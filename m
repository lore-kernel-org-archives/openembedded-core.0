Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5B6DB7D8D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:19:09 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id x132so24736861itf.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 20:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ns5RGhC5O9HEcJNjnFEAeW9iEU7jS6nHn2tAKtKDgjI=;
	b=cP98HvjKxUAFiitcRw3XRbwfKKyEmGxz/ulSC4gVOzEjJ4uCd6dL2iosJJTL1qhvpG
	W+kBL5YF/mtcoE5QJ4At32dzkgRt+gfdoMGUyvfEC5Y/lMmhD5VVdpa+5573VgUWyoCh
	YqioMV8qOm51BTw6NSqdUCOTISuYO3IYKAeBn4ZxxJ1c6qQagOczUDoa7JbVxU2eeDfy
	an5+C0dynkF80m+Fup8PEh26ViQI8NmYyFsF0w89+C6cgeqpPNzSDpeh02N4mhEztALU
	S1sbcv/WdFFtkM5vcGnBNWoGi8vKt5rHCvod/UDBqWoqj0ZvJqMzh1XDuqwl9JIdv9ZY
	FE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ns5RGhC5O9HEcJNjnFEAeW9iEU7jS6nHn2tAKtKDgjI=;
	b=Gu5201VNacugiId4K66V75NkKgVgTcwLOMtHl2EVUOVzDoaQqMDvbvHCkQVbuiM1ka
	SPQZAo9OFijOn6S5N6N45EeTg5rmDCrZoTAnNdsGAdoTyzpw0rriwfg2FNqyeYzfII3/
	io+BB8U/CrKwwxpGLQfFGsA29s99jCDygvmYnOGr2ysoUnRGKUhr6yN2x+7Bjlkl9Qpc
	HTzfUvSMePNfvX6p/1WxKb0DoXRElvqoaGIxNhbQ8w3M/hrjXSNXs3xlfJrftKvrrDdH
	QlWz3E0zw+JlECo6t8GaN0Q64PqQzK9jUemHq0OIUmF2sS/MppCu81sLUD+F9lTRPCMW
	x+xw==
X-Gm-Message-State: APjAAAUJ77bRrpHtj7frDey8i7omd/qebvMIevGZyCHaMyCqK6Ykso08
	Yj88O5l0PoP937V31WTYf2Q=
X-Google-Smtp-Source: APXvYqyiag0StRDb/JZDvK8WPKcXlqrURKlXpE+Lgqp2NHTTAWsfrlNk7esBY2+ttYV9hyZyv/hCnA==
X-Received: by 2002:a24:6e01:: with SMTP id w1mr21265288itc.15.1555298350279; 
	Sun, 14 Apr 2019 20:19:10 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	w184sm7490357ita.9.2019.04.14.20.19.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Apr 2019 20:19:09 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 14 Apr 2019 23:19:03 -0400
Message-Id: <a3a517f7b91c23049125772b7113b17996ba128f.1555298211.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1555298211.git.bruce.ashfield@gmail.com>
References: <cover.1555298211.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto-rt: update to 5.0.5-rt3
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
X-List-Received-Date: Mon, 15 Apr 2019 03:19:09 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the -r3 release, which has the following rt specific
fixes:

    printk: An all-in-one commit to fix build failures
    powerpc/stackprotector: work around stack-guard init from atomic
    powerpc/pseries/iommu: Use a locallock instead local_irq_save()
    powerpc: reshuffle TIF bits
    tty/sysrq: Convert show_lock to raw_spinlock_t

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index adffe4e9f8..24c481681c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "06e1ff79ea9efef052404ee1989cae038b28e954"
-SRCREV_meta ?= "f0b575cda6d03540ff8da2f70421f13a08f34a5e"
+SRCREV_machine ?= "4767ff117d75b2cd54d2c0f77dc1c3e6fdd6c520"
+SRCREV_meta ?= "2070c41a1d0542e41cac5f0ea04a108e46cac427"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.0.3"
+LINUX_VERSION ?= "5.0.5"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
-- 
2.19.1


