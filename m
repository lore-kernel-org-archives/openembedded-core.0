Return-Path: <scott.branden@broadcom.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 34E506062A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 00:11:22 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x185so6217322pfc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 16:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0eE1bsYe4QgDRcy+oiH8ZMEy256amZjI07kcXy3+NCI=;
	b=MyvSEne/PFy/afk33cfZAhzqnBtrn2UmrSYTo46MypEv89nG4abq2HApONfjcZQdLy
	kmDDHEbVg6bwCfPajnNk6mF28Kp3s6/FVYR4CZqsUgAU2tayDlj8pFSci14XH7FTkjlQ
	0cxPFbAcJH0mz7gkqM3JKw4/y0CwTRv4meT1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0eE1bsYe4QgDRcy+oiH8ZMEy256amZjI07kcXy3+NCI=;
	b=CmKEryajztGhR5d17urYR57zAmP/J0dt+gyIeaxSjjVkpArZJvKtmv2QKiyvFbPAvA
	UGz6rMbYcAmJEVok9DXZxTGpKg362+wuWeJtDg89LBJPfQhY0TkyrzHNiP2hA2Xfwh7q
	RWts7/1ar1uVGLWolgrS7i3WItZenSKWN5jtJkxG/J7gDgED/4s+05FbxTk5dz1GeNz8
	ubQxMJ40Ycd4JSAKUis9jz+VRbgKusQdtzavrYXrH8pC66L/229uWNzUI954NUQnB7Aw
	QxBdAugbcE/XuI0DXPqa/Rg86JHIo0T4GFkqIsYP0IxLuZbcK12ZZdizepEH+v8VzFLT
	V/HA==
X-Gm-Message-State: APjAAAVoGFAHT/a/HcQElgZakXFeP8+twtK/XdhMDxcbIY4+60l5cMQE
	F8TWr6i7faslxgRsLys0LjTfsRFQZpbu4j+JrNZycDKOjO/qNbBYEPAuObjcRN9MiwpKBbN8W8j
	n1B5JcSNXoshE54t1PDfMweYVTSCizq610rECFRvW0ys/B7afnj5/sb6NSFJPYYnXGYRwpL4rN3
	o0+KSagI4UgGhRI0hIz492yTThIgs=
X-Google-Smtp-Source: APXvYqxvEAGDPdUFGYiyM283Ozyjh+qfVnBk4Cjnxk35ZigL30mnz996IzK9kb1EiOR3qYHrE1RChw==
X-Received: by 2002:aa7:9a42:: with SMTP id x2mr54252707pfj.71.1582589482979; 
	Mon, 24 Feb 2020 16:11:22 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	t65sm14016432pfd.178.2020.02.24.16.11.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 16:11:22 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2020 16:11:15 -0800
Message-Id: <20200225001115.18188-2-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200225001115.18188-1-scott.branden@broadcom.com>
References: <20200225001115.18188-1-scott.branden@broadcom.com>
Subject: [PATCH 2/2] ffmpeg: add PACKAGECONFIG support for fdk-aac
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
X-List-Received-Date: Tue, 25 Feb 2020 00:11:22 -0000

Add PACKAGECONFIG support for fdk-aac in ffmpeg.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
index 20a8249b02..d7b0641054 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
@@ -59,6 +59,7 @@ PACKAGECONFIG[avresample] = "--enable-avresample,--disable-avresample"
 # features to support
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[bzlib] = "--enable-bzlib,--disable-bzlib,bzip2"
+PACKAGECONFIG[fdk-aac] = "--enable-libfdk-aac --enable-nonfree,--disable-libfdk-aac,fdk-aac"
 PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
 PACKAGECONFIG[gsm] = "--enable-libgsm,--disable-libgsm,libgsm"
 PACKAGECONFIG[jack] = "--enable-indev=jack,--disable-indev=jack,jack"
-- 
2.17.1


