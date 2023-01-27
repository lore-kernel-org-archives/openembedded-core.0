Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA3CC54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 13:29:50 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.101790.1674826188405923875
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 05:29:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VsUox4Yx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id j17so3475927wms.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 05:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/tds54Sfcwa50UhwWasTzLMPlCTSvgxC2Nc8G72E1pw=;
        b=VsUox4Yx48zPgEzAwYqY4aO618h07R1l4exSN5cET1OMG3QAPqB9enfSEFVVBy3m6l
         Q/uCHckeDz77dCgdtIbzk5DO4fcbaTgZy9dgDXSMggOvn5YOAZ1f8u62rgZF2m/3l3pQ
         6PVH41boU0dhDv2EOCLcwMZkAzPDfTN/bImFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/tds54Sfcwa50UhwWasTzLMPlCTSvgxC2Nc8G72E1pw=;
        b=Fn3ezBbtaOZxqE1mrJnxaMemzJdtZyH4WuuuvmXuckTcfwhZ1XPUh0UD9Yh6ZYTImL
         g69X9VknsRJEAQasNe+L34UMChst4YJspl6Ckd9X/ZEC9YgLPROOvuypzWHgc2E4wfqZ
         Ai3m9m/RcUBgN3xQlvXyQom3BkN7eaCHuCuZHBr6ZaZ7miCoz8OqnPEIqVtGiSCJSUOt
         mWzGckdLAOKUbReaD/6Q6F7VPBvvyH0D6N65iLtJZA32gPjoDxzdLqesPhJdnyxlqR6s
         hwlcgfwMBoaVgZHKWBYvF/cbVxZYa8t0X4DmRpkreNIRknDl9zRzyzVEuCgRVycnfaTl
         B7Bg==
X-Gm-Message-State: AFqh2kp5E+W9wewgw2hhNvs4I6q6RfGdafo0oTNDVneID9Tl0TafZ0QY
	jaop3DZqC3oiXu/5YSABxIYKKQ==
X-Google-Smtp-Source: AMrXdXvIWUwFeJuc7anDHSQdzz82wWNv6OEi7W++ef5i9p37/LsfSwAR2aq/k71eBK3z5ngAOFrCow==
X-Received: by 2002:a7b:cd9a:0:b0:3d3:5d69:7aa5 with SMTP id y26-20020a7bcd9a000000b003d35d697aa5mr40337771wmj.25.1674826186814;
        Fri, 27 Jan 2023 05:29:46 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3876:ca46:43a6:4b49? ([2001:8b0:aba:5f3c:3876:ca46:43a6:4b49])
        by smtp.gmail.com with ESMTPSA id v14-20020a1cf70e000000b003db0b0cc2afsm7855533wmh.30.2023.01.27.05.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 05:29:46 -0800 (PST)
Message-ID: <1849a0d46ed86fa4ebb693608b95a28d27842b8a.camel@linuxfoundation.org>
Subject: Re: [yocto-security] [OE-core] OE-core CVE metrics for master on
 Sun 22 Jan 2023 02:00:01 AM HST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Quentin Schulz
	 <quentin.schulz@theobroma-systems.com>, Michael Opdenacker
	 <michael.opdenacker@bootlin.com>
Date: Fri, 27 Jan 2023 13:29:45 +0000
In-Reply-To: <b73312eaff6e6f2e24ee9111bf32ec6a565dd810.camel@linuxfoundation.org>
References: <20230122120427.D9CF696035B@nuc.router0800d9.com>
	 <D5C2125C-6245-4E41-9029-6EF99E4AE623@arm.com>
	 <CANNYZj-mtOntD4NcfMKd4j5jqzCN6sP_OFrGdVWWBv8ug93=Yw@mail.gmail.com>
	 <37CCF635-CA4E-4300-A49C-0F31D9472B6A@arm.com>
	 <eac9dcd2a8b0f0916fd373da9f2c3ee198d437ba.camel@linuxfoundation.org>
	 <2E81B0F3-3747-46CD-85F2-9BBED3F1CF8E@arm.com>
	 <b73312eaff6e6f2e24ee9111bf32ec6a565dd810.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 13:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176444

On Fri, 2023-01-27 at 12:57 +0000, Richard Purdie wrote:
> On Mon, 2023-01-23 at 13:41 +0000, Ross Burton wrote:
> > On 23 Jan 2023, at 13:35, Richard Purdie <richard.purdie@linuxfoundatio=
n.org> wrote:
> > > > I=E2=80=99ve started braindumping into
> > > > https://wiki.yoctoproject.org/wiki/CVE_Triage, when it=E2=80=99s ex=
panded and
> > > > complete we can link to it. Or maybe we should just start a
> > > > Maintainers book in the documentation?
> > >=20
> > > Lets put it in the manual. The wiki is good to pull together info but
> > > I'd like the manual to be definitive. I've thought this about patch
> > > submission for a while too, we have too many docs with the useful bit=
s
> > > of data spread over two wikis and a few READMEs=E2=80=A6
> >=20
> > Copying in Michael and Quentin.
> >=20
> > Taking the JFDI approach, I=E2=80=99ve started (another) wiki page to c=
ollect a table of contents at least:
> >=20
> > https://wiki.yoctoproject.org/wiki/Maintainers_Manual
> >=20
> > I=E2=80=99m sure there=E2=80=99s plenty I left out, but that=E2=80=99s =
a start!
>=20
> I did start experimenting with:
>=20
> https://git.yoctoproject.org/yocto-docs/commit/?h=3Dcontrib/rpurdie-wip&i=
d=3Dcdbe7f39681d2228849b58d1de4c861826d50832
>=20
> It does highlight that we need to be careful on importing some docs as
> the wiki info isn't entirely right or well worded in some cases now.

I updated with some fixes for a few things, if I do anything else I'll
update the branch:

https://git.yoctoproject.org/yocto-docs/commit/?h=3Dcontrib/rpurdie-wip


Cheers,

Richard

