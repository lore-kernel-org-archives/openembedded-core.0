Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12412.1794487749240852428
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 04:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=protonmail header.b=0PoQKAxl;
 spf=pass (domain: geanix.com, ip: 109.224.244.22, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1794487747; x=1794746947;
	bh=v8zoXQTRJvsFR908PFowxDTtU7HbXDEILeS5xcCggag=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=0PoQKAxlY7m5XHRM99qy0Ju9/UmG/6g1bhZlTBitcKu9C1Bh7IoryT977IIMIeP4P
	 28rIwar9wYZMd0F3MZIbQfjDadH8b6AdIf2bWT6MUUe6pCHJ27LatmV2xfy2ISmTqf
	 DqO6TcJ6gFylZdEY9EbHkvSDzi8+ldHFHnzFc3WcR8Dr3kUj4CYMbbwweqec5kYl1A
	 xOYPXGCMmO7P4jzMPkvqheHl2xNzrRmx7Fww8ug5saID4vxzINuczaXpwcDfSy+b0D
	 +061GXhnIMz6bF9Ig3wS7JygIfZMYXMevhFrqSdwOoWM7DltpsfxsVqQ3Rbst4qV8D
	 h/QJ9Ls9t2cAA==
Date: Thu, 12 Nov 2026 12:49:01 +0000
To: Alexander Kanavin <alex.kanavin@gmail.com>
From: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] INCOMPATIBLE_LICENSE
Message-ID: <4D0A9B16-8E0E-46E8-9EAE-73324C6D632D@geanix.com>
In-Reply-To: <CANNYZj--_8eu7tQsuwhdNNEZQ+wSh05AGKHgWnX71-wGZ-SKPw@mail.gmail.com>
References: <F1E91B20-6F2B-413B-B4B2-3EF9769D0E6B@geanix.com> <CANNYZj9DLje7=bQC2PLsb_rkDCePKPM2yWWxFLmx5dZUcHbQ9w@mail.gmail.com> <8A3AB7CF-6273-4D4A-9B95-073EEAE37CB1@geanix.com> <CANNYZj-32deiRNk9ZwzvTTFZuj7evLyPB3d_+33eDM+YSzr0og@mail.gmail.com> <18E7449543C100DC.893556@lists.openembedded.org> <8ABE57A1-35A3-4E3E-85FB-1CD7E3D27EE6@geanix.com> <CANNYZj--_8eu7tQsuwhdNNEZQ+wSh05AGKHgWnX71-wGZ-SKPw@mail.gmail.com>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: 8e572559b1b37867e080c2d564d89d9363b4858c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 12:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250089



> On 12 Nov 2026, at 12.21, Alexander Kanavin <alex.kanavin@gmail.com> wrot=
e:
>=20
> On Thu, 12 Nov 2026 at 11:47, Sean Nyekjaer <sean@geanix.com> wrote:
> My intern pointed me to commit f757ae4dad ("license_image: extend to SDK =
coverage")
> When reverting that, I=E2=80=99m able to run bitbake os-rootfs -c populat=
e_sdk
>=20
> Due to that change, the license check should probably be then fixed to on=
ly run for the target rootfs, and not SDK sysroots. Can you reproduce this =
on plain oe-core/poky master?
>=20

Yes, I=E2=80=99m able to reproduce this on oe-core master.

/Sean
