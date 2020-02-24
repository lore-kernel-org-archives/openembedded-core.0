Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1C14A60C70
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 15:45:59 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c9so10944166wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 07:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5NaHEl0SPjhPbJRVZOrkoB9ivnf+ad0DjWonWntMlAA=;
	b=tIwkm36noVTb/7cQ4XILC1steW8P66TGptb04Te4Ao/S1tYNjgO106f27nybTxHnVT
	RrD38Y6uuVjYxJbjZJkeXh4ALWIo7qqHgkDjEDpnXXXby7dBgZZDpjZ5eiHTaWtOtb2U
	K39RGMArsN95Ms3HkwSqkQaiBaUYSR6dVSNLf2Qyh7v4izc7kOiAKKTPNYmlJ0INRhNA
	0QQOtlYfZXlqQEmV/etEzHt/rEYtk8hiRSR29yFxHcr7PL63Raqebafg0nPwAieix+qp
	t4EpRQKl9Em5skaJkz8cPTShB9PlXkdv7N2SU/n5g5yIC00Q42Tt9kVuln1K82J/9+HE
	mIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5NaHEl0SPjhPbJRVZOrkoB9ivnf+ad0DjWonWntMlAA=;
	b=SKn11SC5qaRy6ZuR9S/K2Z2qPMGb7BT/D82e8opaN80mJZW6I8ItodvLgB479gfhd7
	7dRLzmSzKc1Gcj+EgXW69p9UZhmTSwHG/reX+55Bp1T8d+C2o4OMQh0I/qUZfhv9nVt2
	McFiIWBvvPxM/4LjVkjbCHQXAU4LP5nlZlG9iueNokGa67/7HbcEpMdl1mfc00w1pGub
	Cil6GzMFpKEwZWXnFqRlfK9PrDjWqRqOV0Tx6U7d6K+xoyNEnj6JW7+uzpWLVovU79Tv
	kvatF1aqNjrnJSJEF0SNr2Z7kYi3FamId7cg0Erl/eN7x87LTj5P2YA9AEjqVeuFzB4L
	SwYw==
X-Gm-Message-State: APjAAAWpw2NiX9p/KcsUf3c3T3xNnq7/fW7X1i2FvxL6INPAxU+SDLP1
	dU4bSc0GoY8XA5xr/YlbVz6gXQ==
X-Google-Smtp-Source: APXvYqxdI1CfVscu96Q4V20XzbhwbPSVznYcbgk6RsFDXWrUCSbAS68BfbZ7OtuO/YHZO7DrrBRiBg==
X-Received: by 2002:adf:ed42:: with SMTP id u2mr9197514wro.345.1582559160758; 
	Mon, 24 Feb 2020 07:46:00 -0800 (PST)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
	[2.15.156.232]) by smtp.gmail.com with ESMTPSA id
	f62sm19732700wmf.36.2020.02.24.07.45.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 24 Feb 2020 07:46:00 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>
Date: Mon, 24 Feb 2020 16:45:49 +0100
Message-Id: <20200224154549.17866-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-core@lists.openembedded.org
Subject: [meta-security][PATCH] linux: drop the bbappend for linux v4.x series
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
X-List-Received-Date: Mon, 24 Feb 2020 15:46:00 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

v4.19 LTS has been dropped in poky in favor of v5.4. Drop the bbappend
from meta-security as right now the build fails.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 recipes-kernel/linux/linux-yocto_4.%.bbappend | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto_4.%.bbappend

diff --git a/recipes-kernel/linux/linux-yocto_4.%.bbappend b/recipes-kernel/linux/linux-yocto_4.%.bbappend
deleted file mode 100644
index 39d4e6f..0000000
--- a/recipes-kernel/linux/linux-yocto_4.%.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "apparmor", " features/apparmor/apparmor.scc", "" ,d)}"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "smack", " features/smack/smack.scc", "" ,d)}"
-- 
2.19.1


