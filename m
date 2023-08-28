Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F546C71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 16:22:30 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.18881.1693239747115478565
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 09:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=rqG+tk/d;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37SGML6m082778;
	Mon, 28 Aug 2023 11:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693239741;
	bh=vkip/sHrkN955VLYStpe7sx0qDxkQfg3I0qF5zUF9P4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rqG+tk/drkNsx0G/1diBNvUWkTtSOtcRCXM8flbV4DHmKLfh395dcYVCm+f7m2ULX
	 xCmEj5BGYkUMcRkSoAOmn+hT3k51rT1WkKc1I5+YNsQ8u0sKJk78LVk3k7mHGl4fsc
	 HB1wrgxWwt0xhDkjRg8M3QMYd+KGthbFwHnl/3QI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37SGMLgK040530
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Aug 2023 11:22:21 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Aug 2023 11:22:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Aug 2023 11:22:21 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37SGMLv4104285;
	Mon, 28 Aug 2023 11:22:21 -0500
Message-ID: <0dc0924a-587e-44f5-a264-b78a6f470412@ti.com>
Date: Mon, 28 Aug 2023 11:22:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [oe][OE-core][Patch 0/1] Revert
 "bin_package.bbclass: Inhibit the default dependencies"
Content-Language: en-US, en-US-large
To: Max Krummenacher <max.oss.09@gmail.com>
CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Max Krummenacher
	<max.krummenacher@toradex.com>
References: <20230827080953.2005190-1-max.oss.09@gmail.com>
 <DB5PR02MB1021304FFF37BA67288997ADDEFE1A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <177F942FA4953D34.1521@lists.openembedded.org>
 <CAEHkU3XsGEHZzvL=cy_p83zDs4WURHknpAQP4FRqZ_nCLLbwRQ@mail.gmail.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <CAEHkU3XsGEHZzvL=cy_p83zDs4WURHknpAQP4FRqZ_nCLLbwRQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 37SGML6m082778
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 16:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186837

On 8/28/23 10:09, Max Krummenacher wrote:
> On Mon, Aug 28, 2023 at 5:01=E2=80=AFPM Max Krummenacher via
> lists.openembedded.org <max.oss.09=3Dgmail.com@lists.openembedded.org>
> wrote:
>>
>> On Sun, Aug 27, 2023 at 11:23=E2=80=AFPM Peter Kjellerstedt
>> <peter.kjellerstedt@axis.com> wrote:
>>>
>>>> -----Original Message-----
>>>> From: Max Krummenacher <max.oss.09@gmail.com>
>>>> Sent: den 27 augusti 2023 10:10
>>>> To: openembedded-core@lists.openembedded.org; Peter Kjellerstedt
>>>> <peter.kjellerstedt@axis.com>
>>>> Cc: Max Krummenacher <max.krummenacher@toradex.com>; Randolph Sapp
>>>> <rs@ti.com>
>>>> Subject: [oe][OE-core][Patch 0/1] Revert "bin_package.bbclass: Inhib=
it the
>>>> default dependencies"
>>>>
>>>> From: Max Krummenacher <max.krummenacher@toradex.com>
>>>>
>>>> Hi
>>>>
>>>> With commit d1d09bd4d7 ("bin_package.bbclass: Inhibit the default
>>>> dependencies") applied I'm getting a lot of these errors, i.e. qa
>>>> does miss libc and compiler provided libs:
>>>>
>>>> ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue:
>>>> /usr/lib/libusc.so.23.1.6404501 contained in package ti-img-rogue-um=
libs
>>>> requires ld-linux-aarch64.so.1(GLIBC_2.17)(64bit), but no providers =
found
>>>> in RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
>>>> ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue:
>>>> /usr/lib/libusc.so.23.1.6404501 contained in package ti-img-rogue-um=
libs
>>>> requires libc.so.6(GLIBC_2.17)(64bit), but no providers found in
>>>> RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
>>>> ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue:
>>>> /usr/lib/libufwriter.so.23.1.6404501 contained in package ti-img-rog=
ue-
>>>> umlibs requires libstdc++.so.6(GLIBCXX_3.4.14)(64bit), but no provid=
ers
>>>> found in RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
>>>>
>>>> Reverting the commit makes the build pass, alternatively adding
>>>> to depends in the recipe which is using the bin_package class
>>>> fixes it too:
>>>>
>>>> DEPENDS +=3D " virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
>>>>
>>>> I'd prefer reverting removing the default dependencies over fixing
>>>> each of the recipes which do use the bin_package class to actually
>>>> install binaries running in the target user space.
>>>>
>>>> Any opinions?
>>>
>>> Bummer. I guess we will have to update our recipes individually
>>> instead. :(
>>
>>  From the bugzilla entry [1] which added the feature and from the comm=
it
>> adding the class [2] it looks to me that the class should simplify add=
ing
>> binaries externally built for the target.
>> Having the users of the class having to add the used libc / compiler
>> shared objects to not trigger a qa warning seems really wrong to me.
>>
>> Additionally I don't see the advantage in not installing the base
>> dependencies. Doing anything usefull in a build would need to build
>> them anyway for some other recipe, so one would save creating a few
>> hard links. Do I miss something here?
>>
>> So IMHO a recipe which inherits the class and really does not like the
>> default dependencies should add the `INHIBIT_DEFAULT_DEPS =3D "1"`.
>=20
> Adding the missing links, sorry about that:
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1592
> [2] https://www.openembedded.org/pipermail/openembedded-core/2012-Septe=
mber/067782.html

Thanks for bringing this to light Max. I have no opinion in this. I=20
understand not wanting to implicitly depending on anything. After all,=20
explicit is always nice for those that don't want to navigate the full=20
include chain to figure out recipe dependencies. It's also nicer for a=20
minimal build (though arguably not in this case because these are core=20
packages we're depending on).

If this is going to be the standard moving forward please let me know so=20
I can update this recipe accordingly.

