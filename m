Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 152647C654
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 00:37:10 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id h99so59483wrh.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 17:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=2+Q8LZo/MMZH9TKdNl+BHB+V9b0biFmPgUqarhuOJp4=;
	b=jwQ4FmJWnstmRL88Pax+GhHXgaQ+56SApGsboGlzDlmqFpuPZKTzCxbWLc0IQEF28i
	guthvYnjHiOxpgxfFLEFH5hKSCKQAwjZL03q/eQA42+7bYiNwXujeq5oVuU5AnLKhiTj
	pGUHy3HidC2xb4pUd6V7ysZWgfbQfqOJiW49l0EqW2sU1CRaYaaNqMVHGE2IVt5ErrDI
	Jjc7UOKyJgPUsSprE9JiRKm3W7i0mk8+/pvFTb6G9RRM+DMyU4YVXfAnJE3jfYzHhmVc
	5801bgZHIQ2gGsbxzy3TkI9HpL1el6u+mDuTszbup+iwiiIrzSZG5RWio4QMCIvaDhY2
	2ReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2+Q8LZo/MMZH9TKdNl+BHB+V9b0biFmPgUqarhuOJp4=;
	b=nrNJyMPHOAU+7i4pDyndPlEklY+35XFf5sS4FjIZraRYHHLyEiGUIWlbOtmLj0usMJ
	q2swyGRZgWrJA5pOOX2BIQ6yucBg9U+vuGxRyXJe3OCcvx/dcIcBV9fsGx16/SGiLELf
	BnMFy/3KsBnz3RkHzU4ua6Cysp5vzVj73+ORBEV3FGDPKBn+dyxHgrtKyc63RoDtCo/D
	hbtF415wNfxPqZVK4tSas06Cifk9mkolKXjbncb7oLpVYCWxX1BuLAclpFXAMG8bF7LT
	p5Qg3C95nAOCn2jGRGwKirSkPdEeF6CkhNzPUjYly9lmujlHNWfJVUYM2Vonrkzpg4Fz
	F4kw==
X-Gm-Message-State: APjAAAWtTE56N4MNncE1M+YwYOUB4hjlwrMKeH1/f125nuHiXJOKS3ln
	bDDd3RP5bb0YAl/h7qP2W6LpwhZMmn0=
X-Google-Smtp-Source: APXvYqyE8qDNIk3ArAbiQadhO58ag1qrsHf+87TmiWXRfmozv6dswSoEbDtRFcfwnNzrVLzNFWwnqg==
X-Received: by 2002:a05:6000:124b:: with SMTP id
	j11mr5500845wrx.23.1552437431345; 
	Tue, 12 Mar 2019 17:37:11 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p9sm361555wmc.14.2019.03.12.17.37.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 17:37:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2019 00:37:08 +0000
Message-Id: <20190313003708.24435-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] systemd: drop unused kill-path option
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
X-List-Received-Date: Wed, 13 Mar 2019 00:37:11 -0000

This option isn't used and was dropped upstream in v240.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_241.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index 47492c95129..66a83c5cd11 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -195,7 +195,6 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
 
 # Hardcode target binary paths to avoid using paths from sysroot
 EXTRA_OEMESON += "-Dkexec-path=${sbindir}/kexec \
-                  -Dkill-path=${base_bindir}/kill \
                   -Dkmod-path=${base_bindir}/kmod \
                   -Dmount-path=${base_bindir}/mount \
                   -Dquotacheck-path=${sbindir}/quotacheck \
-- 
2.11.0


