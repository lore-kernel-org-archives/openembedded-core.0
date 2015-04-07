Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 42DE873D25
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 11:24:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t37BOYQB025064
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Apr 2015 04:24:34 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Apr 2015 04:24:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Apr 2015 04:24:29 -0700
Message-ID: <90edd11cb3c867c6c677d97be6a22b9504132879.1428405830.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428405830.git.liezhi.yang@windriver.com>
References: <cover.1428405830.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/10] groff: 1.22.2 -> 1.22.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Apr 2015 11:24:33 -0000
Content-Type: text/plain

* Updated groff-1.22.2-correct-man.local-install-path.patch
* Add perl to RDEPENDS_groff since /usr/bin/perf is a perl script now.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...off-1.22.2-correct-man.local-install-path.patch |   36 +++++++++++---------
 .../groff/{groff_1.22.2.bb => groff_1.22.3.bb}     |    7 ++--
 2 files changed, 23 insertions(+), 20 deletions(-)
 rename meta/recipes-extended/groff/{groff-1.22.2 => groff-1.22.3}/groff-1.22.2-correct-man.local-install-path.patch (40%)
 rename meta/recipes-extended/groff/{groff_1.22.2.bb => groff_1.22.3.bb} (92%)

diff --git a/meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch b/meta/recipes-extended/groff/groff-1.22.3/groff-1.22.2-correct-man.local-install-path.patch
similarity index 40%
rename from meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
rename to meta/recipes-extended/groff/groff-1.22.3/groff-1.22.2-correct-man.local-install-path.patch
index f7e9a74..c73328a 100644
--- a/meta/recipes-extended/groff/groff-1.22.2/groff-1.22.2-correct-man.local-install-path.patch
+++ b/meta/recipes-extended/groff/groff-1.22.3/groff-1.22.2-correct-man.local-install-path.patch
@@ -4,29 +4,31 @@ Correct the install path of man.local to fix following error:
 Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
 Upstream-Status: Pending
 
---- groff-1.22.2/tmac/Makefile.sub.orig	2013-02-07 20:06:08.000000000 +0800
-+++ groff-1.22.2/tmac/Makefile.sub	2013-06-26 19:11:23.572259001 +0800
-@@ -114,9 +114,9 @@
- 	  rm -f $(DESTDIR)$(mdocdir)/$$f; \
+diff --git a/tmac/Makefile.sub b/tmac/Makefile.sub
+index 1506232..f1468c5 100644
+--- a/tmac/Makefile.sub
++++ b/tmac/Makefile.sub
+@@ -121,9 +121,9 @@ install_data: $(NORMALFILES) $(SPECIALFILES) man.local \
+ 	  $(RM) $(DESTDIR)$(mdocdir)/$$f; \
  	  $(INSTALL_DATA) $$f-s $(DESTDIR)$(mdocdir)/$$f; \
  	done
--	-test -f $(DESTDIR)$(localtmacdir)/man.local || \
-+	-test -f $(DESTDIR)$(tmacdir)/man.local || \
- 	  $(INSTALL_DATA) $(srcdir)/man.local \
--	    $(DESTDIR)$(localtmacdir)/man.local
-+	    $(DESTDIR)$(tmacdir)/man.local
- 	-test -f $(DESTDIR)$(localtmacdir)/mdoc.local || \
- 	  $(INSTALL_DATA) mdoc.local-s $(DESTDIR)$(localtmacdir)/mdoc.local
+-	-test -f $(DESTDIR)$(localtmacdir)/man.local \
++	-test -f $(DESTDIR)$(tmacdir)/man.local \
+ 	  || $(INSTALL_DATA) $(srcdir)/man.local \
+-	       $(DESTDIR)$(localtmacdir)/man.local
++	       $(DESTDIR)$(tmacdir)/man.local
+ 	-test -f $(DESTDIR)$(localtmacdir)/mdoc.local \
+ 	  || $(INSTALL_DATA) mdoc.local-s $(DESTDIR)$(localtmacdir)/mdoc.local
  
-@@ -158,9 +158,9 @@
- 	-rm -f $(DESTDIR)$(tmacdir)/$(tmac_s_prefix)s.tmac
- 	-rm -f $(DESTDIR)$(tmacdir)/$(tmac_an_prefix)an.tmac
- 	-rm -f $(DESTDIR)$(tmacdir)/www.tmac
+@@ -164,9 +164,9 @@ uninstall_sub:
+ 	$(RM) $(DESTDIR)$(tmacdir)/$(tmac_s_prefix)s.tmac
+ 	$(RM) $(DESTDIR)$(tmacdir)/$(tmac_an_prefix)an.tmac
+ 	$(RM) $(DESTDIR)$(tmacdir)/www.tmac
 -	-if cmp -s $(DESTDIR)$(localtmacdir)/man.local \
 +	-if cmp -s $(DESTDIR)$(tmacdir)/man.local \
  	           $(srcdir)/man.local; then \
--	  rm -f $(DESTDIR)$(localtmacdir)/man.local; \
-+	  rm -f $(DESTDIR)$(tmacdir)/man.local; \
+-	  $(RM) $(DESTDIR)$(localtmacdir)/man.local; \
++	  $(RM) $(DESTDIR)$(tmacdir)/man.local; \
  	fi
  	-if cmp -s $(DESTDIR)$(localtmacdir)/mdoc.local \
  	           $(srcdir)/mdoc.local; then \
diff --git a/meta/recipes-extended/groff/groff_1.22.2.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
similarity index 92%
rename from meta/recipes-extended/groff/groff_1.22.2.bb
rename to meta/recipes-extended/groff/groff_1.22.3.bb
index 6e84587..d89e747 100644
--- a/meta/recipes-extended/groff/groff_1.22.2.bb
+++ b/meta/recipes-extended/groff/groff_1.22.3.bb
@@ -4,7 +4,6 @@ formatting commands and produces formatted output."
 SECTION = "base"
 HOMEPAGE = "http://www.gnu.org/software/groff/"
 LICENSE = "GPLv3"
-PR = "r1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
@@ -12,12 +11,14 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
 	file://groff-1.22.2-correct-man.local-install-path.patch \
 "
 
-SRC_URI[md5sum] = "9f4cd592a5efc7e36481d8d8d8af6d16"
-SRC_URI[sha256sum] = "380864dac4772e0c0d7b1282d25d0c5fd7f63baf45c87c4657afed22a13d2076"
+SRC_URI[md5sum] = "cc825fa64bc7306a885f2fb2268d3ec5"
+SRC_URI[sha256sum] = "3a48a9d6c97750bfbd535feeb5be0111db6406ddb7bb79fc680809cda6d828a5"
 
 DEPENDS = "groff-native"
 DEPENDS_class-native = ""
 
+RDEPENDS_${PN} = "perl"
+
 inherit autotools texinfo
 
 EXTRA_OECONF = "--without-x"
-- 
1.7.9.5


