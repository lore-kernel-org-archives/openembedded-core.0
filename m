Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id D569278994
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 16:39:17 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id s9-v6so31338wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=M9A+AxGgq3/VUDY/7BU+k1KzXHtazEpNsj319eRFI+8=;
	b=E/0/C3MADQFgmdfO6Hu8djkN9bM1mAeqbXiCR/loCFeSUhjSML0q8hMPl4Vq7nVJAW
	DxHWm5xVYf9gAGWe2va5Ibw7BRDQgGYB5eatk9DbuV7oAvijXPZCsdjggfr5j8GBsIix
	ApROAaKcBkteMljT1juRm6BHsIQmd7Vch521c75s/95i3riXTqvnihWMtl60CmtClMEf
	AGtJMVVKclEb4eTpnQzyR9sn/c8i5D2A+FPhilYyL6wE/Skgd/WuwbPTMDSWTcqB7Tr4
	+/ISZT7CvmQtTEUQo7Y01WZHCwjxOejBhjocg+qGnmTDDq0lh4jSdUixlMwyy980WhKq
	bXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=M9A+AxGgq3/VUDY/7BU+k1KzXHtazEpNsj319eRFI+8=;
	b=BQUOF0fghqidqR7UAHazocyiOxc9lFyJdeVQJt81ayaOoebZLLMD+dT7LDcVmBIZ1e
	FKlbQ973sfMo0gMwJOAO6kjVyDJFbCVQazG+Lim2QKNFQmmcTkyaD+CJHHOREdhYI4W+
	AJqEGm9AXOrj/Agl9S1/pgyJiFUyjiT5WsuWzfB99TFEpEY8Avp0WtWyT6sFCIdgViqd
	TqltEhhBjMcpkSxRpqZyRbHuWsoksm2nEMoaZAW1PnIImfM1GOe0amYyPheEG1fMeXnt
	dta9b8QKNzgR1bn/6AIX7B2jKaymjsIap4mBmvcPSFaz4QlifisoiNyRIP1evCj+4zNW
	6b4A==
X-Gm-Message-State: AOUpUlFFDnHNEpIrSXFh4x+xegX5L9gBxc9/jp05OX/xi4lBTFF5a8+H
	VCgsKnkxQH+g0Pi9DhOchn/4kNWB
X-Google-Smtp-Source: AAOMgpfDMXcQnZgEOtE5FO5WAPLILPCjZc/ZjXStxCk+GmnxdsaovfbB0FymI4Y+r3FxLbpJHIHnHw==
X-Received: by 2002:a7b:c058:: with SMTP id
	u24-v6mr1869990wmc.136.1531845557931; 
	Tue, 17 Jul 2018 09:39:17 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm15958wmd.11.2018.07.17.09.39.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 09:39:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 17:38:58 +0100
Message-Id: <20180717163910.3196-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180717163910.3196-1-ross.burton@intel.com>
References: <20180717163910.3196-1-ross.burton@intel.com>
Subject: [PATCH 03/15] libyaml: upgrade to 0.2.1
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
X-List-Received-Date: Tue, 17 Jul 2018 16:39:18 -0000

License changed due to copyright dates being added.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libyaml/{libyaml_0.1.7.bb => libyaml_0.2.1.bb}             | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-support/libyaml/{libyaml_0.1.7.bb => libyaml_0.2.1.bb} (55%)

diff --git a/meta/recipes-support/libyaml/libyaml_0.1.7.bb b/meta/recipes-support/libyaml/libyaml_0.2.1.bb
similarity index 55%
rename from meta/recipes-support/libyaml/libyaml_0.1.7.bb
rename to meta/recipes-support/libyaml/libyaml_0.2.1.bb
index b167f031a8f..d77891825fc 100644
--- a/meta/recipes-support/libyaml/libyaml_0.1.7.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.1.bb
@@ -5,13 +5,11 @@ HOMEPAGE = "http://pyyaml.org/wiki/LibYAML"
 SECTION = "libs/devel"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6015f088759b10e0bc2bf64898d4ae17"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5591701d32590f9fa94f3bfee820b634"
 
-SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz \
-          "
-
-SRC_URI[md5sum] = "1abf45bd3a96374fa55ca63b32f9f2f9"
-SRC_URI[sha256sum] = "8088e457264a98ba451a90b8661fcb4f9d6f478f7265d48322a196cec2480729"
+SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
+SRC_URI[md5sum] = "72724b9736923c517e5a8fc6757ef03d"
+SRC_URI[sha256sum] = "78281145641a080fb32d6e7a87b9c0664d611dcb4d542e90baf731f51cbb59cd"
 
 S = "${WORKDIR}/yaml-${PV}"
 
-- 
2.11.0


