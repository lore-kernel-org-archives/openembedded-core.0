Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 84AC17D1A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 14:41:08 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id q1so23247872wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 07:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=0FlT/wdHo8CkenVSJnMEeXYqmKzDHF8ycgZw1cEI3xo=;
	b=QHkgcz3e1EPMiFpGmLhGGRbHN5XlC+uQhO9mZwO2R45euaWeyIkxGxp4rjaZXm3UzH
	WpMPCSsfO7Q9lUeIjSXiGKvWhtfqlSltD/nRfcuyYPEocNIq9hTIGGyptJnlubmF5Hsx
	ODYK4E4Eq34aYp6peAZSSgeMTDOezLzfQQtQyYVy7OYlmqUoWk5g5THJ8poF4aqfj9Ba
	p3Mu+ZA8RY//G85xtkhnG2VyzlppkfMDvOnH4J0aAuRMokYMoA+ceIhmeEsk88UY99Q8
	uJULAC7KL5wSoZxeJYbjf6tewkj4W9ZkBx7Jpitzq23KRoR61oqg8Ky5dE2uY8scO0I/
	1fOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0FlT/wdHo8CkenVSJnMEeXYqmKzDHF8ycgZw1cEI3xo=;
	b=a9ywC3YnORAwizacvZN6mzmNwIU2KHu16Skz/SNBeaKRCUmzST8CVIZjmiWwHDliNi
	kbkIcwUEmZbyT69oOJdKf9vXcsRwyf/XYUt6dc/ObTsb5nFRVvm74FBQVkmp0bVcFEN3
	oTSUsfOuxzbG8mlJk7OCHiyypU3azFvML87c7fR2wvMh+nwVDhyniUAMwC1WTRCkX/VU
	xqSNzZ3o8oTAc4+yiMPcJwGecwKXmay9CBgfJXej+fsXYruVkTSMb7FfPj2sceVHoyAQ
	7QggcJZfb/Uzh6B2mPRCm0dzPOaKnGdzFTDl59Ls59GCo+FP9JTULbYxTXjJWrEcKoFN
	pgtw==
X-Gm-Message-State: APjAAAWslk8RMoOLG8C3D94IIjAnVfb0luFFjiL8JXvixZ2g2di8VgSD
	ltK6K3L3jtHqyUQON8ME4eAt4g1ypAw=
X-Google-Smtp-Source: APXvYqzOUlX07lH+9J5uXINVfpyvIuXYUsUHAkwUAyi1xorftSzmMtMSBe/Y+r2E93WsdVkMg1swUg==
X-Received: by 2002:adf:eed1:: with SMTP id a17mr26540189wrp.268.1553784068999;
	Thu, 28 Mar 2019 07:41:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id n1sm2269636wmc.19.2019.03.28.07.41.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 07:41:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2019 14:41:05 +0000
Message-Id: <20190328144105.31018-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] binutils: set CVE_VERSION
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
X-List-Received-Date: Thu, 28 Mar 2019 14:41:08 -0000

PV is 2.32.0 even though the actual release upstream is 2.32.  To a human this
is insignificant, but to automated tooling it matters.  Specifically,
cve-check-tool can't identify CVEs that are in 2.32.

Set CVE_VERSION for now, which should be removed when PV and the upstream
version match again.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/binutils/binutils-2.32.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
index 15406441241..5d0c16b13ec 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -20,6 +20,7 @@ def binutils_branch_version(d):
 # correctly set to match the upstream version tag).
 UPSTREAM_VERSION_UNKNOWN = "1"
 PV = "2.32.0"
+CVE_VERSION = "2.32"
 BINUPV = "${@binutils_branch_version(d)}"
 #BRANCH = "binutils-${BINUPV}-branch"
 BRANCH ?= "binutils-2_32-branch"
-- 
2.11.0


