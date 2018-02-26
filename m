Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4522B787EE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 22:31:01 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id a75so12761525itd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 14:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3TJO2NUVRrbQIvMPmLoQzYNhyUapGgK5uQNBC+3nvU8=;
	b=Whgq7PVoPUitJ69O1NQdzkByxggpvKc+/wpHEONyL/MbtNyCPGlOCvRbxuXF/6HILA
	EWvI1txHxDr/wPM33pwUA8e5nf4OoZP0bufOJiJyZ7Wup0mGj6K+IDjY32SIp3IdIFUD
	avWAFKFuNxHR71jsM5yobWdsX/ofq7idaFU4y7Ib/35nu6XpeTuujnvLs5LTOXsdwK7J
	uam3uHnmF8iJIcQNsHa2Qwb8kww3WUr/wKVz2GUurLO3wDZc+lcIqDPIK7ou4hbGY7FM
	FTMHn9Z4LOkINUCFxKN1QBGqJdH4hmDHI/E/JIIjc5BC7I2dwFxEVMrYbZu17EhKcYD9
	YFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3TJO2NUVRrbQIvMPmLoQzYNhyUapGgK5uQNBC+3nvU8=;
	b=YuHqsdvu0/YuWcnJdKv8xREeYlAybaXvGArOUZ1EbGBHE4SwBWC8aI7MaeTMPf/8UZ
	koeK4Rd/o+KcyXD5b3lI9beVO6eA7GlTWo131Ydl1P/p0w1wnqxPlPibg0knx/XagqZD
	HRMDQdmsZtKfU6BXBLH+UPq0b90II2Eu9W7SrYq6Qvl/MHC78jIdU1hsH4b/dPdJHxSt
	l+mQb7vKJHVvner5Cu35iTFDAIorqGZmUht/SVsmPeAc9fGhzzBDYjuQdTedbuklS5hR
	hVP1cC27XHm7umkrvENZCjkIX5NoV3LecqONi9r+PmV0h18QaFWrpiSm3Bb/u4zebhMX
	TJdA==
X-Gm-Message-State: APf1xPCDedyU3BZMY7Kql5YrjfH7VKUwXvn97BEyVD/bFE4sTUVykMim
	rYcwFstfbLO3IvE9otLE8zA0Sl2I
X-Google-Smtp-Source: AG47ELt5fitKfKj1wFe7GTeO9vZKuwpGhioutWk3S/VoQl1YAozqdUwmLYCIXEtTAG0mz1ChSQcKkQ==
X-Received: by 10.36.157.213 with SMTP id f204mr14622444itd.26.1519684263201; 
	Mon, 26 Feb 2018 14:31:03 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g186sm7609093itg.2.2018.02.26.14.31.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 26 Feb 2018 14:31:02 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 16:30:54 -0600
Message-Id: <20180226223054.5687-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180226223054.5687-1-JPEWhacker@gmail.com>
References: <20180226223054.5687-1-JPEWhacker@gmail.com>
Subject: [PATCH 2/2] Ignore icecc-create-env in task signature
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
X-List-Received-Date: Mon, 26 Feb 2018 22:31:02 -0000

Changes to the icecc-create-env recipe should not cause all recipes to
rebuild just because the have inherited icecc.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 3a8778eae01..6be9d32133a 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -29,7 +29,7 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
         return True
 
     # Quilt (patch application) changing isn't likely to affect anything
-    excludelist = ['quilt-native', 'subversion-native', 'git-native', 'ccache-native']
+    excludelist = ['quilt-native', 'subversion-native', 'git-native', 'ccache-native', 'icecc-create-env-native']
     if depname in excludelist and recipename != depname:
         return False
 
-- 
2.14.3


