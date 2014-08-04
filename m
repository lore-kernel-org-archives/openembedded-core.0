Return-Path: <pbfwdlist@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8D44D60017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 07:55:23 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id z12so7205962wgg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 00:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:date:disposition-notification-to
	:content-type:mime-version:content-transfer-encoding;
	bh=VdxRO/D2zAby123O0TbML2anWOtA6O+Q3sTY44yTWZo=;
	b=QcF+4FnHPTEUr+oZIcAIpuxxznretMsxm5BX2qa6yuQTfZon7jC5TxdfXoEFePuj64
	jdCgl7/rV1+FpxKuOy7MhUSWB4OKRzjQ7qxLXdPfYL9JkLUCsX/dTdELyL5R+uHDYjeQ
	O1/uKI+Ktuc2MAXPDR8xBZ/YOIOPNcPWLCdC5PjBhyMoSu9dKPY4Csk0jMrZOJOnP0Bv
	eSkjoXJ5n/kYOc0SirpG8sf8NKKPwxDX1atS/zx/V8k/oTbEFugQHcjyFcvRcayZGhCG
	4m96vaUQwwhw57ttz243YeC/Hm/qQte2fcxtckKk5SxyX8KS+/7HWVXYraDjMx9/dHd7
	lW8g==
X-Received: by 10.180.184.99 with SMTP id et3mr27788406wic.31.1407138924003;
	Mon, 04 Aug 2014 00:55:24 -0700 (PDT)
Received: from [127.0.0.1] (laf42-1-88-166-73-101.fbx.proxad.net.
	[88.166.73.101]) by mx.google.com with ESMTPSA id
	gc1sm38130284wib.22.2014.08.04.00.55.22
	for <openembedded-core@lists.openembedded.org>
	(version=SSLv3 cipher=RC4-SHA bits=128/128);
	Mon, 04 Aug 2014 00:55:23 -0700 (PDT)
Message-ID: <1407138915.9755.11.camel@localhost.localdomain>
From: Patrice B <pbfwdlist@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 04 Aug 2014 09:55:15 +0200
X-Mailer: Evolution 3.4.4 (3.4.4-2.fc17) 
Mime-Version: 1.0
Subject: [PATCH] psmisc: Typo in fuser makes -M on all the time
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
X-List-Received-Date: Mon, 04 Aug 2014 07:55:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

psmisc: Typo in fuser makes -M on all the time

  It adds a patch to fix a major issue on fuser that behaves as if -M option is always used.

  More info on psmisc website here :
  http://sourceforge.net/p/psmisc/code/ci/3638cc55b4d08851faba46635d737b24d016665b/

  Signed-off-by: Patrice Bouchand <pbfwdlist@gmail.com>

---
 ...001-Typo-in-fuser-makes-M-on-all-the-time.patch | 46 ++++++++++++++++++++++
 meta/recipes-extended/psmisc/psmisc_22.21.bb       |  2 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch

diff --git a/meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch b/meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch
new file mode 100644
index 0000000..e57d60f
--- /dev/null
+++ b/meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch
@@ -0,0 +1,46 @@
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
+Upstream-Status: Backport
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




