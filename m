Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 05A3A78CA0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Oct 2018 14:04:58 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id r63-v6so8289865wma.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2018 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=WcdiCo1z+0HU6N523py0lFU60672QyncfLw7E0YYTFo=;
	b=gg2sGGwTHVA2mdL+uyvw3jK4koYDKWOAqwN4JBRSNgGJviWJg7b0cMqrQieZoCl0bC
	D1zknPPmWu/fZhttTeeFQRnyAcdJamATvCuTNyU5Oa8R12/FOMV9miuIlcNO8HF/lM1h
	i5aItBoL1LfihQulW42S6DvPbNfC1IF1bejVOFrFiOFMJbY/IxhEU8iDPax4URyL5aQ0
	AA548P89oBgRJilrHwb/wFrXa3P8zVQ32usLexAs7GvnmwVKZwwJ1XT7tFRSz5SPAwKw
	G4yPvDLGze1vJuudRwPujdzuCq1G+cJcBrgweN85A8voS04n9t5aeLGrln18EMDtPAmG
	e8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=WcdiCo1z+0HU6N523py0lFU60672QyncfLw7E0YYTFo=;
	b=As8/KgDY4JPiiKtVM1FkMO7oFDmSHVjtYRz4T7hoETgU3BjJAazU683/iHYhSQ7SR3
	75uutosojj3OgINkhmfZc+ithNlr5Ie2OwwoA1M06Uj1+gXGQhw43LNc+t/uKCMcZqca
	TwqnBJ5b2qvdMQusvr9FQIMGQ8FZc//yRmFWFGt//COQE6RNDDAVC8I4CeUX20gkiunb
	1LkW28Ad3pMH8m3lDouBYUquC8oFNhioqWqPJuCpV9Y/eUD/WvCWXxNT6RCmht6Daj4G
	m5m/WAB74ehIPeMvoxAvc9nd7nuwFAeIRiF9CFpfJFtGZmlB5vEVeW43gI/CQfW7gLfL
	dYjA==
X-Gm-Message-State: ABuFfohkGghhieReD6bVFweytn6SwTNjswf82DBipv9iNb24PpqFM0dN
	Lz0RIx7M9DZW8v9HeWBNOJvqTE+/7UE=
X-Google-Smtp-Source: ACcGV61+ywjYkqnMFwS2Ey1jXPinjVyjoGkHQ8ofuZt1nWK/9cb08waHPcg65MiG/eXPsdxCIEcjPQ==
X-Received: by 2002:a1c:8414:: with SMTP id
	g20-v6mr9650658wmd.123.1539007499325; 
	Mon, 08 Oct 2018 07:04:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o201-v6sm13027023wmg.16.2018.10.08.07.04.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Oct 2018 07:04:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2018 15:04:53 +0100
Message-Id: <20181008140455.8990-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181008140455.8990-1-ross.burton@intel.com>
References: <20181008140455.8990-1-ross.burton@intel.com>
Subject: [PATCH 2/4] python: fix patch headers
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
X-List-Received-Date: Mon, 08 Oct 2018 14:04:59 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch   | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python/0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch b/meta/recipes-devtools/python/python/0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch
index 776bbdcf7a4..4c0b3577b24 100644
--- a/meta/recipes-devtools/python/python/0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch
+++ b/meta/recipes-devtools/python/python/0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch
@@ -7,9 +7,7 @@ Subject: [PATCH] bpo-33354: Fix test_ssl when a filename cannot be encoded
 Skip test_load_dh_params() of test_ssl when Python filesystem encoding
 cannot encode the provided path.
 
-Upstream-Status:
-Backport[https://github.com/python/cpython/commit/19f6bd06af3c7fc0db5f96878aaa68f5589ff13e]
-
+Upstream-Status: Backport [https://github.com/python/cpython/commit/19f6bd06af3c7fc0db5f96878aaa68f5589ff13e]
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 ---
  Lib/test/test_ssl.py                                     | 9 ++++++++-
-- 
2.11.0


