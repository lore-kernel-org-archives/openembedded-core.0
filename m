Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9D0F77D1E3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 22:50:32 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id f23so9761956ljc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 15:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=gicINTNjbjwQdSroGI5s62yEpsounLypZ+E9GvHF3Pk=;
	b=mSbqnf3JwSeM/mfVrsEAGoXgWCPm8nYW2NY43x+3P5/Keh+/Rbylt9I+SHD1vOcd2a
	3iVNnm8VE2vpxciqHfLPvBhR7gslJl20QAQ8pZguNIV4yuEwuF337cKDLx9DmEgPCmgL
	aSXo71AXXttJD9Xd4ZhQLbotSg04MDuasP+8EA0KEzsbNrRNg/FC7l9JtVtJl1Ty9eYv
	z/vtno4OYYOX0CoY2GWAF6geJF8WW9ap/II+KsvkqUARoGNng5BnhO27RRhCElsZyeEA
	/SLF0KJH5Bw+WgunQ6tkM1flRuZZbjtedN8cRThkQRLaLgV2BzYnnkslRCamuTocQ7ri
	nI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gicINTNjbjwQdSroGI5s62yEpsounLypZ+E9GvHF3Pk=;
	b=gwUdpZpClGGuteLpDN45Y4FNDZmZEMd2gXkJ7Kfg1ZJMxqGnHnbsoY8CSvWdzGoCaC
	krSRacxeHbEgsMUeT9hQMM1WvYeHNyLe+XYZfTWQ36rDKwsnvj34sjFK5hvljGqGfoNH
	XhxOhtQ244kjiVrZg1oPO7BW1QQySnQw6LaGH2StwLUy5Og2eDNG9/ZtcQbH8y9uXJDg
	cUbNBcpn7v9sspAxr04e08XYsah0o9PajLDPN4Wd5AJTKD7OmkACymjHx+iCZLW1csjq
	ojbzxF9Je9OMi8IRQM6z9jgK1bjbvujFkaUzHser/vVunol6GZIHZidTksp8kV2maUNs
	z02w==
X-Gm-Message-State: APjAAAWG7/MehDYhBKL3WliEaNQ388vLsqEF+pJJPj9tzj/WjfdK8jBR
	c6zjWFJAT2j1Z5CLQ+wYjOVY6m2pDOo=
X-Google-Smtp-Source: APXvYqx3XDTtssNXb/3fsKt4pFIdA4ep2jhQbGVFExm516GhczM8ZsrTDHNfdMiemg/lwq2lBVLXvQ==
X-Received: by 2002:a2e:960b:: with SMTP id v11mr26444421ljh.135.1554159033056;
	Mon, 01 Apr 2019 15:50:33 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	k25sm2427615ljc.14.2019.04.01.15.50.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 15:50:32 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Apr 2019 00:50:30 +0200
Message-Id: <20190401225030.27491-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libgpg-error: update to 1.36
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
X-List-Received-Date: Mon, 01 Apr 2019 22:50:33 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{libgpg-error_1.35.bb => libgpg-error_1.36.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.35.bb => libgpg-error_1.36.bb} (94%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
similarity index 94%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
index 57ac143fd5..2db544a12e 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.35.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.36.bb
@@ -16,8 +16,8 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
 	  "
 
-SRC_URI[md5sum] = "2808a9e044f883f7554c5ba6a380b711"
-SRC_URI[sha256sum] = "cbd5ee62a8a8c88d48c158fff4fc9ead4132aacd1b4a56eb791f9f997d07e067"
+SRC_URI[md5sum] = "eff437f397e858a9127b76c0d87fa5ed"
+SRC_URI[sha256sum] = "babd98437208c163175c29453f8681094bcaf92968a15cafb1a276076b33c97c"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.17.1


