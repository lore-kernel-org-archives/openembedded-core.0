Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC299C76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 09:56:07 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.126188.1680688555918727946
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 02:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EK4OnZRP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so23024966wmq.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 02:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680688551;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q7YVbSTuxIpl0QyOxV2EDf/QPaAgpW2tSwQHDm4q70M=;
        b=EK4OnZRPR8KeFPvDcD26ynqTcPG4SHYgZqTkYQMcPch4LFWsZohei0dCXC1Nn0g+4A
         iYFOnXkXQ328TrSZeSznVU34LRoQ0F0JcFbBwSWtPJS6Ioc7VoZtXvER/Q3gE9NWB2zS
         2cIVcOFbSssQaPx+AmUqpuCUkYY+O2fsfGepY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680688551;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7YVbSTuxIpl0QyOxV2EDf/QPaAgpW2tSwQHDm4q70M=;
        b=SZMEO6h+NqkgXScx0UOVb9k+Otio+MdyQN1ccolb2Di/A03i6kXFwS5Sa+wkyb9sCt
         39GyNV0JVdArul9Zur8nXK4p88xM78+Q1T9SNlmPbt36su79XYQgF/Z9x41aUPT2E6K4
         Ap1sNuRLACyFnrcFA/4kH7MSymfdmUm2CzZQDOXG2lcn/PLLB+g8UEbXtvQAHyezKI0y
         TYP/CuY128pNMww8ecgN+xqRaQM1e20jatGao6Xfu2XzkJJuS5LTGiBxgeJTlH+ewB3w
         7ZAh2pp2hOXRE57JySzKB2If4RNAAMGHFaMP3NNTBSkOzRS9xNjvl2x2BaOLBBalpx6v
         KteA==
X-Gm-Message-State: AAQBX9dhwQf5/v2ekAPnPYlXVJy5MJT7/fj9FIo312eultgWxs9PPlla
	YpUHmDlzLy556FkI0IlAgBCgVg==
X-Google-Smtp-Source: AKy350auE0E8F+iDRSr+XR9L/FGSF1ppXrey7mMbktzCMbL2ELOo3L6Zs9EyKHcEEq//1/SijXBprw==
X-Received: by 2002:a7b:c38b:0:b0:3ed:8bef:6a04 with SMTP id s11-20020a7bc38b000000b003ed8bef6a04mr4448634wmj.27.1680688551325;
        Wed, 05 Apr 2023 02:55:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f5bf:59d3:395c:4325? ([2001:8b0:aba:5f3c:f5bf:59d3:395c:4325])
        by smtp.gmail.com with ESMTPSA id l10-20020a7bc44a000000b003edff838723sm1669373wmi.3.2023.04.05.02.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 02:55:50 -0700 (PDT)
Message-ID: <432346f305541dc9e25b0e7fe34de1fd12aab978.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cve-extra-exclusions.inc: Exclude some issues
 not present in linux-yocto
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Cc: Geoffrey GIRY <geoffrey.giry@smile.fr>
Date: Wed, 05 Apr 2023 10:55:50 +0100
In-Reply-To: <9eab4d61-3939-0703-1d81-e998f8957e99@smile.fr>
References: <20230404164400.403462-1-richard.purdie@linuxfoundation.org>
	 <9cb0aae1-c1be-ab0d-2263-1ab2f928c885@smile.fr>
	 <eaa125c5ba2c1a13837c65df4a961abab5f5373b.camel@linuxfoundation.org>
	 <9eab4d61-3939-0703-1d81-e998f8957e99@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 09:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179731

On Wed, 2023-04-05 at 11:51 +0200, Yoann Congal wrote:
> Hi Richard,
>=20
> On 4/5/23 00:26, Richard Purdie wrote:
> > .../...
> > Thanks, I tweaked those bits. I did a bit more research and the other
> > easier looking linux-yocto ones to mark up are listed below along with
> > the versions known to contain fixes. I'd still need to map out the
> > revisions and so on for these but several look like they can be
> > resolved for our versions if this data is correct.
> >=20
> > That left 13 linux-yocto CVEs that would need more work to track down
> > and 5 non linux-yocto ones.
>=20
> Some of these will be part of a patch from Geoffrey (in cc) that he will =
send in an hour or 2.
>=20
> >=20
> > CVE-2022-2196: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2196 *
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3D2e7eab81425ad6c875f2ed47c0ce01e78afc38a5
> > 5.10.170
> > 5.15.96
> > 6.1.14>=20
> > CVE-2022-3424: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3424 *
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3D643a16a0eb1d6ac23744bb6e90a00fc21148a9dc
> > 5.10.163
> > 5.15.86
> > 6.1.2
> >=20
> > CVE-2022-3523: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3523 *
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3D16ce101db85db694a91380aa4c89b25530871d33
> >=20
> > CVE-2022-3566: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3566 *
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3Df49cd2f4d6170d27a2c61f1fecb03d8a70c91f57
> >=20
> > CVE-2022-3567: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3567 *
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3D364f997b5cfe1db0d63a390fe7c801fa2b3115f6
>=20
> All of the above will be included.
>=20
> >=20
> > CVE-2022-38457: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-38457 *
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3Da309c7194e8a2f8bd4539b9449917913f6c2cd50
> > 6.1.7>=20
> > CVE-2022-40133: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-40133 *
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3Da309c7194e8a2f8bd4539b9449917913f6c2cd50
> >=20
> > CVE-2023-0179: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-0179 *
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3D696e1a48b1a1b01edad542a1ef293665864a4dd0
> > 5.10.164
> > 5.15.89
> > 6.1.7
> >=20
> > CVE-2023-1079: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1079 *
> > Fixed in
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3D4ab3a086d10eeec1424f2e8a968827a6336203df
> > 5.10.173
> > 5.15.99
> > 6.1.16
>=20
> Not these 4 above.
>=20
> >=20
> > CVE-2023-1118: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1118 *
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3D29b0589a865b6f66d141d79b2dd1373e4e50fe17
> > 5.10.173
> > 5.15.99
> > 6.1.16
> >=20
> > CVE-2023-1281: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1281 *
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3Dee059170b1f7e94e55fa6cadee544e176a6e59c2
> > 5.10.169
> > 5.15.95
> > 6.1.13
>=20
> These 2 above will be included.
>=20
> > CVE-2023-1513: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1513 *
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3D2c10b61421a28e95a46ab489fd56c0f442ff6952
> > 5.10.169
> > 5.15.95
> > 6.1.13
> >=20
> > CVE-2023-23005: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-23005 *
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3D4a625ceee8a0ab0273534cb6b432ce6b331db5ee
> > Disputed?
>=20
> These 2 above will not be included.
>=20
> >=20
> > CVE-2023-28466: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-28466 *
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3D49c47cc21b5b7a3d8deb18fc57b0aa2ab1286962
> > 5.15.105
> > 6.1.20
> Included
> >=20
> > CVE-2023-28866: linux-yocto
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-28866 *
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it?id=3Dbce56405201111807cc8e4f47c6de3e10b17c1ac
> > 6.1.22
>=20
> Not included.
>=20
> Should I write a patch including the missing CVEs from Geoffrey's patch o=
r that will clash with your work-in-progress?

I haven't done anything yet with these so I'd happily take a patch!

Cheers,

Richard

