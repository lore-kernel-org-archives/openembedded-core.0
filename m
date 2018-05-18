Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id EBE167481C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 04:35:40 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id ay10-v6so3834045plb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 21:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Po163a/EjXOsA56qiXR8wMPJgJL998Nmzg/VF68GUhY=;
	b=ufAiQ3cFgb+ZjfgbusCSdNlcaPXSKEKn297o79BCNAnrx6RiUurDg8Sd2kf7qqLu2B
	mbztsPVo+w/ALEHlRRu5yZov4K9BdNIj000kTPxvIXoprDR9N1JtblC5UkSq4s2oFJyT
	xsFRxXdib7ZX0s2HH9YqJAmHrYKILWmD0g3gmfh4Ows74F8OiPfEe85hlTxFZoE7nU5u
	g0O43HhdrjZwEcoeffULgPmZvCYFUtrvQLXCL9Pj4M855bnNVAqrwIp7DKRCO+i4MFTt
	NnqLRdddLf0veSNv/FOafXoucLhdN8eXwtKsSNbcqA6+J0sELa3b57hLN3tmUu+nBjLY
	sZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Po163a/EjXOsA56qiXR8wMPJgJL998Nmzg/VF68GUhY=;
	b=U16+8KYPoHl0wRydhVn8ef0FMMvJUSvZtOnmMaILPGv2I+k4rjzGv/5yEysmRiYP9z
	fIP/9mgdPXjvLI8Vng0F6EyEv6SFl/lGlZA+wYun7tqLtpaPqLibCjoNQS6unOcin7oI
	9wdxvL2sHZjt2UsUECQMbhgRx9vQUUsBhGJot4wgozdwHAMNwoGEziTaERHzg9o/fh9b
	Lyb4dye16/1MfCXwZr6YzpLxAaZto+BfCJy8tyINnLMb3C1ErhnDbSZEznTqKgRHBBF5
	Cv4yRyRWR7yiJS+CSlcaoSwz9xwVftgC3vTp6H/v48AjiR0KYypmNYnmPXM/F2Jx9KFH
	fmiA==
X-Gm-Message-State: ALKqPweD/w7XbsWKDX62trqezuvWhw63KYqshBGnaPGuZSFTcmbFRh7o
	wVGs0Y3uc8h3eCkpYK8kmje2Jw==
X-Google-Smtp-Source: AB8JxZrRF3PuBSCDTjQYAfPJ9MIKwnS8UR+ThqIwsp04O3toPIoP/vSQp1L/Gqq9pJBEIZOAGvHMMA==
X-Received: by 2002:a17:902:22cc:: with SMTP id
	o12-v6mr8174378plg.38.1526618141201; 
	Thu, 17 May 2018 21:35:41 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q64-v6sm10235801pfg.180.2018.05.17.21.35.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 21:35:40 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2018 21:35:33 -0700
Message-Id: <1526618135-7513-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/3] gstreamer1.0: let autotools.bbclass handle --disable-dependency-tracking
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
X-List-Received-Date: Fri, 18 May 2018 04:35:41 -0000

autotools.bbclass adds --disable-dependency-tracking to the configure
command line by default, so there's no need for individual recipes to
do so.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
index b4398c8..dec1783 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
@@ -38,7 +38,6 @@ PACKAGECONFIG[unwind] = "--with-unwind,--without-unwind,libunwind"
 PACKAGECONFIG[dw] = "--with-dw,--without-dw,elfutils"
 
 EXTRA_OECONF = " \
-    --disable-dependency-tracking \
     --disable-examples \
 "
 
-- 
1.9.1


