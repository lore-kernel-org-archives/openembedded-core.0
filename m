Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7418374F75
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 06:11:15 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l1-v6so19188983wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 23:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=47frabEF4zpr2/7OsYXCZCqfkU9YgPoCap20SfMqY8Q=;
	b=h124GIRXXurw4m+PxpCk8mi0tommHCjVfH+mTteby1QUG0xGkTGzXfbJdH3SO6luxY
	LYXNKXXgSrfb5JxReZDi5oomBp/tvUBmW6y/erxcCkun8bqDD9P6t3zcp4LttW9qUNkh
	lKQq1ebL/H+eJHGFNGb/smsfxI7CHxW2l3U4Nan0e06eeCV8My1b/s4DQEKRXTA6J3FP
	Or+swB1/KDG9IUZS/2Hiqcf3SGSC9xg7fZXYAk1PQ+EpubGDtWeWIhD8LVUZ4yXIgLp0
	ObmHvhvtzk++aSSiUeItjbq5F4EYjvHPf6MVTDaLKukT/curQ5P4RIgyl0edKxzzJrTx
	gDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=47frabEF4zpr2/7OsYXCZCqfkU9YgPoCap20SfMqY8Q=;
	b=bqR6ORsF+54y6nHnz5Vm2Wg02UFOvGh+0Y48huq+gwebxqDDiG74rxTIRdvjDQsGeW
	guozH4kAX3+TuGCG3JsHVKxzly07JDPGGKiHzLxM22Bqzo5na+/1EegVSpEInZVMI0WD
	Dm4XaTu9EBSDoH2zw11YYwZL+Hp4DbK8WXTWMCtfCC7LIw0XWfWFdnysfutj9M19CHvZ
	hZZ7+7TdydDM+hKX8yRVZbHd72A6UpDDuQSNM7WOKtpddf4YzlQstI5XB/XsYa2SNbhX
	xSqTlczA6v486x5CeuAuieIclLnqFrWNZ0QGyNr5zWnNpwX1H44v7bEsr4KTLew4joT8
	AsXw==
X-Gm-Message-State: ALKqPwdCoAd/bojNyN/3HAtwKCXLD+G1zch/dBnPfTvvRtlFhxdkf8oU
	66pobsCf5ldW2Unt9Kf2m5JZKg==
X-Google-Smtp-Source: AB8JxZrlgYTgIR1rRK+QbHJ7gPBBzU317j0K6UTKOfbAd8/pKnKLWmcrl5HX7VxDdUGmr4nI6sVNRA==
X-Received: by 2002:a1c:acc2:: with SMTP id
	v185-v6mr6715523wme.67.1526364675697; 
	Mon, 14 May 2018 23:11:15 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([176.32.49.4]) by smtp.gmail.com with ESMTPSA id
	131-v6sm18086723wms.34.2018.05.14.23.11.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 May 2018 23:11:14 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 08:11:07 +0200
Message-Id: <1526364671-29451-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH 0/4] support initramfs/devicetree bundle for uImage
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
X-List-Received-Date: Tue, 15 May 2018 06:11:15 -0000

From: Ming Liu <liu.ming50@gmail.com>

Ming Liu (4):
  kernel-uimage.bbclass: use boolean to check KEEPUIMAGE
  kernel.bbclass: make bundle_initramfs to be more flexible
  kernel-uimage.bbclass: support initramfs bundle
  kernel-uimage.bbclass: support devicetree bundle

 meta/classes/kernel-devicetree-common.bbclass | 21 ++++++++
 meta/classes/kernel-devicetree.bbclass        | 29 +++-------
 meta/classes/kernel-uimage.bbclass            | 78 +++++++++++++++++++++++----
 meta/classes/kernel.bbclass                   | 74 ++++++++++++++-----------
 4 files changed, 138 insertions(+), 64 deletions(-)
 create mode 100644 meta/classes/kernel-devicetree-common.bbclass

-- 
2.7.4


