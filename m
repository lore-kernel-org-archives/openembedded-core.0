Return-Path: <earwigz32@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9463678310
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 09:24:10 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id b79so6144807pfk.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 02:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=sjzZpA9BQ0zZ77NJXY/HcM31grd3HkVOGnpR1QPqvz4=;
	b=FurMs4cT3+wzCJKf/HdhJ9rcO7ktYR17mynYR5tnDPBbv/RQjsJWeHqyeVqHRSwnbW
	i4L+9wGmzabOaZQlsGbgGkDwORMon7VHH3EMzPMYNwfheZhkdiCSxGiVvrZjtzdYvLMG
	CJFBHZILzTTiaZ7GUxhHglDvq1SiKInsELKIsgjMI4LRvjvpkMyZ8O+WLsKBP+LSkSSE
	yYxZhEQeodmRsGrpj0+M23rJXoqUmSx9foef1CqCKRRq7HWl/vBIvGOxEqbYrM7kuzKa
	Hr4CqvMEXWvTTNK/rgU7B5TKMpOgS+j81kICcqo/A9mRTc+nFKPCqsiXnOrGC217+7jm
	T4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sjzZpA9BQ0zZ77NJXY/HcM31grd3HkVOGnpR1QPqvz4=;
	b=KOwZO0ItCygbK/EJsFRY+/pm8TuX6qH3O2znIleJbH0yf4/kDYYR11N6yUP/RJuKfN
	XKrki1WEW+1BFz7gZshW61ogboITMicfiBKnQ2h8YFXHfwWZPITRxqbz9kzbA4vrMYSg
	GEg5knmtHti7dfTWWR/AUbWHLOje9M2npJtEFV8ISdJlMPeG74K8MeYkYWDwzi2rvlaU
	A1S79NgwMAv0Dp2+otJBqHLqgFb4eJj3rbGt43ujdCg9aLTBTTcFLENZRi/dPQLJ0A51
	6dZPOsBuhSBs36vEi48o0jWUZR/8SGdn62DmGvLvNU30uIbeE8Cgd9qDiu1kw+HXIt8p
	MllA==
X-Gm-Message-State: AMCzsaW+w3nqOg+xhJl5YfdctBybhMnKLH0Ip3JJ/A4zNQ37DOYx++Zm
	9saNGc1EEJMAWLxp9329+n5QPA==
X-Google-Smtp-Source: ABhQp+QxpJ5puJXz09m9S98ridevrMryTDKJP3HCinU3FVzVGLTfKI+tN/4HE9Fh3gvlKVneyGDPNQ==
X-Received: by 10.98.60.211 with SMTP id b80mr944852pfk.4.1508405051623;
	Thu, 19 Oct 2017 02:24:11 -0700 (PDT)
Received: from localhost.localdomain ([61.107.31.52])
	by smtp.gmail.com with ESMTPSA id
	l28sm24827036pgu.38.2017.10.19.02.24.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Oct 2017 02:24:10 -0700 (PDT)
From: youngseok <earwigz32@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Oct 2017 18:22:29 +0900
Message-Id: <1508404949-12189-1-git-send-email-earwigz32@gmail.com>
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
X-List-Received-Date: Thu, 19 Oct 2017 09:24:10 -0000

From: "ricky.yoon" <ricky.yoon@windriver.com>

License file changes are due to updates in Version and Copyright date

Signed-off-by: youngseok <earwigz32@gmail.com>
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


