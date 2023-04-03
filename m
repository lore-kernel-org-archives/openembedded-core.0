Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1E7C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 15:50:05 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.74912.1680537002313579427
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 08:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fd8OKQeb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id o24-20020a05600c511800b003ef59905f26so18382016wms.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 08:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680537001;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=88C7aWbEEFncTY5EwLUVgBl/F5857tIyMgBeLII+ElE=;
        b=Fd8OKQebAmw+K8kA0NCrts0jOtDAyDy0r3qqqxO82Tf1BXi8kxSCgsew4bPG5Zsc3/
         9pGYY3bVUe6NoE+JQSIoHCA7X5hKgQfH9xjxzHMudbPmM+x1kOW63/8hHzuordupPcrI
         BSpw2ZbB69xQO2JK44uJs/583S7P4sz1+SQEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680537001;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=88C7aWbEEFncTY5EwLUVgBl/F5857tIyMgBeLII+ElE=;
        b=fyFOsfXWfDbeY8eiezwBLp6FyLJ4SmpEzAYXsJuDJFyTPUI0hf1gLcP+PVcdksGvau
         EVaTfGGRh7Lc+uFChGxxLRLE6NBHZzL7cGWgryrOAXhBYU1+z8YldEnJ57hHlX6bCqKq
         BSuaGFov/s6VuVUCYg7lT6lY2GSN4gyKiIiRnYyABWbwbl6XXvr2o5/yxSENVMlxTBMs
         Skn/vaRzzA9J5GE8nxYtjfuuglT0yF5ZQsXi6VEiIoe/Lu0+7Wilh6gnTW+6tl/i+q9q
         CPdHiYeMYUHII73hDq6Wm+n3NoetjKszdNn+LlwTh6PjR5htYWJcWJAnvmULHfGixVO8
         JIOg==
X-Gm-Message-State: AO0yUKWEORjhqaesPIPt4Ig8FCJCRdQAVoM5NgZj5QzptuiB5W7v7SkZ
	8FwS46iKwlmsKTcbeXt6aGOVEg==
X-Google-Smtp-Source: AK7set8B5c8vfINk/1fSMLwS1gVtfvQoeL9egjuua+ZW2wDAt29xEa/XcOHMJzoQojCfToRfW3zoWQ==
X-Received: by 2002:a7b:c850:0:b0:3ed:29db:cb80 with SMTP id c16-20020a7bc850000000b003ed29dbcb80mr26909932wml.18.1680537000757;
        Mon, 03 Apr 2023 08:50:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7b4:9c72:6a4a:d9b8? ([2001:8b0:aba:5f3c:7b4:9c72:6a4a:d9b8])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c198e00b003ee1e07a14asm19812731wmq.45.2023.04.03.08.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 08:50:00 -0700 (PDT)
Message-ID: <7269b525eb965461ff7507ed59e79ccb24dbb388.camel@linuxfoundation.org>
Subject: Re: [PATCH v2 0/9] Add barebox bootloader support (and testing)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Jorns <ejo@pengutronix.de>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Alexander Kanavin <alex.kanavin@gmail.com>, 
	alexandre.belloni@bootlin.com
Date: Mon, 03 Apr 2023 16:49:59 +0100
In-Reply-To: <20230331104025.1478393-1-ejo@pengutronix.de>
References: <20230331104025.1478393-1-ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 15:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179642

On Fri, 2023-03-31 at 12:40 +0200, Enrico Jorns wrote:
> This adds support for the barebox bootloader (and tools) to oe-core.
>=20
> In order to have proper testing, this extends oe-selftest to allow
> basic testing of bootloaders. While at it, cover both barebox and u-boot.
>=20
> v2:
>   * set myself as maintainer in maintainers.inc
>   * move doc from documentation.conf to recipe
>   * update to barebox v2023.03 (including fixes for musl, etc.)
>   * set standard configs for qemu machines to allow building them
>   * add better efi dir support in barebox recipe
>   * enable testing bootloaders in oeqa
>   * add test cases for barebox (and u-boot)
>=20
> Enrico Jorns (7):
>   barebox: set default BAREBOX_CONFIG for qemu machines
>   oeqa/utils/qemurunner: support ignoring vt100 escape sequences
>   oeqa/utils/qemurunner: simplify output parsing and make
>     crlf-compatible
>   oeqa/utils/commands: document runqemu context manager
>   oeqa: support passing custom boot patterns to runqemu
>   oeqa/selftest/cases: add barebox tests
>   oeqa/selftest/cases: add basic u-boot test
>=20
> Marco Felsch (2):
>   barebox: add initial support
>   barebox-tools: add initial barebox tools support

Testing on the autobuilder did trigger a few issues:

on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5023
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6932

and some failing oe-selftests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4971
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5023
[there were more but look similar]

Cheers,

Richard


