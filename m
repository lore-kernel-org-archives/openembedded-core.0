Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1726B6D48D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 14:33:43 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id y10so6674871wgg.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 07:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QjJCkrq8CuagwqxFlzYFltubR66W8jSASYrpkUCJX1g=;
	b=KJVUKDFBLNt7Z0vtkeS9vELPZYsDo/hxbjNvAel8tKaLwzv4h8bs78wc+dprD6oqj/
	ZItxtszVKT//s+V3dRvXwhGi689aY79rWznzT9+eI0x/Bo8yjaR4uMLgYajlFUNXZw0W
	jr2VgH/zP/mkoBd58NqHDsfR3puxPsp0CShpsb/KQXr70tZxiVucwNi4MU/BRZK4JZ1V
	BF9hPkWwEe5SwKlSiKYkg9atgsPwmHTjCSKrMR358k2VkVnhH5NIPqND+ISCkk51HGFw
	b6LMQW3F/K9Lqrpq9wREf68vw6z37OukwAN7TdXglncP8IZqJ8JmujCRbZ/MQXyd0kHp
	34FA==
X-Gm-Message-State: ALoCoQkXfPNNeTRSaSF6oX8g3WJeZWchdN0iaje0XDlnR2QRG/mcjTFiSg7VyZX6jysPXojExpu4
X-Received: by 10.180.73.40 with SMTP id i8mr9285950wiv.37.1382970825561;
	Mon, 28 Oct 2013 07:33:45 -0700 (PDT)
Received: from flashheart.burtonini.com (188.29.164.71.threembb.co.uk.
	[188.29.164.71])
	by mx.google.com with ESMTPSA id fr4sm36349149wib.0.2013.10.28.07.33.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Oct 2013 07:33:45 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 14:33:18 +0000
Message-Id: <1382970798-13574-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382970798-13574-1-git-send-email-ross.burton@intel.com>
References: <1382970798-13574-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/5] libgcrypt: remove --without-pth
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
X-List-Received-Date: Mon, 28 Oct 2013 14:33:44 -0000

This isn't recognised by configure, and the random number daemon that requires
Pth isn't enabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 6a0e0cf..e0dfec2 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -15,7 +15,7 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
 
 inherit autotools binconfig pkgconfig
 
-EXTRA_OECONF = "--without-pth --disable-asm --with-capabilities"
+EXTRA_OECONF = "--disable-asm --with-capabilities"
 
 # libgcrypt.pc is added locally and thus installed here
 do_install_append() {
-- 
1.7.10.4


