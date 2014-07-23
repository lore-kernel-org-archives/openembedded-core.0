Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8702B707E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 21:58:24 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so2995523wib.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 14:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PUCbdYaWFyuTZ8bsvfR6VVzEcBDwtbunJcdJgXAUTmo=;
	b=mM4rfELLk872parY2MaQuQ8i7/ldGaol7h6HEpbkRJArQpnvmrg5QDuuWi8kpZMeOR
	uW88a74jgEhA77D5Xlt87Ow8KRIwjFHzYC7ERWfaWLMGP17MTvc56xlLqrwMgV2nTnmn
	o1ly4gNVROHY6UIg6cJPeX1emgXisaSBqVXZxtnVq3tBb3LoiVlX/JU6HSWRlnjrkxYq
	bvxxQCI7uNIqyhMbm5VhQcZoIFv7o5psOT2s7r6HajV6zibmllSSv9s4dr37Sw1X5baS
	+58KwNU4GOeKv5VkpuweHi7fn/SvjIETkBPYbp9aXzjQ6NWAUhpk4iwZAyGUtOGR7rB9
	nTVQ==
X-Gm-Message-State: ALoCoQmN1l+GrSBTJS7uhSX6D5+muQkkDim12lzQsuPAA9wjdp+uTmMRStWIGApNElks9D33drXj
X-Received: by 10.194.189.50 with SMTP id gf18mr5993580wjc.13.1406152705915;
	Wed, 23 Jul 2014 14:58:25 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	pl1sm14090074wic.17.2014.07.23.14.58.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 14:58:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jul 2014 22:58:12 +0100
Message-Id: <1406152694-6242-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1406152694-6242-1-git-send-email-ross.burton@intel.com>
References: <1406152694-6242-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/4] libevdev: add new recipe (needed by xf86-input-evdev)
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
X-List-Received-Date: Wed, 23 Jul 2014 21:58:28 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libevdev/libevdev_1.2.2.bb |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-support/libevdev/libevdev_1.2.2.bb

diff --git a/meta/recipes-support/libevdev/libevdev_1.2.2.bb b/meta/recipes-support/libevdev/libevdev_1.2.2.bb
new file mode 100644
index 0000000..db4ffc6
--- /dev/null
+++ b/meta/recipes-support/libevdev/libevdev_1.2.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Wrapper library for evdev devices"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libevdev/"
+SECTION = "libs"
+
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
+                    file://libevdev/libevdev.h;endline=21;md5=7ff4f0b5113252c2f1a828e0bbad98d1"
+
+SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
+SRC_URI[md5sum] = "7c1ee9c2069489b2a25dfde6f8e2ff6a"
+SRC_URI[sha256sum] = "860e9a1d5594393ff1f711cdeaf048efe354992019068408abbcfa4914ad6709"
+
+inherit autotools pkgconfig
-- 
1.7.10.4


