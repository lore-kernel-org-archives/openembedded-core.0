Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8A0F1798DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 11:49:09 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id 20-v6so12553440wrb.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 04:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xLZo7aGYXsIflUsbJOOVfbVZKOIIV+uSAGP6rGBy5aU=;
	b=i1um8kyFfFwjUw3kslLXG6pTDXm2uU3Dm2+nsxLY65pWzafREkcRAVIeRZ6RQGnOy4
	ICJt9Sd73idrKv7CZ/8J2sy/3Bt73v7HgtQiUS1kQHvtdT+sOe5B5GSrrj55p7y/rdnk
	6ttGG6LL91qOk3G9bqNU7maUu8VUjAwH4yMNqGGaAkJtsnQj4wto/0lQg70RAD808+dl
	ASZmoFdGjIkM8484g97BJj3giKvvfURIa+F2Hucpx1bkgKOc6OHwgRokKP1s4ch58yzn
	YhItMyrWZ8/8FCdYiWauToKzBnV0kf0WmGie0d5ZN7HceEyMGxZyoJEslvfmnDT1ydmz
	1uKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xLZo7aGYXsIflUsbJOOVfbVZKOIIV+uSAGP6rGBy5aU=;
	b=DDFsEHcE8LhRgdYhMrW93Pla9s/+5SKEtZuVWwU0YP1W7WBuNOCLfqMnQFzyrFHfPG
	UIiL+sgeB433JNOKNjNpgSDw5GyKel0uklBDsSx99EREMLP1IK1v4IkJlLoGe/H0CLv6
	ajkYA8CRZrVnINORL3ovGpgr0eflxtvOEoE1B65fp743bC05C6n409ajCil1A6d7n/YD
	ySGZKU/QbOh1xdGeJWH0rA2I/iMAxRW4UPttbrmue18iSC07TRiIvmCUeAwO1lSxTP6U
	8v5KFGIScDjTndoLShaNtUEiOhlOZGoTyuEz8zQGKs85mfKfyb2oVIoZyxzzW2XT0wbd
	2EpA==
X-Gm-Message-State: APzg51D76dexsEk6yTTLjpzCKyGLNXDWNKdvyIcpmkF4CzJmJQsmyVf6
	PgeHbsz7D5Dm9IAUf1MbmPwGGfkEgaw=
X-Google-Smtp-Source: ANB0Vdb1q+1OXPITKN/9/o6/vZhSIaXHBKR11dbTY6D0DIEb3MVTYnXJ0NlnwZueJSG5gLMUMRzdwQ==
X-Received: by 2002:adf:a599:: with SMTP id
	g25-v6mr37467446wrc.88.1537530550001; 
	Fri, 21 Sep 2018 04:49:10 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n8-v6sm3479850wrw.31.2018.09.21.04.49.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Sep 2018 04:49:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 12:49:00 +0100
Message-Id: <20180921114900.26338-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180921114900.26338-1-ross.burton@intel.com>
References: <20180921114900.26338-1-ross.burton@intel.com>
Subject: [PATCH 4/4] python3: remove specal handling of sqite3-tests
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
X-List-Received-Date: Fri, 21 Sep 2018 11:49:09 -0000

This package doesn't exist anymore so the manifest tool doesn't need to handle
it specially.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3/create_manifest3.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index efef62af943..fddb23cdc42 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -214,7 +214,7 @@ for pypkg in old_manifest:
 
     # Handle special cases, we assume that when they were manually added 
     # to the manifest we knew what we were doing.
-    special_packages = ['misc', 'modules', 'dev', 'tests', 'sqlite3-tests']
+    special_packages = ['misc', 'modules', 'dev', 'tests']
     if pypkg in special_packages or 'staticdev' in pypkg:
         print('Passing %s package directly' % pypkg)
         new_manifest[pypkg] = old_manifest[pypkg]
-- 
2.11.0


