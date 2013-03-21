Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1UIi6M-0006Mk-38
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Mar 2013 17:12:30 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4rVX009096; Thu, 21 Mar 2013 16:04:53 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aBWvWMLMA3Ul; Thu, 21 Mar 2013 16:04:53 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2LG4l37009077
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 21 Mar 2013 16:04:49 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1UIhpm-0006Le-1e; Thu, 21 Mar 2013 15:55:18 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Mar 2013 15:55:01 +0000
Message-Id: <1363881315-24352-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1363881315-24352-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/16] pam: Fix case where ${B} != ${S}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Mar 2013 16:13:20 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/pam/libpam/fixsepbuild.patch |   24 ++++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |    1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/fixsepbuild.patch

diff --git a/meta/recipes-extended/pam/libpam/fixsepbuild.patch b/meta/recipes-extended/pam/libpam/fixsepbuild.patch
new file mode 100644
index 0000000..8a9c3b2
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/fixsepbuild.patch
@@ -0,0 +1,24 @@
+Fix the build error when a separate build directory is used:
+
+Making install in xtestsmake[1]: Entering directory `/media/build1/poky/build1/tmp/work/i586-poky-linux/libpam/1.1.6-r2/build/xtests'/usr/bin/install -c -d /media/build1/poky/build1/tmp/work/i586-poky-linux/libpam/1.1.6-r2/image/usr/share/Linux-PAM/xtestsfor file in run-xtests.sh tst-pam_dispatch1.pamd tst-pam_dispatch2.pamd tst-pam_dispatch3.pamd tst-pam_dispatch4.pamd tst-pam_dispatch5.pamd tst-pam_cracklib1.pamd tst-pam_cracklib2.pamd tst-pam_unix1.pamd tst-pam_unix2.pamd tst-pam_unix3.pamd tst-pam_unix4.pamd tst-pam_unix1.sh tst-pam_unix2.sh tst-pam_unix3.sh tst-pam_unix4.sh access.conf tst-pam_access1.pamd tst-pam_access1.sh tst-pam_access2.pamd tst-pam_access2.sh tst-pam_access3.pamd tst-pam_access3.sh tst-pam_access4.pamd tst-pam_access4.sh limits.conf tst-pam_limits1.pamd tst-pam_limits1.sh tst-pam_succeed_if1.pamd tst-pam_succeed_if1.sh group.conf tst-pam_group1.pamd tst-pam_group1.sh tst-pam_authfail.pamd tst-pam_authsucceed.pamd tst-pam_substack1.pamd tst-pam_sub!
 stack1a.pamd tst-pam_substack1.sh tst-pam_substack2.pamd tst-pam_substack2a.pamd tst-pam_substack2.sh tst-pam_substack3.pamd tst-pam_substack3a.pamd tst-pam_substack3.sh tst-pam_substack4.pamd tst-pam_substack4a.pamd tst-pam_substack4.sh tst-pam_substack5.pamd tst-pam_substack5a.pamd tst-pam_substack5.sh tst-pam_assemble_line1.pamd tst-pam_assemble_line1.sh tst-pam_pwhistory1.pamd tst-pam_pwhistory1.sh tst-pam_time1.pamd time.conf ; do \/usr/bin/install -c $file /media/build1/poky/build1/tmp/work/i586-poky-linux/libpam/1.1.6-r2/image/usr/share/Linux-PAM/xtests ; \	done
+/usr/bin/install: cannot stat `run-xtests.sh': No such file or directory
+/usr/bin/install: cannot stat `tst-pam_dispatch1.pamd': No such file or directory
+/usr/bin/install: cannot stat `tst-pam_dispatch2.pamd': No such file or directory
+
+Upstream-Status: Pending
+
+RP 2013/03/21
+
+Index: Linux-PAM-1.1.6/xtests/Makefile.am
+===================================================================
+--- Linux-PAM-1.1.6.orig/xtests/Makefile.am	2013-03-08 12:26:30.360266000 +0000
++++ Linux-PAM-1.1.6/xtests/Makefile.am	2013-03-21 11:39:58.557166650 +0000
+@@ -59,7 +59,7 @@
+ install_xtests:
+ 	$(INSTALL) -d $(DESTDIR)$(pkgdatadir)/xtests
+ 	for file in $(EXTRA_DIST) ; do \
+-		$(INSTALL) $$file $(DESTDIR)$(pkgdatadir)/xtests ; \
++		$(INSTALL) $(srcdir)/$$file $(DESTDIR)$(pkgdatadir)/xtests ; \
+ 	done
+ 	for file in $(XTESTS); do \
+ 		$(INSTALL) .libs/$$file $(DESTDIR)$(pkgdatadir)/xtests ; \
diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 93c98c0..9a49c50 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
            file://pam.d/* \
            file://libpam-xtests.patch \
            file://destdirfix.patch \
+           file://fixsepbuild.patch \
           "
 SRC_URI[md5sum] = "7b73e58b7ce79ffa321d408de06db2c4"
 SRC_URI[sha256sum] = "bab887d6280f47fc3963df3b95735a27a16f0f663636163ddf3acab5f1149fc2"
-- 
1.7.10.4



