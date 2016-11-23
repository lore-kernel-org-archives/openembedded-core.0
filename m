Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 44E086B6EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:28:11 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id p66so680166pga.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gQFRoxKguXLy1WcZCursgFk9+ncwJnY/Kt9X2/+JPkI=;
	b=TjpCqGYbnpxWM9P0DzjJmBCf3jViXaQFhSnd9+x4X51j2h6Dfmd2PZE9bBrHkiA/+O
	LusGyU/9+WZepxXhDkOznkQWumPisMdyOkOjvJeYgz4d6ucirIXBblgLFC/iEup+z5x6
	J9aMAeVbF/3if5i3f6A9HX21jxV7PdtmviEgoyN17J1n9tXGTYZ3AMaBly/Cb6F705TS
	HJycLmZB0IMJeOkHT5IWzY6RY2qj0/aQ8GozDiVsLITGHf9vYQddGFHNiHfTNmxqnZVv
	Fp+DXfho/EkA52pBNulnvQRE8753ev8RRMGDSzq2eu89MRWvkwiCkkGjDWWqacEoqKb9
	aCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gQFRoxKguXLy1WcZCursgFk9+ncwJnY/Kt9X2/+JPkI=;
	b=RtMnJPEdGI3Ng3WSEj4UFa978HFFRomUaEQIStCkUvfkRm1JlVVM2Pxry4mML5AqIz
	aJ20I+4a2wTDoh9Gf+/pkJFt7zwvKfg/FXpCq7EfM0S0o39+hju6kPOMSjYgAKZoa5rn
	7lI47rwqsmk7HLcHHDSeClOhz8ET3UhxK2ylXgteULY+Mu7daF8T5yoOZMSIsfSS6B2k
	gznDkVMD/1PopShdqtWc5aHO/NvVplpSjNcm79RON/tDwdB0T7qlwN2BrEp0cw9lBdsa
	O94aguFl+1Jjvf5WNdYcEYinEAV/dS/nNL+B1Odk47Thneao+kh9Dagn/WTs5Mw1vJWZ
	kuLg==
X-Gm-Message-State: AKaTC03R8YCcevWIDA7GjQ1KCCqc4qnkL/O3P8U84DKsZw6MY2OylCD0KzFTlhbVFjjbmw==
X-Received: by 10.84.197.1 with SMTP id m1mr4564009pld.75.1479893292997;
	Wed, 23 Nov 2016 01:28:12 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	c22sm33216727pgn.12.2016.11.23.01.28.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:28:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:28:06 -0800
Message-Id: <20161123092807.28693-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 1/2] arch-arm64.inc: Include arch-armv7ve.inc
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
X-List-Received-Date: Wed, 23 Nov 2016 09:28:11 -0000

All armv8 implementations from a53 - a73 supports
virtual extentions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/arch-arm64.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
index 9440698..9eeffac 100644
--- a/meta/conf/machine/include/arm/arch-arm64.inc
+++ b/meta/conf/machine/include/arm/arch-arm64.inc
@@ -1,6 +1,6 @@
 DEFAULTTUNE ?= "aarch64"
 
-require conf/machine/include/arm/arch-armv7a.inc
+require conf/machine/include/arm/arch-armv7ve.inc
 
 TUNEVALID[aarch64] = "Enable instructions for aarch64"
 
-- 
2.10.2


