Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568EBC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 23:49:47 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.8262.1749253786651422428
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 16:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=W3+sI+0V;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 556NnO9L326311;
	Fri, 6 Jun 2025 18:49:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749253764;
	bh=LbMvrCR/tgZqjlhXdPLLbpLcfx0t0XfNwbCtFlQTYXY=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=W3+sI+0VJROWEsnrPjJEqlZlV+5Uc+TrLbemDuUJWQgwagJKjij9zLUkPJ5bg3SQm
	 gBUppLq2H6Rw/Xar09PMLgZC50NRNuac0yW0srp/tJL8sTyCycejycIKWkl5xDjqzI
	 vD7YRDygq1Y/08tbaJOGEdsxp5maGzcTCurdWC8Q=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 556NnOVw2010307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 6 Jun 2025 18:49:24 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Jun 2025 18:49:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Jun 2025 18:49:24 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 556NnOc71702062;
	Fri, 6 Jun 2025 18:49:24 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 6 Jun 2025 18:49:24 -0500
Message-ID: <DAFUPHGYYRT1.2FFSY7HLVS32B@ti.com>
CC: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv6 0/5] Display manager proposal for x11 and
 wayland
From: Randolph Sapp <rs@ti.com>
To: Randolph Sapp <rs@ti.com>,
        Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>,
        <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>,
        <alex@linutronix.de>, <otavio@ossystems.com.br>,
        <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250520233935.740242-1-rs@ti.com>
 <DA1YOI4L8TYX.ALF8S230UTO1@bootlin.com> <DA7AGREX7HJ9.33KJKYJPO1A3N@ti.com>
 <DA7RUET7783J.484RLJVMFOCZ@bootlin.com> <DAE5YENHYCZ0.39HEAHC58A3FV@ti.com>
In-Reply-To: <DAE5YENHYCZ0.39HEAHC58A3FV@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 23:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218190

On Wed Jun 4, 2025 at 7:12 PM CDT, Randolph Sapp wrote:
> On Wed May 28, 2025 at 6:53 AM CDT, Mathieu Dubois-Briand wrote:
>> On Wed May 28, 2025 at 12:16 AM CEST, Randolph Sapp wrote:
>
> [snip]
>
>>> Ah, the auth failures persist. Normally this is caused when the user at=
tempts to
>>> login before the user account was created or something unusual like tha=
t. I
>>> don't suppose there's any way this could be happening on the test machi=
nes?
>>>
>>> I'm not able to reproduce this locally, but my build config is differen=
t. I tend
>>> to use oe-core and nodistro instead of poky. They aren't playing around=
 with the
>>> reproducible build date stuff or anything like that are they?
>>>
>>> Well, I mean I did see this on occasion. The first login attempt almost=
 always
>>> failed, but the subsequent attempts were fine. Bumping the attempt coun=
t back up
>>> the default (2) was enough to resolve it on my end, but evidently it's =
not
>>> enough here.
>>>
>>> This is not happening on hardware from what I'm seeing.
>>
>> Hi Randolph,
>>
>> I was able to reproduce it locally, with the following configuration:
>> - https://git.yoctoproject.org/poky-ci-archive on tag
>>   autobuilder.yoctoproject.org/valkyrie/a-full-1630.
>> - template local.conf, with the following modifications:
>>   MACHINE =3D "qemux86"
>>   DISTRO =3D "poky-altcfg"
>>   SDKMACHINE =3D "x86_64"
>>   PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
>>   INHERIT +=3D 'image-buildinfo'
>>   IMAGE_BUILDINFO_VARS:append =3D ' IMAGE_BASENAME IMAGE_NAME'
>>   PACKAGE_CLASSES =3D 'package_ipk package_rpm package_deb'
>>   IMAGE_ROOTFS_EXTRA_SPACE:append =3D '${@bb.utils.contains('IMAGE_FEATU=
RES', 'package-management', ' + 262144', '', d)}'
>>   IMAGE_INSTALL:append =3D ' ssh-pregen-hostkeys'
>>   SANITY_TESTED_DISTROS =3D ''
>>   OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder core/yocto-autob=
uilder/autobuilder-resource-constraints'
>>   # (Plus my own sstate cache and downloads dir).
>> - bitbake core-image-sato
>> - bitbake core-image-sato:do_testimage
>>
>> Of course using the tag from poky-ci-archive is not mandatory, you
>> should see the same behaviour with master branch and your patches.
>>
>> I saw some oe-selftest was also failing on the autobuilder, with an
>> error related to emptty. You can reproduce it with:
>>
>> oe-selftest -r sstatetests.SStateHashSameSigs3.test_sstate_sametune_same=
sigs
>
> Status report, since it's been a little bit.
>
> Seems this some i386/x86 fault only exposed in this specific environment.=
 I was
> unable to reproduce it on Archlinux32. I've traced it back to a SEGFAULT =
when we
> attempt to execute mcookie as the target user. Odd stuff. Delve and gdb a=
ren't
> helping me here. Running some more tests to see if I can corner this some=
 other
> way.
>
> - Randolph

Well, I managed to determine this is specifically an issue after loading li=
bpam
and attempting to authenticate.

Seems like loading both common-auth and common-account before calling
pam_acct_mgmt results in the above described segfault.

There are 3 pam interactions made after the initial auth.
	1. pam_acct_mgmt
	2. pam_set_item
	3. pam_setcred

Loading only common-account reports that pam_acct_mgmt fails with the PAM_S=
ILENT
flag set.

Removing that flag makes the later pam_setcred fail, but allows pam_acct_mg=
mt
and pam_set_item to work correctly. Removing the call to pam_acct_mgmt
altogether seems to allow pam_setcred to work.

Removing the call to pam_acct_mgmt also allows both common-auth and
common-account to be loaded without triggering the segfault.

Very unusual. Everything points at the obvious "arch specific problems with=
 the
go pam wrapper", but other distributions don't seem to have this issue and
nothing seems particularly wrong with the wrapper itself. Could be a
manifestation of multiple issues though, considering how much the behavior
changes depending on what pam modules are loaded.

Guess I have some reading to do this weekend.

- Randolph

