Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2C29065C7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 13:17:18 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id 20so7713827yks.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 05:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=zStMLncCQNqqq7kvRK0AF4xjpgYQ31WglHUz8d+DpN4=;
	b=DjxidPVbP3ZBbNL+ioU5wwBtZ96TueOUv78tDbf/d9/fS/vwWUqtcHRrhjy5ny5Tnh
	O0L1pJhhzobvQ2W79vm5i2lqcnL0RBBRJq1nf3FFSKE1C/0FbA/gVW/jLqDqZ4iFsWPm
	HEgTdnj04iWZm6cLI4kWtWnvv3sI26VD/GPlNFB/VhZMBoEsx5rM3paxXC//8KEWxX54
	Q7g00U6kKzwxBc74ltlGi5h6jEQ4fkyV4ZPT7qS+wOrHMHtNUChpfWjnhEwbfmTjaMtt
	7+8AKxBvvDnupXFoLcA/1flpsIqoZ2Stj931RfmwXi/bpg5rXNSEEiWWTow2joalS1BR
	2SvA==
MIME-Version: 1.0
X-Received: by 10.236.199.103 with SMTP id w67mr24017177yhn.37.1421846239332; 
	Wed, 21 Jan 2015 05:17:19 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Wed, 21 Jan 2015 05:17:19 -0800 (PST)
In-Reply-To: <1421165391-30203-1-git-send-email-denis@denix.org>
References: <1421165391-30203-1-git-send-email-denis@denix.org>
Date: Wed, 21 Jan 2015 11:17:19 -0200
X-Google-Sender-Auth: tmY4uP1a52bDetP30HxuXTlZwQE
Message-ID: <CAP9ODKoygArG8C+wJm7buqgfnjU_MkvfOxoiFGKNfjhAXYgc9g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2015.01
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
X-List-Received-Date: Wed, 21 Jan 2015 13:17:21 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 13, 2015 at 2:09 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
...
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch
> @@ -0,0 +1,36 @@
> +From ee2d75513452aa6d5306fd380104adc8a2f6d8f2 Mon Sep 17 00:00:00 2001
> +From: Masahiro Yamada <yamada.m@jp.panasonic.com>
> +Date: Wed, 3 Dec 2014 10:22:50 +0900
> +Subject: [PATCH] tools: env: fix build error
> +
> +Since CONFIG_SYS_ARCH, CONFIG_SYS_CPU, ... were moved to Kconfig,
> +tools/env/fw_printenv fails to build if CONFIG_ENV_VARS_UBOOT_CONFIG
> +is defined.
> +(I do not think this is the right way to fix the problem, but
> +for now I do not have enough time to take a close look.)
> +
> +Upstream-Status: Submitted [http://patchwork.ozlabs.org/patch/417192/]
> +
> +Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> +Reported-by: Denys Dmytriyenko <denys@ti.com>

Is it necessary? In meta-fsl-arm we don't have this patch and get the
tools built.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

