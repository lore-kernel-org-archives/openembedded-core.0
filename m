Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1C5627EE79
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:46 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id u14so16147045pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YOnUvV/jmebYgu0JjgXSsbVLmC8rYcF8/kJi9g3Efoo=;
	b=c1fmrFKC5Z9mYK+jKp76hAJmw5/iyGVnalp6ea/3De2sWoSfJxV2kUSzF5KK3ZYrk0
	8g6DjIHW5XcjuuCAwvCvWJcMNwqT/GxcvdtKGjrS5xFb3eEVNX50WHBBYwGOZkR9b3Rx
	K2ueIA0+hsy0Zo/YKEDxx8+vxcJvXRlFysrSB3tgbl494GCr0mHZ1b24yhEmCniBzuyd
	G73CXrhncGDcL/GgMx70GxXu5pEiKW/7Dko6F9iz3dxeduhfOLfjOLBe8TJuv2LVYiRV
	5066FnQ22cDxjT4oRIUu3EcmCuOI9P21d08rrrBkgUMXogPOrdFsCCmgR+HxyovotrrG
	sSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YOnUvV/jmebYgu0JjgXSsbVLmC8rYcF8/kJi9g3Efoo=;
	b=G1+NCkEDqXaPZKTn/ecGyH4GEyzWsiw1AJGW2SPZ725ZAJuJC6Gbfz/0H275jSGnhj
	ejcWgezC5wvs6mN20jfDsCTNyfUo5ih7wiJsWPFznSOY+ZmfCXhkI3rJgp8v35PAR8VR
	Kzn54Y/HaUi1VXx1eqkMCGwXKhcOLCNzzQ9USEeKu0ZwmoEZgHCUZXqVfCuDGYOai1JK
	FZv+e2J5Mr3mkI3V+10T2HJ2Y5sFUFqtZE9rJpyD6vzx3jXHFMIZ1DI+y2vXvo+NawlQ
	oAGgHCdeVqwnoMxKGkkxG0kteGuGHLMc4hAQ10ud5+vb+8AeLvazxZDVd+K3rnBvg4Rf
	ilLw==
X-Gm-Message-State: APjAAAVome66C/zltp97pVvwyOjSImk+tva3FY8HUrANIgoSQsd+dkb4
	H+wXqyZ7ztPN2vlMdHUJLeC1CJvp
X-Google-Smtp-Source: APXvYqyKSc+pRHDaWgwhJNSx6xjJ/BLrlqu68a8c7UIzkPxM0+AzI1bWa20as8xN/D/ZlctpAALj6w==
X-Received: by 2002:a65:514c:: with SMTP id g12mr66925263pgq.76.1563719147092; 
	Sun, 21 Jul 2019 07:25:47 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:25:13 -0700
Message-Id: <16785ebdc50f38ef4bc30d477a6833bdd4b541d1.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 24/30] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:46 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 29fc9210b973be68de474e75068e4c72371afe5a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/uninative.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index ba99fb6..3326c0d 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -2,7 +2,7 @@ UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/
 UNINATIVE_STAGING_DIR ?= "${STAGING_DIR}"
 
 UNINATIVE_URL ?= "unset"
-UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.bz2"
+UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.xz"
 # Example checksums
 #UNINATIVE_CHECKSUM[aarch64] = "dead"
 #UNINATIVE_CHECKSUM[i686] = "dead"
@@ -89,7 +89,7 @@ python uninative_event_fetchloader() {
         cmd = d.expand("\
 mkdir -p ${UNINATIVE_STAGING_DIR}-uninative; \
 cd ${UNINATIVE_STAGING_DIR}-uninative; \
-tar -xjf ${UNINATIVE_DLDIR}/%s/${UNINATIVE_TARBALL}; \
+tar -xJf ${UNINATIVE_DLDIR}/%s/${UNINATIVE_TARBALL}; \
 ${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py \
   ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux \
   ${UNINATIVE_LOADER} \
-- 
2.7.4


