Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4673C77B7F
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 18:43:10 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.116502.1683571383390697944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 May 2023 11:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=f141uvc7;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 348Igp4m008116;
	Mon, 8 May 2023 13:42:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683571371;
	bh=WQInkIivuJKyFeq5USbnWyoA8AE5OuBKLSs8VLAT2Xo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=f141uvc7qIEnsvxkVdd0qcXBKvLJwMRERpg59E3p6TfJxwTcnF680jPucVWP+nwh4
	 zE/w4vTy7eupFbqTMSR6xS+WtrA17xPeJQ1uCHoy1aNZQVP5AmJbZU5gpjmaQUZjBk
	 aULvAIrd4TA1bJqXmLQOw4LHJ0JCLnz+Xu5TtNFY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 348Igpfb096634
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 May 2023 13:42:51 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 May 2023 13:42:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 May 2023 13:42:50 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 348Igoiv017878;
	Mon, 8 May 2023 13:42:50 -0500
Message-ID: <41c7e82e-c480-1267-de4c-7d44cae9de0e@ti.com>
Date: Mon, 8 May 2023 13:42:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [EXTERNAL] Re: [OE-core][PATCH] kernel-devicetree: allow
 specification of dtb directory
Content-Language: en-US, en-US-large
To: Denys Dmytriyenko <denis@denix.org>
CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        Martin Jansa
	<martin.jansa@gmail.com>, "afd@ti.com" <afd@ti.com>,
        "detheridge@ti.com"
	<detheridge@ti.com>,
        "reatmon@ti.com" <reatmon@ti.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20230505163601.6708-1-rs@ti.com>
 <CA+chaQd0iy1pv1QBhueS1fbpu0=fPzOU9Unr7+ROnGntuOUOcA@mail.gmail.com>
 <DB5PR02MB10213095D76376494151E4B01EF709@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CA+chaQfuTxjoqm8RJO6RARF031YEmBa2g3dZo_A0b5TX7XB9vA@mail.gmail.com>
 <DB5PR02MB102130440F80045AD512A1668EF719@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <b305b819-8772-61d0-5ec6-3e23fd190d62@ti.com>
 <175D3DFC66A1C041.2502@lists.openembedded.org>
 <20230508183225.GQ9226@denix.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230508183225.GQ9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 348Igp4m008116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 18:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181026

On 5/8/23 13:32, Denys Dmytriyenko wrote:
> On Mon, May 08, 2023 at 02:18:57PM -0400, Denys Dmytriyenko wrote:
>> On Mon, May 08, 2023 at 01:13:58PM -0500, Randolph Sapp wrote:
>>> On 5/8/23 01:13, Peter Kjellerstedt wrote:
>>>> That is most certainly a good alternative.
>>>>
>>>> //Peter
>>>>
>>>> *From:*Martin Jansa <martin.jansa@gmail.com>
>>>> *Sent:* den 8 maj 2023 00:20
>>>> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>>>> *Cc:* rs@ti.com; afd@ti.com; detheridge@ti.com; reatmon@ti.com;
>>>> denis@denix.org; alexandre.belloni@bootlin.com;
>>>> openembedded-core@lists.openembedded.org
>>>> *Subject:* Re: [OE-core][PATCH] kernel-devicetree: allow
>>>> specification of dtb directory
>>>>
>>>> or
>>>>
>>>> if "${@'true' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED'))
>>>> else 'false'} <mailto:$%7b@'true'%20if%20oe.types.boolean(d.getVar('=
KERNEL_DTBVENDORED'))%20else%20'false'%7d>";
>>>> then
>>>>
>>>> to avoid test as well (like systemd recipes is using) and I did
>>>> here as well in:
>>>>
>>>> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dj=
ansa/master&id=3De2a6da5202a6671113758f9746ddbd8141a75757 <https://git.op=
enembedded.org/openembedded-core-contrib/commit/?h=3Djansa/master&id=3De2=
a6da5202a6671113758f9746ddbd8141a75757>
>>>>
>>>> On Sun, May 7, 2023 at 10:49=E2=80=AFPM Peter Kjellerstedt
>>>> <peter.kjellerstedt@axis.com <mailto:peter.kjellerstedt@axis.com>>
>>>> wrote:
>>>>
>>>>     [ Outlook does not support commenting inline for HTML mails, thu=
s
>>>>     I=E2=80=99m top posting=E2=80=A6]
>>>>
>>>>     The problem is `=3D=3D`, which is a bashism. POSIX shells (like =
dash)
>>>>     only support `=3D`. When it comes to quoting, you typically want=
 to
>>>>     quote shell variables in tests in case they are empty. OTOH, sta=
tic
>>>>     strings without whitespace or other special characters do not ne=
ed
>>>>     quoting. So the correct way to write the if statements is:
>>>>
>>>>      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if [ "${KERNEL_DTBVENDORED}" =3D false ]; then
>>>>
>>>>     (In this case it is actually a bitbake variable being quoted, bu=
t
>>>>     unless you can guarantee it is not empty, the same rule applies.=
)
>>>>
>>>>     //Peter
>=20
> <snip>
>=20
>=20
>>> Ah, my bad. I need to figure out a way to get shellcheck to run on
>>> bash blocks in bb recipes. Would save everyone some time. I'll
>>> submit a V2 with your modifications Martin!
>>
>> No V2 - it already got merged into master. Moreover, due to this overs=
ight, it
>> defaults to "vendored" DT install in some builds, where bash is not th=
e system
>> shell...
>>
>> We should merge Martin's fix from his contrib tree ASAP.
>=20
> BTW, there are other nuisances with this change:
>=20
> https://patchwork.yoctoproject.org/project/ti/patch/20230508181551.2404=
141-1-denis@denix.org/
>=20
> Not sure how common the use of third level in KERNEL_DTBDEST dir struct=
ure is,
> maybe we should add a third level generic glob to OE-Core to be safe...
>=20

May just be a better idea to have a python / bash function to find all=20
related files recursively. Technically there is no set depth to the=20
kernel dtb structure. They just tend to idle around 2/3.

