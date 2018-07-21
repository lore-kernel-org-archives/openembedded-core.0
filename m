Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3AD78B0D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 16:27:31 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id k3-v6so9244594pgq.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 09:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NOwdX8KR6MsSpJ3nuifsLGtj/Emc8pW9E2Hi8AxGfpo=;
	b=DxhQaAIk39Jj80vWrPSnEtTbhO2Et/+88by4sqXx019cXReQlfXs4Jz3DRsocINDeF
	MfX0GuM6fwuwfpqNeihk3PWK1uzKgB1UX/nP6p2UredImb1JgBvlmN3FIPGsvRDltF2o
	mUFpIIuJRISI1FRjUNxyBApmy6fKgAKSbz1HXikKbMEtVSHDUyGKQY8EbDJFf9DE1rdu
	BCqgN4ejP72pV0tbku6h672YxRUW486Pb4ai4RNeyHZFydcBQ+VAOn5Iw3A0BxY9tWIS
	ux14HGzDheCmpWrLEPCWGrSvghBuyCJ2wRROUM6idkWZl9SYjJKuOytGgnKstQEcwxEB
	fv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NOwdX8KR6MsSpJ3nuifsLGtj/Emc8pW9E2Hi8AxGfpo=;
	b=VUzXGYVi9c8AW7FGA6HrhmhXYKOV5YLzT7Zp+gEVYCINXUyGJ2TTINcke6nwaaX67L
	XLSmGs8wMeXhY7qmp1JZvpjpzgregvVcPmAebrkkPE/qrh/JmgFtfWWTRyUA+RskKNJn
	WVZw/NE5W7Q9v+FZch1HNFCPPCyCXe/xpGByzvw+OVDhAPoiduy7xS2lBtdp5ObX3y9N
	3qXAwnGtjvdCbOKm49EFMZqFw0AxdmuOED55bcdo/nVR3Z2w8+sNreivAbaq2RHXYnF1
	bXCLziIeTWRVxsAXbisMc34/LohQPLyAZmL+W5CGUbVQ5Gyxbr+/rm/dVZfncjTGNLlW
	8n4Q==
X-Gm-Message-State: AOUpUlFP0xfzj5o4AY1W16TVO+2UJszHoYjYuZOAxpFCoiiu1wzbVUGc
	1K3mCjDVo42Nsqb6XvvnMAwwPUcb
X-Google-Smtp-Source: AAOMgpf9Hqcu2JjAYXGzAVuiQYt+hlnwq8EMICIVF4ezmigV3ST/U4iR+sD1tF+9BOR1vUpfcdchqQ==
X-Received: by 2002:a63:e001:: with SMTP id
	e1-v6mr6142425pgh.380.1532190452313; 
	Sat, 21 Jul 2018 09:27:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::8092])
	by smtp.gmail.com with ESMTPSA id
	k26-v6sm14485231pfb.167.2018.07.21.09.27.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jul 2018 09:27:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Jul 2018 09:27:15 -0700
Message-Id: <20180721162715.12611-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180721162715.12611-1-raj.khem@gmail.com>
References: <20180721162715.12611-1-raj.khem@gmail.com>
Subject: [PATCH 7/7] no-static-libs.inc: use `?=' to set a default DISABLE_STATIC
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
X-List-Received-Date: Sat, 21 Jul 2018 16:27:31 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

It could be overrided by basic variable setting `='.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/no-static-libs.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index 7c165c717f..7fd578b3ce 100644
--- a/meta/conf/distro/include/no-static-libs.inc
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -1,4 +1,4 @@
-DISABLE_STATIC = " --disable-static"
+DISABLE_STATIC ?= " --disable-static"
 
 # qemu aborts on unrecognised option
 DISABLE_STATIC_pn-qemu = ""
-- 
2.18.0


