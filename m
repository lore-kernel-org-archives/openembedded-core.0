Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAF0C47DD9
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 13:07:29 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.38836.1708866445993231083
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 05:07:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.com header.s=2017 header.b=NKWI9I9y;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 47F61240029
	for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 14:07:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708866444; bh=J7AL5kFsvwKOLM+djZTuP0BmeLTGAxvEZCa4OHPgBAw=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=NKWI9I9y5ar4h063KKHLVpaWAxtGt1gAT0/IsdcxIeWldsCyy7mkEMcqS8UTrePsY
	 pNn3tcuq1Z49ESCDaBGWqHDS2fSW/Zxt/y2mh7Ys9ECIuyoxVRCnwKEZXLbTaqq979
	 AqJJkGPhJmTy2x5zO4JMaHMtsOMDueqDWKwAzK0wtnMV4NywzZADotyUrtZGNgpkW1
	 /SklJVGalBu2PAOGPna/ViYXH+VCrhG5Fq+y+vPKzGJfeUWJwAbFpWUYchillaHZsV
	 rQJEoFsQhubIM3mqZCc2Sieu/NE+IJMRwKKo5Rr1AwJUKOAzAfh7CiEwU5qJ+g6AAg
	 q8gqLy4DcTN8A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TjPDB6q41z9rxM;
	Sun, 25 Feb 2024 14:07:22 +0100 (CET)
Message-ID: <69d52b293cb610d683c203ccbad07c5cad6be08f.camel@posteo.net>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 25 Feb 2024
 01:00:01 AM HST
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Sun, 25 Feb 2024 13:01:21 +0000
In-Reply-To: <20240225111837.2C120106968@builder.sakoman.com>
References: <20240225111837.2C120106968@builder.sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196139

Hi,

quick summary (besides linux-yocto):
- No new CVEs
- 13 fixed in oe-core
- qemu: CVE-2023-6683: Fixed upstream on master now via
https://github.com/qemu/qemu/commit/405484b29f6548c7b86549b0f961b906337aa68=
a
- coreutils: CVE-2024-0684: Fixed upstream via
https://github.com/coreutils/coreutils/commit/c4c5ed8f4e9cd55a12966d4f520e3=
a13101637d9
- libxml2 upgrade is still ongoing from last week.
- Rest is all still open upstream

Simone

On Sun, 2024-02-25 at 01:18 -1000, Steve Sakoman wrote:
> Branch: master
>=20
> New this week: 0 CVEs
>=20
> Removed this week: 13 CVEs
>=20
=3D> I updated the wiki

>=20
> Full list:=C2=A0 Found 42 unpatched CVEs
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
Hypothetical DoS. A patch was proposed upstream, but hasn't been reviewed
or merged.=20
> CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-38096=C2=A0*
> CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-4543=C2=A0*
> CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-46456=C2=A0*
Buffer overflow, still open upstream.
> CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386=C2=A0*
still open upstream.
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
All 4 busybox issues above are still open upstream. Proposed patch for
CVE-2023-42366 is not reviewed/merged.
> CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-51767=C2=A0*
authentication bypass via row hammer attack, Upstream bug  (still open, no
patch) Real-world impacts seem quite low
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
> CVE-2023-6683 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native=C2=
=A0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6683=C2=A0*
patch is now merged to master
> CVE-2023-6780 (CVSS3: 5.3 MEDIUM): glibc
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6780=C2=A0*
=3D> wrong cpe, I will ping NVD again
> CVE-2023-7042 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-7042=C2=A0*
> CVE-2023-7216 (CVSS3: 8.8 HIGH): cpio
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-7216=C2=A0*
open upstream
> CVE-2024-0684 (CVSS3: 5.5 MEDIUM): coreutils:coreutils-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-0684=C2=A0*
Fix available in master branch of coreutils, but not in any release yet.=
=20
> CVE-2024-0841 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-0841=C2=A0*
> CVE-2024-21803 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-21803=C2=A0*
> CVE-2024-23307 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23307=C2=A0*
> CVE-2024-23848 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23848=C2=A0*
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
> CVE-2024-24860 (CVSS3: 5.3 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24860=C2=A0*
> CVE-2024-24861 (CVSS3: 6.3 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24861=C2=A0*
> CVE-2024-24864 (CVSS3: 4.7 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24864=C2=A0*
> CVE-2024-25062 (CVSS3: 7.5 HIGH): libxml2:libxml2-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25062=C2=A0*
=3D> update is ongoing
>=20
> Summary of CVE counts by recipe:
> =C2=A0 linux-yocto: 29
> =C2=A0 busybox: 4
> =C2=A0 qemu:qemu-native:qemu-system-native: 2
> =C2=A0 coreutils:coreutils-native: 1
> =C2=A0 cpio: 1
> =C2=A0 glibc: 1
> =C2=A0 gnupg:gnupg-native: 1
> =C2=A0 libxml2:libxml2-native: 1
> =C2=A0 nasm:nasm-native: 1
> =C2=A0 openssh: 1
>=20
> For further information see:
> https://autobuilder.yocto.io/pub/non-release/patchmetrics/
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196137):
> https://lists.openembedded.org/g/openembedded-core/message/196137
> Mute This Topic: https://lists.openembedded.org/mt/104561433/8052774
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[simone.p.w=
eiss@posteo.com
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


