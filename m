Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1B06F7D1E9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 22:36:34 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id v14so7497516lfi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 15:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=gWoghS6Kd+bB6JoL9X/9VSFt8afM/fFIVGS9gyb3RTY=;
	b=GgI2SHCD8za+7xZ0gZk1dbO9msJ2DkB1RjBsPO5ZN0cXwJ75DEo6VU5UUdz83ShwPQ
	pgpa9ZNDxH03GpQVZjtVxZnZDGTOijQNuhnfJKUbVuIFmunmN9v6E24eY1tk/eSEYbB6
	8b2afs4ep/rOvi8ys5Pv2Buap/WojjJsfxt4xoJxdEfYj8nl9Pz6yY/BRwiyowM1Sghq
	ym0DrX3Kwk68+YhYdJj50PJlkhLUU9BkAYGE5anI8le1q0tCSOOdiAB77qDBLeYK7vhf
	M/BR73xEaCFytelaPAkpz8NgFgW49XgSxxPEKu0shk8KxN4qJQpYxuyTpMLRPN18kf+w
	5I5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gWoghS6Kd+bB6JoL9X/9VSFt8afM/fFIVGS9gyb3RTY=;
	b=ndIlm9e3N1950SdrTBnmDPKfL9GLPY8F/GdPn1Pn5733anGAbcHeAYfua4xNwYrSSD
	H7EkFo+HlrOzjVNGwmYIM3MeXtg+tXkfAOZGArfV05FPp1bBPYyFNATw0Az4pHrWJCuF
	cQdE19rxw0D49MUE2CZRB1SCPyn9bjRiozfd7q7YMe4qCHIE7TzYUU7Te9KL7O+jYU9E
	xw/HKYFfbspGYSQVb2xvRyaReRsZnlcfSvoJCs9LB+ZxL2t1ltBCQqs6KbV77qCEaO2U
	0uewlphOUa30qKwBxZnjjAA86vqDwg+yxWeKO29UtfdmExL2EJqrRIDpPAJpxpYCumnP
	DDvw==
X-Gm-Message-State: APjAAAVi8yPhP+pkZevCztSUeGkWSXvwabKUc5gu2KJps9w5Bh9MI0oS
	LKrHUJbSH8dF+5WQDv9Nw8dMBRAKjsQ=
X-Google-Smtp-Source: APXvYqzZeDp9zPQMJnWoQnrcuEPIlCr1vD3T/4mBmTbGYh5ARLbdAb4SEjPxp2W2r63c/1zKsWMD6A==
X-Received: by 2002:a19:740e:: with SMTP id v14mr33795401lfe.94.1554158195200; 
	Mon, 01 Apr 2019 15:36:35 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id k15sm2434924lji.2.2019.04.01.15.36.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 15:36:34 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 00:36:32 +0200
Message-Id: <20190401223632.18045-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libinput: update to 1.13.0
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
X-List-Received-Date: Mon, 01 Apr 2019 22:36:35 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../wayland/{libinput_1.12.6.bb => libinput_1.13.0.bb}    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.12.6.bb => libinput_1.13.0.bb} (84%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.12.6.bb b/meta/recipes-graphics/wayland/libinput_1.13.0.bb
similarity index 84%
rename from meta/recipes-graphics/wayland/libinput_1.12.6.bb
rename to meta/recipes-graphics/wayland/libinput_1.13.0.bb
index 46366b7511..77792b9bb1 100644
--- a/meta/recipes-graphics/wayland/libinput_1.12.6.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.13.0.bb
@@ -7,12 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f2ea9ebff3a2c6d458faf58492efb63"
 
 DEPENDS = "libevdev udev mtdev"
 
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
-           "
-SRC_URI[md5sum] = "8cf10cc0fdfab865b105dd28283fa0fd"
-SRC_URI[sha256sum] = "12b4023a3fc683d3d8127db573bdf925a2ef366615042f69c87e57c32a50f45d"
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
+SRC_URI[md5sum] = "ea0834452b03457f8a33359db3eabfbf"
+SRC_URI[sha256sum] = "eb27c95d35c8fc9c7b96b9f0b2de5a043c47eb5f4b2868f353ab1bd0be0b616d"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
+
 inherit meson pkgconfig lib_package
 
 PACKAGECONFIG ??= ""
-- 
2.17.1


