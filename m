Return-Path: <earwigz32@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1B11877E93
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Oct 2017 05:09:00 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id b79so9369498pfk.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 22:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=2VCJoAfKncRwTPB7xFA4+azICzDRWrSw2g0aqmvuTcE=;
	b=DoynZXGodOWPGeMYPJM5sF7ZsJlX+oe/EC9QhWZF+H5j7z5KJvXD/pXC4AnrwfvnUU
	5ECW3pqNt04eRYbmd0n1gyyrA9IKqQQdU9HzUkyf0VLhfgvX1RhWRlZ7m22fo8Yis+9s
	WVK6NwCtfojyTL8909b1FpvSWX55DW11gSHwsyjuJP+dqZ/lVjgad5jfC+GEKTkZWGXY
	HvsJK9zKc1wVGWwkKK29tbxJqd63Vmnhe3In4Y4eeVGK0xXikMk1ku3Y2YithXO647Ws
	q3SOFDUeM8/c7BvrvKUAbb5NHLe4Km94rAPVbIC0E2f+cH7BJMQF9UHnj623GVxQMwO0
	oTsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2VCJoAfKncRwTPB7xFA4+azICzDRWrSw2g0aqmvuTcE=;
	b=VoSyHhzXuWaqpJ53/g1jDxFtU4IjBh9dJvJKiCQU5EkB4yZI7v1j6/0nAJ2LFtVKyZ
	zMC1FYkOyPb59ZON/zhU3vG0o3qTwRz+g1dJY3jcPfc9vnSA5WzKnQu4adoq09sll/ls
	7i0hg86/DVixsGiUDLAPQvefOEwP8fdVIFcp8YJWk8qDNr6tnKcoWm2Na6Zb4RVd9xCM
	eWBgW9S7MJpDg5FV5mS7u90v4Zw1+4LXdUWyVDZMPGFzMkfSS4mJOPitS7AKcRnRkfzH
	GZED8ntb33/0ux9p4qlNBtng802mEQFHopjTMiB5GyvCPAg5ACiQLFUftmxO1Q4605UI
	cNNA==
X-Gm-Message-State: AMCzsaUSx1GWPVVMGzDnyOg8kj15DgDub7MFGX2bPgiY7SA9kPly/8pn
	J/eN3LVei8acGOWnlfe1n8EXqI9h
X-Google-Smtp-Source: ABhQp+RNiRNd6K9G2/ZuhXT5/xx6DPwE5dxLNwV4cLb5rGSoRth1UFlBhzqPbHIsjB4+frnfJjZSig==
X-Received: by 10.98.205.12 with SMTP id o12mr3782566pfg.339.1508476142026;
	Thu, 19 Oct 2017 22:09:02 -0700 (PDT)
Received: from localhost.localdomain ([61.107.31.52])
	by smtp.gmail.com with ESMTPSA id n19sm301876pfj.52.2017.10.19.22.09.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Oct 2017 22:09:01 -0700 (PDT)
From: "ricky.yoon" <earwigz32@gmail.com>
X-Google-Original-From: "ricky.yoon" <ricky.yoon@windriver.com>
To: earwigz@naver.com, earwigz32@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 20 Oct 2017 14:07:19 +0900
Message-Id: <1508476039-9514-1-git-send-email-ricky.yoon@windriver.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libpng: Upgrade 1.6.31 -> 1.6.32
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
X-List-Received-Date: Fri, 20 Oct 2017 05:09:01 -0000

License file changes are due to updates in Version and Copyright date

Signed-off-by: ricky.yoon <ricky.yoon@windriver.com>
---
 .../libpng/{libpng_1.6.31.bb => libpng_1.6.32.bb}                 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.31.bb => libpng_1.6.32.bb} (72%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.31.bb b/meta/recipes-multimedia/libpng/libpng_1.6.32.bb
similarity index 72%
rename from meta/recipes-multimedia/libpng/libpng_1.6.31.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.32.bb
index c96ea14..d93e72c 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.31.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.32.bb
@@ -2,15 +2,15 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6f21e4e1f795810b5ea491b333bc6ea1 \
-                    file://png.h;endline=144;md5=af300c419a45c53a8d2daa0b7d167a66"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=53f2df0e62ce82307cd1389a9f41e4cf \
+                    file://png.h;endline=144;md5=591cf1f8d84a757af46e43c2b9b5ddd9"
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "1b34eab440263e32cfa39d19413fad54"
-SRC_URI[sha256sum] = "232a602de04916b2b5ce6f901829caf419519e6a16cc9cd7c1c91187d3ee8b41"
+SRC_URI[md5sum] = "e01be057a9369183c959b793a685ad15"
+SRC_URI[sha256sum] = "c918c3113de74a692f0a1526ce881dc26067763eb3915c57ef3a0f7b6886f59b"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/"
 
-- 
2.7.4


