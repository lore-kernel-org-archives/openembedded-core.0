Return-Path: <pbfwdlist@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id E0D4165CFF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 10:05:11 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id k48so942358wev.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 03:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:date:content-type:mime-version
	:content-transfer-encoding;
	bh=zuCdWosT4fkren0sqhk2YeB7y0cs3t8UzFLRNDaqhb8=;
	b=rDUdeA3tk8IU6Bomh9eksavB5OGfzZHjuaxhrRdt6Dgdjzr1ZJ0Ab1r9057/Q22Ika
	KMrYO66fBLvtGnD3f8GNRXdZ+zyjOvgM2NuyT1bmQIitoMomGmpqvz3KP0YwmL2DmYH/
	hYbPGFlpVB2vAGSINJEwDL6UU5s/mi+hPb3mt8IlMAv7EMPi/75VXwBRInLSjpcG3k5G
	xHxtgQzwJknu7J45jmW0YNdkEsK+8FuLaWjkip+XzhKYPjkcFxScADDg3T01GLQeW+BN
	L0FZ+fpN4gqUhkurG6OQvGLgpH66ZaMsZ8Ci5mB6+FiDnpmEEfGIHiVTmr0vXSoSoRjC
	EM/A==
X-Received: by 10.180.212.113 with SMTP id nj17mr1617115wic.46.1406714712459; 
	Wed, 30 Jul 2014 03:05:12 -0700 (PDT)
Received: from [127.0.0.1] (laf42-1-88-166-73-101.fbx.proxad.net.
	[88.166.73.101])
	by mx.google.com with ESMTPSA id fs17sm4385387wjc.6.2014.07.30.03.05.11
	for <openembedded-core@lists.openembedded.org>
	(version=SSLv3 cipher=RC4-SHA bits=128/128);
	Wed, 30 Jul 2014 03:05:12 -0700 (PDT)
Message-ID: <1406714692.31179.9.camel@localhost.localdomain>
From: Patrice B <pbfwdlist@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jul 2014 12:04:52 +0200
X-Mailer: Evolution 3.4.4 (3.4.4-2.fc17) 
Mime-Version: 1.0
Subject: [PATCH] psmisc: Typo in fuser makes -M on all the time (backport)
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
X-List-Received-Date: Wed, 30 Jul 2014 10:05:15 -0000
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit

I encountered this bug in psmisc 22.21. Since it is fixed in main
stream, I proposed this patch created from psmisc git.

More info here :
http://sourceforge.net/p/psmisc/code/ci/3638cc55b4d08851faba46635d737b24d016665b/


"Brad found that fuser had the -M option on all the time.
A simple but significant typo caused this, thanks the patch.

Bug-Debian: http://bugs.debian.org/740275"

Signed-off-by: Patrice B <pbfwdlist@gmail.com>


---
 ...001-Typo-in-fuser-makes-M-on-all-the-time.patch | 44 ++++++++++++++++++++++
 meta/recipes-extended/psmisc/psmisc_22.21.bb       |  2 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch

diff --git a/meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch b/meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch
new file mode 100644
index 0000000..3a4c9a9
--- /dev/null
+++ b/meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch
@@ -0,0 +1,44 @@
+From 3638cc55b4d08851faba46635d737b24d016665b Mon Sep 17 00:00:00 2001
+From: Brad Jorsch <anomie@users.sourceforge.net>
+Date: Fri, 28 Feb 2014 21:55:02 +1100
+Subject: [PATCH] Typo in fuser makes -M on all the time
+
+Brad found that fuser had the -M option on all the time.
+A simple but significant typo caused this, thanks the the patch.
+
+Bug-Debian: http://bugs.debian.org/740275
+
+Signed-off-by: Craig Small <csmall@enc.com.au>
+---
+ ChangeLog   | 4 ++++
+ src/fuser.c | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index fd1cccf..e5f784c 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,7 @@
++Changes in 22.22
++================
++	* Fixed typo in fuser which has -M on Debian #740275
++
+ Changes in 22.21
+ ================
+ 	* Missing comma in fuser(1) added Debian #702391
+diff --git a/src/fuser.c b/src/fuser.c
+index b485f65..389b302 100644
+--- a/src/fuser.c
++++ b/src/fuser.c
+@@ -1174,7 +1174,7 @@ int main(int argc, char *argv[])
+ 		usage(_("No process specification given"));
+ 
+ 	/* Check if -M flag was used and if so check mounts */
+-	if (opts * OPT_ISMOUNTPOINT) {
++	if (opts & OPT_ISMOUNTPOINT) {
+ 	    check_mountpoints(&mounts, &names_head, &names_tail);
+ 	}
+ 
+-- 
+1.8.4.2
+
diff --git a/meta/recipes-extended/psmisc/psmisc_22.21.bb b/meta/recipes-extended/psmisc/psmisc_22.21.bb
index 22f65c5..9f328bb 100644
--- a/meta/recipes-extended/psmisc/psmisc_22.21.bb
+++ b/meta/recipes-extended/psmisc/psmisc_22.21.bb
@@ -4,3 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI[md5sum] = "935c0fd6eb208288262b385fa656f1bf"
 SRC_URI[sha256sum] = "97323cad619210845b696d7d722c383852b2acb5c49b5b0852c4f29c77a8145a"
+
+SRC_URI += "file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch"
-- 
1.8.4.2







