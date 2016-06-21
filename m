Return-Path: <ross.burton@intel.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id EF64570018
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 14:39:38 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id oe3so12509802lbb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 07:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0TZKbE7lhDJ0aYsSbX3xgBfhqluCaCO9u0d4h50fmnk=;
	b=BAWzquC0Zx+o++1Tg4PGnpe3V/9K4CUsuIoM/vfqLGTQSionSgvnIAMCTJf2RQWZtf
	j6qgEuDM9Hz2FsJ26sAZo+tzjkcB42t236zSMN5fGlzib72NrXxXgY5bGOH/BIvAhi3J
	94J+3PU7JAXZDouDyVuYHeV17Fi/Rtkyiuc9lOHpLyA8Q7wZplivoxcx1xWe6DzGLqq2
	QI3OtkcOmcp+q2cTYe+9dXy/+z5GcaZKKZvttAsOA4SliV7ddMi1utzJHH9McM0I67gL
	RH4jw7LE4qlkhyxO+FM4xBQSpYvoN3Alnk4a+6vi/YoYDNOvDnWj8LIUT4UAYwWVA+94
	FT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0TZKbE7lhDJ0aYsSbX3xgBfhqluCaCO9u0d4h50fmnk=;
	b=DkaUU5LNydqSLxwSoEzvzrzLiIQDu/NGFngecAyns3JWMF0XKfDihW1rj4tLZ6/kvm
	L0hNxXYKOgvO3Lo8/5hn25LtzybsoxQltJM+jk6x8dnKre1/J/0pUJj1wJ1nFTOM58VQ
	QBnpPQIq8uIF+rB3L3Xhy5qZc6J1pEDCQDKAhmPcj7DMnQQrx60jFj1hDn2lc/Vde8vH
	dsfV0QMyT3zBWV+ixUa+W6GxL42mNeFcumuLBS6LDQ8I1z9Jo/LDCMfiSNvAHHK0H0vK
	KRQnaHqO/rn94sTIkkf9WEAR8vZQmT9VTjCoWftHtgqpSSLFXF3Lw0ibbQLWG/Q59YAI
	5DVg==
X-Gm-Message-State: ALyK8tKqj1wboJ2Gc/dK0kgesE/Y7Bf+8d3xmHqNsS0G45/Rt/RkTIxE+CYGsivwRZCSztH7
X-Received: by 10.194.70.41 with SMTP id j9mr12669452wju.30.1466519978699;
	Tue, 21 Jun 2016 07:39:38 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i74sm3272374wmg.21.2016.06.21.07.39.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jun 2016 07:39:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2016 15:39:31 +0100
Message-Id: <1466519971-5127-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466519971-5127-1-git-send-email-ross.burton@intel.com>
References: <1466519971-5127-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] Revert "core-image-sato: add gtk+ for M1"
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
X-List-Received-Date: Tue, 21 Jun 2016 14:39:39 -0000

We added gtk+ to core-image-sato for M1 solely because the SDK self test was
building an application (sudoku) that links to GTK+ 2.

Now that sukoku has been replaced with galculator this workaround can be
removed.

This reverts commit 282d5f7f8573551b94c6b610370db15665cf4bdf.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/images/core-image-sato.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index b93bf23..e3246d2 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -8,5 +8,4 @@ LICENSE = "MIT"
 
 inherit core-image
 
-# Add GTK+ to the image temporarily for M1 testing
-IMAGE_INSTALL += "packagegroup-core-x11-sato-games gtk+"
+IMAGE_INSTALL += "packagegroup-core-x11-sato-games"
-- 
2.8.1


