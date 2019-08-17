Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2CB487F361
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 14:48:24 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id e8so9332960qtp.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 07:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=zgnMLAki3+0M1GOmG84ghUlg8qohX1sPmz/iMhW8sIo=;
	b=I2uY9jDkdEI4WVryhpgOoax5jJqYWlurfHHDKAjsIPKKnDRw5ZJu8/lTC3XZ/aP/XC
	Xv2hHKl2+js1mUVHauwwmIcTlJxoqkn7s4XLd/vB9/aRdskjWWd8n4yxbWtCPfhH0Wzc
	bzQcjYU1n+jLb0x8TBe3177gwgoPawchtZXCems9Fqlj47gBO0425KaSIKyhDvNPz38Q
	FtJLpXxnIweRFYIbKeOSzWVX79uahJQnt7l2ftVQjPsWRUJ+r3PkTFm/HFLWqLVRfDZV
	duL+m06QdEHzwg1zkhm7M7my10/NBCpB5VLL2Lew8eq85PlvLqdY47U7x0jcnN8KC+CG
	J/Iw==
X-Gm-Message-State: APjAAAV4FFy3LIv0QcpyK+9xgNB3EGaytQh3ymg7vlVJwmElWnJXy/vS
	aHNIJVpXNsp/62beiiEd1e0lBvTXzs4=
X-Google-Smtp-Source: APXvYqwIdZe+gAPIZXaVi4GxH+EUXoW4sFNMz9oq6GveI39ihKcb313pux9/P/CKoLSlF2Gy+iMIDQ==
X-Received: by 2002:a0c:928b:: with SMTP id b11mr5220201qvb.209.1566053305487; 
	Sat, 17 Aug 2019 07:48:25 -0700 (PDT)
Received: from localhost ([181.220.83.67]) by smtp.gmail.com with ESMTPSA id
	w24sm5136831qtb.35.2019.08.17.07.48.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 17 Aug 2019 07:48:24 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 17 Aug 2019 11:48:21 -0300
Message-Id: <20190817144821.15767-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] linux-firmware: Upgrade 20190618 -> 20190815
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
X-List-Received-Date: Sat, 17 Aug 2019 14:48:25 -0000
Content-Transfer-Encoding: 8bit

License-Update:
- WHENCE: New firmware files additions and version updates

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...{linux-firmware_20190618.bb => linux-firmware_20190815.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20190618.bb => linux-firmware_20190815.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
index 9afaad73f3..518638806f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20190618.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
@@ -123,7 +123,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=55814698bbae7c7dd40c9fbde91af0a8 \
+                    file://WHENCE;md5=37a01e379219d1e06dbccfa90a8fc0ad \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -192,7 +192,7 @@ NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
 PE = "1"
 
-SRCREV = "0731d06eadc7d9c52e58f354727101813b8da6ea"
+SRCREV = "07b925b450bfb4cf3e141c612ec5b104658cd020"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
 
-- 
2.22.1


