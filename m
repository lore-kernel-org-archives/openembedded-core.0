Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id EB299786B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 21:52:47 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id 30so940862iog.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 13:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3TJO2NUVRrbQIvMPmLoQzYNhyUapGgK5uQNBC+3nvU8=;
	b=oyYZzGwir2zcqyxVg7BlbTuhaOHl9yTqIGux9Z50QSunzZczdjv7hdzoBMOW7iEGS0
	LaUq36WMcTnKMiiAoNJAYo6Nwh3WWmOhPq7KZtSYW2+0P1KjMdKJWdiZ+pJuU0Jr1YH3
	vpn4g+1YMC72VyoEXU+S3iwZQ5107edgbJJnbc08LXp+56BDs5ez3XbmeY0qQdSQZjrc
	8555hohK9rhmB4DOc7pOXY9yVydaP/EZq9CmnUJLCxMbzdnHCwy4CQuoKlRjbX5r88by
	JT8fWFxp/C6nvxOJ+MaczaWbHs0qN0spkh6CJSkQuD0b6Z23OcBu6pRsJ/ufg42l44wz
	9R9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3TJO2NUVRrbQIvMPmLoQzYNhyUapGgK5uQNBC+3nvU8=;
	b=sHZhgVKTcGtBmnlKzotZBRX8NmAfGToDCofxoimgFhwWeOojTTbJPeUi/o21fooSq4
	14mDrwjhHhDuRTQx+DpXSeP08s1deaE+wX3Rf6AISRznj0DL+EkgU86f/QrxdYC6CQds
	hGO+Sj4KUxEiOxdnThnYeFhvKwJSneUappF5vgK/dv4obQz5zBTDm9XtoXVvfoVl3m+U
	EC+knvv/V6wy8wOEJx15BH0/vEmkpeds/Pk2YZ1QWyhvbowzmne/Ga+A2bf6zeaQQprs
	RgNqfN0XX+0tKSvrW/49Cw7tUXiCHJMJ2by1kuCQU2xPhFbatdF9quILxj2vAqNqeEy8
	bKCQ==
X-Gm-Message-State: APf1xPB9TcDD/YUiCELv5dAWJ+8NnwbF5lIuigBmGSOZuWPtokVrrxb4
	aEBS/2BL1s87DFYIITGxoizEYt48
X-Google-Smtp-Source: AG47ELs4Z9eLpsemqaCy2Ly9mHGn/ailjoALsnl88Y6gd27SohYvENGgy1EquOlKVdEBVRbV+1iNKQ==
X-Received: by 10.107.184.10 with SMTP id i10mr18129583iof.283.1519768369370; 
	Tue, 27 Feb 2018 13:52:49 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	f5sm96798iof.13.2018.02.27.13.52.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Feb 2018 13:52:48 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 15:52:46 -0600
Message-Id: <20180227215246.30689-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180227215246.30689-1-JPEWhacker@gmail.com>
References: <20180226223054.5687-1-JPEWhacker@gmail.com>
	<20180227215246.30689-1-JPEWhacker@gmail.com>
Subject: [PATCH v3 2/2] sstatesig: Ignore icecc-create-env in task sigs
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
X-List-Received-Date: Tue, 27 Feb 2018 21:52:48 -0000

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


