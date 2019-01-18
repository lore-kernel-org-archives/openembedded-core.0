Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id A03787C22E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 11:24:16 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id f188so4122684wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 03:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=F79MyfkNEYIuUXsKoobdZRCbi7YhmOh9Kw7RSVV1CoY=;
	b=uIJ/ZrxVizSD4DonU0NCsNK2Auyl4AVqxb7hpGLcRVb4tCcdGfymmfiyzWPzk0Daef
	3DY8eBGOkLCeZQM2k/u3uzewFX6jQUavBvBgvHDhNtcIuyaUolgVD8Q/DxyQ4jR3Xb3d
	XQxe51C/h5OQ9tDdim7x+ljiliq2Zc5/BniUryWJT3oxAaZczJM1gndvOzVF+wh3bog9
	6DRPapjYCCBGC/EnpBw1EO9N2LgBP4WDujKTY+HXhohazkx2E0gkfK77ohdcm5NTCqzX
	/8wv/wANon1Zk1Ti5fzpSeNzwFG0PbxzxkjteRYjILes5xA1b9OwjNWgchgaq3X8ra53
	/BHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F79MyfkNEYIuUXsKoobdZRCbi7YhmOh9Kw7RSVV1CoY=;
	b=SoUdcY6osGMI27zw2ad1LwdNXzpC8FfQUomoLa77BJByOoUQohF9x72ewUao9A/Ouz
	M8B+YZmx5Bd3HA/8xl89YeNzUkJn+S3l2SxS3Lc5zqPwBi6oeYl8X9u/R+MNbYioQNx2
	xbdDhEkkXLxxTo+F2CuFUlzT3SCT+sb51y5Yz7Zuz9RG3jT2fMvmp7EFyEOAIGyXkBeh
	Mbe7cMBfYoC8mOHKqgA5qwX8qttQzl27jEubqZTd/hEbOUZVokJaJF60CGO/lhmsJfFV
	CeySJ1APWHvALfmenEK2h+wUMRcKAdhHVtuqBYPANlFi6uVYId5SnwpLunNQ2j7qChxk
	kO7w==
X-Gm-Message-State: AJcUukfb6KQd+z+9SanZZZdqlNArXdvHhcYVGzREEEpz6LMJXS+D41lM
	IotizBV3XhTcH6u7CBSLFb82nag/
X-Google-Smtp-Source: ALg8bN6pXKboMLCab2vgIkYXGxQSuq+sQcE28AcQS6VhLnJpU0/GGJHdSdzvoY+kccq6qWKulYqmHg==
X-Received: by 2002:a1c:1f54:: with SMTP id f81mr16137832wmf.6.1547810656980; 
	Fri, 18 Jan 2019 03:24:16 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	q12sm71121998wrx.31.2019.01.18.03.24.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jan 2019 03:24:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2019 12:24:10 +0100
Message-Id: <20190118112410.122823-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python3: use ncursesw, not ncurses
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
X-List-Received-Date: Fri, 18 Jan 2019 11:24:16 -0000

So that wide-char functions are accssible.

[YOCTO #13142]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python3/130-readline-setup.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/130-readline-setup.patch b/meta/recipes-devtools/python/python3/130-readline-setup.patch
index c805652d694..cfa712678b9 100644
--- a/meta/recipes-devtools/python/python3/130-readline-setup.patch
+++ b/meta/recipes-devtools/python/python3/130-readline-setup.patch
@@ -49,7 +49,7 @@ Upstream-Status: Inappropriate [Embedded Specific]
 -            curses_library = 'ncurses'
 -        elif self.compiler.find_library_file(lib_dirs, 'curses'):
 -            curses_library = 'curses'
-+        curses_library = "ncurses"
++        curses_library = "ncursesw"
  
          if host_platform == 'darwin':
              os_release = int(os.uname()[2].split('.')[0])
-- 
2.17.1


