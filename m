Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 488A0799E7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 16:06:20 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id o2-v6so2730535wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2018 09:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IGFY2FJy9VdH2Wjc/ZTS1MTZARxG9Wlm9VgxoSD90q8=;
	b=bVyNOQHJUC2FOp4ogg6RJVQLK3EhloTUFwijFBkD0oW7BZXK2r3VnYrdQ1+dwWMJOJ
	mxVPAPE2n7Q4lf+aRwq51Af7PYcgH3Q1P4pwYvMbHTlS7SFgw4bRKiQIuckfQKx8YJ3S
	GudrSbhejtbcKHpBwuXDWKzplJWH9SgQIYmHS5MF6VNVqtjQMEdURSpjNNmwMdTD6a7d
	0pidcAUhRe30cz8TBqmadwCk1KbQWfKFgZoxm3+GgQPjt1Ac2YmEriKG3zK0r1neNKOF
	loX5dMKry/mnoLQrLsNWr9J0+/TOSYUxFJbf9SD40jDBmjnVpy9E+6uhV+7rhLjhcCkw
	APfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IGFY2FJy9VdH2Wjc/ZTS1MTZARxG9Wlm9VgxoSD90q8=;
	b=ttKIyXNHRXWN/Zduxl5UKStGS+DTlI+Kzhetfm/c+igUYHsfG5Qnbzb8gK3v5XG24g
	VlhCxfjRRavIWhDUb43oKHkGOCDvpiMlkkAKJAeB/tSsiv38uBeYZhToDF/bZ4MP1W8k
	cxOMGC3RCp1qtIycQtTs/a0aMIA9YsD+VzpPr/0PioA7qIKOMJM1SX8XFsnHJNU0Ty5O
	M1rhwir/SPlWRVufGOrLN8wHFCHvO6g68uoGk86AZu86tlGNy8D62ukJXNeNLNKS2i7k
	pyxL6brfzBcNMso0ncFRiv0wNtVyVd7AJYE5vA/HD9fut541rxGDgvF0TA99dQQ11bpt
	paOQ==
X-Gm-Message-State: ABuFfogLQXZ68LDBhmfNgO7zIeUQEuPgWGcnBiUFTeGYk1GhVh32mmo2
	Fk0Lviv5jEeHxTVPwSPDj2tzejvokv8=
X-Google-Smtp-Source: ACcGV61gIoj6o76Am7qX+OW9gp/Kuuva3aXx3TMBXRrMSrbKhHnTlagoy2c6/YcK6xDrs3aEVKe2yQ==
X-Received: by 2002:a1c:a90:: with SMTP id 138-v6mr2346955wmk.49.1538150780628;
	Fri, 28 Sep 2018 09:06:20 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	11-v6sm7562289wrb.95.2018.09.28.09.06.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Sep 2018 09:06:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Sep 2018 17:06:15 +0100
Message-Id: <20180928160616.6672-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180928160616.6672-1-ross.burton@intel.com>
References: <20180928160616.6672-1-ross.burton@intel.com>
Subject: [PATCH 2/3] python: mark the tests modules as special when updating the manifest
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
X-List-Received-Date: Fri, 28 Sep 2018 16:06:20 -0000

We manually maintain the tests package's content and dependencies, so mark is as
special (matching create_manifest3.py).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python/create_manifest2.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python/create_manifest2.py b/meta/recipes-devtools/python/python/create_manifest2.py
index 1af1443f476..87999991d73 100644
--- a/meta/recipes-devtools/python/python/create_manifest2.py
+++ b/meta/recipes-devtools/python/python/create_manifest2.py
@@ -137,7 +137,7 @@ for key in old_manifest:
     # Handle special cases, we assume that when they were manually added 
     # to the manifest we knew what we were doing.
     print ('Handling package %s' % key)
-    special_packages=['misc', 'modules', 'dev']
+    special_packages=['misc', 'modules', 'tests', 'dev']
     if key in special_packages or 'staticdev' in key:
         print('Passing %s package directly' % key)
         new_manifest[key]=old_manifest[key]
-- 
2.11.0


