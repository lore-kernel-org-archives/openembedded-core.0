Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4C33178867
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 01:34:02 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id k15so2357782pgr.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 17:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6rMIRdmuLcuYbZmi37MNGMqjVVLKQ9XIjzay2Zoc6CI=;
	b=LsgqVLWq99b7+VUYcoMY5898d5hFpjbb5WzSt1TxCvdC2kvv5sqJHaOpUKWg6eV9aO
	bsyuSs0JpEnHyGlfdhKe/9TJMP6VQFZu/t40HMcwOowyV47mJQyvvzT+t7x+RVoLW7gW
	isbf18wfk3+jK8vPrE22wXp3ms1dPI/fhvFH2J8qYsb+i4eOnAQCinHqISzQPuagLvCK
	K5YrPoJ0JxQAStWUOb1EbMdYdY7birAj8PP6wASJ4zgt39d6w/GwUJsK353TEawnynIw
	gPI7mLKgA51qGpolAXGfzPSARGvGEuo2ZaacTzm0Uzi7+S9TMEZy+HzjHgUDgeHFjUVY
	6UJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6rMIRdmuLcuYbZmi37MNGMqjVVLKQ9XIjzay2Zoc6CI=;
	b=tcob/i+0habWIsZhJkIiSJ8xnYRFFaS5y3BcnI8m9XO2YJ08HYFCR0EQXLxrE+AUsP
	OHpdPWhbefTqpMzc8mtd1t1u1a+kmp1rvjWgXv72apUMg3bgYc1JZ2n7l+ppeDrd5tc2
	+4jTIV1beAcCjC7mRtEAZ7ZhXg1tfbBT1toKUprmBg29A32eKkarBZGdo3qDBxNuH/ED
	ru0sG1n7nbBNDFn7YiRIraZnGwihog6d8ppVtL0lzBDQNHQudoVkyx169FXZ4uMqdtne
	NO3wkInEVedYtm5hZGoZae3tfnHWab2hAs5WSrjQgndjtTQ5Q7IE9jcENVz5r8DOTwEk
	9qpg==
X-Gm-Message-State: AKGB3mK65OtomfvS8/jxD9cQgPxwgDqQ1cOAflOgIAN1DS/UnDa5+JDW
	vB3MCd0Y/dIU7PiauN4uPzxDzw==
X-Google-Smtp-Source: ACJfBovQrKm7qPJv3O6LNyj4PLHwCNun/UXbOlseqCTcUscn82BSLpkGcxYCDkMhPED3aopHbgpzrw==
X-Received: by 10.98.95.68 with SMTP id t65mr7988633pfb.45.1513215244036;
	Wed, 13 Dec 2017 17:34:04 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	t28sm5419163pfk.154.2017.12.13.17.34.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Dec 2017 17:34:02 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 17:33:58 -0800
Message-Id: <1513215238-19948-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] busybox: drop obsolete CONFIG_FEATURE_SYSTEMD reference from musl.cfg
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
X-List-Received-Date: Thu, 14 Dec 2017 01:34:03 -0000

From 1.25.0 onwards, busybox dropped systemd compatibility from its
version of syslogd:

  https://git.busybox.net/busybox/commit/?id=accd9eeb719916da974584b33b1aeced5f3bb346

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox/musl.cfg | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox/musl.cfg b/meta/recipes-core/busybox/busybox/musl.cfg
index facfe85..6fffc91 100644
--- a/meta/recipes-core/busybox/busybox/musl.cfg
+++ b/meta/recipes-core/busybox/busybox/musl.cfg
@@ -2,7 +2,6 @@
 # CONFIG_SELINUX is not set
 # CONFIG_FEATURE_HAVE_RPC is not set
 # CONFIG_WERROR is not set
-# CONFIG_FEATURE_SYSTEMD is not set
 # CONFIG_FEATURE_VI_REGEX_SEARCH is not set
 # CONFIG_PAM is not set
 # CONFIG_FEATURE_INETD_RPC is not set
-- 
1.9.1


