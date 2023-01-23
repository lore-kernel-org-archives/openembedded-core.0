Return-Path: <rpurdie@rpsys.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA549C38142
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 13:35:19 +0000 (UTC)
Received: from dan.rpsys.net (dan.rpsys.net [217.169.23.60])
 by mx.groups.io with SMTP id smtpd.web11.42366.1674480913614467011
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 05:35:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="crypto/rsa: verification error" header.i=@rpsys.net header.s=default header.b=KO8MIX5Q;
 spf=pass (domain: rpsys.net, ip: 217.169.23.60, mailfrom: rpurdie@rpsys.net)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rpsys.net; s=default;
	t=1674480904; bh=ABGjCkUrkJxFufF6aNwXQW7CCj2pRUkR6OXkLIEer94=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KO8MIX5QcNhhyyewClngNNrgWvTEFI2lAfEP0pHh6Is0PS1DuveUDiqgMFMo54i3h
	 XKrA+gRNpCdWJwzrbGWJvqhe7412jEqNBYVD8cj6bfzQZWK4hsrPGsZezOS6YnIWdB
	 uwvsNuH8QSShpWkEzeiCigVqt2oIGMKm4JZiAbo8pBK71tVtBVqXlaeR9WWB0ayjy3
	 zlOZ1RSPTjQw1kloYtJO4nkREeJmfukGqtYBx9bUkQ0fjjB3pz5czi8KFXeAs+D8F3
	 neyU6AZA6plEg1zfjrtc+Z6uH8XTikf7ChbPAACX8wJyWDQzLg+vPp15xeR5D4tQl/
	 zCUZ/GTkXVmGw==
Received: from [192.168.1.7] ([192.168.1.7])
	(authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTPSA id 30NDZ3Kp1007140
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Jan 2023 13:35:04 GMT
Message-ID: <86a778f909863ac4b1d622c47b6fc91533ca03aa.camel@rpsys.net>
Subject: Re: [yocto-security] [OE-core] OE-core CVE metrics for master on
 Sun 22 Jan 2023 02:00:01 AM HST
From: Richard Purdie <rpurdie@rpsys.net>
To: Ross Burton <ross.burton@arm.com>,
        Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: "steve@sakoman.com" <steve@sakoman.com>,
        OE-core
	 <openembedded-core@lists.openembedded.org>,
        "yocto-security@lists.yoctoproject.org"
	 <yocto-security@lists.yoctoproject.org>
Date: Mon, 23 Jan 2023 13:35:03 +0000
In-Reply-To: <37CCF635-CA4E-4300-A49C-0F31D9472B6A@arm.com>
References: <20230122120427.D9CF696035B@nuc.router0800d9.com>
	 <D5C2125C-6245-4E41-9029-6EF99E4AE623@arm.com>
	 <CANNYZj-mtOntD4NcfMKd4j5jqzCN6sP_OFrGdVWWBv8ug93=Yw@mail.gmail.com>
	 <37CCF635-CA4E-4300-A49C-0F31D9472B6A@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at dan
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 13:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176307

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

