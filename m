Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 12CCD731A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:37 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id oj9so2022946obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Somk8fQPf9dK2Qb/etw2eGfkR6Y9QohY1/gHAhVk9TQ=;
	b=iDdsZ7NEq93uV20F44pa8BpsidLbJkB98Eclo0RjDX5CDHPme46Osp536O4LMJtMzq
	xmC9MEqQKGMRxmVnMGXK6rD4FbvYy8wTGAesJ7sCgmJOeF8qJeUbV4DcX8E5cuKdw0Po
	qypXM55CpNP50E6qWVCfEdZY14IXlhxv0vUHoua6s2qh/X+Pjf3cW62rMgYm0kYnN29d
	lFAEWKnoO5ofTsklsMP1FGim/7+5JLYOfBvqNmyDJaKsv5uCtB3Yepud6zm+fGBOKa0L
	UlwakMeEbzG43OHdFzoctqgutXbPTqvHoqRM3ytmM++/zGSpU5a7xrbLgdyZGFD9Hx5f
	txpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Somk8fQPf9dK2Qb/etw2eGfkR6Y9QohY1/gHAhVk9TQ=;
	b=F2C9g/wqn0WjuNZdkLkR64x0XXwyE88U59XOxQnuFt4cQ4e6Rf7jB8ly7rpZ3tbZ5k
	/FRQVYVd6D/N4Ttgl7ig3yYaGGNW9WboDyMcBEKroVU/bHLxRvcy4htNo6v0jpH36gHy
	yCqZozn+iwKAkrsPKsFhRGwmwt2VdHayefsfEzrtlBV5oG5Bg11QsDTpWOXBQNs9QtN1
	lcLFxvVLMbfLXHvQcK2ejoMzCKL0OcaTwphjqCLbaoV6mnakRBHlsgE/cytkJ/5HO1fa
	F5u4bj6cSoTcxv4Z7WT5BVoeIaCxBXPw4aaCT9+HYjub8vTfJlsS3PWJXY2T7vJehTd5
	r63g==
X-Gm-Message-State: ALoCoQlK2wkyvKO3OrSZfp6DaOFKNqKfcRyj2mxxneQJHe3Y0hG5pq+G2NGk1dESvgeu38KzmhXMjifZeJdSCir9h2Ht+qII0A==
X-Received: by 10.182.166.1 with SMTP id zc1mr33025771obb.23.1453354658021;
	Wed, 20 Jan 2016 21:37:38 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:37 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:35 -0800
Message-Id: <1453354610-19218-18-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 17/32] gstreamer1.0-plugins-bad.inc: update hls dependency gnutls -> nettle
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:37 -0000

The HLS plugin requires AES decryption and links with nettle, not
with gnutls.

  http://cgit.freedesktop.org/gstreamer/gst-plugins-bad/tree/configure.ac?h=1.6&id=7dee47fe39223d8a98615f03f34d9221f9e8a6c1#n3038

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 689d3ad..c4199bd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -33,7 +33,7 @@ PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
 PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
 PACKAGECONFIG[gles2]           = "--enable-gles2,--disable-gles2,virtual/libgles2"
 PACKAGECONFIG[gtk]             = "--enable-gtk3,--disable-gtk3,gtk+3"
-PACKAGECONFIG[hls]             = "--enable-hls,--disable-hls,gnutls"
+PACKAGECONFIG[hls]             = "--enable-hls,--disable-hls,nettle"
 PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
 PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
 PACKAGECONFIG[modplug]         = "--enable-modplug,--disable-modplug,libmodplug"
-- 
1.9.1


