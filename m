Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5272C54E94
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 13:35:49 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.42374.1674480940872205367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 05:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OsnHNEPv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso8571870wms.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 05:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ABGjCkUrkJxFufF6aNwXQW7CCj2pRUkR6OXkLIEer94=;
        b=OsnHNEPvWEBE/j7nQHeSRgaclnisX1GLaqj6vPx6xXfvXlhzoXZ2jrinQXUSDTK0nE
         f7LeE/QypxL2s+oUGSMdj6FM1k5gsEOX1vHOWbavLFiNPZlpvYX4ns5co5+h/Ul2CifC
         8t7taZgfWJ3AfoVCTEpq30iHheZ5AZKVgdTa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABGjCkUrkJxFufF6aNwXQW7CCj2pRUkR6OXkLIEer94=;
        b=l2hQzQ+8O0FoqbJ2f5ocUH8ykXlZcu+sYg01nN6ylbR1c094ieOAgRXENmQeX1fOUX
         m9plZS+Us6oSdnpwqFsm/FHRSVo8GFVPJZ4oq7erQOlEhJW52/tJjOM5yvOEN8ia/NSM
         tQAbFNm4pCT5Gb2CLelBsrQPTXhpcyPNUT1toO9f/WgSZ4c6iaMCIo4An1abQl9lSSVo
         /Ah8BR9ONDjcy6cajHHfX+HCnsBw27yuS0or2uXkk/eoLaXoN+lawXRY2mpJqXafAwUs
         NRL3uOuzhx30AcjHZT/2h+JgfVKjEek0+OJQ6aop6gKlNAfucOKCfvHz32lAuEPUuPCE
         SBKQ==
X-Gm-Message-State: AFqh2krEBo3rFCdpF4DTOOxJ/1Xem19yZ56hCWoESGwHvCJiohKC4p7i
	h8Gev4DcZBJlZTLHNrSbIFiGWA==
X-Google-Smtp-Source: AMrXdXvFnV1eYlyFJvry93I+4q1dcBB/I12RRLoCsZSKCTdiXJ9i0g0pNcYi4gtsITibf1waw3CEmA==
X-Received: by 2002:a1c:6a10:0:b0:3da:f665:5b66 with SMTP id f16-20020a1c6a10000000b003daf6655b66mr24391681wmc.6.1674480939195;
        Mon, 23 Jan 2023 05:35:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9195:b014:a064:8114? ([2001:8b0:aba:5f3c:9195:b014:a064:8114])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bca49000000b003c65c9a36dfsm10465298wml.48.2023.01.23.05.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 05:35:38 -0800 (PST)
Message-ID: <eac9dcd2a8b0f0916fd373da9f2c3ee198d437ba.camel@linuxfoundation.org>
Subject: Re: [yocto-security] [OE-core] OE-core CVE metrics for master on
 Sun 22 Jan 2023 02:00:01 AM HST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: "steve@sakoman.com" <steve@sakoman.com>, OE-core
	 <openembedded-core@lists.openembedded.org>, 
	"yocto-security@lists.yoctoproject.org"
	 <yocto-security@lists.yoctoproject.org>
Date: Mon, 23 Jan 2023 13:35:38 +0000
In-Reply-To: <37CCF635-CA4E-4300-A49C-0F31D9472B6A@arm.com>
References: <20230122120427.D9CF696035B@nuc.router0800d9.com>
	 <D5C2125C-6245-4E41-9029-6EF99E4AE623@arm.com>
	 <CANNYZj-mtOntD4NcfMKd4j5jqzCN6sP_OFrGdVWWBv8ug93=Yw@mail.gmail.com>
	 <37CCF635-CA4E-4300-A49C-0F31D9472B6A@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 13:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176308

On Mon, 2023-01-23 at 13:29 +0000, Ross Burton wrote:
> On 23 Jan 2023, at 12:42, Alexander Kanavin <alex.kanavin@gmail.com> wrot=
e:
> >=20
> > On Mon, 23 Jan 2023 at 13:40, Ross Burton <ross.burton@arm.com> wrote:
> > > > CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2022-3550 *
> > > > CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2022-3551 *
> > >=20
> > > These are fixed in xserver-org 21.1.6, I=E2=80=99ve mailed to get the=
 CPE updated.
> >=20
> > This is quite often the case, perhaps those weekly reports could
> > include a pointer on how to do that?
>=20
> I guess whilst the CVE triage process is actually quite simple, there=E2=
=80=99s a few non-obvious steps.
>=20
> I=E2=80=99ve started braindumping into
> https://wiki.yoctoproject.org/wiki/CVE_Triage, when it=E2=80=99s expanded=
 and
> complete we can link to it. Or maybe we should just start a
> Maintainers book in the documentation?

Lets put it in the manual. The wiki is good to pull together info but
I'd like the manual to be definitive. I've thought this about patch
submission for a while too, we have too many docs with the useful bits
of data spread over two wikis and a few READMEs...

Cheers,

Richard


