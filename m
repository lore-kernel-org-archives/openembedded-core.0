Return-Path: <simone.weiss@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0059C48BC4
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 16:31:33 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.21150.1708273888631183762
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 08:31:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.net header.s=2017 header.b=YEZulBdw;
 spf=pass (domain: posteo.net, ip: 185.67.36.66, mailfrom: simone.weiss@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id DE075240101
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 17:31:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1708273886; bh=EU00lCr1Qi/312uY47Ak+PdH55zt3BDdbIqbo1mVyYo=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=YEZulBdw2YhID1hZ4Z2iRQ7F04dCP2P9GHYEbcA4d0m4Z7jktsSNBFNWI5Cs/nwhX
	 W61MPQOLeES5pb+bW0WwpldpUxBd7W7ucWXlKHDhb/8cz2sQjSdgMKVTRy5dZ+i7YZ
	 6mU4W80gDo4Z/hD89q55hurifU5wFOrAswtptThquG5oZsHZNTiBhRWM82byVaHVpY
	 k5hzRZJNbUw01RDTyu6y/8D721zGOAWoFu5GJJBZEUzUpEONB5Ski2uVpe8en/QmBO
	 W3rQU2FgsgMmM9itR8RgPyHshi70I9P3WOYiSiRZN/1UeGgvAHNxKixC4u5r6G0DlX
	 InPLK7EOBJhhg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TdB4s3Mfnz6twM;
	Sun, 18 Feb 2024 17:31:25 +0100 (CET)
Message-ID: <717596dc14c15277f5bb2db2aac9349bc808f62b.camel@posteo.net>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 18 Feb 2024
 01:00:01 AM HST
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.weiss@posteo.net>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Sun, 18 Feb 2024 16:31:24 +0000
In-Reply-To: <20240218111825.850BB10693E@builder.sakoman.com>
References: <20240218111825.850BB10693E@builder.sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 16:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195836

Hi,=20

This time we have some real new issues, mostly we need to upgrade some
recipes.
For wrong entries NVD was now multiple times pinged. I'll set the
CVE_STATUS now, but ping them again anyhow.

On Sun, 2024-02-18 at 01:18 -1000, Steve Sakoman wrote:
> Branch: master
>=20
> New this week: 13 CVEs
=3D> Action for me: update wiki page
> CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6240=C2=A0*
> CVE-2023-6356 (CVSS3: 7.5 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6356=C2=A0*
> CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6535=C2=A0*
> CVE-2023-6536 (CVSS3: 7.5 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6536=C2=A0*
> CVE-2023-7216 (CVSS3: 8.8 HIGH): cpio
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-7216=C2=A0*
> CVE-2024-0684 (CVSS3: 5.5 MEDIUM): coreutils:coreutils-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-0684=C2=A0*
> CVE-2024-1048 (CVSS3: 3.3 LOW): grub:grub-efi:grub-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-1048=C2=A0*
> CVE-2024-22667 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-22667=C2=A0*
> CVE-2024-24575 (CVSS3: 7.5 HIGH): libgit2
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24575=C2=A0*
> CVE-2024-24577 (CVSS3: 9.8 CRITICAL): libgit2
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24577=C2=A0*
> CVE-2024-24806 (CVSS3: 9.8 CRITICAL): libuv
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24806=C2=A0*
> CVE-2024-24860 (CVSS3: 5.3 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24860=C2=A0*
> CVE-2024-25062 (CVSS3: 7.5 HIGH): libxml2:libxml2-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-25062=C2=A0*
>=20
> Removed this week: 4 CVEs
=3D> Action for me: update wiki page
> CVE-2023-48795 (CVSS3: 5.9 MEDIUM): openssh
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-48795=C2=A0*
> CVE-2023-51384 (CVSS3: 5.5 MEDIUM): openssh
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-51384=C2=A0*
> CVE-2023-51385 (CVSS3: 6.5 MEDIUM): openssh
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-51385=C2=A0*
> CVE-2024-23849 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23849=C2=A0*
>=20
> Full list:=C2=A0 Found 55 unpatched CVEs
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
> CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native=C2=A0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3219=C2=A0*
Hypothetical DoS. A patch was proposed but hasn't been reviewed or merged
> CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-38096=C2=A0*
> CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-4543=C2=A0*
> CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native=C2=A0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-46456=C2=A0*
Buffer overflow, still open upstream.
> CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native=C2=
=A0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386=C2=A0*
Still open upstream.
> CVE-2023-25584 (CVSS3: 7.1 HIGH): binutils:binutils-cross-
> testsuite:binutils-cross-x86_64:binutils-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-25584=C2=A0*
Merged fix in
https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D77c225bdeb41=
0cf60da804879ad41622f5f1aa44
. Present in binutils >=3D2.40 NVD pinged 06/02/2024. NVD pinged 12/02/2024=
.
=3D> I'll set the cve status=20
> CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3019=C2=A0*
Fixed in 8.2.0 with 9050f976e447444ea6ee2ba12c9f77e4b0dc54bc. NVD pinged
06/02/2024. NVD pinged 12/02/2024.=20
=3D> I'll set the cve status
> CVE-2023-3164 (CVSS3: 5.5 MEDIUM): tiff
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3164=C2=A0*
Upstream issue https://gitlab.com/libtiff/libtiff/-/issues/542 closed as
"wontfix-unmaintained" Only affect the tiffcrop tool not compiled by
default since 4.6.0 (OE-Core =3D 4.6.0). NVD pinged 06/02/2024. NVD pinged
12/02/2024.=20
=3D> I'll set the cve status
> CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3397=C2=A0*
> CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3640=C2=A0*
> CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-38559=C2=A0*
Fix
https://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommitdiff;h=3Dd81b82c70b=
c1
Present in >=3D 10.02.0 (OE-core ghostscript =3D 10.02.1) NVD pinged
06/02/2024. NVD pinged 12/02/2024.=20
=3D> I'll set the cve status
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
Busybox: All still open upstream
> CVE-2023-4692 (CVSS3: 7.8 HIGH): grub:grub-efi:grub-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4692=C2=A0*
> CVE-2023-4693 (CVSS3: 4.6 MEDIUM): grub:grub-efi:grub-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4693=C2=A0*
Both: (in NTFS support) : Fix merged :
e58b870ff926415e23fc386af41ff81b2f588763 + 6 parents , released in 2.12
OE-Core grub =3D 2.12 NVD pinged 06/02/2024. NVD pinged 12/02/2024.=20
=3D> I'll set the cve status
> CVE-2023-5088 (CVSS3: 7.0 HIGH): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-5088=C2=A0*
Fix merged
https://github.com/qemu/qemu/commit/7d7512019fc40c577e2bdd61f114f31a9eb84a8=
e
Present in >=3D8.2.0 (OE-core qemu =3D 8.2.1) NVD pinged 06/02/2024. NVD
pinged 12/02/2024.=20
=3D> I'll set the cve status
> CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-51767=C2=A0*
"openssh: authentication bypass via row hammer attack" Upstream bug :
https://bugzilla.mindrot.org/show_bug.cgi?id=3D3656 (still open, no patch)
Real-world impacts seem quite low=20
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
> CVE-2023-6683 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6683=C2=A0*
v2 of fix still in review
https://lists.nongnu.org/archive/html/qemu-devel/2024-01/msg03298.html
> CVE-2023-6693 (CVSS3: 5.3 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6693=C2=A0*
Backported upstream 939a09575fff7048446e36ce438fa7be6e251d41 in v8.2.1.
CPE change request sent to NVD 07/02/2024. NVD pinged 12/02/2024. =20
=3D> I'll set the cve status
> CVE-2023-6780 (CVSS3: 5.3 MEDIUM): glibc
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6780=C2=A0*
Fixed in 2.39 already wrong cpe. NVD pinged 12/02/2024.=20
=3D> I'll ping again
> CVE-2023-7042 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-7042=C2=A0*
> CVE-2023-7216 (CVSS3: 8.8 HIGH): cpio=C2=A0
path traversal in cpio, open upstream bug.
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-7216=C2=A0*
> CVE-2024-0684 (CVSS3: 5.5 MEDIUM): coreutils:coreutils-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-0684=C2=A0*
Fixed upstream in coreutils master branch via
https://github.com/coreutils/coreutils/commit/c4c5ed8f4e9cd55a12966d4f520e3=
a13101637d9
but not in any release yet
-> we need to update with latest fixes
> CVE-2024-0841 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-0841=C2=A0*
> CVE-2024-1048 (CVSS3: 3.3 LOW): grub:grub-efi:grub-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-1048=C2=A0*
Appeared after the fix of CVE-2019-14865 which was RHEL specific. This is
also RHEL specific as it affects the grub2-set-bootflag extension.
=3D> I set the CVE_STATUS and mark this as RHEL specific, patch is on list
> CVE-2024-21803 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-21803=C2=A0*
> CVE-2024-22667 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-22667=C2=A0*
Fixed in version 9.0.2142 of vim. We have vim 9.0.2130
=3D> I will update vims patchlevel, patch is out
> CVE-2024-23307 (CVSS3: 7.8 HIGH): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23307=C2=A0*
> CVE-2024-23848 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23848=C2=A0*
> CVE-2024-23850 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23850=C2=A0*
> CVE-2024-23851 (CVSS3: 5.5 MEDIUM): linux-yocto
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-23851=C2=A0*
> CVE-2024-24575 (CVSS3: 7.5 HIGH): libgit2
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24575=C2=A0*
> CVE-2024-24577 (CVSS3: 9.8 CRITICAL): libgit2
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24577=C2=A0*
Both are fixed in libgit2 1.7.2, we have 1.7.1
=3D> I update libgit2, patch is on list
> CVE-2024-24806 (CVSS3: 9.8 CRITICAL): libuv
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-24806=C2=A0*
Is fixed in libuv 1.48.0, we have 1.47.0
-> we need to update libubv
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
>=20
We have libxml2 2.11.5 it is fixed in 2.12.5.=20
=3D> I'll Update it

> Summary of CVE counts by recipe:
> =C2=A0 linux-yocto: 29
> =C2=A0 qemu:qemu-native:qemu-system-native: 5
> =C2=A0 busybox: 4
> =C2=A0 grub:grub-efi:grub-native: 3
> =C2=A0 libgit2: 2
> =C2=A0 binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-
> native: 1
> =C2=A0 coreutils:coreutils-native: 1
> =C2=A0 cpio: 1
> =C2=A0 ghostscript: 1
> =C2=A0 glibc: 1
> =C2=A0 gnupg:gnupg-native: 1
> =C2=A0 libuv: 1
> =C2=A0 libxml2:libxml2-native: 1
> =C2=A0 nasm:nasm-native: 1
> =C2=A0 openssh: 1
> =C2=A0 tiff: 1
> =C2=A0 vim: 1
>=20
> For further information see:
> https://autobuilder.yocto.io/pub/non-release/patchmetrics/
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195825):
> https://lists.openembedded.org/g/openembedded-core/message/195825
> Mute This Topic: https://lists.openembedded.org/mt/104426008/8071792
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[simone.wei=
ss@posteo.net
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


