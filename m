Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id E709B7FCE2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 04:41:25 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id x1so7366623qkl.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 20:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UUNCOp6pA1mHxIPglAtl+DdNpaCNTViFdkfaAj4ADDU=;
	b=btngvJcEMmxDyV4zvfqUKp4S2CSNheyuJ9NGIaUkpfvNlbFQSB3fg5plISPPmiIOfO
	PJ+XqCBhMklm14wAXp78zk+dvK9mx2KhDwhJ6790wNZ358IQhdVGRhnXHxVxRTLkDemf
	2X0mfYGJ0Takhr1cUKOxxDuyVra50o3mP/52EeL+QRubsfHrxUnndNN/JcZGDHHEwelA
	XzttgY8PSnBfZVW1ORfs2vUaZ82LEwjLktXXP2QXcjhEUW9bcE6Nn7hGyQp2usC3rFdV
	5hg/AGNzh8bdQkOxuypbXs0okfCmMpWIQmCj+1zxmf5rBlrZ9s5caluIPet6UchNV91I
	6fOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UUNCOp6pA1mHxIPglAtl+DdNpaCNTViFdkfaAj4ADDU=;
	b=qZsEzdi7hOS5IACBjAFZgvqUgPpsXVXQCafEC6xOCLgCFRJWs1g7ZUD0n5wwNAR7r1
	KpQX1c19YB5BGzdX3ojh94NN8UILJAPd8S1MGZ2nBF3vJq8uzV6cX2XoDXX/iyWWZfW6
	WCmyxs2CDXIVas7gCFtm77aauBTKhH+zVv2PBk3uolNBdubw7rpSlOS2CS4bojqtG+3j
	640oO5DnYGH59x2wWfdegAy6eCiWHmVqzst94z9v9T20ybql83G3Lz109bXx6+4NB8Hb
	1ywNYvnCqye5GM6O//52r+EPmec7oqLnW81SaAEEobTRJa8kHs6Cl7/wP37u8QdO4PB4
	YP2g==
X-Gm-Message-State: APjAAAU8KTOCiKo+Fs+CEKNrqgZyOXJQ6G2ztjeFVlG7TebkDhJSscwm
	d1Nx44msB4M+6TscMOOdVBw=
X-Google-Smtp-Source: APXvYqw+W/9vhGVctRvHwQzH3mPijRd4bWOpsKeCFL/QX7C1YA9xss0LTE2/to841l7wXvxcYX0ABA==
X-Received: by 2002:ae9:edc8:: with SMTP id c191mr13213843qkg.78.1578890486861;
	Sun, 12 Jan 2020 20:41:26 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	s20sm4472974qkg.131.2020.01.12.20.41.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 12 Jan 2020 20:41:26 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 12 Jan 2020 23:41:22 -0500
Message-Id: <303908f84e3481cefdd86753cfc9cadbddc08a7c.1578890313.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1578890313.git.bruce.ashfield@gmail.com>
References: <cover.1578890313.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto-dev: bump to v5-5-rcX
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
X-List-Received-Date: Mon, 13 Jan 2020 04:41:26 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 3b5c9ddc59..afda84936a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.4-rc+"
+LINUX_VERSION ?= "5.5-rc+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1


