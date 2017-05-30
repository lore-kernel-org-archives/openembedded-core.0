Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 20E9C781D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 17:15:35 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id f27so19291421pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 10:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=byCbx7z8PTfOsH0pb2hGrr+jhNbR/SwjUwCfC7dpceQ=;
	b=orG66x8bCWIVEfKix0cXohuU8hR2BthQZR68W3qhCzzQsbI7E9ZT7HfkHdUVVFMQcd
	Zwgd1UeZkG2NrBzEWv8HWXUyq5QUU2ewuWnrc+u9EEL9CsIGdFy53rNqZw/K626pksFC
	jw44pYC+eARt4HTTS1c62plnFQQDfFbi8ZFu4TKcJUr9sZbD+BetBJmJ+Kts6Em3PugO
	gY2TJjev1V1YvYJnUiDT3IwfUk8rwqpUT5IGSfhi53TUG7MotdGLl33oxyXsTDCb/nvt
	1JNtgAX7ISa6f7x2UWFdn1pJRrE2aAWzs0coTP7JNgdX9SosA3YEGkvNpUE5aTHz8QXB
	KA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=byCbx7z8PTfOsH0pb2hGrr+jhNbR/SwjUwCfC7dpceQ=;
	b=QJIXMLTSpulO7R3wjy1prhuIo4g7kVtkWDz371hycpG/yAzNxBU7tHcr1+d3rr4vXV
	c1Y5O+G1aDFktJBkR8UhDB1jRW5tkHxZ2L1TGQsX9xNixK++I6ECyj3on2mWQ/gJITS2
	19ExnfGo+c10yUKkDsc2iFGtIpsh5DQdNkVtk8co4tiUKtQ+Vs2LedJtZV8mRFVUhcY4
	7H7+E7ZmSKn6fv4u6LFLRIg2kRNgwhYJJdGBdguOaBGShi5z/PPfdHvZpm6YVos+2rha
	8H0podBBvM9+GmAvpZoPbhokLKHAgDj1FlxOEsjJL6ygK8E7Y9H686PVaAOJcNiH2utt
	9CTg==
X-Gm-Message-State: AODbwcD7ecSR2shghP9rQ8igB/Oe+kt6yOO3eLY/SkLmYJIrJEigMv1V
	K71Qxm/bX0cWk6E6
X-Received: by 10.99.101.132 with SMTP id z126mr26808161pgb.194.1496164536942; 
	Tue, 30 May 2017 10:15:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	n24sm28071137pgd.57.2017.05.30.10.15.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 May 2017 10:15:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 10:15:23 -0700
Message-Id: <20170530171523.37470-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170530171523.37470-1-raj.khem@gmail.com>
References: <20170530171523.37470-1-raj.khem@gmail.com>
Subject: [PATCH 3/3] libatomic-ops: Upgrade to 7.6.0
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
X-List-Received-Date: Tue, 30 May 2017 17:15:36 -0000

Can compile in thumb1 and thumb2 modes now
AO_THUMB_GO_ARM, AO_THUMB_RESTORE_MODE are used
to guard swp instructions

Switch to github and use git for src_uri

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libatomic-ops/libatomic-ops_7.4.4.bb           | 32 ----------------------
 .../libatomic-ops/libatomic-ops_7.6.0.bb           | 20 ++++++++++++++
 2 files changed, 20 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-support/libatomic-ops/libatomic-ops_7.4.4.bb
 create mode 100644 meta/recipes-support/libatomic-ops/libatomic-ops_7.6.0.bb

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.4.4.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.4.4.bb
deleted file mode 100644
index 930c1b8ed6..0000000000
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.4.4.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "A library for atomic integer operations"
-HOMEPAGE = "https://github.com/ivmai/libatomic_ops/"
-SECTION = "optional"
-PROVIDES += "libatomics-ops"
-LICENSE = "GPLv2 & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://doc/LICENSING.txt;md5=e00dd5c8ac03a14c5ae5225a4525fa2d \
-		   "
-
-SRC_URI = "\
-	http://www.ivmaisoft.com/_bin/atomic_ops/libatomic_ops-${PV}.tar.gz \
-	file://0001-Add-initial-nios2-architecture-support.patch \
-	"
-
-SRC_URI[md5sum] = "426d804baae12c372967a6d183e25af2"
-SRC_URI[sha256sum] = "bf210a600dd1becbf7936dd2914cf5f5d3356046904848dcfd27d0c8b12b6f8f"
-
-S = "${WORKDIR}/libatomic_ops-${PV}"
-
-ALLOW_EMPTY_${PN} = "1"
-
-ARM_INSTRUCTION_SET = "arm"
-
-inherit autotools pkgconfig
-
-do_install_append() {
-	# those contain only docs, not necessary for now.
-	install -m 0755 -d ${D}${docdir}
-	mv ${D}${datadir}/libatomic_ops ${D}${docdir}/${BPN}
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.0.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.0.bb
new file mode 100644
index 0000000000..4463d86c86
--- /dev/null
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "A library for atomic integer operations"
+HOMEPAGE = "https://github.com/ivmai/libatomic_ops/"
+SECTION = "optional"
+PROVIDES += "libatomics-ops"
+LICENSE = "GPLv2 & MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://doc/LICENSING.txt;md5=e00dd5c8ac03a14c5ae5225a4525fa2d \
+		   "
+PV .= "+git${SRCPV}"
+
+SRCREV = "73c60c5ef1ed370111549ee5aab6d4020ba70ed4"
+SRC_URI = "git://github.com/ivmai/libatomic_ops"
+
+S = "${WORKDIR}/git"
+
+ALLOW_EMPTY_${PN} = "1"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.13.0


