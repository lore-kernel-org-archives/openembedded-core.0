Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id F18696BA11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 13:40:58 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id y10so13241078pll.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 06:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=e0WynzKY9pF9i7Ms7cw1mVrtdZVZa1W2iCWMXzNRyKw=;
	b=Yl6MyCBYFnCmBcbDNcqPTNhpBHxr6q1D5HsP/AF8L6wyw+24Uwp8bavnSzXd+Q0wv3
	IJzys+aMBw0/bgZX4gdXdZSNxkxz4Hdh+OOfQm7MKdby628sI3g2Tl4A/EhzQIdovS9q
	V9Lh3bO+I+giVppM2LlCLWhQYT5eGAcBCBuGt+frgUiBe0uHI57ML3GYKj1jLZgkXcBW
	1XLHAK2pjbrfWd3h/oSfLJrGYVtwiA13KblH+TD85P69UYTUVD0bv919qcYnXZ7rYRSw
	1eW5/FOlE0dcWADXbEJIpsvIcmWr1SUc6g0C8pQeM6ADvepNzE1ZUkySR4eRZ+f6XNuP
	qlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=e0WynzKY9pF9i7Ms7cw1mVrtdZVZa1W2iCWMXzNRyKw=;
	b=OdwoejZr1WM0Z2vfBkHEozUgWtGR9m2JDzbWU1tJPRAqWSdIcfDe/MOKWMZ8nRKdBZ
	JAcIHbZQ88xisg7pvLCI/GJHaIFKsXg6lOY5ZzIIyhQG2WCnm14jTDPXWTEBFdjU6vfP
	WYTR5KKy9zljZiLN2b7KQyeOdnheRA2AcwwtynGtc1neXVlc7a5iGefk3H66lIdILcsW
	IphrxwhZ+cPmffnt2ePRaMcuao6WnxUnlbb5xBzQ0tXyywVH/GAZeZPJXoPrHXrgSsVv
	wHxcI6C0jZyyduoMeOE31B3oOW6iwoIyGcZPoKDiSoVwMRtbq0uudMSnwuxaXCLlrr21
	CpVw==
X-Gm-Message-State: APjAAAVexuiZF616LL8khJEpadgnxovQS7G1LnRk8GU47FgNxK2DpdLw
	kSi93C+unrjcBgIUumWchOJb+uvWjl0=
X-Google-Smtp-Source: APXvYqxydu443fs2HeOVusRR7ALFog4XsxNtK/jBr9QQjjOA4xB1adHpUGdfuj50GNFCMnqbJy8Vwg==
X-Received: by 2002:a17:902:8541:: with SMTP id
	d1mr49694854plo.39.1568382059303; 
	Fri, 13 Sep 2019 06:40:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	u2sm15001853pgp.66.2019.09.13.06.40.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Sep 2019 06:40:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 06:40:48 -0700
Message-Id: <20190913134049.2700261-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH 1/2] musl: Update to latest master
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
X-List-Received-Date: Fri, 13 Sep 2019 13:40:59 -0000
Content-Transfer-Encoding: 8bit

* Added copy_file_range posix_spawn_file_actions_add[f]chdir API
* optreset is added to getopt
* pthread fixes
* Conditionally add legacy long definition of wchar_t

Details [1]

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=6ad514e4e278f0c3b18eb2db1d45638c9af1c07f..1f0e9f9cc2e3fa354f94e18b3b362de5f1ec7272

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 9341bf5d58..87453be07f 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "6ad514e4e278f0c3b18eb2db1d45638c9af1c07f"
+SRCREV = "1f0e9f9cc2e3fa354f94e18b3b362de5f1ec7272"
 
 BASEVER = "1.1.23"
 
-- 
2.23.0


