Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3042D7D95C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:16 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s15so21281984wra.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=H5Pif3yf1uchjak7tn7u7rAk9qv528DFq29NchvlgeU=;
	b=iK0QqAeW9ZzYCFTMtfc+4rvNatIrezRuz+XRyRwKNotq74eiPCfvE3aydMZac7JKsN
	R95OTDUv/OlXfSg7ubYMzeB4r2Ak0E6z1H7kZtAFrpAsD/F8ltNeXeSYl/XRvyk29LY9
	8ZYTG0r0oIYQpKtaM9GwivdmVdP2Me0xFEKX/6sMMlmrsvND1CYuDJGmcZMw7pwQ+Uak
	zlpXMI83Vc4kgxOpqGGAZff9rlU+2n3kfVo66PiKFuB61nfKtvNpuphZAYqW+Rv0uBEC
	rxFfH+qBpYV+IE+EaYKyE3HCp6titdeIXVXO1RGoU7Eg/RpA0+cTSohyp/mVH8AZSUuE
	b3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=H5Pif3yf1uchjak7tn7u7rAk9qv528DFq29NchvlgeU=;
	b=O2Ivwevwhdk0ATSfIPl+kigntbXhomTRdHl/ScYgMmaN/W8A29eu1YW4g/BVyfguLW
	5bha99qKdRT7N/Cr3PLO3ANIA9BQh8gb4ja6ncUKEb2oAUyMO6CH3rTQ9/ppqRzrnQTw
	BCTDFEH9c7mGF6LnnFxLc5Lb5I1fKWwX8RaLFAPZO34WkSoTNwsMAwB7p+2hJ42TNz8h
	wn26Hsawb3kXjyVfnUri5JZZtnO0zA3bTr3y6PXRCBiYCFEi4leX0dW2PVPJsUt+MTdO
	LZVEveq8zOSxE0cuq8VDVnZEEkFl7H5ncdkc+KgwkPh5GP43Ap5F4n2VANPgsy29Gwjj
	Gr0A==
X-Gm-Message-State: APjAAAVhDLWPa6IGKbS7UZwk1aXn3LjkVVzQf1EGkMOTYOpUDrQsuTwc
	Ru6NGn1jA9JUg8eYMa9+qvaxvKrv3eM=
X-Google-Smtp-Source: APXvYqzt0k1X1SwBoRtc/93Qtp5nTOWwBaEj7mKkdpRxWqQjmddsYeqIpKrtYUdlPOIrcoKeut5m7A==
X-Received: by 2002:adf:9427:: with SMTP id 36mr48449961wrq.128.1555325716730; 
	Mon, 15 Apr 2019 03:55:16 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:52 +0200
Message-Id: <20190415105457.57067-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
Subject: [PATCH 14/19] ffmpeg: update to 4.1.3
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:16 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ffmpeg/{ffmpeg_4.1.2.bb => ffmpeg_4.1.3.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.1.2.bb => ffmpeg_4.1.3.bb} (97%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb
similarity index 97%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.2.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb
index e76fe7cbbfc..994a792ded4 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.3.bb
@@ -26,8 +26,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            "
-SRC_URI[md5sum] = "8f7f0a6c5d81ff20d9d65d000a6b419d"
-SRC_URI[sha256sum] = "b95f0ae44798ab1434155ac7f81f30a7e9760a02282e4b5898372c22a335347b"
+SRC_URI[md5sum] = "dcc20dd2682ea01c678b7b8324339d43"
+SRC_URI[sha256sum] = "0c3020452880581a8face91595b239198078645e7d7184273b8bcc7758beb63d"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.17.1


