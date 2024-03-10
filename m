Return-Path: <simone.weiss@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AF8C54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 11:39:12 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.32245.1710070747610523449
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 04:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.net header.s=2017 header.b=iLQcd5Du;
 spf=pass (domain: posteo.net, ip: 185.67.36.65, mailfrom: simone.weiss@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 45C7724002A
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 12:39:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1710070745; bh=DLGv0qhehsRM4IjJSH5tCF4z17eyYJH2hyye4aEUINg=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=iLQcd5DuaQ9ig6Czy65JT8HUD0W+KXvlj6vHZusPemmMuCUMSxW5KcjwINQCPJFwe
	 P673IG/WlPUo7qcfp2b+Ukyn0dmkDSxrYH2gX5CZKqgW00q9hnvcdVXbVvkuEHOa/B
	 twTBP0J2kK3mIwho+J2VwtX03LV7kNn10X1vBBJ7DD1mBTM3WE6yjeEW82Oc6phCNA
	 w6HqzTRJm0XhVdwg1s9nS0ZyNWMPeClTNhUOum72s0Y++fIRrDX7x55JfYVwU0ApSU
	 Vs7i+a+phRI7n02AMPPLzCDil75KZomwl8FvS5xERNTlCTYH87ltY0V0tGvGnjy3vv
	 55T7GOhahGZ9g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Tsybq61Byz9rxD;
	Sun, 10 Mar 2024 12:39:03 +0100 (CET)
Message-ID: <843149744b75d6815f7c4168f5138860c02e947a.camel@posteo.net>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 10 Mar
 2024 01:00:01 AM HST
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.weiss@posteo.net>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Sun, 10 Mar 2024 11:39:03 +0000
In-Reply-To: <20240310111809.EC2D8106901@builder.sakoman.com>
References: <20240310111809.EC2D8106901@builder.sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 11:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196879

On Sun, 2024-03-10 at 04:18 -0700, Steve Sakoman wrote:
> Branch: master
>=20
> New this week: 0 CVEs
>=20
> Removed this week: 4 CVEs
>=20
Hi, again a quick check:
- wiki updated.
- rest all still same status as last week(no fixes available for any, no
direct action item for porting/upgrading)

- Simone
>=20
> Full list:=C2=A0 Found 37 unpatched CVEs
> CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-14899=C2=A0*
> CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3714=C2=A0*
> CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3864=C2=A0*
> CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-0400=C2=A0*
> CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1247=C2=A0*
> CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3219=C2=A0*
> CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-38096=C2=A0*
> CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-4543=C2=A0*
> CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-46456=C2=A0*
> CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386=C2=A0*
> CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3397=C2=A0*
> CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3640=C2=A0*
> CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4010=C2=A0*
> CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42363=C2=A0*
> CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42364=C2=A0*
> CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42365=C2=A0*
> CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42366=C2=A0*
> CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-51767=C2=A0*
> CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6238=C2=A0*
> CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6240=C2=A0*
> CVE-2023-6270 (CVSS3: 7.0 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6270=C2=A0*
> CVE-2023-6356 (CVSS3: 7.5 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6356=C2=A0*
> CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6535=C2=A0*
> CVE-2023-6536 (CVSS3: 7.5 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6536=C2=A0*
> CVE-2023-7042 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-7042=C2=A0*
> CVE-2023-7216 (CVSS3: 8.8 HIGH): cpio
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-7216=C2=A0*
> CVE-2024-0841 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-0841=C2=A0*
> CVE-2024-21803 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-21803=C2=A0*
> CVE-2024-23307 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23307=C2=A0*
> CVE-2024-23848 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23848=C2=A0*
> CVE-2024-24857 (CVSS3: 6.8 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24857=C2=A0*
> CVE-2024-24858 (CVSS3: 5.3 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24858=C2=A0*
> CVE-2024-24859 (CVSS3: 4.8 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24859=C2=A0*
> CVE-2024-24861 (CVSS3: 6.3 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24861=C2=A0*
> CVE-2024-24864 (CVSS3: 4.7 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24864=C2=A0*
> CVE-2024-25739 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25739=C2=A0*
> CVE-2024-25740 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25740=C2=A0*
>=20
> Summary of CVE counts by recipe:
> =C2=A0 linux-yocto: 28
> =C2=A0 busybox: 4
> =C2=A0 cpio: 1
> =C2=A0 gnupg:gnupg-native: 1
> =C2=A0 nasm:nasm-native: 1
> =C2=A0 openssh: 1
> =C2=A0 qemu:qemu-native:qemu-system-native: 1
>=20
> For further information see:
> https://autobuilder.yocto.io/pub/non-release/patchmetrics/
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1100):
> https://lists.yoctoproject.org/g/yocto-security/message/1100
> Mute This Topic: https://lists.yoctoproject.org/mt/104842148/8052774
> Group Owner: yocto-security+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/yocto-security/unsub=C2=A0[simone.p.weis=
s@posteo.com
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


