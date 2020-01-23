Return-Path: <yamane07ynct@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 382FC7FDE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 10:33:38 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w62so1337560pfw.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 02:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fNKej0sjvkoD0n+C9XT4J9e+pckf+7wcoEThRLuWRDQ=;
	b=Vx3fqvhQCJp6u/qpFmGyAJD7Vkh3k3YI4lXmW+93KpHMDhi/1mFxFfm/NdVANzeOOe
	ITaUR/TF4dzQcTdsU/0zL5LH2H514xn2L1NLv0XGF7QIF8RszA8hOMoNhlZb/9IY8jOO
	wk/IdnDQUPCVCHxJaZujVvIKDv9hNTzNC2VxHJqvass+Cf8AyYl3Rvb3/fBcYkvkQvL6
	ZDR0BJG2zn9XQy9qAHUuOj0YGWkgw8LOCHYfrsyiJbGsRpPw4z8u4UL19yNn6xS8TDK1
	MaHqE4RUUwUUGW2uw8qvAWQHeddtNV6ra9C4ry8Q1roPzGBX115dW+TnrzM1+oQrTl0A
	6MXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fNKej0sjvkoD0n+C9XT4J9e+pckf+7wcoEThRLuWRDQ=;
	b=Ganld7+vFzmPEKiFGdM2TSNAmh/KOc+mGGcxFT3n8FL645X+5RV802ItHA1F3EvgwV
	1ZeCTUJoj8I/TasKGKCYaK8gXHZGkjDM8HpdLvdfHxpNNu7F07d96sNzKPDEF/+nsxw1
	wW9ERBB4H9CMILJ02AIvxiXLG27nz9CtKxzMnOT8EfNU0eMfcAhfKfNGpIPsWu2lYCX9
	UnNq3iB8yDlTakf6QSQo6A6Q2p1tGML159odc938iDqZQbPGokBluClAFuU6FKLcFTma
	8tCAQJdGfYNuVa4m3qPfWFYuQkK4CUUJnr/U+hXZeqgoczJRkuvxVB3S8lC47SL24sXd
	uN/A==
X-Gm-Message-State: APjAAAWP9XiT83Ux/xTfwajKrW8voYY/lSPp+D+hO+2EVwdoO6kNVwCl
	sFwcRX9xKSWft2UDtEjCE3Kae2r4
X-Google-Smtp-Source: APXvYqzZ+N6TrvgMEv9qUpbHd3i9Oo3wjFB5jUCFTN9UcRLiAPgJqNZ2cHhhLfPDEPTsdqa/WRGeoQ==
X-Received: by 2002:a63:28c7:: with SMTP id o190mr3124723pgo.394.1579775619313;
	Thu, 23 Jan 2020 02:33:39 -0800 (PST)
Received: from localhost.localdomain (softbank060117076056.bbtec.net.
	[60.117.76.56]) by smtp.gmail.com with ESMTPSA id
	dw10sm2253176pjb.11.2020.01.23.02.33.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jan 2020 02:33:39 -0800 (PST)
From: Daisuke Yamane <yamane07ynct@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 10:33:33 +0000
Message-Id: <1579775613-23857-2-git-send-email-yamane07ynct@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579775613-23857-1-git-send-email-yamane07ynct@gmail.com>
References: <1579775613-23857-1-git-send-email-yamane07ynct@gmail.com>
Subject: [PATCH v5 2/2] u-boot: Move B from u-boot.inc to u-boot-common.inc
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
X-List-Received-Date: Thu, 23 Jan 2020 10:33:38 -0000

Use the same value of B between u-boot and u-boot-tools.
This patch also enable the out-of-tree builds of u-boot-tools actually.

Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 2 ++
 meta/recipes-bsp/u-boot/u-boot.inc        | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index ce07055..edd0004 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -18,3 +18,5 @@ SRC_URI = "git://git.denx.de/u-boot.git \
           "
 
 S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 55d8b47..ec77762 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -1,8 +1,6 @@
 SUMMARY = "Universal Boot Loader for embedded devices"
 PROVIDES = "virtual/bootloader"
 
-B = "${WORKDIR}/build"
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "kern-tools-native"
-- 
2.7.4


