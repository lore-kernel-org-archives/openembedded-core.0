Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 636366E5CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 16:15:33 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y16so30380370wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 09:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=i/I1k2KVLHCgSsNsKw8DWQ842m70hX6gdsX0BtwiLb4=;
	b=bKJ7ZUbegTv0L5j76BaNfIHh5cQwwE+aidTl5HmvLAOBAzZztgDolJYckuSP7wPgZG
	EhvlwBWRRf/wtBawidlJJ4bBxPsz3QKj65a2UcHoTkJJLFh9GBQ81WQ50nWTrtQLcpNl
	8M+fl7rKWOkXoie8NvN7soTOTOb1aDsNdusvUAbSZtGaYemPIbonBc4lspPMBXRIqmUD
	KR82OXZo/qeqKa7HtZUK2pP7sa+52eA2BV1Yk5FlQGI34svSNzPpMhDHIcHcEW16OCps
	7WvgHrGubzkY6McuhUk8T91wF1iADEfha14Pohj82jk5Xw6aXPhNaEeMaCqp+StQiW0N
	7Rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=i/I1k2KVLHCgSsNsKw8DWQ842m70hX6gdsX0BtwiLb4=;
	b=aqnmXWWpw6qlX5dOKkDrjrItSpcMMvxFo72RXsyHIVGgqa/GyIb+BmJhTR+1zAgyj+
	wadQFlAgdUGYjd1L+6Tw/Nw3trVlw04S41FjUQ+/hqAM0QdNQupsrO+/PiLxMJTNpQV8
	07d76Q0wfWUfmkasxDcrUVV7jfT3u66roF7eiQCZr7rkZw7uTGdhHA7s6wHCAqeYuY4U
	uYsuUKxib1rkGM/QhBUx10LEW+oRxBDnW8cR8kJVEWQ4Zl6Vv8eK5elpgAj465RxuG+V
	1Je2Jy5ZAqGTy5FojU5eqQ2M8nCsWqZapf+iEA99G4+xMY6TOOW3NeHvxKtmb4JpvJEz
	ylQw==
X-Gm-Message-State: ABuFfojADNhtQlw8PtXwHaM+5I7pobjM9zAGQXaUhTo8lD9WITeAaeS0
	4bKs2Ht+dW2IheZV+0L238dYW1DCINE=
X-Google-Smtp-Source: ACcGV62iMGFgTUhw1TQpzUHMApEKk8fCmrVkpwJhHO2mBjvk3YRQzYV79neeluAbqauweS7B3YJ7sA==
X-Received: by 2002:adf:e444:: with SMTP id
	t4-v6mr2227901wrm.306.1539792933137; 
	Wed, 17 Oct 2018 09:15:33 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c13-v6sm15366607wrm.50.2018.10.17.09.15.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 09:15:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2018 17:15:30 +0100
Message-Id: <20181017161530.31303-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] maintainers: assign CMake to Pascal Bach
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
X-List-Received-Date: Wed, 17 Oct 2018 16:15:34 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ddc8a034556..49d9f70481e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -96,8 +96,8 @@ RECIPE_MAINTAINER_pn-chrpath = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-clutter-1.0 = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-clutter-gst-3.0 = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-clutter-gtk-1.0 = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-cmake = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
-RECIPE_MAINTAINER_pn-cmake-native = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
+RECIPE_MAINTAINER_pn-cmake = "Pascal Bach <pascal.bach@siemens.com>"
+RECIPE_MAINTAINER_pn-cmake-native = "Pascal Bach <pascal.bach@siemens.com>"
 RECIPE_MAINTAINER_pn-cogl-1.0 = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-connman = "Changhyeok Bae <changhyeok.bae@lge.com>"
 RECIPE_MAINTAINER_pn-connman-conf = "Ross Burton <ross.burton@intel.com>"
-- 
2.11.0


