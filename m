Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBT-0001ke-Mq
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:43 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:18:58 -0700
Received: by mail-wg0-f43.google.com with SMTP id dr1so617841wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=kZ1gyGAopsRL1gVF58gBN0b088u3MV73OMAGxyprKNQ=;
	b=pbVe2JhH5q5OB13Ruk/ZGeJTX8VlMZkBp9NCf9oNXXdNUu56BoCkemrI85z6lxkgVM
	k8ingQn4dOxY8q5i16L5bbnJujzUkBGk4ScOrCYia4C6BY9OH3mBfG7ea7+gZugGSHEo
	mi7r2H5T/GxAHQoNmQluMp5m05iWSMrmCps74QXXwu0HYpmlZZ0gWvX6qUbYpYgcqi3q
	1N8/H0cP5X7dVWlrB+j7EWtju7taZLFDo991QJn3DONW1C89A3k8xpaRua3UZL/yHvgl
	vkrl1Oj58Wu/LQS0IU5Cb2eHRlRoR4/awL9nyw0dST7nWIYZWi/W52MynlqPeVRooNt5
	pbKw==
Received: by 10.217.6.12 with SMTP id x12mr9623909wes.176.1347391146638;
	Tue, 11 Sep 2012 12:19:06 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.19.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:19:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:17:57 +0100
Message-Id: <1347391088-30390-7-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkmskRc6F0r+yxUX+5Ksl/Fv1PZJBXSsMYTksodVH8xFTocNQ4LovXo+1IWkX8zeXMD5izV
Subject: [RFC 07/18] libx11: remove redundant license data
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
X-List-Received-Date: Tue, 11 Sep 2012 19:31:44 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb |    2 --
 meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb |    3 ---
 2 files changed, 5 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
index 9a7de33..04ee1b8 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
@@ -3,8 +3,6 @@ require libx11.inc
 DESCRIPTION += " Support for XCMS and XLOCALE is disabled in \
 this version."
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
-
 PR = "${INC_PR}.2"
 
 SRC_URI += "file://x11_disable_makekeys.patch \
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
index 714b993..6550903 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim_1.5.0.bb
@@ -2,9 +2,6 @@ require libx11.inc
 
 DESCRIPTION += " Support for XCMS is disabled in this version."
 
-LICENSE = "MIT & MIT-style & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
-
 PR = "${INC_PR}.0"
 
 DEPENDS += "libxcb xproto xextproto xtrans libxau kbproto inputproto xf86bigfontproto xproto-native"
-- 
1.7.10



