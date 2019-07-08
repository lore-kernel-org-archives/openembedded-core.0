Return-Path: <lemagoup@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA627D200
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 08:59:43 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id f9so16083292wre.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 01:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bkvCZ2ajFW41WwMB6FxlEA+EHyfUUPgJZOB9kdSrNUA=;
	b=kPVW494OgVJwuNVnmD9hBsog4wWTwFWca9uNwtKV6gDDsGHRP8aWSOzO07EitpnqbY
	dCS0m0UdorPWiVKMmFRjCS3/uLFJbcJY1pJDvOV6mZdHEGjB2uLnGtp3VFsSkxavuLPl
	p8MrulDpFMXK7DeXh6POvGPNIpH6kZISulhsxyarHcIx2QYqhKvS9kDklqffpyIeHHSx
	dY45X1OduzwIFBchhO3SKN0FSfCpYG0qdpJBUj8DR2cPDR+37MNm/GWohblll0/uJgVZ
	NKOTxHLXpJMzLP1ePimIdlSHoQ7iGySJJr0cvVB65nv6jesVNxM48NSAuu+uyC4sVsMw
	66lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bkvCZ2ajFW41WwMB6FxlEA+EHyfUUPgJZOB9kdSrNUA=;
	b=A4TvnX8pYgHzeI1l4A2mAj6wrUrB6cGDI61pjwntfp84+Hhh6o1JjATtiZDQ/G0tYh
	J68P1ByBiKFtMtA7wy9V1IIgb39Or2WVgsjGzz2JlEOuhi12lCATsSJvWfdD2T8FAKFM
	taDqcx/CHusOabonLhIUqcXF2zLTwWKRRA/4HqPPzrLmq/VrthMzL3hSfkfDhT7/y/o+
	qn7z1LOIL0E48SJ0BTe0iWwL/Xwp9eZS6CDxsoFJKYyc3PHX2E+2leN1l7xX8LzgCnCd
	vXAFNdZYo/rGaVdptbW5pqXjedK/+dHZDSbTGRNeIdsb8dLXbeKdrXQnQ08lFno+sBwl
	l8gg==
X-Gm-Message-State: APjAAAW5lCLOWqQcFcLSJV55DfgYYbdh2S936bx3P7Zxbd11EBOhd5BJ
	j0LDyxIuQ5y1aCiml1mbRoTlbD6o
X-Google-Smtp-Source: APXvYqwkCZDdPjR0cNYxD3MDKirCRGQuIoDI2+9lve+aIAKCIQryRNG3Tj/CJrr0QCp+9thlUP0Z9g==
X-Received: by 2002:adf:f046:: with SMTP id t6mr18810896wro.307.1562576383628; 
	Mon, 08 Jul 2019 01:59:43 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194]) by smtp.gmail.com with ESMTPSA id
	p26sm24796749wrp.58.2019.07.08.01.59.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jul 2019 01:59:43 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jul 2019 10:59:28 +0200
Message-Id: <20190708085928.13160-1-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v2] cve-update-db-native: Skip recipe when cve-check class is not loaded.
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
X-List-Received-Date: Mon, 08 Jul 2019 08:59:43 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index d658c7bfea..e16c41a72f 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -13,6 +13,11 @@ deltask do_compile
 deltask do_install
 deltask do_populate_sysroot
 
+python () {
+    if not d.getVar("CVE_CHECK_DB_FILE"):
+        raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
+}
+
 python do_populate_cve_db() {
     """
     Update NVD database with json data feed
-- 
2.11.0


