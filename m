Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D145CDD0E1
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 19:54:52 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.3421.1729626886604768183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 12:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hoJ1ao9y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d8901cb98so123895f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 12:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729626885; x=1730231685; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YZZI63EU4OihKLYY2nq8kjWM6AeQFWrBpfIv9tAIG6Q=;
        b=hoJ1ao9yv4v1Zkjdmw/so/ezuvsqPpDp4X40yU8fmwmTXKQ5M22XlYNECYuKsQvywV
         OszzcMxCeJVGdArfI6WoNbB6y4wU53XBiYOnNW/Xgof8GVH25HF19HuymZeuHHgrB41p
         82FofxGLUVcAZD70MqLMPFjH3Kwz85/d+abTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729626885; x=1730231685;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YZZI63EU4OihKLYY2nq8kjWM6AeQFWrBpfIv9tAIG6Q=;
        b=WoXORAAesVlASHV/Q5nZmPQNkcwEEcHaJs9HFYgK9Z7syoNyPEtrjqvJZv1qRiN5g9
         8Rx9g/udc8X1cEFghzkIhzuTLbnLGEljrnZN3d2l9SD4UzWfJphWyaJVDODOrdQv/i/q
         E1ytI+FMKLM7P7wA5d0hUv31wy5bRetFthGouCM83QXDSKKZ8rbiZTy3NA1vSUV7cXUW
         u00Gr8Nh9fAQQ0QZsEt1QeYBr/wSrcJddVouXUTbxiStZ1C9ojElBDWreiDYI7swRjcL
         ETeYeko4LgwgoGYQOr/cOiDoWzAmXwneLavx+eGhf/F/NlvuHh+7BCbMj1TNiwzx9zJT
         m+EQ==
X-Gm-Message-State: AOJu0Yw7zydnUzAn7Eh3HUSig8ym+Y0UNxMa7xO043qwnXcUDgdpYYB/
	WIo3fw/8s1q6GfKX1OLqx4N6KEjcN/Qv3T1Q5D/oIlmsHzsFyeUP9+tojowOvtE=
X-Google-Smtp-Source: AGHT+IFSqjQ+mQc0XD9L1sdLJ/wKDGJGcvXp5+QvsBPGKwg4yGwi94CuO94xZFNfiOZvfYknIoFJVg==
X-Received: by 2002:a5d:5708:0:b0:374:c33d:377d with SMTP id ffacd0b85a97d-37ef15075b3mr2643358f8f.28.1729626884814;
        Tue, 22 Oct 2024 12:54:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f3ec:315d:2907:a25f? ([2001:8b0:aba:5f3c:f3ec:315d:2907:a25f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37b41sm7310839f8f.5.2024.10.22.12.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 12:54:44 -0700 (PDT)
Message-ID: <1f3e21110ad79efab2bb46a4ef779355a9ae7458.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v9 00/11] systemd uki support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Oct 2024 20:54:42 +0100
In-Reply-To: <Zxf-KtENbXFeTMTp@nuoska>
References: <20241017084552.182136-1-mikko.rapeli@linaro.org>
	 <BAB907B5-CB67-4320-BDBC-37098336FBFC@arm.com> <Zxf-KtENbXFeTMTp@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 19:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206175

On Tue, 2024-10-22 at 22:34 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> Hi,
>=20
> On Tue, Oct 22, 2024 at 10:26:52AM +0000, Ross Burton wrote:
> > On 17 Oct 2024, at 09:45, Mikko Rapeli via lists.openembedded.org <mikk=
o.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:
> > > v9: Fixed unrelated ext4 rawcopy wic test on genericarm64. Enabled ne=
w aarch64 target
> > > =C2=A0=C2=A0 wic test on x86_64 build host only since boot with qemu =
is currently
> > > =C2=A0=C2=A0 failing on aarch64 build host.
> >=20
> > Sorry, but I don=E2=80=99t think disabling tests based on the build mac=
hine is the right thing to do here.
>=20
> Well I'm running out of options to try.
>=20
> > My gut reaction is that there is another test that is running with kvm =
enabled, thus breaking uboot.=C2=A0 I=E2=80=99ll do a build on my own machi=
ne shortly and see if I can replicate.
>=20
> IMO this is a generic problem. The selftest code is not fully in control =
of
> the bitbake build config, including runqemu. Snippets get enabled here an=
d
> there. Difficult to know what the effective config in CI is. This also no=
t visible
> in the AB build logs, or at least I could not find it.
>=20
> Thanks for helping, I hope you can reproduce this.

Ross asked for a failing build log, there is one here:

https://valkyrie.yoctoproject.org/#/builders/23/builds/306/steps/14/logs/st=
dio

and the config for this is clearly visible here in the step before it:

https://valkyrie.yoctoproject.org/#/builders/23/builds/306/steps/13/logs/st=
dio

There isn't anything more being set or any other magic, that is the
config and it runs an oe-selftest command (the one at the top of the
first link above).

Cheers,

Richard

