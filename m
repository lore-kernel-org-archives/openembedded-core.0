Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A80C4829A
	for <webhook@archiver.kernel.org>; Sun, 11 Feb 2024 12:51:48 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.36308.1707655901280726571
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Feb 2024 04:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.com header.s=2017 header.b=bddMC/w3;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 6451C240027
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 13:51:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1707655899; bh=yqB+bT/kC8LJZAopdJPz/9/T7pkJLI1fB2YOSOsKAng=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=bddMC/w3IqC07c8Zo4opdmKfm82BRrEldQzShERXhnaLUKCaFMPNyaApz/eKZ5vAR
	 6JbtAOlumChyNn/KA1mWPsB14VTWqIup303EHSv9GKBYSsoKsv16j900ZcY0AjK8Oj
	 H7Ng65wHVjCDQm/eQwAf5Dp7GL0Em52Rc0SSWdyECUlPSkjOOUYA19D4uXtnh3kFiG
	 vl+OQUyYYFss8trYaWKR399s5wAb4bDyCra553LKGf0qvnzLBxZhfXcFyN8mlRz9R7
	 eNcNVu3bQzJ1KQYOKg63WrublqNU+la1PNjWIHYyE6P8pN5TVQdSN8XX+H2b2vYIlo
	 PhLtla9Qr2Xog==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TXnXQ0McBz6twK;
	Sun, 11 Feb 2024 13:51:33 +0100 (CET)
Message-ID: <aa4f81ea3cdacf0a137463ed3112204b94e6f5f4.camel@posteo.net>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 11 Feb 2024
 01:00:01 AM HST
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Sun, 11 Feb 2024 12:45:32 +0000
In-Reply-To: <20240211111803.59692106928@builder.sakoman.com>
References: <20240211111803.59692106928@builder.sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Feb 2024 12:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195289

Hi all,

did a quick check(expect linux-yocto), all in mostly NVD needs to be
pinged, rest are pending upstream (with or without patches).
Besides the ongoing openssh update no further updates/backports should be
needed.

On Sun, 2024-02-11 at 01:18 -1000, Steve Sakoman wrote:
> Branch: master
>=20
> New this week: 7 CVEs
...
Action for me: Add to wiki page
>=20
> Removed this week: 13 CVEs
...
Action for me: Remove from wiki page. Good news more removed then added:)
>=20
> Full list:=C2=A0 Found 46 unpatched CVEs
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
Patches still in review, pinged in discussion
> CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-38096=C2=A0*
> CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-4543=C2=A0*
> CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native=C2=A0
Still open upstream
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-46456=C2=A0*
> CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native=C2=
=A0
Still open upstream
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386=C2=A0*
> CVE-2023-25584 (CVSS3: 7.1 HIGH): binutils:binutils-cross-
> testsuite:binutils-cross-x86_64:binutils-native=C2=A0
Present in binutils >=3D2.40 NVD was pinged 06/02/2024=20
- > Action for me ping NVD again

> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-25584=C2=A0*
> CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native=C2=
=A0
Fixed in 8.2.0 with 9050f976e447444ea6ee2ba12c9f77e4b0dc54bc. NVD pinged
06/02/2024.=20
- > Action for me ping NVD again
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3019=C2=A0*
> CVE-2023-3164 (CVSS3: 5.5 MEDIUM): tiff=C2=A0
Upstream issue https://gitlab.com/libtiff/libtiff/-/issues/542 closed as
"wontfix-unmaintained" Only affect the tiffcrop tool not compiled by
default since 4.6.0 (OE-Core =3D 4.6.0). NVD pinged 06/02/2024.=20
- > Action for me ping NVD again

> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3164=C2=A0*
> CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3397=C2=A0*
> CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3640=C2=A0*
> CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript=C2=A0
Fix
https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommitdiff;h=3Dd81b82c70b=
c1
Present in >=3D 10.02.0 (OE-core ghostscript =3D 10.02.1) NVD pinged
06/02/2024=20
- > Action for me ping NVD again
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-38559=C2=A0*
> CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto=C2=A0


> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4010=C2=A0*
> CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42363=C2=A0*
> CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42364=C2=A0*
> CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42365=C2=A0*
> CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox=C2=A0
Those 4 busybox upstream bugs are all still open upstream. Some of them
might duplicate the others. Patch for one posted end of January.
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-42366=C2=A0*
> CVE-2023-4692 (CVSS3: 7.8 HIGH): grub:grub-efi:grub-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4692=C2=A0*
> CVE-2023-4693 (CVSS3: 4.6 MEDIUM): grub:grub-efi:grub-native=C2=A0
Both: (in NTFS support)=C2=A0: Fix merged=C2=A0:
e58b870ff926415e23fc386af41ff81b2f588763 + 6 parents , released in 2.12
OE-Core grub =3D 2.12 NVD pinged 06/02/2024=20
-> Action for me ping NVD again

> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4693=C2=A0*
> CVE-2023-48795 (CVSS3: 5.9 MEDIUM): openssh=C2=A0
Fix in progress
https://lists.openembedded.org/g/openembedded-core/topic/103546397#193372

> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-48795=C2=A0*
> CVE-2023-5088 (CVSS3: 7.0 HIGH): qemu:qemu-native:qemu-system-native=C2=
=A0
Fix merged
https://github.com/qemu/qemu/commit/7d7512019fc40c577e2bdd61f114f31a9eb84a8=
e
Present in >=3D8.2.0 (OE-core qemu =3D 8.2.1) NVD pinged 06/02/2024=20
-> Action for me ping NVD again

> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-5088=C2=A0*
> CVE-2023-51384 (CVSS3: 5.5 MEDIUM): openssh=C2=A0
Fix in progress
https://lists.openembedded.org/g/openembedded-core/topic/103546397#193372
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-51384=C2=A0*
> CVE-2023-51385 (CVSS3: 6.5 MEDIUM): openssh=C2=A0
Fix in progress
https://lists.openembedded.org/g/openembedded-core/topic/103546397#193372
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-51385=C2=A0*
> CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh=C2=A0
Still open upstream https://bugzilla.mindrot.org/show_bug.cgi?id=3D3656,
might stay open longer. Small real world impact.

> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-51767=C2=A0*
> CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6238=C2=A0*
> CVE-2023-6270 (CVSS3: 7.0 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6270=C2=A0*
> CVE-2023-6683 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native=C2=
=A0
native=C2=A0https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-668=
3=C2=A0*
Patch available upstream, not merged yet
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6683=C2=A0*
> CVE-2023-6693 (CVSS3: 5.3 MEDIUM): qemu:qemu-native:qemu-system-native=C2=
=A0
Backported upstream 939a09575fff7048446e36ce438fa7be6e251d41 in v8.2.1.
CPE change request sent to NVD 07/02/2024=20
-> Action for me ping NVD again

> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6693=C2=A0*
> CVE-2023-6780 (CVSS3: 9.8 CRITICAL): glibc=C2=A0
New this week: Fixed in glibc 2.39
https://sourceware.org/git/?p=3Dglibc.git;a=3Dtag;h=3D9609a435f3f9a07c1cf60=
7ad5821b12f735abd69
which we have (yeah!)
-> Action for me ping NVD=20

Cheers,
Simone
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6780=C2=A0*
> CVE-2023-7042 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-7042=C2=A0*
> CVE-2024-0841 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-0841=C2=A0*
> CVE-2024-21803 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-21803=C2=A0*
> CVE-2024-23307 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23307=C2=A0*
> CVE-2024-23848 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23848=C2=A0*
> CVE-2024-23849 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23849=C2=A0*
> CVE-2024-23850 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23850=C2=A0*
> CVE-2024-23851 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23851=C2=A0*
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
>=20
> Summary of CVE counts by recipe:
> =C2=A0 linux-yocto: 25
> =C2=A0 qemu:qemu-native:qemu-system-native: 5
> =C2=A0 busybox: 4
> =C2=A0 openssh: 4
> =C2=A0 grub:grub-efi:grub-native: 2
> =C2=A0 binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-
> native: 1
> =C2=A0 ghostscript: 1
> =C2=A0 glibc: 1
> =C2=A0 gnupg:gnupg-native: 1
> =C2=A0 nasm:nasm-native: 1
> =C2=A0 tiff: 1
>=20
> For further information see:
> https://autobuilder.yocto.io/pub/non-release/patchmetrics/
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195284):
> https://lists.openembedded.org/g/openembedded-core/message/195284
> Mute This Topic: https://lists.openembedded.org/mt/104292333/8052774
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[simone.p.w=
eiss@posteo.com
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


