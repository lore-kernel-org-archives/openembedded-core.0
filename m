Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48172EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 12:07:33 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.5841.1687176448269743489
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 05:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=I7iPkO82;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31121494630so3922396f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 05:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687176447; x=1689768447;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0eWWDDmz3ZRBIWvtBJf5J2gCU7clJ5t/ybxeGhAugqs=;
        b=I7iPkO82eR6faNMQnLL42OuuLtdKugAJgoMFg2ILPX6qvuE5LrgOv5D/WL3Cd2x0Fn
         f+gs6ZMxoph8Npwm53Qzsc73xKLM958opbPFjEXzbDPa97bLkme8aWyhhQyIXGzNwik2
         G5K0RGX39Jpe2sLZCYMDuOaaWtxSMQ2eeSg/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687176447; x=1689768447;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0eWWDDmz3ZRBIWvtBJf5J2gCU7clJ5t/ybxeGhAugqs=;
        b=TNBfe72XAwiVEiU0WBZHdlgfTzIMzjZv7kwvoD9iNqhse6e/gyRiTRi+W9I82YQm4m
         1D9BwviFRoiMNgJVs4SUTt1n8WM1f30yGK1qa5N9N/mk1rvjiV+cvW4dZtH5Gt8xzu4R
         qAwxpL3lTN01f6gywH75fBe2/NF0Febacebv9DhdmjuNsfqPS6QHojta+v2j1FYnjlwZ
         ZSMapKIc6lX3hSrFXkhlW47ryyABzwTblNaOARUwqpTUeNCph0/55679Kffkza15ZkVd
         AqhpP+7tEdHfEqjZOwW2CTriKd9aAMuE7cqN2n3Y5y67nfBH21CGgEqv6sX8T7Ug0U1l
         4I3w==
X-Gm-Message-State: AC+VfDzvged3jLJDzOOKEUkxpRMqMD2C5oA9Y5nxPkL1wIZ7py4acI3T
	ML4zgJjT7EFzLrqMm8k04T3Zwg==
X-Google-Smtp-Source: ACHHUZ4wC7MRTKOTUsj38mzL5I5w6TMhACZIgvHpENpePo1fIBA1cshZzgcJvlzLtR0SEWfsl7ZQ+A==
X-Received: by 2002:adf:f84e:0:b0:311:10db:dad2 with SMTP id d14-20020adff84e000000b0031110dbdad2mr8104463wrq.53.1687176446614;
        Mon, 19 Jun 2023 05:07:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f105:ba55:87cc:dc34? ([2001:8b0:aba:5f3c:f105:ba55:87cc:dc34])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d5711000000b003113b3bc9d7sm3780599wrv.32.2023.06.19.05.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 05:07:26 -0700 (PDT)
Message-ID: <d3cdc91111da08f19d47cfc1e5fb861fd8882543.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rootfs-postcommands: Set vardeps for
 write_image_test_data
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Hoyes <Peter.Hoyes@arm.com>, Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Jun 2023 13:07:25 +0100
In-Reply-To: <88d7eb23-d5e1-71db-f789-1c9dff4fcf47@arm.com>
References: <20230517162906.2395999-1-peter.hoyes@arm.com>
	 <F3C8EF1B-E5EA-4357-8977-1FCC0F5E553D@arm.com>
	 <a87d5dd9-4128-6d02-eda2-c0c15f5a52fc@arm.com>
	 <b4852d5295cc250431cf375ba4677c9cc5cbbfc1.camel@linuxfoundation.org>
	 <88d7eb23-d5e1-71db-f789-1c9dff4fcf47@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 12:07:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183103

On Mon, 2023-06-19 at 12:47 +0100, Peter Hoyes wrote:
> =C2=A0
> It sounds like moving testdata creation to a separate task doesn't
> bring much benefit so I'll revert to something based off this patch.
>=20
> It looks like a relatively small number of variables are actually
> used by OEQA tests in OE-core:
> =C2=A0
> =C2=A0* IMAGE
> =C2=A0* ARCH
> =C2=A0* MACHINE
> =C2=A0* PACKAGE_FEED_GPG_NAME
> =C2=A0* VIRTUAL-RUNTIME_init_manager
> =C2=A0* WORKDIR
> =C2=A0* DISTRO_FEATURES
> =C2=A0* PTEST_EXPECT_FAILURE
> =C2=A0* TEST_LOG_DIR
> =C2=A0* libdir
> =C2=A0* T
> =C2=A0* MULTILIB_VARIANTS
> =C2=A0* SDKPATH
> =C2=A0* SDK_DEPLOY
> =C2=A0* TOOLCHAINEXT_OUTPUTNAME
> =C2=A0* QEMU_USE_KVM
> =C2=A0=C2=A0=C2=A0=C2=A0
> =C2=A0* DL_DIR
> =C2=A0=C2=A0=C2=A0=C2=A0
> Notably, DATE/TIME do not seem to be referenced at all (apart from a
> comment in oeqa/runtime/cases/ptest.py recommending *not* using
> DATETIME for test output). Additionally, DL_DIR and WORKDIR are
> updated on each testimage execution using TESTIMAGE_UPDATE_VARS.
> =C2=A0
> =C2=A0
> How about introducing a new variable, e.g. TESTIMAGE_EXPORT_VARS,
> containing just the list above (to which other variables could
> optionally be appended in other layers)?
>=20

I think that is certainly worth trying.

Cheers,

Richard





