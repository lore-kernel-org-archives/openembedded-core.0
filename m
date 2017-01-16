Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id B797D71B27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:17:36 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 75so5492506pgf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=fl6793vueri/7Wc/GlZKiV5dqBSguwV+b0KUMIxIOw4=;
	b=FjeN45sZPJeCxVrN6sbiy9GDTfu484EWstnJ7eOYq0bX1adggggHG36xN9OK6Zfw7a
	ZsmRb33sMYI/rxXClUzO8rnjWvf571ND42w5u7xuagL3zA5wl3YIskYz6c3rgYlNTcqd
	jArS7w4AUMzrJv7ik6x4xlpeSrnSNNqGiwq0QEtEN4txvYp/Z0Ukf9tHgVdiKb/V40l0
	KtiCukTbtCOtYY71mXoenQs0bl+3VsD4EFC7+kpdVb+hCex3DITpcwBH5QrvXzB6A/bK
	UnZuGUYfLyYt9r60/ZKgKUeRsVe7O6wTyRObyZWvGKqjLzrP4NVpDjpslJM1AWgDhNpH
	Baxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=fl6793vueri/7Wc/GlZKiV5dqBSguwV+b0KUMIxIOw4=;
	b=q4xmEnqBbMNlj1TxaGdjf/67levLpgZCw+CvvmZlgUIE+3tzgZXtemMVyZmq0n7Iv3
	iYZZbiW0l8I2FEVXIu9zF2uwjTXJ797mLlBVevanvQ/fGNhIdZ2N8utWTgpEfOJ9PpkE
	Qv4A4Vk6gcPlKTZVXfqRF2Swd3HvHlhmHLHh43HpVk8Cql7+9BbGuXajMuwWuxjVGzIH
	jreFSfNp01MD9toYczmXAUayhvnR1Le3lon32D+1NuEVmYUkvgc8NKTXETBrYoZdTsRJ
	oW0KXf6B+qwewwYxEHvIqs/z+khSmqLch/+C85pheBuMdhXlaDeQZGzYcQUeS+f5soIU
	4Y8Q==
X-Gm-Message-State: AIkVDXIavu7yruvcg9mffk/apgN4oujAzsRMwAyyejvJcBqsHa3scVmZG/yRPCVikoT90w==
X-Received: by 10.84.215.154 with SMTP id l26mr51048225pli.120.1484576257483; 
	Mon, 16 Jan 2017 06:17:37 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	o12sm48331436pfg.15.2017.01.16.06.17.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:17:36 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-23-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 23/30] libgcrypt.inc: Disable 'capabilities' for mingw32
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
X-List-Received-Date: Mon, 16 Jan 2017 14:17:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

libcap does not support mingw32, so disable 'capabilities' support for
the mingw32 targets.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 7464637acd..483b92e157 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -27,6 +27,7 @@ BINCONFIG = "${bindir}/libgcrypt-config"
 inherit autotools texinfo binconfig-disabled pkgconfig
 
 PACKAGECONFIG ??= "capabilities"
+PACKAGECONFIG_remove_mingw32 = "capabilities"
 
 PACKAGECONFIG[asm] = "--enable-asm,--disable-asm"
 PACKAGECONFIG[capabilities] = "--with-capabilities,,libcap"
-- 
2.11.0


