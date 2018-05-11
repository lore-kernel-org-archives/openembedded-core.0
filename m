Return-Path: <danismostlikely@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id D34797833E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 20:11:57 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id p18-v6so6444972wrm.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 13:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TtsqU+F9bfNu06ycaE1Rd/hT67DHne6poxawe14U5sA=;
	b=SemgvIOsMxCe7j0TiO3qUlS8z8ouIB7m+Gnrhl12F86qOZGqYf4pml6gBruf5J2ODO
	rolK3hnBINLCepTiJ8nUVVVBUaqNgPzzz32VmGXLpwSq4ckMoD/EP5X9HmI+4MsospcG
	BtOyBc0bSNK4ZoKn+9oThgLscPMW4TJHdKZhiWUAxWCHDJquRpZLxEjK/i1VmHtMkxyf
	keje53vV5b1MHIYSlHTh7AXRVmEZFfsQWSu8zaK6QYpIzeACT+GpQP6V8S5CmLxl+0+p
	RDJfzyNHBe89XGUKMat21Wo3Wk94zOmffF7ZFZCxAPPaLBt2IoUvtL2tvLkkO7DEGOnn
	NQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TtsqU+F9bfNu06ycaE1Rd/hT67DHne6poxawe14U5sA=;
	b=ltiI1dIQDyk2yWj0y/ewCHX8hOrLZeXqQeK6zNg4tLWNU7H5aS0zNU/cyEhnovyb2H
	1xtn3DsyMqtrMaLlfLi5K4w47pvJe5nzweZIN/cbAos3ZSkIno93KBiYojljkZdMRkOl
	KtEgps9GcNuX/mUPZUG4jAePRI0Rl2te2rxLyU/Stv/xsrLC9CfI038SuyjTKYrkYV9R
	KKIPdan3gxd404E0cqMiKrrCXjnoj0F9CiC2u1zTzZhfCM6v+42ejl1UHAdRWWcsgj84
	GK3ooNwhAXj1Tvvwf2bMI1Vd7UCkqNIrlQBU4V24oSMDiPfSfHMsDWpMPvMG6FFLRTsd
	rrCQ==
X-Gm-Message-State: ALKqPwcMm1RNzwK2mX2iUL4PlQ9Q41ep75DjdsmLJpCTRqL4StNWTW0z
	e7S8sminvmzy4hyJVKMkUfl4+knc
X-Google-Smtp-Source: AB8JxZo1w8dwY8AIIdhmDkfamjFBQ/w5Uo7jdS0U7SUEO0UMsG6UHY6tM/fh6RQs/y9qqGeqgD34bA==
X-Received: by 2002:adf:e343:: with SMTP id n3-v6mr327970wrj.82.1526069517885; 
	Fri, 11 May 2018 13:11:57 -0700 (PDT)
Received: from mediabox.local ([2001:470:30f3:1:922b:34ff:fe5d:d4b3])
	by smtp.gmail.com with ESMTPSA id
	o20-v6sm4692147wro.67.2018.05.11.13.11.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 13:11:57 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 14:10:54 -0600
Message-Id: <20180511201055.15463-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.18.0-dev
In-Reply-To: <20180511201055.15463-1-danismostlikely@gmail.com>
References: <20180511201055.15463-1-danismostlikely@gmail.com>
Subject: [PATCH 2/3] base-files: use /proc/self/mounts for /etc/mtab
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
X-List-Received-Date: Fri, 11 May 2018 20:11:58 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

It should be /proc/self/mounts instead of /proc/mounts. Also switch to
using a relative link in base-files, as seems to be the convention in
other distributions.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb             | 2 +-
 .../initrdscripts/files/init-install-efi-testfs.sh            | 2 +-
 meta/recipes-core/initrdscripts/files/init-install-efi.sh     | 4 ++--
 meta/recipes-core/initrdscripts/files/init-install-testfs.sh  | 2 +-
 meta/recipes-core/initrdscripts/files/init-install.sh         | 4 ++--
 meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh    | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index a6963ba24d6..a4c22c51c77 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -132,7 +132,7 @@ do_install () {
 	install -m 0644 ${WORKDIR}/host.conf ${D}${sysconfdir}/host.conf
 	install -m 0644 ${WORKDIR}/motd ${D}${sysconfdir}/motd
 
-	ln -sf /proc/mounts ${D}${sysconfdir}/mtab
+	ln -sf ${@oe.path.relative('${sysconfdir}', '/proc/self/mounts')} ${D}${sysconfdir}/mtab
 }
 
 DISTRO_VERSION[vardepsexclude] += "DATE"
diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
index 9c4b263d544..60c290e1052 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
@@ -67,7 +67,7 @@ rm -f /etc/udev/scripts/mount*
 umount /dev/${device}* 2> /dev/null || /bin/true
 
 mkdir -p /tmp
-cat /proc/mounts > /etc/mtab
+cat /proc/self/mounts > /etc/mtab
 
 disk_size=$(parted /dev/${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 82b0aa819e3..838bc83fdb8 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -141,8 +141,8 @@ umount ${device}* 2> /dev/null || /bin/true
 mkdir -p /tmp
 
 # Create /etc/mtab if not present
-if [ ! -e /etc/mtab ] && [ -e /proc/mounts ]; then
-    ln -sf /proc/mounts /etc/mtab
+if [ ! -e /etc/mtab ] && [ -e /proc/self/mounts ]; then
+    ln -sf /proc/self/mounts /etc/mtab
 fi
 
 disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
diff --git a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
index ac621605287..c5b435286e7 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
@@ -91,7 +91,7 @@ fi
 
 mkdir -p /tmp
 if [ ! -L /etc/mtab ]; then
-	cat /proc/mounts > /etc/mtab
+	cat /proc/self/mounts > /etc/mtab
 fi
 
 disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 28e8f09d19d..e203caa32f1 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -137,8 +137,8 @@ if [ ! -b /dev/loop0 ] ; then
 fi
 
 mkdir -p /tmp
-if [ ! -L /etc/mtab ] && [ -e /proc/mounts ]; then
-    ln -sf /proc/mounts /etc/mtab
+if [ ! -L /etc/mtab ] && [ -e /proc/self/mounts ]; then
+    ln -sf /proc/self/mounts /etc/mtab
 fi
 
 disk_size=$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut -d" " -f 3 | sed -e "s/MB//")
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
index 02f0351fcb3..db472ac2676 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
@@ -142,7 +142,7 @@ fi
 mount -n -o remount,$rootmode /
 if test "$rootmode" = rw
 then
-	ln -sf /proc/mounts /dev/mtab
+	ln -sf /proc/self/mounts /dev/mtab
 fi
 
 : exit 0
-- 
2.18.0-dev


