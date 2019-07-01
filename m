Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 072A47E79B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 19:11:44 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id 16so14315828ljv.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 12:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=PtJbcG/GLSdMm7XDBEiEZx9uPgRQAx5OlsuA3pc16s0=;
	b=OU8CSq7DQY5VXL9SoS6tlad1ACX235CxwsytUv3F+a6EbRNotCFabS/dN9q2bwp9kG
	6SAuCUub6hUUKOr9RltrlOsQkwRfZyKVwsaTRfM5AakCsp2KmIcuYdYOQaqPCNqs695K
	glyNkKI6DtxCjvaHJDf3TJV5/lzJgMfPoLwA00OckgLcpdcqYu+Y/4uCzMthdbVPaUEZ
	aT9EK/3/UeqSnbOv8LJuP8SxRv1tZgpobkCkR4siP7Twv/61ieMwt++ahwuB2tFoNbnp
	F2WvKeZx+C1u36Xz/K3CxBjgdCqwQLRw2yKq1RLskqpEuZ/ROYaaFs5Ex+TSFMjvuYQj
	eAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PtJbcG/GLSdMm7XDBEiEZx9uPgRQAx5OlsuA3pc16s0=;
	b=Ib0x8K1RAZ815ibvdSyFIhWnYR098uBtSL96nsd/zaXa0Jvf6ybkbXmzvvqIOj5TIy
	Syi2i4AesOyc/uTkLpE5re854qbB++oKXVmjSK9Yca5mePq/A3OpQ8sZAwWGSZOSxGOW
	gqRHO1rhS7f5+IYShlmeGVmnsY764IsO4vO9oO/OpJP8WVfL0l8hBgNn4e3NvDvFXtwc
	jaOVyWPtAZ9mZa+0HGIpw2dYLgxxes01rMwDhpOgOKcAJ6HqIxcelp3FdFQgNNZTMpQR
	UnjCtsCsTSZMZpaW65TrkX2nna1CbNLzaXz4EQ9A7Ey3NEQ2qE+23yGIJnvIzPaMtf7w
	nLlA==
X-Gm-Message-State: APjAAAVL8i1RYReDl9m0rTHELQbppMR6OzIm/ejdaV94K6IxtNrRRkKj
	D22sQ18B1oy3zYT32OqLD0SMr6/n+J4=
X-Google-Smtp-Source: APXvYqycWbN8bIaX3Y6UQi5Pve1g/ooXAiDZOlGvHh9Fu2+x2JbXa9HpuJ6jUT7RsTcjm5Yudcd0dw==
X-Received: by 2002:a2e:2b19:: with SMTP id q25mr15141183lje.127.1562008305125;
	Mon, 01 Jul 2019 12:11:45 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	x18sm2723273lfe.42.2019.07.01.12.11.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 12:11:44 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 21:11:42 +0200
Message-Id: <20190701191142.367-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] linux-firmware: bump to 20190618
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
X-List-Received-Date: Mon, 01 Jul 2019 19:11:45 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{linux-firmware_git.bb => linux-firmware_20190618.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_git.bb => linux-firmware_20190618.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
index 8b6ad96dba..acaca955be 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
@@ -92,7 +92,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
                     file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
                     file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
-                    file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
+                    file://LICENCE.Marvell;md5=28b6ed8bd04ba105af6e4dcd6e997772 \
                     file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2 \
                     file://LICENCE.moxa;md5=1086614767d8ccf744a923289d3d4261 \
                     file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
@@ -123,7 +123,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=b6e44adf71bc37e5f26ebfe5a08b5490 \
+                    file://WHENCE;md5=55814698bbae7c7dd40c9fbde91af0a8 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -190,9 +190,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "711d3297bac870af42088a467459a0634c1970ca"
-PE = "1"
-PV = "0.0+git${SRCPV}"
+SRCREV = "0731d06eadc7d9c52e58f354727101813b8da6ea"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
 
-- 
2.17.1


