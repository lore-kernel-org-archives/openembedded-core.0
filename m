Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 95BBF7873C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 04:09:59 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id bb3-v6so7864476plb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2018 20:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zcgwxAojj+2hR7NyYDcXtgOfit5xV9uUAgAjmHaAdpw=;
	b=Z3nB0JbueaOOCzcwLxxSqiA3CriuThBIJaqOlyIqoEfjepyGe8Qg6TeCNyWLBiPsrI
	YzBEn7d4FKdYKsOInOtbCrQFlS0Y47r+rQ516P4Lr3SWgds7cGw7yEaSESTaZkSnbtpV
	4IQTszd3ZhccNYTEpIZsrC+bJoi9Ski1F/vxLz7z7aduj//I1oXXGCrSBoM1gdrjDUdy
	P7Niij9lGljztuJltLtgjZbjV856mMA+UWJ3sCZEHw4iNR+ZPFurXi/E97RZEQePp9em
	sb1HoLpaDtn7EdM+YEcAum5tNXfNAhgyMmzUm35rHsKO5BL3CZ3KmwHQeyZWMAUvh770
	1Jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zcgwxAojj+2hR7NyYDcXtgOfit5xV9uUAgAjmHaAdpw=;
	b=I43WPQxkbmSdypTSBvTTlmnshwIJicsC98r5ZxjoMwfMCHh9nUxxlgPLCE3C4KvHNR
	wwGzmEV5gK5j9b30O7mdsoryOlqAdtOx12n0MW91LoBFfWISxOYeh03Adt7JwTwB6mTW
	gOLnSz8swwV1nvidt1Jq/EAzXz99JvsYvpTzse+oNaGOtK+D+ukOqTLh0xylA6WSONQL
	aFD5QLYCMBvjN7QR2WwlOqBpFrSWToVAJ5sf3ZxmzW6lD2SHqehC722vjHR49ghEF5ea
	g6pJwBlij6TD9fYEiCOZ4f/skxruUzqYItD/Z4oZ5JZFQ9+TDymTZEyPrR0JLU93VK9M
	jvmQ==
X-Gm-Message-State: APf1xPCuvvXwWw+BrRkwkjP0z6iyj5hrex9KQDXWj4KP9BT5bKYaC0mN
	AOREUZNoRguUwMnzxav7Luz83w==
X-Google-Smtp-Source: AG47ELsVKpSKGziWp8VxyestEbDbBU9edydPzL4/Yl3/fZ1GYIZ64uNcj8zWzcy1fzi5aIR5U4Mbyg==
X-Received: by 2002:a17:902:6184:: with SMTP id
	u4-v6mr9273243plj.390.1520136600353; 
	Sat, 03 Mar 2018 20:10:00 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	m3sm16909045pgs.90.2018.03.03.20.09.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Mar 2018 20:09:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Mar 2018 20:09:49 -0800
Message-Id: <20180304040949.12689-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH] libsdl2: Upgrade 2.0.7 -> 2.0.8
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
X-List-Received-Date: Sun, 04 Mar 2018 04:09:59 -0000

License checksum changed due to copyright year changes see commit

https://github.com/SDL-mirror/SDL/commit/a9072159b2afff5a338804781312067f0a174c3c#diff-21c55fa400e4d25aed3a755371e32151

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-graphics/libsdl2/{libsdl2_2.0.7.bb => libsdl2_2.0.8.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.7.bb => libsdl2_2.0.8.bb} (92%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.7.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
similarity index 92%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.7.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
index fcbfa738b5..c0cf70d7fd 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.7.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "http://bugzilla.libsdl.org/"
 SECTION = "libs"
 
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e4688d3bd5bf02dadaa3e5182fd9eda9"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=02ee26814dd044bd7838ae24e05b880f"
 
 PROVIDES = "virtual/libsdl2"
 
@@ -20,8 +20,8 @@ SRC_URI = " \
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[md5sum] = "cdb071009d250e1782371049f0d5ca42"
-SRC_URI[sha256sum] = "ee35c74c4313e2eda104b14b1b86f7db84a04eeab9430d56e001cea268bf4d5e"
+SRC_URI[md5sum] = "3800d705cef742c6a634f202c37f263f"
+SRC_URI[sha256sum] = "edc77c57308661d576e843344d8638e025a7818bff73f8fbfab09c3c5fd092ec"
 
 inherit autotools lib_package binconfig pkgconfig
 
-- 
2.16.2


