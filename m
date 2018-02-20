Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 715346FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 00:36:24 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id p8so7191403otf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 16:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=5d4pCzhQDuWp/DCROypJ0u5AwLXfs+4CjaBCoBy8+/Y=;
	b=qVyRPADWCyQmm/lhQrfkE4qvc2Z61iRoslG7ubOJJE/HpnleH7tcrQt8vdGDJFXWFB
	+sLgmZlyb41YLGOLgGtFOOIU/TxEJB4SRvKfYC5rVYV7NVFwixiikaYJlLp47+DgoZXO
	EJfvme7GuOBmw4y43315YQzNMz/r/npkWbjgQDJjjA8SAn75EXhfczG3D+7UTgDMwNCQ
	wpqGPAWFmOepGwpB7pI3lTmyHGEhcg8V2g3Spq7MUiLkMG/bzmr+knoRe+wK5j/EdXY7
	wBRJnuZaTMLousQtYq/VwWwpLfyA1X4bcmgybK6OodNaM1ReQM/AL9sUjseJEsCrXx+Z
	mz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=5d4pCzhQDuWp/DCROypJ0u5AwLXfs+4CjaBCoBy8+/Y=;
	b=eEblGyHaAZaDbHjLofBWdLfETfTczGdrHNvjASEKvuXXbK5dB9BoQymC+do4SsKvEz
	vbg3K52Ztj1ZkXspjMSb7Nju1sYhGHcWHyJ3qVjFvh3IeBvXPGejz8XFjwO1t3mjbf7y
	f/qDNj1U6ihE4gVxNvkScZLgjvB5A7PC51ZcdANQ4Qabh/QAd1np7VjbrqRnuHd6M/JB
	T0PecRC7UBQg40kpoBygmz1/bbsV9kC90FHsJNypcGf/0b302SLCI97MWK9McneuN08a
	aWZBro0lowi40dV4BsMGbA2tcueMbEBt+I1HvHtYPUozB6rOJNCCp0IOvxmCZdpmR2Tm
	ecNw==
X-Gm-Message-State: APf1xPBcV4omJxnllvetrAgU2tgVUFvchL8COVoJUvcTzkNoDrz9Mo28
	iPSxFTpX1eUbtVv3MmXUNSabtZdq
X-Google-Smtp-Source: AH8x227cZMrkiB8KlrvHCBcsQOAIMCiS2c+vtaXmC68YmIYPYWMiZl1LVYhCJAEvlOSOVMqoApy37g==
X-Received: by 10.157.17.234 with SMTP id y39mr8844809oty.158.1519086984987;
	Mon, 19 Feb 2018 16:36:24 -0800 (PST)
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com.
	[74.125.82.171]) by smtp.gmail.com with ESMTPSA id
	g9sm13574198otc.35.2018.02.19.16.36.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Feb 2018 16:36:23 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f171.google.com with SMTP id f18so10019578otf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 16:36:23 -0800 (PST)
X-Received: by 10.157.31.34 with SMTP id x31mr12607568otd.125.1519086982911;
	Mon, 19 Feb 2018 16:36:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Mon, 19 Feb 2018 16:36:22 -0800 (PST)
In-Reply-To: <1519084455-3915-1-git-send-email-denis@denix.org>
References: <1519084455-3915-1-git-send-email-denis@denix.org>
Date: Mon, 19 Feb 2018 21:36:22 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq7YyqaapLxxOrPo6WoNf6dTFpxkvQh1pF+yqJQxGA7jQ@mail.gmail.com>
Message-ID: <CAP9ODKq7YyqaapLxxOrPo6WoNf6dTFpxkvQh1pF+yqJQxGA7jQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: explicitly depend on bison-native for deterministic builds
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
X-List-Received-Date: Tue, 20 Feb 2018 00:36:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 19, 2018 at 8:54 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Explicitly depend on bison-native for deterministic builds, as it is required
> for the build:
>
> |   HOSTCC  scripts/basic/fixdep
> |   GEN     ./Makefile
> |   HOSTCC  scripts/kconfig/conf.o
> |   YACC    scripts/kconfig/zconf.tab.c
> | /bin/sh: bison: command not found
> | scripts/Makefile.lib:217: recipe for target 'scripts/kconfig/zconf.tab.c' failed
>
> In most cases, this dependency comes indirectly via toolchain dependencies,
> specifically binutils-cross, which pulls bison-native. Different setups,
> such as with external toolchain, would expose this problem, since correct
> dependency is not marked explicitly.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> I'm seeing this now on 4.16-rc2 with external toolchain.

I am not against the addition but in fact, it is because 4.16 stopped
of using pre-generated files and now requires bison to be available. I
am unsure it ought to be on kernel.bbclass at this moment.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

