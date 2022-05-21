Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AAEC433F5
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 07:48:09 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.3491.1653119284542718302
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 00:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=flTcQETn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id w4so14069132wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 00:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=zY4eAypt1OKrS3CNa4VjIY8672iy2TYgmTZog60RZzU=;
        b=flTcQETnXEjZ6zkurd9N4xg47AhwT3HFF1h6Mrve/nE0fayLr1gJ0hgteorRl3y7lo
         hOYlW8WleC1QydBbzS850AP6nw+FqSloZXV1yctL44KwRRR/VX5i0jxGL8rtFAEiC9j/
         YchXE/suMoxiAgJk+TtcC9GtP98Z2LApbmaRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=zY4eAypt1OKrS3CNa4VjIY8672iy2TYgmTZog60RZzU=;
        b=JsU6Y8gL/QV94e34ctYr3OB0iI1vI/JLi4S6pazZ6Pvepx6c4yTi1ma6pnMfKMn9XZ
         4dq8XhtAFndzZHp6/U661Cs5bKmpuBb3IhxpIOH1H6kRKY0/DeKCMrrNe1zxcK6eZYUV
         Vc2J8O3vx/wwaVDwE2PT1BQmYmxNIgKrzkJkwjwlvyMD5kFi9ocgOQToiK4V01ULkiv+
         76jGZw5GjdW29Ao3DlRhNuz49oIqKgNWr/XjixKOQLbnm9k8N/Sjr1+6t6GJzRK55e6W
         A7Ygxz917hm7gXojM6rdA+P2haab9se0tJLtrtWup4S2Hn1AK7GENsiqGBK/nWj6zQ5A
         xwsQ==
X-Gm-Message-State: AOAM530841v2vfPq8N7rWfRk/BOkFRIWbl/jD5RoVRLkE/blDljERaa4
	utPRITEQF1+G4GlxqVWmeODeHQ==
X-Google-Smtp-Source: 
 ABdhPJxTtDJyJfmZblv8Si5u50k+PRLZ3+/IDi4Owe9mU6CfSQyfH5NGokxCjSXLYzmhbDOEII3Bog==
X-Received: by 2002:a05:6000:1869:b0:20f:c1a4:111 with SMTP id
 d9-20020a056000186900b0020fc1a40111mr3998962wri.261.1653119282927;
        Sat, 21 May 2022 00:48:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d812:46de:9e00:ca1c?
 ([2001:8b0:aba:5f3c:d812:46de:9e00:ca1c])
        by smtp.gmail.com with ESMTPSA id
 x5-20020adfbb45000000b0020d117a4e00sm4374256wrg.105.2022.05.21.00.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 00:48:02 -0700 (PDT)
Message-ID: 
 <31d4ac7f1c8db63e0bcc2028c787dc59e30a2781.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][RFC PATCH 1/2] libdecor: initial add recipe
From: richard.purdie@linuxfoundation.org
To: Markus Volk <f_l_k@t-online.de>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 21 May 2022 08:48:00 +0100
In-Reply-To: <70887c7d-4063-93d5-025f-46c4a17e5940@t-online.de>
References: <20220519064312.391164-1-f_l_k@t-online.de>
	 <20220519184315.1e91b017@melee>
	 <70887c7d-4063-93d5-025f-46c4a17e5940@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 May 2022 07:48:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165955

On Fri, 2022-05-20 at 14:46 +0200, Markus Volk wrote:
> i have started here locally to resolve all dependencies to be able to=20
> build pipewire-native. Besides I tried to untie the node when building=
=20
> libpam-native, because otherwise I can't compile openssh-native either.=
=20
> All in all, the changes were more invasive than I had hoped. Quite some=
=20
> recipes needed to be added for native and I'm not sure if anything got=
=20
> broken in the process. In any case, RFC.=C2=A0 Test-wise, I ran -c=20
> populate_sdk for my full image with about 13500 tasks. I had a problem=
=20
> with nativesdk-cairo and had to disable a runtime test. But that was=20
> related to the meson buildsystem. On the bright side, I otherwise had no=
=20
> issues with building nativesdk and the changes also solved some of my=20
> problems. nativesdk-libdecor-dev was created just fine here.
>=20
> Since this is all very experimental and even unsure if this should end=
=20
> up in core, editing the maintainer for libdecor still has time. For=20
> libusb1 I added a PACKAGECONFIG option and a comment what you want to=20
> enable it for. I'll send an updated patchset because it might be=20
> interesting for some to experiment with it.
>=20
> I also had to make some changes in meta-openembedded. I send these=20
> patches to openembedded-devel

A number of the things you're adding native versions to worry me a
little since they're often functionality from the native system which
we've been trying hard not to duplicate. For example, you wouldn't want
two udevs running. Worse, it may be eudev but could also be systemd and
the native binaries are supposed to run on both systems. Similarly, you
wouldn't expect a build to start a local ssh server via openssh.

With libpam, we'd want to be sure that the library works in a number of
different environments.

These issues are probably why you see the native PACKAGECONFIG for
libsdl being a bit more minimal to avoid these kinds of dilemmas.

I also noticed you renamed gles2 to gles and I'm not sure if that will
catch existing users our or not.

There are definitely good things in the patch, for example the removal
of obsolete config but there are things I'm unsure about (e.g.
pipewire, libpam) and things I do think may cause more problems than
they solve (openssh-native and eudev-native).

Cheers,

Richard






