Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1311373613
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 04:25:02 +0000 (UTC)
Received: by iecar1 with SMTP id ar1so5211149iec.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 20:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=WL4b55vdx+Xg4ud3dFSyosH4h2/vldJ5lUUX0l/ip2Y=;
	b=cS/G37U+a17c1rbsTzpwQPwuiBgFE1X0WNFOJ1HSvcpVInuoiK61+9KQcgGDTeuoSi
	IiwNA+CgULqLg2riBceKl6b0TR50TbEQKdcs6CXOLm1HRXr0s1tLnXbsRdnCY8maWp1S
	9f87GA4ta5atqohuzMDynQjh3LqqAvD9VNavVQOmoDkCe+WQ7SO7AamHKn9A4dgSFrMA
	OhOYl+DgWm4rA83cTxUIh1KNzZ2HIcT7v6QiXtCea28w2IpJkPXMAzaOqstSoU9AAIon
	RM/WM4Zz3Fx1/6BbTJkg9tdfAveZS8oAnX+OTMoq6Pe6TzB2rW+XtzTPJWfkfNNe3AG7
	Q41A==
X-Received: by 10.107.5.79 with SMTP id 76mr10986237iof.15.1424406304283;
	Thu, 19 Feb 2015 20:25:04 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205]) by mx.google.com with ESMTPSA id
	f12sm15642652ioi.21.2015.02.19.20.25.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Feb 2015 20:25:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Feb 2015 04:24:35 +0000
Message-Id: <0194a56748daf7f4486b78b8507ea164501d8242.1424405852.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e879427a035a12a0b9040ff948fe3e22618412b8.1424405852.git.raj.khem@gmail.com>
References: <e879427a035a12a0b9040ff948fe3e22618412b8.1424405852.git.raj.khem@gmail.com>
In-Reply-To: <cover.1424405852.git.raj.khem@gmail.com>
References: <cover.1424405852.git.raj.khem@gmail.com>
Subject: [PATCH 4/5] tclibc-musl: Use musl for providing virtual/libintl instead of gettext
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
X-List-Received-Date: Fri, 20 Feb 2015 04:25:03 -0000

Lets try to use musl version of libintl and see how far we get

Change-Id: I0259049eb6461ab9b579c7f3ad401fefede24621
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tclibc-musl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index d1272a3..7c1c91b 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -10,7 +10,7 @@ OVERRIDES .= "${LIBCOVERRIDE}"
 
 PREFERRED_PROVIDER_virtual/libc ?= "musl"
 PREFERRED_PROVIDER_virtual/libiconv ?= "musl"
-PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
+PREFERRED_PROVIDER_virtual/libintl ?= "musl"
 PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
 
-- 
2.1.4


