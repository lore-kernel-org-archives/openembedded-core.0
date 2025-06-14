Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A63C71136
	for <webhook@archiver.kernel.org>; Sat, 14 Jun 2025 01:05:23 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.2032.1749863115309129806
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 18:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qEhBPUsL;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55E14r132111448;
	Fri, 13 Jun 2025 20:04:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749863093;
	bh=Ql9j0d0osKpGVGJt/vcbAwBfZyUDbZ3DgldlhqtBpF0=;
	h=Date:Subject:From:To:CC:References:In-Reply-To;
	b=qEhBPUsLf6ESBq6ak1qs+YKTMQ4dz9tThXvJU3LCAoVFs2Eq67TJj/UrvJ9V4sq+I
	 gPL05XIYNv0jfPMp35Kr+HdPDCSq35EdAiIuulb7Z9ie8X6YeJtL+wZSditCWO1rDl
	 H4bHzZ5mzvBisZiDd3aOGrHiSqNj/WS1muyXoc54=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55E14qYQ589588
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 13 Jun 2025 20:04:53 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 13
 Jun 2025 20:04:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 13 Jun 2025 20:04:52 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55E14qav154601;
	Fri, 13 Jun 2025 20:04:52 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 Jun 2025 20:04:52 -0500
Message-ID: <DALUP31PRAWK.LADOXLI1SELP@ti.com>
Subject: Re: [oe-core][PATCHv6 0/5] Display manager proposal for x11 and
 wayland
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250520233935.740242-1-rs@ti.com>
 <DA1YOI4L8TYX.ALF8S230UTO1@bootlin.com> <DA7AGREX7HJ9.33KJKYJPO1A3N@ti.com>
 <DA7RUET7783J.484RLJVMFOCZ@bootlin.com> <DAE5YENHYCZ0.39HEAHC58A3FV@ti.com>
 <1846990D23EB4550.17668@lists.openembedded.org>
In-Reply-To: <1846990D23EB4550.17668@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jun 2025 01:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218633

On Fri Jun 6, 2025 at 6:49 PM CDT, Randolph Sapp via lists.openembedded.org=
 wrote:
> On Wed Jun 4, 2025 at 7:12 PM CDT, Randolph Sapp wrote:
>> On Wed May 28, 2025 at 6:53 AM CDT, Mathieu Dubois-Briand wrote:
>>> On Wed May 28, 2025 at 12:16 AM CEST, Randolph Sapp wrote:
>>
>> [snip]
>>
>>>> Ah, the auth failures persist. Normally this is caused when the user a=
ttempts to
>>>> login before the user account was created or something unusual like th=
at. I
>>>> don't suppose there's any way this could be happening on the test mach=
ines?
>>>>
>>>> I'm not able to reproduce this locally, but my build config is differe=
nt. I tend
>>>> to use oe-core and nodistro instead of poky. They aren't playing aroun=
d with the
>>>> reproducible build date stuff or anything like that are they?
>>>>
>>>> Well, I mean I did see this on occasion. The first login attempt almos=
t always
>>>> failed, but the subsequent attempts were fine. Bumping the attempt cou=
nt back up
>>>> the default (2) was enough to resolve it on my end, but evidently it's=
 not
>>>> enough here.
>>>>
>>>> This is not happening on hardware from what I'm seeing.
>>>
>>> Hi Randolph,
>>>
>>> I was able to reproduce it locally, with the following configuration:
>>> - https://git.yoctoproject.org/poky-ci-archive on tag
>>>   autobuilder.yoctoproject.org/valkyrie/a-full-1630.
>>> - template local.conf, with the following modifications:
>>>   MACHINE =3D "qemux86"
>>>   DISTRO =3D "poky-altcfg"
>>>   SDKMACHINE =3D "x86_64"
>>>   PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
>>>   INHERIT +=3D 'image-buildinfo'
>>>   IMAGE_BUILDINFO_VARS:append =3D ' IMAGE_BASENAME IMAGE_NAME'
>>>   PACKAGE_CLASSES =3D 'package_ipk package_rpm package_deb'
>>>   IMAGE_ROOTFS_EXTRA_SPACE:append =3D '${@bb.utils.contains('IMAGE_FEAT=
URES', 'package-management', ' + 262144', '', d)}'
>>>   IMAGE_INSTALL:append =3D ' ssh-pregen-hostkeys'
>>>   SANITY_TESTED_DISTROS =3D ''
>>>   OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder core/yocto-auto=
builder/autobuilder-resource-constraints'
>>>   # (Plus my own sstate cache and downloads dir).
>>> - bitbake core-image-sato
>>> - bitbake core-image-sato:do_testimage
>>>
>>> Of course using the tag from poky-ci-archive is not mandatory, you
>>> should see the same behaviour with master branch and your patches.
>>>
>>> I saw some oe-selftest was also failing on the autobuilder, with an
>>> error related to emptty. You can reproduce it with:
>>>
>>> oe-selftest -r sstatetests.SStateHashSameSigs3.test_sstate_sametune_sam=
esigs
>>
>> Status report, since it's been a little bit.
>>
>> Seems this some i386/x86 fault only exposed in this specific environment=
. I was
>> unable to reproduce it on Archlinux32. I've traced it back to a SEGFAULT=
 when we
>> attempt to execute mcookie as the target user. Odd stuff. Delve and gdb =
aren't
>> helping me here. Running some more tests to see if I can corner this som=
e other
>> way.
>>
>> - Randolph
>
> Well, I managed to determine this is specifically an issue after loading =
libpam
> and attempting to authenticate.
>
> Seems like loading both common-auth and common-account before calling
> pam_acct_mgmt results in the above described segfault.
>
> There are 3 pam interactions made after the initial auth.
> 	1. pam_acct_mgmt
> 	2. pam_set_item
> 	3. pam_setcred
>
> Loading only common-account reports that pam_acct_mgmt fails with the PAM=
_SILENT
> flag set.
>
> Removing that flag makes the later pam_setcred fail, but allows pam_acct_=
mgmt
> and pam_set_item to work correctly. Removing the call to pam_acct_mgmt
> altogether seems to allow pam_setcred to work.
>
> Removing the call to pam_acct_mgmt also allows both common-auth and
> common-account to be loaded without triggering the segfault.
>
> Very unusual. Everything points at the obvious "arch specific problems wi=
th the
> go pam wrapper", but other distributions don't seem to have this issue an=
d
> nothing seems particularly wrong with the wrapper itself. Could be a
> manifestation of multiple issues though, considering how much the behavio=
r
> changes depending on what pam modules are loaded.
>
> Guess I have some reading to do this weekend.
>
> - Randolph

Found out that specifying the noreap option for pam_unix in the account con=
text
fixes things. Suppose go was having issues with the new signal handler bein=
g
registered in _unix_run_verify_binary. Still weird that it was only really =
an
issue on i386/x86, and only in this environment.

This means we can't inherit the common-account, we'll have to require pam_u=
nix
as part of the pam.conf directly. There's also a conditional fork in the
pam_unix password path with another signal handler that we should probably =
guard
against to prevent issues with selinux configs.

I'm still not entirely satisfied with this debug. Something seems off, but =
given
go's use of coroutines it would make sense this would cause *some* issue. S=
till
odd. I'll poke around a bit more.

- Randolph

