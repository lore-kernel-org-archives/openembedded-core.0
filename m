Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DC1C3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 23:00:53 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.5495.1721084444578371775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 16:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WOzEAbBJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-36796bbf687so2732607f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 16:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721084443; x=1721689243; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TCWQZRAKao+qRpFx2FCBRUZptoSa3w+UQSeIYDWrQ60=;
        b=WOzEAbBJ/qJKQer4KgchS/cs3sF7fxn/KG0GE38ymMsTUmfeXtQHsOZ3Lygm0WfEsa
         v/01eUymmItjKC+NQSrZcP0BzelXNoE3C6USzZjKg30kBKGsQ+VEACV03BCaTebX38bM
         C0WSrYmbNKD7pfP/uajbGVZkddykyPKlB33ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721084443; x=1721689243;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TCWQZRAKao+qRpFx2FCBRUZptoSa3w+UQSeIYDWrQ60=;
        b=Rup0VE6AwjDKZC1RptNn8Xc85PSMJvBvp/q4qu5eja9/oaNNkVNXHhbIF8Q9+Dyi2t
         0spSLou/VofZWPMEJkiHcFq6iBs0I9xzY/v23j25c7KuTyWWclvQMzVIi/5X3rxnLXyd
         fw5lVFVpvEo6vW9/GjTkJkTPh4PuH1z3gLZCCb3HF613v2ybdBQw6+1ZCGLs0bQlGsTn
         PTWxu6hleDQQ3rh4QQvPmmJ8DOZyzsfPLeGdzPh9SLougip6n99rtoFuGwhPbCDV81gX
         GOA/W6Wi46tBa5nxOr1NNFUanZlkhv8rk6DiR03Mgc6hn92mzOjdgcSIM4xultsTNbHZ
         LpUg==
X-Gm-Message-State: AOJu0YwDWYciWVvqDPIwgBrW83xd9vpUgMAjS0FG58JYtBwHKXlXR1AY
	PQMVp7EddVRApR5J/AkHS94YjTiMFfbt1OUnBBM78gPTnafVhF8tvr8H9Z3Hm4Y=
X-Google-Smtp-Source: AGHT+IF8ut7NvkQIELFBn7n4h4dovjj0MV/Na9DlADjkAByljxIsrS+Au/DoQsC7S36ZxpOtTsfvwQ==
X-Received: by 2002:a5d:4f8c:0:b0:367:96b5:784e with SMTP id ffacd0b85a97d-36826320db2mr152926f8f.50.1721084442787;
        Mon, 15 Jul 2024 16:00:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4132:3ff0:dd64:6503? ([2001:8b0:aba:5f3c:4132:3ff0:dd64:6503])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dab3cb0sm7458578f8f.10.2024.07.15.16.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 16:00:42 -0700 (PDT)
Message-ID: <f900f8bef462def301f66f837035d112beac01d2.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v6 00/12] Add SPDX 3.0 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2024 00:00:41 +0100
In-Reply-To: <CAJdd5GZV2Ygb4iAPtRgyHt_40nBAonzfS6=XzmH9KwxOyUfyag@mail.gmail.com>
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
	 <20240712160304.3514496-1-JPEWhacker@gmail.com>
	 <54c574fdb35ef25b71baaf1e1adfa8bd909a5f39.camel@linuxfoundation.org>
	 <CAJdd5GaA4tByvK04pNycoApWYHeznYVe=y1ckSWsUVu=jwmjnQ@mail.gmail.com>
	 <330caeaef519ceaf40dceac15ccd00be2ed38d60.camel@linuxfoundation.org>
	 <CAJdd5GZV2Ygb4iAPtRgyHt_40nBAonzfS6=XzmH9KwxOyUfyag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 23:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202074

On Mon, 2024-07-15 at 15:26 -0600, Joshua Watt wrote:
> On Mon, Jul 15, 2024 at 3:07=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Mon, 2024-07-15 at 14:40 -0600, Joshua Watt wrote:
> > > On Sat, Jul 13, 2024 at 12:44=E2=80=AFAM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > On Fri, 2024-07-12 at 09:58 -0600, Joshua Watt via
> > > > lists.openembedded.org wrote:
> > > > > This patch series add support for SPDX 3.0 and sets it as the
> > > > > default.
> > > > > Currently it is not possible to have SPDX 2.2 and SPDX 3.0
> > > > > enabled at
> > > > > the same time
> > > > >=20
> > > > > v2: Added tests and addressed feedback
> > > > > v3: Fixed several oe-selftest and build failures
> > > > > v4: Fixed silly typo mistake in staging.bbclass
> > > > > v5: Reworked to make SPDX 3 output reproducible by default.
> > > > > Variables
> > > > > =C2=A0=C2=A0=C2=A0 that introduce non-reproducible output are doc=
umented as
> > > > > such.
> > > > > v6: Many changes:
> > > > > =C2=A0 * Fixed bug where building baremetal images would break
> > > > > SPDX
> > > > > 2.2
> > > > > =C2=A0 * Most SPDX code is now in python library files instead of
> > > > > tasks
> > > > > =C2=A0 * Removed dependency on pacakge_write_* tasks
> > > > > =C2=A0 * Fixed sstate selftest cases to account for SPDX 3.0 task
> > > > > names
> > > >=20
> > > > This had a lot of failures in testing I'm afraid:
> > > >=20
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7=
134
> > >=20
> > > This appears to be caused because the SPDX tasks are not running
> > > for
> > > some recipes (e.g. automake). It looks like this like:
> > >=20
> > > =C2=A0 do_create_rootfs_spdx[recrdeptask] +=3D "do_create_spdx
> > > do_create_package_spdx"
> > >=20
> > > is not actually strong enough to make sure the SPDX tasks for
> > > automake
> > > run for e.g. core-image-sato-sdk, but I don't know why. I'll keep
> > > looking, but if anyone happens to know off the top of their head
> > > let
> > > me know
> >=20
> > Can you be specific about which tasks you mean when you say "make
> > sure
> > the SPDX tasks for automake run"? Do you mean do_create_spdx,
> > do_create_package_spdx or a different one?
>=20
> Specifically, do_create_package_spdx must be run for each package
> installed in the rootfs before do_create_rootfs_spdx runs. I thought
> that
>=20
> =C2=A0 do_create_rootfs_spdx[recrdeptask] +=3D "do_create_spdx
> do_create_package_spdx"
>=20
> would do this (the do_create_spdx is probably not necessary), since
> AFIACT, this is also how the packages get generated before being
> installed in the root file system via manipulation of
> do_rootfs[recrdeptask], but I think I'm missing something?


In packagegroups.bbclass there is this being added:

do_create_package_spdx[deptask] =3D "do_create_spdx"
do_create_package_spdx[rdeptask] =3D ""

and=20

bitbake core-image-sato-sdk -g -c create_rootfs_spdx

lists

"core-image-sato-sdk.do_create_rootfs_spdx" -> "automake.do_create_package_=
spdx"

in tasks-depends.dot if I disable it.

I'm not 100% sure what is going on and should sleep but wanted to share
that before I did.

Cheers,

Richard

