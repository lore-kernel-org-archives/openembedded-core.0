Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id EDD507DE88
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 21:12:36 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id y19so7660984lfy.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 14:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3r342KcAqikefDqaYdvRX/3P3T3yCWeWUfq2jGtGYyw=;
	b=gFah3VV7Pmx76UfdgEMheZIXCsnlhlvfzazS2mRYDGpoRfKdQEDfeDlNNfd7qm7e/Y
	ODoh9xM/6EuDircXD/z2hPzZM3TJCrVOTn8WSJOTVifv7PbvXoxSQ+7+C5myYR6EJ4g7
	0xm5Yny18vrgTfCm8/Z38vvR6Kpr/oXieMti+hqYEF8jcATb1ru2qVNDuywDFgh8jZ1c
	4vnoX4l+t3JuFaHllqqCjZKkbHHhpNskp0S8nyrxjmFfY9/vgX0uWux1UIOAzYKxMMxJ
	dAmcYvo/AuDeSuUC7RIBUjKSiihl1Yet6f4RTQg0eb3EtafSxe9v9RQ5x/gP5PEoxTIE
	eTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3r342KcAqikefDqaYdvRX/3P3T3yCWeWUfq2jGtGYyw=;
	b=jruG9sB8OAeO1FGgTgHXfDeVgkr4XFvcPF05pOw1b4i2TAuiuwh8YKwsPb/hGOMSug
	cb+UEPD19rwYri4xvqDZUBtEyQgZj+kUzOpbi47LKEKYaOBlUr4VAsB4SnbhQ+JW4Dj8
	Qfp91r5V7b7VwWUzLkuK2Z7Osy4c1eZkHDvE5lDE7wveg+I+mnPoP3xrcPj+eee8Vlgf
	MO2SYs3WtdYOpdOo8jbhzFB0cI9k0YBHsczLsZsLJ6LVcJBPGIqJ5svGqMkY1VXaFsBK
	hkc9jNWUqZinnjc5OxKH5IHx2Em/d7d4ADEB5lnpkp+fIjz/ei0xS9zZLQgxrX6KiGGJ
	mznw==
X-Gm-Message-State: APjAAAWT8jvz1+bw6jKVjtaK7X0insSQo9Aj3BpY22QxR3yL3ZNFijCn
	QEKc6OycJGZGbFmG4W9tJtR9rjFsNkE=
X-Google-Smtp-Source: APXvYqzCiyjjATOUo6TWsFgeQhDyWbNc6UerboLCMs+La3yREFUXjus3Fh0OKiN69PjMIYqf5iYQcQ==
X-Received: by 2002:a19:c205:: with SMTP id l5mr315730lfc.134.1558213957232;
	Sat, 18 May 2019 14:12:37 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id f16sm953723lfk.75.2019.05.18.14.12.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 May 2019 14:12:36 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 May 2019 23:12:23 +0200
Message-Id: <1558213945-10235-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: gerard.salvatella@toradex.com, luka.pivk@toradex.com,
	stefan.agner@toradex.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH V2 0/2] meta: drop IMAGE_FSTYPES from UBOOT_CONFIG
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
X-List-Received-Date: Sat, 18 May 2019 21:12:37 -0000

From: Ming Liu <liu.ming50@gmail.com>

Instead, introduce a new item 'env' into UBOOT_CONFIG.

Ming Liu (2):
  u-boot: clean up some redundant code
  meta: drop IMAGE_FSTYPES from UBOOT_CONFIG

 meta/classes/uboot-config.bbclass  | 25 +++++++++-----------
 meta/conf/documentation.conf       |  2 +-
 meta/recipes-bsp/u-boot/u-boot.inc | 47 ++++++++++++++++++++++++--------------
 3 files changed, 42 insertions(+), 32 deletions(-)

-- 
2.7.4


