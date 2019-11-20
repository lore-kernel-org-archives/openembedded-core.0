Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 223E17F7A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:45:02 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id i12so2038037wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 05:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KMIzhUgLysSPUVGynLg2XezWdwwJr8MwDxE1VTIBOdg=;
	b=sSMQP80bl/FV+vdqCsAUqh0hhAlg6tRdloO9ANV6x/FjzA362Ljym7CmIqBWp1z/ZG
	zahPWjq8XUUaViSW2IOOGKSGneA/Hwv7YiwMSvtQKVwGLH2eMqyB40OOLAl0Pl9XVZT2
	Q+479GtAdxU1LcbplkqVP5vekSuE0z/Tiv2N+gZ8f/QlrIjmFY06iEWk+6h1DMkQBdWd
	we8GHqGrjjf5X38AgsCeL0a0OsSrPxBlqfhdVEOqS6wC2I0A+3toxB9+NRH49yQhEQSD
	APQ0QtSHLRTWutEnhTdzHdRI1RtoFBtp5UJxCF8udyn7muber9oaVTQBSaAjG+0mFehE
	dC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KMIzhUgLysSPUVGynLg2XezWdwwJr8MwDxE1VTIBOdg=;
	b=Kypu5XAQcV+e3b4i5KM7g66J3ptYijCmP02coygYQXv332o6CB+lDVBlFzV1jSj7mt
	paKNoanJfkylIhW3NGWNvLSHqa+x0kRBvGiaWZkfUEf8hbbm2UdPqOPMO2E3T7KmyDaH
	Kn0nwL9H0oRW8kXATtn//dtFyaBuKIeAUusqPRVTJd2Zks43iTs6/ASdvaY20DVOgKjN
	aD5ljYAXfI0xUHsYr0xY6fI06l1vqSdrxRlvXJHsubirxN+MOiUAfKR2Uyl2LcMhYvw6
	YnUDevtdI2UQDxbZscsW+HyxERq8e/3nVslsDTe/d6mHEdhD3SQ0+J478AaL35nau1xG
	pScQ==
X-Gm-Message-State: APjAAAXO59+LT60wB6L8Fm+kVopNU4J09sD477NMEbYDZX74VWT8UBrj
	ipX++F/HEQDJzzOr4PezsVC6uZxf
X-Google-Smtp-Source: APXvYqyF5LBdZzgvkINVuOjhw+XIlslfYMkNkbGjYBjDrLt7k1Ky6pFGMUD5W8jY7fc9WvFkzOV56g==
X-Received: by 2002:a05:6000:1083:: with SMTP id
	y3mr3335381wrw.290.1574257502692; 
	Wed, 20 Nov 2019 05:45:02 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o189sm7031771wmo.23.2019.11.20.05.45.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 05:45:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 14:44:46 +0100
Message-Id: <20191120134455.125118-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120134455.125118-1-alex.kanavin@gmail.com>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/11] man-pages: update to 5.03
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
X-List-Received-Date: Wed, 20 Nov 2019 13:45:02 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../man-pages/{man-pages_5.01.bb => man-pages_5.03.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_5.01.bb => man-pages_5.03.bb} (87%)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.01.bb b/meta/recipes-extended/man-pages/man-pages_5.03.bb
similarity index 87%
rename from meta/recipes-extended/man-pages/man-pages_5.01.bb
rename to meta/recipes-extended/man-pages/man-pages_5.03.bb
index ea1249e4396..2381ba4348b 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.01.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.03.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=794f701617cc03fe50c53257660d8ec4"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "38abead776a506109e128ab96bcbbe58"
-SRC_URI[sha256sum] = "070bef794c6826b3fb3965d1a2efdb46c25cb37c06c715987f88a50906cd5b6f"
+SRC_URI[md5sum] = "d1da6babb99cbd269233a35de9d8718e"
+SRC_URI[sha256sum] = "e8bab0b10c6fb3a6d69615edb488f8a27020f3625c4cf43b8451ba206acbb1b8"
 
 inherit manpages
 
-- 
2.17.1


