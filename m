Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6C11F6B1F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 11:35:15 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id y185so6407081wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 03:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=mvGNap8dnI1JLDffeDhu79eFrts++B+nvimGhQTtvHY=;
	b=0WX8ZsBa/jp+6Hc2adM93rK/5D5oOTuwAj+lfsCYTLvYc8LYC8c22ZOB9T90hEg9rC
	jg1GSqQeBuw/wSFOLNrmrWnnqVt5Ij7jysmd8Vf/6l8d3K9OdqokYZ6rtUOdMk9Y87uB
	RQgmukD8M6DGQSeV1PBNF4VeEYeRX0MHs7Dpj8RqdiPPm/XSKj1qINbobuHB0Bwi0+3W
	mnoTCgnpqvKOZzSBzsnYao2z2cUhm8Yu48//BRz2dEX9wpGdCFbLeQ8qJK60H82+2Ig7
	pHPQbfcQoOOw9uQ6ZFqyG0Rsy25mgcfC6tb78l3Tv9CtYKdpzQzOcKggF8niwzFGGyeF
	M0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mvGNap8dnI1JLDffeDhu79eFrts++B+nvimGhQTtvHY=;
	b=OJaJMy48zLhy11nrbbWmEgyy4/08lpeGqYvF9RJ4VFv5AMzxOJyMlKJAePcF4cMZ9+
	EsUSk1UuXBqcLX1rNVC80mjb1m8ZHObvmsxaENnl0V4F3IgvKQyNQwp0x0f9oA4q41D6
	gNpyQ7Zm5J0aFZaBTLvQKxR7c4/nFg7rDyxTfpag/YBgq2u2fdAIP1a6XE6vnDuA/QKW
	w2Cp/IBL2wy4ZCr8v19oQ6wH9Ga+wt36rcCxY6OdqcdNuSviRgU8yFdPAx41bf3X7qIF
	yitF0TQvmCNOXobYd8377TSGcXkZ0SsveIQPre1IOwTaPupISo3BNUCogA2pkq8sa8Tg
	jeyQ==
X-Gm-Message-State: AA+aEWZUGfyE45ir6j3NEi0Tdwrm/zcFtW+xY36S9wzuBAaYcn/KHr37
	LzkcdP3ye6djrdRJYvUKpcX0Gv8o3sY=
X-Google-Smtp-Source: AFSGD/WatXmBsO3SEADqWOMeyEdy8XIWsggJqdGQOXoj9/TMePJ0x6JqPJKklATmU80e9B5edrn7Bw==
X-Received: by 2002:a1c:3c06:: with SMTP id j6mr9377272wma.27.1544441715689;
	Mon, 10 Dec 2018 03:35:15 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id w8sm10516766wrv.7.2018.12.10.03.35.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 03:35:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2018 11:35:13 +0000
Message-Id: <20181210113513.3671-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] nss: fix Upstream-Status format
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
X-List-Received-Date: Mon, 10 Dec 2018 11:35:15 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch b/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch
index 7ba8d16483a..bb1c6e3b345 100644
--- a/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch
+++ b/meta/recipes-support/nss/nss/nss-fix-SHA_HTONL-bug-for-arm-32be.patch
@@ -2,7 +2,7 @@ Subject: [PATCH] Fix SHA_HTONL bug for arm 32be.
 
 In arm 32be, there is no need to reverse the host value.
 
-Upstream Status: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
-- 
2.11.0


