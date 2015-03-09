Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id EA1B57394C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 16:40:57 +0000 (UTC)
Received: by wevk48 with SMTP id k48so33010608wev.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 09:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=R7Kqw9SDNJx9Ar37Miuctoc8jO+BxlP0oLmtSp89a+0=;
	b=e8lK5EiOWub3D+yevsk1oqhIbQg3OUZktaaRTQokxq5mnltFEkXniXVIFT3RXRcZ2U
	GaMldg/WtvIJFxCT2PQrKXwE7ncEkw3tHyMf0YuR43obxs+zvexhZEtSN99C6ZuHOlWp
	V14Hj8QEZxrQi8LFs2smlR93gVsuTljgM6e1Yz3EmnMUF5szuYmL4/gh9hTbuyQuoW79
	X3eNP77+/nKvi//iIfdVSYflJAc+eT8vOV1KrZT+CeWYrfYXk4X8+LJJPQiAs75DIMW9
	zO5xLDj4rvXUPQuoKvRz6/vAPUgs8pgelwoCeLLddv019XIYsGd4BVJvRvl9dW0AQQF3
	uIhg==
X-Gm-Message-State: ALoCoQngd62IaMT7OE9sE0Mvog4aS6tKOK80euwUQ9FCrRH+L3cIHtucQNvd9IcYu9HMMfj+HFuv
X-Received: by 10.180.99.194 with SMTP id es2mr62274615wib.23.1425919257819;
	Mon, 09 Mar 2015 09:40:57 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id m9sm48114364wiz.24.2015.03.09.09.40.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Mar 2015 09:40:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2015 16:38:16 +0000
Message-Id: <1425919096-19919-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] liberation-fonts: inherit allarch as fonts are arch-independent
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
X-List-Received-Date: Mon, 09 Mar 2015 16:41:00 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
index 89fa4b21..708f59e 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 PR = "r4"
 PE = "1"
 
-inherit fontcache
+inherit allarch fontcache
 
 FONT_PACKAGES = "${PN}"
 
-- 
1.7.10.4


