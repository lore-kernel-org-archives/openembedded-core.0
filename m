Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2073665C8F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 00:41:25 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id a25so5097035edc.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Mar 2019 17:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=2id/FLv5Vcqwv699rgr9dZRO7jj5pErKWvX9WDZBz8Q=;
	b=WcLCK84Ksbbt5spbGUbpKtbSx1ga75FF7ulRJnXs+fvy0+uVFxzWkSzH0+RrMPuMJS
	g9QqjXUlTHyaKsCS509w5WQ5NoSkIJrpQjHl2rgu2EGm3gQjYX1Z+vUFKV1kpMY2/tVy
	sjIlZhhpr0Q3KS3P7mQFOTHeC826tD+uCw0RtuvmUP5rZNbPhij9tV7WgNOYLTSvXXK/
	Rz3PKCW0dIu9HRhThAyYZIHcBsFASiLbG2vblDOVs6TXktsDrmLfPhiRVglqetQmAJ2c
	ZE/N3LiC+gbFea47WGSn1iCTg7W5ymFQmSqyagrIQbJfdJ+I93Plpx3zSWdn/sGVzucz
	pIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2id/FLv5Vcqwv699rgr9dZRO7jj5pErKWvX9WDZBz8Q=;
	b=iGAC9SO2uCGnjHMqCshQkLPn5mxpeJgem2qsUyti/r2jHfa3obLHYL83bfnu4wiXa1
	oOy/tysUbdieKKMisJ3ZjtQ6oFygAiODbTKKO7/8iSYsEhoiJqpErefggTS1LicIE63G
	GbhewTn/Tbo7BcHnIACYSK5ay0RQppaQrRQRZNCAfMB87ctxs2CZ4HF78IFpITujoNGY
	34KMoLUgkDGsRaJw6TQO33wtqE9X+ERdDsH/7jsiBpr3o7ZKwyg7OUevC2pSr42f1McD
	SZPMRFhays3/yIyuD1XKaoZdGbJISuQn3i8S42PcmfVYrMFYxC5pYT47+dkU2K3SBeUN
	ZJiQ==
X-Gm-Message-State: APjAAAXLFOPHfNxk05kUmtPUSmPbJH/qii+sGi2/cvpMaG3jZqR7CKaW
	vswNxUVTvlknA75R+Iou749JxE+gans=
X-Google-Smtp-Source: APXvYqy/r+c812MVo1pl+fZPx2s49Mu+Gd8jgWZKTYMupKgHf9K7coaAKEOV8XjfmY5GLT6xwiDDWA==
X-Received: by 2002:a50:ac04:: with SMTP id v4mr37482813edc.255.1553992886319; 
	Sat, 30 Mar 2019 17:41:26 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	t31sm1906130edb.52.2019.03.30.17.41.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Mar 2019 17:41:25 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 31 Mar 2019 01:41:15 +0100
Message-Id: <20190331004115.16429-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] pango: update to 1.43.0
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
X-List-Received-Date: Sun, 31 Mar 2019 00:41:26 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../pango/{pango_1.42.4.bb => pango_1.43.0.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.42.4.bb => pango_1.43.0.bb} (93%)

diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.43.0.bb
similarity index 93%
rename from meta/recipes-graphics/pango/pango_1.42.4.bb
rename to meta/recipes-graphics/pango/pango_1.43.0.bb
index d3357f82de..e91e02a837 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.43.0.bb
@@ -18,8 +18,8 @@ inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspec
 SRC_URI += "file://run-ptest \
             file://insensitive-diff.patch"
 
-SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
-SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
+SRC_URI[archive.md5sum] = "2df040d3f6a4ed9bc316a70b35adcd8b"
+SRC_URI[archive.sha256sum] = "d2c0c253a5328a0eccb00cdd66ce2c8713fabd2c9836000b6e22a8b06ba3ddd2"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.17.1


