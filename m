Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id CF5347FCAB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:35 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id p17so156089wma.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YETj59ZEJPh+TxTjdT2ayMjbq2/qgA/SjwCcG4UlHnk=;
	b=GCwiAOLChg382yYmEyu78vsD8QdBK7E2fKjcsIVB04is6Sl5a1hpuCtpxyk8zYbLHi
	fZpxq1Y20HZMesAJYKdBCyYn0IJj8+XpHsR2U3bPu/Y0HgneKSX7l5M0B6GQrFG+9jeU
	FlzBZyTS/VaPuJAd2ctF53sY7etyDvbNzzxi4a8oM/Z/uOs1OIH9BE3CCm7fyfjMr8W1
	p7nLuxDAiRC364NWfqYa1GKwc2HwIb7MjU7JAhcOSu52yiO7xFSAveanMHUCWhAPUhHB
	VnF36hminP4tw5cnopV3SuWF72eXoucf95k3OYu2yOdCBrOXj2kX2H7/HcMPIz24+H1W
	6v0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YETj59ZEJPh+TxTjdT2ayMjbq2/qgA/SjwCcG4UlHnk=;
	b=PId54s3sQ5u0PFFP90S29E/ZixAI6byPn2RlV0oF2xy8S0Vy9TSZ+M0/BbcgVdFnh2
	GXQBsks3rT18yR4pVI+rrmIWeeR1PXze+BFKezrmR21UdL5pqsgMsa4/iDZ2R2JXBVaA
	QAhbtdvKt+Ygpn8YwF7yE6MZAoU7DHUajGYy7PgqqKXDbTXmon/GWe78RmnhGT1WUB7y
	boTZSKlzkmlDuhH9Pxy10BPVrbxNtieZZWtwOCJRh670DdbLz0+Onowl21YEPGUdfYUj
	gfnL6MfhKMchi5UV44jUz4TMv5zw5/f8knaN3IdGaSHlYB2vmDYZlvWfKVIkqaGaI/xV
	CkKw==
X-Gm-Message-State: APjAAAXlcJkYfZFEafywEtb1m0VOFP/xhvZRUasQrg8VcyJSAl7CVIEI
	8P0dzn79rKmOrKvt6YZuL8fCvYcM
X-Google-Smtp-Source: APXvYqwvbXhzAPBJpWMw4RzkAj23ZQeSRS4hAykoJOVxTBbm3uTb0/sgaRb1nQDCiLxDxA0zJKXWsA==
X-Received: by 2002:a05:600c:54b:: with SMTP id
	k11mr361892wmc.63.1579541136281; 
	Mon, 20 Jan 2020 09:25:36 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:25:00 +0100
Message-Id: <20200120172510.22648-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 14/24] qemu.inc: add vfat to MACHINE_FEATURES
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:36 -0000

This is beneficial for parted ptests in particular as they
make use of vfat, and fail otherwise.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/machine/include/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 5050e41066e..8dedb1a42d3 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -9,7 +9,7 @@ XSERVER ?= "xserver-xorg \
             xf86-video-fbdev \
             "
 
-MACHINE_FEATURES = "alsa bluetooth usbgadget screen"
+MACHINE_FEATURES = "alsa bluetooth usbgadget screen vfat"
 
 MACHINEOVERRIDES =. "qemuall:"
 
-- 
2.17.1


