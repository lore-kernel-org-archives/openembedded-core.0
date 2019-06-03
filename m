Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id A83FA7E3B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:19 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c6so10778110pfa.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=W+3xUZVXZbg3QjSyUSoloKoiqbqDwsPGp57r26ZZImE=;
	b=OQMATpqG2LGcCCkgYwVkEUfW9zTK4d7D3U/wqe872mr/rzZL91Kj3eay2EqODFw0yq
	9w9oN+bCWvR0WpEjL6a/+DD4/iaZMpkZV2JtoE79Ro2wjS3Xa5WVZCSCrg3w9YzB3idg
	1sUZE0tpxUbWOt7PxXaX1GiTbFWL2NPj705agW8OK5UFLnJaCxje53U0W+OjJ6rGTbCp
	2jAcn4rktd2ujDV0ZDl9kBvMVCk9EsnbhucITwwz8XbcYBwC0QSAIcP4+XhR3qz6lF6R
	vM/cq0mYTVneC5fSkjn8R57KiG4aVPpfg7xcssHo7bPUKurzaUcQuwIiyBtQ57pPEJkP
	E/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=W+3xUZVXZbg3QjSyUSoloKoiqbqDwsPGp57r26ZZImE=;
	b=cp001gRre2hvrCiE2IVxUpAu3SueUSCNtVFnq6pcee64BeqLpmUbWB0ZggjsaHY3qw
	puefHqonOgWtsZeFTPJkmuMShM1aAivW0RS0zt40B9sSVS7YU4SXkZeBXXkD7Lf60f77
	Yrd7MuFTkcwLjgwf/qjQgqzk/eL/vLIAjZYx3X5yQrORPNxKMQuX4G16d3fXB49DioGH
	AHm3EkBmjX4S9Rf8LMBfEtyNzulKVDp5vCYFL4mhe7OtQcsv/2FcTwIBF+4lET0UIcbq
	KLcLiqzgZbD61JHO7+/x4zQj8EnKqz8P2sV5JpGx61EmHjDTlL7O02+wMcCxaPdnkw8r
	zPuw==
X-Gm-Message-State: APjAAAX4CNh8fyc2gV3RLDfms6bxsA1zChhcqxjBi/CZxTZpknpDGrdn
	kJyCT0FLgSadnFzHBKs3ukYbU+66
X-Google-Smtp-Source: APXvYqxJR89lLybBop0WmFDiFFsmctaBanw6OK5V3qsg7Al1i+Bi2mRMkQjTJeSKU3UM2YEVK2ctRA==
X-Received: by 2002:a63:6a49:: with SMTP id f70mr4899192pgc.55.1559574440871; 
	Mon, 03 Jun 2019 08:07:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:06:57 -0700
Message-Id: <b684728304cc6a4bee03c1233022258d8b53f78c.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/21] util-linux: Add missing ptest dependencies
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mariano López <just.another.mariano@gmail.com>

There are some missing dependencies for the util-linux-ptest package
that causes inconsistencies in the package tests run in different images.

The kernel module in RRECOMMENDS is not build at this time, it needs
more testing and check if the configuration change can be part of the
yocto-kernel-cache repository.

Signed-off-by: Mariano López <just.another.mariano@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 34255a2..6dfbe0b 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -142,7 +142,8 @@ RDEPENDS_${PN}_class-nativesdk = ""
 RPROVIDES_${PN}-dev = "${PN}-libblkid-dev ${PN}-libmount-dev ${PN}-libuuid-dev"
 
 RDEPENDS_${PN}-bash-completion += "${PN}-lsblk"
-RDEPENDS_${PN}-ptest = "bash grep coreutils which btrfs-tools ${PN} sed"
+RDEPENDS_${PN}-ptest = "bash bc btrfs-tools coreutils e2fsprogs grep iproute2 kmod mdadm ${PN} procps sed socat which xz"
+RRECOMMENDS_${PN}-ptest = "kernel-module-scsi-debug"
 RDEPENDS_${PN}-swaponoff = "${PN}-swapon ${PN}-swapoff"
 ALLOW_EMPTY_${PN}-swaponoff = "1"
 
-- 
2.7.4


