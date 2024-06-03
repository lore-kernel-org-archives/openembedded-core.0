Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84EBC25B74
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 02:19:43 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.73942.1717381176960015564
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 19:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Cg8DDpY3;
 spf=pass (domain: konsulko.com, ip: 209.85.214.175, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f480624d0dso31240795ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 19:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1717381175; x=1717985975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rMGchBq4JlqmX2gqwLoRAJGguMbHCoszbH4KcS02K6c=;
        b=Cg8DDpY3GsdrjjnvpPc5GMktsFG+1XFD7bUHeBJuM4qLLa8fRIyjniYx9pGIRypITU
         tLR0tFnHk4CljquJTCsvJbNJfZdS59aaSJTCbQubY/HRwa4+sYcv4yPofzeGRy2b+dcO
         ZzOnopKCYEcvb+UPLmhx6wAb2oFKL6OfMWhsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717381175; x=1717985975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMGchBq4JlqmX2gqwLoRAJGguMbHCoszbH4KcS02K6c=;
        b=tIjP8l1rRYsaNWAAxLo3XaMIea6iSQq97529enLt1grm4BheJaF9RjsA3BBn9alh+j
         FEMrZ/oQRVEnjTNNeuCwOvPkRTEvLq7x6oU0OeX9IyCL5nnu65C6qwJY+7y1mp5DeODk
         K+dPP9w2LZHRynpo9KKRk8OBzYs+8czk+sByTEIFwt+Dt5kNDza3lsg5JiRRX02xzEey
         DopX+iaST/Cz1j9YDY+3do6DZl2NIAaijJspYGyVqpdahgDEetktzLtFHcKVC+uHczNo
         8xhmq2sfMQIqkF+G4dABdW/ynQB5kXX4jQsYL1WJkS0sqlHX+r4QtF5k+dg0djyAWAYB
         f9YQ==
X-Gm-Message-State: AOJu0YxzSrbnCzokmzvKTZxMrL9ztI9q8EbZ4txD/q2tj929gzJxS9/K
	2Bw5TW1i0m1Ugiq0oKiAHUC1SDObkZNq93pE1XW939XIZgGYSrzv/AE/BI+EOZGIN7QlHtNsafK
	58Vg=
X-Google-Smtp-Source: AGHT+IG1o79xW5cqGgzRMkVNcyEG2U7da9uBZkeJMpEfAtqnFMBRkoOAB2MSiBY4b1sXn2ztE6GB4A==
X-Received: by 2002:a17:902:e802:b0:1f6:62c:96f3 with SMTP id d9443c01a7336-1f636fc573amr109470015ad.6.1717381175326;
        Sun, 02 Jun 2024 19:19:35 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:3acf:7e6a:63a4:1366])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63236ca4esm53981385ad.98.2024.06.02.19.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 19:19:34 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-babel: upgrade 2.14.0 -> 2.15.0
Date: Sun,  2 Jun 2024 19:18:34 -0700
Message-ID: <20240603021833.2437840-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 02:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200228

From: Tim Orling <tim.orling@konsulko.com>

* Override S and PYPI_SRC_URI as upstream tarball is now "babel"
  instead of "Babel", but we still need PYPI_PACKAGE to be "Babel"
  for the upstream version check to work.

What's Changed
* Drop support for Python 3.7 (EOL since June 2023) by @akx in #1048
* Upgrade GitHub Actions by @cclauss in #1054
* Improve .po IO by @akx in #1068
* Use CLDR 44 by @akx in #1071
* Allow alternative space characters as group separator when parsing
  numbers by @ronnix in #1007
* Include Unicode license in locale-data and in documentation by @akx
  in #1074
* Encode support for the "fall back to short format" logic for time
  delta formatting by @akx in #1075
* Prepare for 2.15.0 release by @akx in #1079

https://github.com/python-babel/babel/compare/v2.14.0...v2.15.0

License-Update: copyright years

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-babel_2.14.0.bb => python3-babel_2.15.0.bb}  | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-babel_2.14.0.bb => python3-babel_2.15.0.bb} (62%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.14.0.bb b/meta/recipes-devtools/python/python3-babel_2.15.0.bb
similarity index 62%
rename from meta/recipes-devtools/python/python3-babel_2.14.0.bb
rename to meta/recipes-devtools/python/python3-babel_2.15.0.bb
index cd40d4222bf..03d06c46840 100644
--- a/meta/recipes-devtools/python/python3-babel_2.14.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.15.0.bb
@@ -1,14 +1,18 @@
 SUMMARY = "A collection of tools for internationalizing Python applications"
 HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0f97d9a63e91407b4c0d01efde91cfc0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e7ebed8cd9f4ff11f547e3afd024a28c"
 
-SRC_URI[sha256sum] = "6919867db036398ba21eb5c7a0f6b28ab8cbc3ae7a73a44ebe34ae74a4e7d363"
+SRC_URI[sha256sum] = "8daf0e265d05768bc6c7a314cf1321e9a123afc328cc635c18622a2f30a04413"
 
 PYPI_PACKAGE = "Babel"
 
+PYPI_SRC_URI = "https://files.pythonhosted.org/packages/source/b/babel/babel-${PV}.tar.gz"
+
 inherit pypi setuptools3
 
+S = "${WORKDIR}/babel-${PV}"
+
 CLEANBROKEN = "1"
 
 RDEPENDS:${PN} += " \
-- 
2.45.2


