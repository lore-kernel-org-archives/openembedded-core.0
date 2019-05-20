Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1FB7B7E024
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:51 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id n25so12804093wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vq0JpLhcgOIGC//q6TalpI0EQCxWF6zKRhQNOEc02BQ=;
	b=g+sc1mpw1tRN5BUf9VfhvhuQ7cLoFIHEDfHyUIMDM9uDgwX1sNDNS7SVuy24BvU3DG
	h9UdyBWqatDwoWHnLSO68CeSClY/mfBl41i8/4fuX+j5Vk6Mqa/OMbuhkevosBwucap7
	xkxNSzyK8KtBTRa/gHyURUuB+grTLKQC31IJ6PlUjvpVJRtAoIuf4eSqDAnqkkC03ini
	CVIo7cy7PJAf474JNGPMgC+xPlAfCnhFdsOfmLeaBlcIspW7oP/gddOMA0Y0yHFrXcXm
	t+7wUt2jQpBWCZAzhvBICNuhcN1ilPPY+Ufv8J+xTYFX43LzFWgRRu4IocHkuNHCLwj+
	rdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vq0JpLhcgOIGC//q6TalpI0EQCxWF6zKRhQNOEc02BQ=;
	b=j3F/FIXBC6tnxIt3pH0UX8qy/iv/Cc+Uu5tkkrYQ9xTvq3DC7uNaem31VxqZiSN3aI
	qPW040UNL2pJON9vvWbHl42pwSjzaO6TrOR1adhV/8i6qrOunq42H2ZkejEm3cAOU8TH
	yzxbDYe1uD1OY4lwPWn5ghPPx8Zc2p6TBMSydNafsApasQTx4UWt6xXMMVd5k98NPCAr
	UeIYETgA3aBuZrRoLjaIj0spjZLPdZ+ngFT8cC44FngD+UG+Js916VWvEqARPZSUmCwZ
	yjxBM5+hdb6C+t454aal/g1EZC27ve19ukb4jY2EaOyuYT7q63YW6jvYS+3mWqx81XIw
	//SQ==
X-Gm-Message-State: APjAAAU6BP/C3swSoyNoYa7fXYT2PL56S/prOFjqut988Drf6q0cVSot
	UL+c5X+KYu1Pt+cHGRJGEs/7svM7
X-Google-Smtp-Source: APXvYqw40r70LXrYY7dKlCobGte+Sj0KwR3ruXQ1B8NGBB1XR3sqLQFu6R8zD+7NpyOzIeTp3zvzpw==
X-Received: by 2002:a1c:a64e:: with SMTP id p75mr11659575wme.62.1558361511565; 
	Mon, 20 May 2019 07:11:51 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:02 +0200
Message-Id: <20190520141125.10805-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 19/42] lz4: upgrade 1.9.0 -> 1.9.1
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
X-List-Received-Date: Mon, 20 May 2019 14:11:51 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/lz4/{lz4_1.9.0.bb => lz4_1.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/lz4/{lz4_1.9.0.bb => lz4_1.9.1.bb} (94%)

diff --git a/meta/recipes-support/lz4/lz4_1.9.0.bb b/meta/recipes-support/lz4/lz4_1.9.1.bb
similarity index 94%
rename from meta/recipes-support/lz4/lz4_1.9.0.bb
rename to meta/recipes-support/lz4/lz4_1.9.1.bb
index 744a1bf4709..de1f970247e 100644
--- a/meta/recipes-support/lz4/lz4_1.9.0.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
 
 PE = "1"
 
-SRCREV = "131896ab9d4fc9b8c606616327ed223d5d86472b"
+SRCREV = "398e36c756a3067de8e2b35dd380baef040dfe0d"
 
 SRC_URI = "git://github.com/lz4/lz4.git \
            file://run-ptest \
-- 
2.17.1


