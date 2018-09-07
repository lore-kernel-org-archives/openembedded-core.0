Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id CB166797D5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 13:13:49 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id u12-v6so14901840wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 06:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HKfyD9ovAetTJIcvSB0qXbpRrAx5WZHqqSXtSKdRzXc=;
	b=T4updyHVRs2cd8zSzzZdaTYJAIsg3inwNn6DiP+GX0V3oKAmM1+OGh/jZaDM4HAUyO
	BthTpqEybRXhnqNWDUMfqcA2Y0MoCzXwjNRocmkB3wuzCc9KVhKs/fwIWQ/ohVgv9s2S
	OmeSa5/eadVkTQpOv/BDOM6ZAP4R/res+RBR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HKfyD9ovAetTJIcvSB0qXbpRrAx5WZHqqSXtSKdRzXc=;
	b=jubjHj9oQkaf+rFfzVuATGbKUhqhBLWBOUwnLx/NWFjUbD7PXtyB3gRIAFqxIvJOqW
	NEXcC7oMXVpc+SHYm2wUxE+h3njgkvFBfEQVTKO+t/sSRLTbyS7VQHMOEy/dUnVuk541
	0a/Gmdrlqc6wlONfQWgfsDuxcE31asZDMsefEdl3jranguxiCZvHlwddyWzV/n7APHnN
	oX28reClJVjQJ3moZBiuKXZKU1xYKeYTic5h/RBK/BMfAYsifeHqs7CSol6yNifqlRSu
	12B1DZd7ufNbAB7wwrorVBV4UU+JkilKMoGjJsOaDKgNwai8beYNyR+KEpLSxanlaYF5
	mbeQ==
X-Gm-Message-State: APzg51DuNL3QOGYHgOBEA5UQd3PDMmG/iBQykBsJ316u99+37NslBc7p
	4M/GW1ibm22SpMajOrjxAxRlzKcK38E=
X-Google-Smtp-Source: ANB0VdaosZiJAEX8+cSmiwGU1zA3sjrdqM/qo3s/auuEwq5I+U+Ct/7pvzF44jYX7IFT6oQb3PyTuQ==
X-Received: by 2002:adf:a292:: with SMTP id
	s18-v6mr6516137wra.100.1536326030259; 
	Fri, 07 Sep 2018 06:13:50 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g2-v6sm12930301wrd.71.2018.09.07.06.13.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 06:13:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Sep 2018 14:13:47 +0100
Message-Id: <20180907131347.19537-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180907131347.19537-1-richard.purdie@linuxfoundation.org>
References: <20180907131347.19537-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] core-image-tiny-initramfs: Avoid parsing failures
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
X-List-Received-Date: Fri, 07 Sep 2018 13:13:50 -0000

This variable is otherwise unset leading to missing dependency warnings. Give
it the same default as used elsewhere in other recipes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/images/core-image-tiny-initramfs.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index d7f97f3a170..4f11b4a90dd 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -5,6 +5,8 @@ first 'init' program more efficiently. core-image-tiny-initramfs doesn't \
 actually generate an image but rather generates boot and rootfs artifacts \
 that can subsequently be picked up by external image generation tools such as wic."
 
+VIRTUAL-RUNTIME_dev_manager ?= "udev"
+
 PACKAGE_INSTALL = "initramfs-live-boot-tiny packagegroup-core-boot dropbear ${VIRTUAL-RUNTIME_base-utils} ${VIRTUAL-RUNTIME_dev_manager} base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
 
 # Do not pollute the initrd image with rootfs features
-- 
2.17.1


