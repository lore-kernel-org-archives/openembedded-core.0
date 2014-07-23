Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id EC5F0707EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 21:58:23 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so8591210wiv.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 14:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=364JAyhR/ReX/WFpc5eb4xfcT5e9leKVaDRHQ8ttoqQ=;
	b=WcxlKZrjA/HEvitc5Khzg0YFpfGQFqmxjmo5mzTNh2EX8lVwxlC5D6NowYrKUn9vop
	69xr6Cq5KCTnhVZF9gP8BpMhIyVhyyOPLAdA+cGWiIjo68MUIpS8rJbrAjK4W9hp9SLZ
	+OZpWfCMm5+2MBWzhw9NBAS1ujJwJsWOomp002j0w3eA/Fuvj1mGX0FK0i3pV6C6+WCT
	CQjAoaLXnldHABYmnTsJF8C6wyDbTgJA19cy5AYoT7oOBGAgip86DF3LYuWa3FZw6shT
	9MsRDriE++hPzCc4MZ/GyV6lZC5CV+Z4YjncjdsDW4THB3NZ5sy1E4GexBodlOs/j93E
	ArfQ==
X-Gm-Message-State: ALoCoQmcIHe1+kgrz4YJEo5NA51Xkpkv4/oxPkyzUZO/rDtSR9aklOWSewHdwDNACnaKYgJPuoTj
X-Received: by 10.180.36.238 with SMTP id t14mr7253407wij.38.1406152704723;
	Wed, 23 Jul 2014 14:58:24 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	pl1sm14090074wic.17.2014.07.23.14.58.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 14:58:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jul 2014 22:58:11 +0100
Message-Id: <1406152694-6242-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/4] libxi: upgrade to 1.7.4
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

Also remove outdated (~1.2.99.5) git recipe that was never used.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/{libxi_1.7.2.bb => libxi_1.7.4.bb}      |    4 ++--
 meta/recipes-graphics/xorg-lib/libxi_git.bb          |   18 ------------------
 2 files changed, 2 insertions(+), 20 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.2.bb => libxi_1.7.4.bb} (81%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxi_git.bb

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.7.2.bb b/meta/recipes-graphics/xorg-lib/libxi_1.7.4.bb
similarity index 81%
rename from meta/recipes-graphics/xorg-lib/libxi_1.7.2.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.7.4.bb
index 0ae98e0..07033a3 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.7.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.7.4.bb
@@ -17,5 +17,5 @@ PE = "1"
 
 XORG_PN = "libXi"
 
-SRC_URI[md5sum] = "f4df3532b1af1dcc905d804f55b30b4a"
-SRC_URI[sha256sum] = "df24781dc63645e2b561cd0b20bd8a0e7aff02e426a8d2a7641159004d4cb20e"
+SRC_URI[md5sum] = "9c4a69c34b19ec1e4212e849549544cb"
+SRC_URI[sha256sum] = "2cffc2686618dc1803725636cd92b36342c512dc60a7a35cba34bf7192a42244"
diff --git a/meta/recipes-graphics/xorg-lib/libxi_git.bb b/meta/recipes-graphics/xorg-lib/libxi_git.bb
deleted file mode 100644
index c17c1f7..0000000
--- a/meta/recipes-graphics/xorg-lib/libxi_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require xorg-lib-common.inc
-
-SUMMARY = "XI: X Input extension library"
-
-DESCRIPTION = "libxi is an extension to the X11 protocol to support \
-input devices other than the core X keyboard and pointer.  It allows \
-client programs to select input from these devices independently from \
-each other and independently from the core devices."
-
-DEPENDS += "libxext inputproto"
-SRCREV = "d0326fe8cdbb08d4f52d79fd3fd4e1b2a0951d5e"
-PE = "1"
-PV = "1.2.99.5+gitr${SRCPV}"
-
-XORG_PN = "libXi"
-
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/${XORG_PN}"
-S = "${WORKDIR}/git"
-- 
1.7.10.4


