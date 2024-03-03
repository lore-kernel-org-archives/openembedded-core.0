Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA1AC48BF6
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 11:49:42 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.71612.1709466579931296304
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 03:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.com header.s=2017 header.b=ZT/leJJp;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 2FFBE240028
	for <openembedded-core@lists.openembedded.org>; Sun,  3 Mar 2024 12:49:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1709466578; bh=wZ0YgGt5zfDiBdFylALiMJkWfgmKqkF5W7ABE+UeWYM=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=ZT/leJJpr7ocGWUjbtASvU2Laf9iGWRuTVzNCdPqH41MwrVKCisp9+RVjO6fUlOwx
	 MTKYjknJG6aP8AiMkk4uzgLRL7zBt3iTn7wA7zBwL7QLcs2tPqerxORB3ZeppLdmuv
	 MqFB6m02d0kC4PMEDxILribVAAy/NAXyb/dvfT1OQ8FBvaBpf/AhUC08ZOYWGhxSp6
	 A7uVUZxOBy4mLIvAHRl0Fz+MK4nJLs58Y9Dhl5b4Pz2gHNVHU+l3ZHfcAJc+rJyUPh
	 dtV+Qp4dBtNDdlE3BwZPO1oRrbuU4wIWq0JWASKs299CgwCJ5bs6SPFyvJBq/Pv8TT
	 9eyYunT5s+MOA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Tng9D2vJtz9rxN;
	Sun,  3 Mar 2024 12:49:36 +0100 (CET)
Message-ID: <f9e113a874a6c71e73bed3a062da1b06520dcabb.camel@posteo.net>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 03 Mar
 2024 01:00:01 AM HST
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Sun, 03 Mar 2024 11:49:35 +0000
In-Reply-To: <20240303111845.7A4DE106912@builder.sakoman.com>
References: <20240303111845.7A4DE106912@builder.sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 11:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196558


Hi all,=20

quick check: No news for any old issue, except cpio, which is disputed by
the maintainer.

Simone
> Branch: master
>=20
> New this week: 2 CVEs
...
> Removed this week: 3 CVEs
wiki updated
> Full list:=C2=A0 Found 41 unpatched CVEs
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
Patch available but not reviewed upstream
> CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-38096=C2=A0*
> CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-4543=C2=A0*
> CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-46456=C2=A0*
upstream still open
> CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386=C2=A0*
upstream still open
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
busybox: all still open upstream
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
> CVE-2023-6683 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native=C2=
=A0
patch in master-next
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6683=C2=A0*
> CVE-2023-6780 (CVSS3: 5.3 MEDIUM): glibc
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6780=C2=A0*
Should be gone soon, got mail from NVD that it will be updated
> CVE-2023-7042 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-7042=C2=A0*
> CVE-2023-7216 (CVSS3: 8.8 HIGH): cpio=C2=A0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-7216=C2=A0*
Disputed by upstream maintainer as intended. I would set a CVE_STATUS
soon.
> CVE-2024-0684 (CVSS3: 5.5 MEDIUM): coreutils:coreutils-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-0684=C2=A0*
patch in master-next
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
> CVE-2024-25062 (CVSS3: 7.5 HIGH): libxml2:libxml2-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25062=C2=A0*
If libxml2 gets updated webkitgtk build fails still
> CVE-2024-25739 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25739=C2=A0*
> CVE-2024-25740 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25740=C2=A0*
>=20
> Summary of CVE counts by recipe:
> =C2=A0 linux-yocto: 28
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
> View/Reply Online (#1086):
> https://lists.yoctoproject.org/g/yocto-security/message/1086
> Mute This Topic: https://lists.yoctoproject.org/mt/104700791/8052774
> Group Owner: yocto-security+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/yocto-security/unsub=C2=A0[simone.p.weis=
s@posteo.com
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


