Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD9275452
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 15:26:59 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id n5-v6so1190638wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 08:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=EaPrRPTK9P05CL3d8bob8xKBRCGcmbjg0uHwQaDWhDw=;
	b=TzZKi9nTT2z+dFTTWZ9IDdkpEOVwmJIYwQnEkRQUCPWQLiIqLWLS40/mk+nEWsph3M
	qFlo0rLN1opLWWXp65Q6t2Qljge/x8JveMEzI2Pi2Zl1Qp2EpVkfe7utf1BfYBuokeAo
	7qHAyvf4NNwgaMdZlXzwHreL9hauLuw0+4lZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EaPrRPTK9P05CL3d8bob8xKBRCGcmbjg0uHwQaDWhDw=;
	b=hC9lPRugMFnt8P8GC7vOXfmvOp+s0jHbxMGsCth6zF7Epy1vZ6iP6ulnBUlliBGckF
	PvTvUDFlx7Agmq2rdgj6VVPMF44dM3sAtSecL/Bjaizxiysyo/5VSVHpwlXgFCROxLuq
	Y92c/rAWOcurm9LdfCDCecRWrbG5vx270xykcEk85dgJUBkfAaUNo6ARgf6oa+jjRHQb
	BisuvTjqsowHPZ4njePYCIN0ZpowJ+fUEEoZLCv7bPPJQr02sStUGHSkFvkzyGZqTFK+
	lDe3CjC1ReyaO73iWTliirWhu9pbKut/D1JSeZa+soGUu9JIUrLIKnsgp8SVJGmT/qzK
	zRcA==
X-Gm-Message-State: APt69E2bYO+kxYZ4itlwG4yYWO42ZVHj4hzR/BzmOBsb670sU042ySx6
	pHiGeNa/UwQTyaIFMfxjVWzBkyxmsNA=
X-Google-Smtp-Source: ADUXVKKZ0yaFUhEhntiv6cQq6x3Z4x7J39RQnvdTVZdPXCJWC1oZK3vNW8GfKr6cJ1Jz7ZNLyWW1Jw==
X-Received: by 2002:a1c:bc3:: with SMTP id
	186-v6mr13360357wml.39.1529422020041; 
	Tue, 19 Jun 2018 08:27:00 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u7-v6sm15328713wrp.44.2018.06.19.08.26.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 08:26:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 16:26:58 +0100
Message-Id: <20180619152658.21882-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] subversion: Update HOMEPAGE
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
X-List-Received-Date: Tue, 19 Jun 2018 15:27:00 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/subversion/subversion_1.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/subversion/subversion_1.10.0.bb b/meta/recipes-devtools/subversion/subversion_1.10.0.bb
index 82454ae63c3..42c2562bfc6 100644
--- a/meta/recipes-devtools/subversion/subversion_1.10.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.10.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Subversion (svn) version control system client"
-HOMEPAGE = "http://subversion.tigris.org"
+HOMEPAGE = "http://subversion.apache.org"
 SECTION = "console/network"
 LICENSE = "Apache-2 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=83206f39819e7a4dfca2ff7c190f6ce0"
-- 
2.17.1


