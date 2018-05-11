Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id DC88F75322
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 11:02:33 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id 94-v6so4929242wrf.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 04:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=HOJdEnt3ViSzaP8CFEMT/jHlvJ+FjBzdtkhhkBMONss=;
	b=ml7D13FnN6DYuSkv3yKCI+rSq8gfjPcJJe1rT+WomnugPKUHOFoEoAXUomLlKVaZkD
	sO60kGlq/X23AGTUojybtrh7sMnGVGEjhFgwpRIn8RF2Xds8QakExVM6nABaoS9+QtIM
	2abkQ9pqlTIoIhRBWn5M/15APsrnhUA+/vX8k6lqVjY3zxM9xk3zBEeFtS5RzVBtqii5
	ZDxnKhW1Oi/2ZFydI5Vy8O1o+xGhVm7UMrvOQIRS1dseqqLGD6A2MaBGPB3eq73Q7SpL
	z+T8XWIZ9C9nWd8IxPtHEn0uL3sRhcrWikv76gGpxg2VolTM+4XhnWiRzWCVTRct6iUL
	t27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HOJdEnt3ViSzaP8CFEMT/jHlvJ+FjBzdtkhhkBMONss=;
	b=Dygs1W9ezLtiC7Z/bCaOKo4Ntwv1ckKqAdleKcnSunW9e7dP6yz/OdfB7EQGnN0hSY
	N4TUWCz089G2F2fJISOUbT11ZTC8EtI9Gl8wdPRzK4Is4g7zj1+7C6hPh2lsC3ndJK7h
	bOBoEL5AwRhzMkpf/KwyR8IgsULKT6ksjdy4PM5oi4GtEyMEKdeistqoMWvluqVE1S5I
	5Xdmf1qGg7TpeEkwQIaV7HKtrp85hZAt5ehvzpe0B7co9GMcH/jHifzXWEdAT7A9SyCN
	7hplXRchi1ErxmY/03OM4p/f/FWzuZRUm0ZFzZV2Gwxw+mLUj6Hdo71mmcxQJg9qklzt
	PyyQ==
X-Gm-Message-State: ALKqPwdPuKH6CvoTI6twBs/HVXUcT6oGNVaiNcIvDJaO70zJO8r3c/An
	dVAQ7tsX07jSCh/SJ0zxlUB1bq0C
X-Google-Smtp-Source: AB8JxZrEI7l5EVDiL77q+GodqD43orgp8lIORNKBpZSjmtdZz8w05k6PjfXtNLFfmjaDDqSKRCIwTg==
X-Received: by 2002:adf:94c1:: with SMTP id
	59-v6mr4036697wrr.112.1526036553804; 
	Fri, 11 May 2018 04:02:33 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l69-v6sm1617814wmb.6.2018.05.11.04.02.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 04:02:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 12:02:29 +0100
Message-Id: <20180511110230.9867-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] musl-utils: monitor commits for upstream tracking
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
X-List-Received-Date: Fri, 11 May 2018 11:02:34 -0000

This repository is infrequently updated and doesn't really release, so just
watch for new commits.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/musl/musl-utils.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/musl/musl-utils.bb b/meta/recipes-core/musl/musl-utils.bb
index 74b846df595..dd0ce330613 100644
--- a/meta/recipes-core/musl/musl-utils.bb
+++ b/meta/recipes-core/musl/musl-utils.bb
@@ -13,6 +13,8 @@ PV = "20170421"
 SRCREV = "fb5630138ccabbbc14a19d372096a04e42573c7d"
 SRC_URI = "git://github.com/boltlinux/musl-utils"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 inherit autotools
 
 S = "${WORKDIR}/git"
-- 
2.11.0


