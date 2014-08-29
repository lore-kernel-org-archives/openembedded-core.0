Return-Path: <net147@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6A9A271210
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 13:38:05 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id z10so435127pdj.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 06:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QT+znNXOw07R5Pk9mJcuH+B+BKA3Ye0CLjDuyPD329s=;
	b=LTSWdeQjk+r/0+1xDiSgyf3jP/3cgvQS0QUsjWr9kwLHzfddcZJthBpM/vEPABJS4R
	Zto1oD2+6pXqZaQZ1lij9GMYzeAhQ2MpBj0ap7toMvEn2GlGa8/7Omz3snvUWnJOUuZy
	7IIShtdipEZdJpg5QQ3HiVwYOzT06R22YPi9QJXUJQtFP0jtqr3+d5r65LXOdrEYazPg
	pI3qJPDn2n3Mq2sBEgdiE2kBVwY/FkLqus5yLeeerWK9lhXyVwBZ0OqyZ1em6b/eTyiX
	SiZpJgAmk5eIBaYzaP00KqzoUWI5wO0W11tnZ3qk7fLnkju7XgXt1KgNv9KktPuFzOXE
	PtxQ==
X-Received: by 10.66.237.206 with SMTP id ve14mr15555033pac.40.1409319486704; 
	Fri, 29 Aug 2014 06:38:06 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id d3sm3257pbu.32.2014.08.29.06.38.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Aug 2014 06:38:05 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 23:48:39 +1000
Message-Id: <1409320119-25825-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.0.3
Subject: [daisy][PATCH] qemu: Explicitly disable libiscsi, its not in DEPENDS
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
X-List-Received-Date: Fri, 29 Aug 2014 13:38:06 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2702986..472988d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -26,7 +26,7 @@ SRC_URI_append_class-native = "\
     file://fix-libcap-header-issue-on-some-distro.patch \
     "
 
-EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --audio-drv-list=oss,alsa --disable-bluez --with-system-pixman --extra-cflags='${CFLAGS}'"
+EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --audio-drv-list=oss,alsa --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
 
 EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
 				"
-- 
2.0.3


