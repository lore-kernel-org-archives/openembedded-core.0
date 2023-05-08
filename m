Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECC2C77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 18:14:20 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.115707.1683569652711980035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 May 2023 11:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=vtvwyHpv;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 348IDxZb089336;
	Mon, 8 May 2023 13:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683569639;
	bh=XpGk3xXM90K7uFsoNCPneS16cXJw2LiuolKYKJJ6rIE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vtvwyHpvfVxq5XCc1lrY9bcP5799UT884bNiJp/LN+mw81Sv4mYNjBTBRMpa/iVT/
	 Xu26bI7a/I31GRhzkmSNVl6nGVYyZiZzfHnFwpf0Yu3dplXj9NL09KSPnzYTiFzEgR
	 /qMr1TdSgWMcVPSeQfkbHjBGLNTDuWqdItgfCZZk=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 348IDxDa079479
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 May 2023 13:13:59 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 May 2023 13:13:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 May 2023 13:13:59 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 348IDwJc091589;
	Mon, 8 May 2023 13:13:58 -0500
Message-ID: <b305b819-8772-61d0-5ec6-3e23fd190d62@ti.com>
Date: Mon, 8 May 2023 13:13:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [EXTERNAL] RE: [OE-core][PATCH] kernel-devicetree: allow
 specification of dtb directory
Content-Language: en-US, en-US-large
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        Martin Jansa
	<martin.jansa@gmail.com>
CC: "afd@ti.com" <afd@ti.com>, "detheridge@ti.com" <detheridge@ti.com>,
        "reatmon@ti.com" <reatmon@ti.com>, "denis@denix.org" <denis@denix.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20230505163601.6708-1-rs@ti.com>
 <CA+chaQd0iy1pv1QBhueS1fbpu0=fPzOU9Unr7+ROnGntuOUOcA@mail.gmail.com>
 <DB5PR02MB10213095D76376494151E4B01EF709@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CA+chaQfuTxjoqm8RJO6RARF031YEmBa2g3dZo_A0b5TX7XB9vA@mail.gmail.com>
 <DB5PR02MB102130440F80045AD512A1668EF719@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <DB5PR02MB102130440F80045AD512A1668EF719@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 348IDxZb089336
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 18:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181023

On 5/8/23 01:13, Peter Kjellerstedt wrote:
> That is most certainly a good alternative.
>=20
> //Peter
>=20
> *From:*Martin Jansa <martin.jansa@gmail.com>
> *Sent:* den 8 maj 2023 00:20
> *To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> *Cc:* rs@ti.com; afd@ti.com; detheridge@ti.com; reatmon@ti.com;=20
> denis@denix.org; alexandre.belloni@bootlin.com;=20
> openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core][PATCH] kernel-devicetree: allow specification=20
> of dtb directory
>=20
> or
>=20
> if "${@'true' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else=20
> 'false'}=20
> <mailto:$%7b@'true'%20if%20oe.types.boolean(d.getVar('KERNEL_DTBVENDORE=
D'))%20else%20'false'%7d>"; then
>=20
> to avoid test as well (like systemd recipes is using) and I did here as=
=20
> well in:
>=20
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djans=
a/master&id=3De2a6da5202a6671113758f9746ddbd8141a75757 <https://git.opene=
mbedded.org/openembedded-core-contrib/commit/?h=3Djansa/master&id=3De2a6d=
a5202a6671113758f9746ddbd8141a75757>
>=20
> On Sun, May 7, 2023 at 10:49=E2=80=AFPM Peter Kjellerstedt=20
> <peter.kjellerstedt@axis.com <mailto:peter.kjellerstedt@axis.com>> wrot=
e:
>=20
>     [ Outlook does not support commenting inline for HTML mails, thus
>     I=E2=80=99m top posting=E2=80=A6]
>=20
>     The problem is `=3D=3D`, which is a bashism. POSIX shells (like das=
h)
>     only support `=3D`. When it comes to quoting, you typically want to
>     quote shell variables in tests in case they are empty. OTOH, static
>     strings without whitespace or other special characters do not need
>     quoting. So the correct way to write the if statements is:
>=20
>      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if [ "${KERNEL_DTBVENDORED}" =3D false ]; then
>=20
>     (In this case it is actually a bitbake variable being quoted, but
>     unless you can guarantee it is not empty, the same rule applies.)
>=20
>     //Peter
>=20
>     *From:*openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org>
>     <openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org>> *On Behalf Of
>     *Martin Jansa
>     *Sent:* den 6 maj 2023 11:10
>     *To:* rs@ti.com <mailto:rs@ti.com>
>     *Cc:* afd@ti.com <mailto:afd@ti.com>; detheridge@ti.com
>     <mailto:detheridge@ti.com>; reatmon@ti.com <mailto:reatmon@ti.com>;
>     denis@denix.org <mailto:denis@denix.org>;
>     alexandre.belloni@bootlin.com
>     <mailto:alexandre.belloni@bootlin.com>;
>     openembedded-core@lists.openembedded.org
>     <mailto:openembedded-core@lists.openembedded.org>
>     *Subject:* Re: [OE-core][PATCH] kernel-devicetree: allow
>     specification of dtb directory
>=20
>     On Fri, May 5, 2023 at 6:38=E2=80=AFPM Randolph Sapp via
>     lists.openembedded.org <http://lists.openembedded.org>
>     <rs=3Dti.com@lists.openembedded.org
>     <mailto:ti.com@lists.openembedded.org>> wrote:
>=20
>         From: Randolph Sapp <rs@ti.com <mailto:rs@ti.com>>
>=20
>         Fedora/Redhat and Arch are somewhat standardized on their dtb
>         directory
>         structure. Let's add some flags to configure yocto to mimic tha=
t
>         behavior.
>=20
>         Add the following variables to the kernel class:
>          =C2=A0 =C2=A0 =C2=A0 =C2=A0 - KERNEL_DTBDEST (controls the des=
tination directory
>         for dtbs)
>          =C2=A0 =C2=A0 =C2=A0 =C2=A0 - KERNEL_DTBVENDORED (controls if =
vendor subdirectories
>         are to
>          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be respected)
>=20
>         Currently KERNEL_DTBDEST is expected to be a subdir of
>         KERNEL_IMAGEDEST
>         and KERNEL_DTBVENDORED is expected to be "true"/"false". This o=
nly
>         applies to the package directory structure. The deploydir
>         structure is
>         purposely left untouched for compatibility with existing recipe=
s.
>=20
>         By default this is configured to behave the same as the current
>         recipe
>         and produce a flat dtb directory at KERNEL_IMAGEDEST.
>=20
>         Signed-off-by: Randolph Sapp <rs@ti.com <mailto:rs@ti.com>>
>         ---
>=20
>         Well, suppose I was breaking things by submitting this to kirks=
tone
>         first. This is just the master version of the following patchse=
t:
>         https://lists.openembedded.org/g/openembedded-core/message/1807=
54 <https://lists.openembedded.org/g/openembedded-core/message/180754>
>=20
>         I'd love to get that series merged as well if this patch is
>         acceptable.
>=20
>          =C2=A0meta/classes-recipe/kernel-devicetree.bbclass | 22
>         ++++++++++++++-----
>          =C2=A0meta/classes-recipe/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++
>          =C2=A02 files changed, 19 insertions(+), 5 deletions(-)
>=20
>         diff --git a/meta/classes-recipe/kernel-devicetree.bbclass
>         b/meta/classes-recipe/kernel-devicetree.bbclass
>         index 4d0ecb1032..a6c6c5f227 100644
>         --- a/meta/classes-recipe/kernel-devicetree.bbclass
>         +++ b/meta/classes-recipe/kernel-devicetree.bbclass
>         ...
>=20
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_bas=
e_name=3D`basename $dtb .$dtb_ext`
>          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_pa=
th=3D`get_real_dtb_path_in_kernel "$dtb"`
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install=
 -m 0644 $dtb_path
>         ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${=
KERNEL_DTBVENDORED} =3D=3D "false" ]; then
>=20
>     dash doesn't like this:
>=20
>      =C2=A0/bin/dash -c "if [ false =3D=3D "false" ]; then echo foo; fi=
"
>=20
>     add quotes or use single '=3D'.
>=20
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0dtb_ext=3D${dtb##*.}
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0dtb_base_name=3D`basename $dtb .$dtb_ext`
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0dtb=3D$dtb_base_name.$dtb_ext
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install=
 -Dm 0644 $dtb_path
>         ${D}/${KERNEL_DTBDEST}/$dtb
>          =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
>          =C2=A0}
>=20
>         @@ -88,7 +97,10 @@ do_deploy:append() {
>          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_ex=
t=3D${dtb##*.}
>          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_ba=
se_name=3D`basename $dtb .$dtb_ext`
>          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 instal=
l -d $deployDir
>         -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install=
 -m 0644
>         ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
>         $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ${=
KERNEL_DTBVENDORED} =3D=3D "false" ]; then
>=20
>     Same here
>=20
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0dtb=3D$dtb_base_name.$dtb_ext
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>         +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install=
 -m 0644 ${D}/${KERNEL_DTBDEST}/$dtb
>         $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
>          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ "=
${KERNEL_IMAGETYPE_SYMLINK}" =3D "1" ] ; then
>          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ln -sf
>         $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
>         $deployDir/$dtb_base_name.$dtb_ext
>          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>=20

Ah, my bad. I need to figure out a way to get shellcheck to run on bash=20
blocks in bb recipes. Would save everyone some time. I'll submit a V2=20
with your modifications Martin!

