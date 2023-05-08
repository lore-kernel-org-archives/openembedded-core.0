Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1157C7EE22
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 18:19:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.115851.1683569988833101491
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 May 2023 11:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C934A40C5D;
	Mon,  8 May 2023 18:19:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwkPnFtHLb_U; Mon,  8 May 2023 18:19:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6C56540A03;
	Mon,  8 May 2023 18:19:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A3EF91638C9; Mon,  8 May 2023 14:18:57 -0400 (EDT)
Date: Mon, 8 May 2023 14:18:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Randolph Sapp <rs@ti.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Martin Jansa <martin.jansa@gmail.com>, "afd@ti.com" <afd@ti.com>,
	"detheridge@ti.com" <detheridge@ti.com>,
	"reatmon@ti.com" <reatmon@ti.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [EXTERNAL] RE: [OE-core][PATCH] kernel-devicetree: allow
 specification of dtb directory
Message-ID: <20230508181857.GP9226@denix.org>
References: <20230505163601.6708-1-rs@ti.com>
 <CA+chaQd0iy1pv1QBhueS1fbpu0=fPzOU9Unr7+ROnGntuOUOcA@mail.gmail.com>
 <DB5PR02MB10213095D76376494151E4B01EF709@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CA+chaQfuTxjoqm8RJO6RARF031YEmBa2g3dZo_A0b5TX7XB9vA@mail.gmail.com>
 <DB5PR02MB102130440F80045AD512A1668EF719@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <b305b819-8772-61d0-5ec6-3e23fd190d62@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b305b819-8772-61d0-5ec6-3e23fd190d62@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 May 2023 18:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181024

On Mon, May 08, 2023 at 01:13:58PM -0500, Randolph Sapp wrote:
> On 5/8/23 01:13, Peter Kjellerstedt wrote:
> >That is most certainly a good alternative.
> >
> >//Peter
> >
> >*From:*Martin Jansa <martin.jansa@gmail.com>
> >*Sent:* den 8 maj 2023 00:20
> >*To:* Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> >*Cc:* rs@ti.com; afd@ti.com; detheridge@ti.com; reatmon@ti.com;
> >denis@denix.org; alexandre.belloni@bootlin.com;
> >openembedded-core@lists.openembedded.org
> >*Subject:* Re: [OE-core][PATCH] kernel-devicetree: allow
> >specification of dtb directory
> >
> >or
> >
> >if "${@'true' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED'))
> >else 'false'} <mailto:$%7b@'true'%20if%20oe.types.boolean(d.getVar('KE=
RNEL_DTBVENDORED'))%20else%20'false'%7d>";
> >then
> >
> >to avoid test as well (like systemd recipes is using) and I did
> >here as well in:
> >
> >https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djan=
sa/master&id=3De2a6da5202a6671113758f9746ddbd8141a75757 <https://git.open=
embedded.org/openembedded-core-contrib/commit/?h=3Djansa/master&id=3De2a6=
da5202a6671113758f9746ddbd8141a75757>
> >
> >On Sun, May 7, 2023 at 10:49=E2=80=AFPM Peter Kjellerstedt
> ><peter.kjellerstedt@axis.com <mailto:peter.kjellerstedt@axis.com>>
> >wrote:
> >
> >    [ Outlook does not support commenting inline for HTML mails, thus
> >    I=E2=80=99m top posting=E2=80=A6]
> >
> >    The problem is `=3D=3D`, which is a bashism. POSIX shells (like da=
sh)
> >    only support `=3D`. When it comes to quoting, you typically want t=
o
> >    quote shell variables in tests in case they are empty. OTOH, stati=
c
> >    strings without whitespace or other special characters do not need
> >    quoting. So the correct way to write the if statements is:
> >
> >     =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if [ "${KERNEL_DTBVENDORED}" =3D false ]; then
> >
> >    (In this case it is actually a bitbake variable being quoted, but
> >    unless you can guarantee it is not empty, the same rule applies.)
> >
> >    //Peter
> >
> >    *From:*openembedded-core@lists.openembedded.org
> >    <mailto:openembedded-core@lists.openembedded.org>
> >    <openembedded-core@lists.openembedded.org
> >    <mailto:openembedded-core@lists.openembedded.org>> *On Behalf Of
> >    *Martin Jansa
> >    *Sent:* den 6 maj 2023 11:10
> >    *To:* rs@ti.com <mailto:rs@ti.com>
> >    *Cc:* afd@ti.com <mailto:afd@ti.com>; detheridge@ti.com
> >    <mailto:detheridge@ti.com>; reatmon@ti.com <mailto:reatmon@ti.com>=
;
> >    denis@denix.org <mailto:denis@denix.org>;
> >    alexandre.belloni@bootlin.com
> >    <mailto:alexandre.belloni@bootlin.com>;
> >    openembedded-core@lists.openembedded.org
> >    <mailto:openembedded-core@lists.openembedded.org>
> >    *Subject:* Re: [OE-core][PATCH] kernel-devicetree: allow
> >    specification of dtb directory
> >
> >    On Fri, May 5, 2023 at 6:38=E2=80=AFPM Randolph Sapp via
> >    lists.openembedded.org <http://lists.openembedded.org>
> >    <rs=3Dti.com@lists.openembedded.org
> >    <mailto:ti.com@lists.openembedded.org>> wrote:
> >
> >        From: Randolph Sapp <rs@ti.com <mailto:rs@ti.com>>
> >
> >        Fedora/Redhat and Arch are somewhat standardized on their dtb
> >        directory
> >        structure. Let's add some flags to configure yocto to mimic th=
at
> >        behavior.
> >
> >        Add the following variables to the kernel class:
> >         =C2=A0 =C2=A0 =C2=A0 =C2=A0 - KERNEL_DTBDEST (controls the de=
stination directory
> >        for dtbs)
> >         =C2=A0 =C2=A0 =C2=A0 =C2=A0 - KERNEL_DTBVENDORED (controls if=
 vendor subdirectories
> >        are to
> >         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be respected)
> >
> >        Currently KERNEL_DTBDEST is expected to be a subdir of
> >        KERNEL_IMAGEDEST
> >        and KERNEL_DTBVENDORED is expected to be "true"/"false". This =
only
> >        applies to the package directory structure. The deploydir
> >        structure is
> >        purposely left untouched for compatibility with existing recip=
es.
> >
> >        By default this is configured to behave the same as the curren=
t
> >        recipe
> >        and produce a flat dtb directory at KERNEL_IMAGEDEST.
> >
> >        Signed-off-by: Randolph Sapp <rs@ti.com <mailto:rs@ti.com>>
> >        ---
> >
> >        Well, suppose I was breaking things by submitting this to kirk=
stone
> >        first. This is just the master version of the following patchs=
et:
> >        https://lists.openembedded.org/g/openembedded-core/message/180=
754 <https://lists.openembedded.org/g/openembedded-core/message/180754>
> >
> >        I'd love to get that series merged as well if this patch is
> >        acceptable.
> >
> >         =C2=A0meta/classes-recipe/kernel-devicetree.bbclass | 22
> >        ++++++++++++++-----
> >         =C2=A0meta/classes-recipe/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++
> >         =C2=A02 files changed, 19 insertions(+), 5 deletions(-)
> >
> >        diff --git a/meta/classes-recipe/kernel-devicetree.bbclass
> >        b/meta/classes-recipe/kernel-devicetree.bbclass
> >        index 4d0ecb1032..a6c6c5f227 100644
> >        --- a/meta/classes-recipe/kernel-devicetree.bbclass
> >        +++ b/meta/classes-recipe/kernel-devicetree.bbclass
> >        ...
> >
> >        -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_ba=
se_name=3D`basename $dtb .$dtb_ext`
> >         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_p=
ath=3D`get_real_dtb_path_in_kernel "$dtb"`
> >        -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0instal=
l -m 0644 $dtb_path
> >        ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
> >        +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $=
{KERNEL_DTBVENDORED} =3D=3D "false" ]; then
> >
> >    dash doesn't like this:
> >
> >     =C2=A0/bin/dash -c "if [ false =3D=3D "false" ]; then echo foo; f=
i"
> >
> >    add quotes or use single '=3D'.
> >
> >        +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0dtb_ext=3D${dtb##*.}
> >        +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0dtb_base_name=3D`basename $dtb .$dtb_ext`
> >        +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0dtb=3D$dtb_base_name.$dtb_ext
> >        +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> >        +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0instal=
l -Dm 0644 $dtb_path
> >        ${D}/${KERNEL_DTBDEST}/$dtb
> >         =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
> >         =C2=A0}
> >
> >        @@ -88,7 +97,10 @@ do_deploy:append() {
> >         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_e=
xt=3D${dtb##*.}
> >         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_b=
ase_name=3D`basename $dtb .$dtb_ext`
> >         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insta=
ll -d $deployDir
> >        -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0instal=
l -m 0644
> >        ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
> >        $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
> >        +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $=
{KERNEL_DTBVENDORED} =3D=3D "false" ]; then
> >
> >    Same here
> >
> >        +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0dtb=3D$dtb_base_name.$dtb_ext
> >        +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> >        +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0instal=
l -m 0644 ${D}/${KERNEL_DTBDEST}/$dtb
> >        $deployDir/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
> >         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ =
"${KERNEL_IMAGETYPE_SYMLINK}" =3D "1" ] ; then
> >         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 ln -sf
> >        $dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
> >        $deployDir/$dtb_base_name.$dtb_ext
> >         =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> >
>=20
> Ah, my bad. I need to figure out a way to get shellcheck to run on
> bash blocks in bb recipes. Would save everyone some time. I'll
> submit a V2 with your modifications Martin!

No V2 - it already got merged into master. Moreover, due to this oversigh=
t, it=20
defaults to "vendored" DT install in some builds, where bash is not the s=
ystem=20
shell...

We should merge Martin's fix from his contrib tree ASAP.

--=20
Denys

