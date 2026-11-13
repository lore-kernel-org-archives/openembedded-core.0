Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9010.1794569430688190141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 03:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail header.b=XDFfo6yg;
 spf=pass (domain: geanix.com, ip: 185.70.43.23, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794569428; x=1794828628;
	bh=M11W2bhTqVB8Zf0UUv5L4yIpGPbDi5bIVDPA9ZBuISM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XDFfo6ygBlso+kaGY0TWAE01K3kuO64gpjxKvXGjpYjAzUCY2tP5J6L05eFZO0Awi
	 OveKxYBLiuPBKodIZDlGGzlGqQh7As04RM/ssgk+sDUhPnCehtTV6BCLkmoq2GvN/5
	 /Zvg2uCHVBHJNtkKZMzA9Z/C465VoTCaPBNKVyab1dSy9isBSjPsTm0GUlki1bkp4i
	 SQNY5eN27hFN3+U+wafr3BCm/eFSzTBl+sPsUIPb4JQ8z/F2t+sAQN4jD6UkvChOvV
	 hVKDebSRfE08lk41HmPUmIWDrE28E+/W2KddJEZ7GHwlAecRbLBQSiSlvxRYjJLU0q
	 3q0QkJfSha0wg==
Date: Fri, 13 Nov 2026 11:30:21 +0000
To: Alexander Kanavin <alex.kanavin@gmail.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
From: Sean Nyekjaer <sean@geanix.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] INCOMPATIBLE_LICENSE
Message-ID: <D89905C6-57A9-4F19-B44A-C7F127DF7B75@geanix.com>
In-Reply-To: <CANNYZj9J75S6ApU3g9ayPG3hgDRLpOveLpSVRhvRc3PGh+vmFw@mail.gmail.com>
References: <F1E91B20-6F2B-413B-B4B2-3EF9769D0E6B@geanix.com> <CANNYZj9DLje7=bQC2PLsb_rkDCePKPM2yWWxFLmx5dZUcHbQ9w@mail.gmail.com> <8A3AB7CF-6273-4D4A-9B95-073EEAE37CB1@geanix.com> <CANNYZj-32deiRNk9ZwzvTTFZuj7evLyPB3d_+33eDM+YSzr0og@mail.gmail.com> <18E7449543C100DC.893556@lists.openembedded.org> <8ABE57A1-35A3-4E3E-85FB-1CD7E3D27EE6@geanix.com> <CANNYZj--_8eu7tQsuwhdNNEZQ+wSh05AGKHgWnX71-wGZ-SKPw@mail.gmail.com> <DB5PR02MB1021331FEDA82B00E39E86139EF7F2@DB5PR02MB10213.eurprd02.prod.outlook.com> <CANNYZj9J75S6ApU3g9ayPG3hgDRLpOveLpSVRhvRc3PGh+vmFw@mail.gmail.com>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: e423008a0ef8703ef16723578a1a3b2592baaece
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 11:30:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250161



> On 13 Nov 2026, at 12.24, Alexander Kanavin <alex.kanavin@gmail.com> wrot=
e:
>=20
> You probably have a point here. I'm not sure. Asking the audience :)
>=20
> Distributing gpl-3 generally requires that users can modify and replace t=
hat code in the context of their use of it. For SDKs that means users shoul=
d be able to rebuild and reinstall the SDK with their own modifications?
>=20
> We probably should keep the current enforcement as it is (both target roo=
tfs and SDKs), but add a variable to opt out of it for SDKs only.
>=20
> Alex

I have sent two patches from your suggestions made yesterday.
In our case we are satisfied with users is able to modify, rebuild and rein=
stall the SDK.

/Sean


>=20
> On Fri, 13 Nov 2026 at 12:04, Peter Kjellerstedt <peter.kjellerstedt@axis=
.com> wrote:
> That does not sound correct. If you are distributing the SDK, you are dis=
tributing both native and target code, i.e., the licenses for the native to=
ols apply as much as the licenses for the target parts. It is very unlikely=
 that you will ever be able to distribute an SDK that avoids GPL-3 since ma=
ny of the core components like GCC, binutils, autoconf and m4 use GPL-3.
>  //Peter
>   From: Alexander Kanavin via openembedded-core <alex.kanavin=3Dgmail.com=
@lists.openembedded.org>=20
> Sent: den 12 november 2026 12:22
> To: Sean Nyekjaer <sean@geanix.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] INCOMPATIBLE_LICENSE
>  On Thu, 12 Nov 2026 at 11:47, Sean Nyekjaer <sean@geanix.com> wrote:
> My intern pointed me to commit f757ae4dad ("license_image: extend to SDK =
coverage")
> When reverting that, I=E2=80=99m able to run bitbake os-rootfs -c populat=
e_sdk
>  Due to that change, the license check should probably be then fixed to o=
nly run for the target rootfs, and not SDK sysroots. Can you reproduce this=
 on plain oe-core/poky master?
>  Alex



