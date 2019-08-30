Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5D89F7F359
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 20:17:23 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id j4so16536458iog.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 13:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8p/v+bXizGyR7u8p6cKfP5e7lxcRqJWRSuoqE2tERH4=;
	b=Gg3vngIcfjmb0/v8CSWVIklBAJ9E7TC4Feg9Ig+ki4xpJSiD/HAwYMGg57pxjoHNDv
	O9QPfVYllbw1uDEVcBa8l+VgpnDXb/5ebpPfmQq96m4AvDrOLCZI5cji03L4gAl49ujL
	gPAguoo0Zi/UZ/CQYyPDSmnpQgdBTTw5xaTNZUDb4dBn1fZURIqHKz8am1sY3W1vhQ3/
	WrTPU3oFHO/v2SGASJW4PnmupcLqi0ZHpLF1zLBp7Bh2hYXEkFP4GaN3ZZBQAwfzxMEK
	A/5xnMeAoxq7OtbVsuNpfgPr1U7SfFNKASHEJ33+e/KX6N1SIUijfmwMTGjpBOTm3VGz
	T0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8p/v+bXizGyR7u8p6cKfP5e7lxcRqJWRSuoqE2tERH4=;
	b=SvVHorwdjcR0UomfyZv7KbC5MQ1XO/39BNJ7sUbbqjUevA7iAiI7OJZE3FR6o77t0R
	qO+D9i/t1U7GYWc/PmJL2jAuuUNfhYka8F/wLloV92q/5pQGyF33SiHDuADj698BaKOY
	lNcERgwviJkIUVz81F4K3xXRFdgKsbzD19IkQ8INiWvlio8bgkzHtvur3Lr3/cUjHoPE
	b/DhIYtfszkuhFSA9cIo27wXYDs3jZ6y9nJ+aIep0SYbMM1v25ASDtnzTIYCMYrrjWhu
	JA5BKGgDFGwc5LWNEupeye2U0nDXY8UrSseDqfEgf17+1jdobXCQSUTEBkOH8gjmZgqO
	0b3g==
X-Gm-Message-State: APjAAAUfWdKu6BxQ9jY14MotP3EdJmgtaNOU3ClaSZKzGhp97naq5Y7H
	mRPFdxjkla6JE9sET0Htvouu7Y16ANL8+Q==
X-Google-Smtp-Source: APXvYqyDW2v8/Ery0qS7PJopb1lPauZAAjrUt8qCe6iRBw8prZSyp+E4d9jHKHzXE+tT/I+KwN1HRw==
X-Received: by 2002:a02:4005:: with SMTP id n5mr18220360jaa.73.1567196244110; 
	Fri, 30 Aug 2019 13:17:24 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id k9sm6626409ioa.10.2019.08.30.13.17.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 13:17:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 30 Aug 2019 16:17:18 -0400
Message-Id: <20190830201718.64067-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.2: update qemuriscv64 SRCREV
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
X-List-Received-Date: Fri, 30 Aug 2019 20:17:23 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The scripts that update my SRCREVs were missing the qemuriscv64. This
SRCREV bump moves it to match the rest of the 5.2 qemu BSPs.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto_5.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index 8bafeb3c46..3d6a3ecf8f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -16,7 +16,7 @@ SRCREV_machine_qemuarm ?= "c9b6ba7aba803fdf715e93c22fe5927767b08a64"
 SRCREV_machine_qemuarm64 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
 SRCREV_machine_qemumips ?= "31f1ce49e00a7bbb136a81480da135865da0ea90"
 SRCREV_machine_qemuppc ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
-SRCREV_machine_qemuriscv64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
+SRCREV_machine_qemuriscv64 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
 SRCREV_machine_qemux86 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
 SRCREV_machine_qemux86-64 ?= "35276d20c01a78ee3640a074446b0c15c486c5d0"
 SRCREV_machine_qemumips64 ?= "898f35c813f9d89acd456c193b9005771ab37a60"
-- 
2.19.1


