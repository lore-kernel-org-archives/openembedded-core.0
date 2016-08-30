Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF7F601D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 19:19:29 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id v123so1967371qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 12:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=L09KOYOzmWAhNUEfxwOPnBLA3i+tMjwW43RMTJANBr8=;
	b=a6gAtea8QGrb2Cmn8+740q3y6epVjyrHb8XA6UckzS4nLUS2HW1UqEZNYpLr4yZnUB
	uLYiuor0BmK4YXxPgKrawebA5SFk7LZDT1LZ8BvfeJdBwZwutHBPr3+et/JiSzDHp5NH
	ILCKse5z4Ajv+CPK8yf0c6Wr7sUYUW71c8V2kN7XwEuswsH8UfvV1PnPC/op5BMaCNas
	5gXlyGl7IkSg2RUd20BMKacVzK9oITr3fPfcB74NFgWeRWUH1LfM4gPBi9tG11oQGtfD
	sPLbG4EbxykiG47AJcxLAD15pn9+m/HoN5qEHC+6f/lxzv+0AjHviuVlekY8i4aT6yrK
	IYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=L09KOYOzmWAhNUEfxwOPnBLA3i+tMjwW43RMTJANBr8=;
	b=BVsheKYaK/lNBj99KmpZOV9aL0URdOAiRVP9ifSHI3mfR1hkmPodEpyU6cmb17dnm/
	iW0LFT5bR3Vna1B04/FzVvlAJaciNGVZj0FT7uXw1A9P0hwA+/CmcGBRHlO4ak5XieTL
	MeeGWD9NRhXfvXU82x8ia23qZHVv8hAM/n07PDjtK0kCopVKjyH1jArq3xCiyMn8B0Lr
	uGceNCJRiNa64nKPuTjZR1TxsxcCDsBpXdGBJdYqYs5Ne0JSlo/AWYZVZQzw4rP+dkTu
	+MO8KpmfjpY7k9laXltjoB51zhcYTwEduPWpqlXREbhQfxB1v1ZaTN4mexLJoDXFcKlY
	0O2w==
X-Gm-Message-State: AE9vXwPAqRxXixXFMgFZ2ZDGMaHyU7Nil1S4yBhTkDB4iyDYKCHT9lMJO1E38Yz0gRNHEQ==
X-Received: by 10.233.239.149 with SMTP id d143mr6742985qkg.176.1472584769759; 
	Tue, 30 Aug 2016 12:19:29 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.100.224.8])
	by smtp.gmail.com with ESMTPSA id
	f62sm22523511qka.3.2016.08.30.12.19.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Aug 2016 12:19:28 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 16:19:12 -0300
Message-Id: <1472584752-24827-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] linux-firmware: Bump revision to 7534e19
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
X-List-Received-Date: Tue, 30 Aug 2016 19:19:31 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index ed0c6ec..5314ff9 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -112,7 +112,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=fc7f8a9fce11037078e90df415baad71 \
+    file://WHENCE;md5=0eb5bc029ecbe85c54524114cf17ed0e \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -172,7 +172,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "cccb6a0da98372bd66787710249727ad6b0aaf72"
+SRCREV = "7534e191256629a20c02e04d5f6d0439c48de80a"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.1.4


