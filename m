Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id DE3116E630
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 00:52:46 +0000 (UTC)
Received: by iodd187 with SMTP id d187so66464044iod.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 17:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lURvi8dGFfZ+4YIP/PKIpyy70qExqkX69YbG2bMvZ6Q=;
	b=C20ayNhqESNnmAdEWxu8fNQ1aiU9R3Fxyekh6+4AmgBOfml1D1q+fx+3i3HuIInBVR
	a8FWXccLlvDluCANGpGV8hch7FcRlBXsQLfp8WIsI8EiIxEXQUNokNtLWOw4OZwzJxTY
	oE6Q7l+Tkozm/+Gl0qe0c0h3cJrbGGeRo6PiLqOPU6P96id6ewbrBCIqBWVPUAeQE/J1
	gBIQW2WkPB3Rjc5l8MMbEreAEpoc62DpiSaEftk79gag+6lSfIUuLARhMqSdPzsNmDwg
	8zty5SrfltaT0b5+44hOiKyEuzbUjSB/ap05w8iqacu76tmxkTyNUE4e+D9TSCs4FZGK
	bCNA==
X-Received: by 10.107.164.82 with SMTP id n79mr1284019ioe.88.1438822366749;
	Wed, 05 Aug 2015 17:52:46 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id x4sm3355789iod.26.2015.08.05.17.52.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Aug 2015 17:52:46 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Aug 2015 17:52:34 -0700
Message-Id: <1438822355-23346-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438822355-23346-1-git-send-email-armccurdy@gmail.com>
References: <1438822355-23346-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/2] libiconv_1.11.1: fix LICENSE declaration, LGPL -> LGPLv2.0
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
X-List-Received-Date: Thu, 06 Aug 2015 00:52:47 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libiconv/libiconv_1.11.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libiconv/libiconv_1.11.1.bb b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
index abf739b..d09b194 100644
--- a/meta/recipes-support/libiconv/libiconv_1.11.1.bb
+++ b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
@@ -5,9 +5,11 @@ HOMEPAGE = "http://www.gnu.org/software/libiconv"
 SECTION = "libs"
 NOTES = "Needs to be stripped down to: ascii iso8859-1 eucjp iso-2022jp gb utf8"
 PROVIDES = "virtual/libiconv"
-LICENSE = "LGPL"
+
+LICENSE = "LGPLv2.0"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
                     file://libcharset/COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
+
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://autoconf.patch \
 	   file://shared_preloadable_libiconv_linux.patch \
-- 
1.9.1


