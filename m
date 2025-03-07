Return-Path: <louis.rannou@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EB7C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 07:46:07 +0000 (UTC)
Received: from 1.mo550.mail-out.ovh.net (1.mo550.mail-out.ovh.net [178.32.127.22])
 by mx.groups.io with SMTP id smtpd.web10.6256.1741333559793295839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 23:46:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@syslinbit.com header.s=ovhmo4479509-selector1 header.b=QSr+OWSi;
 spf=softfail (domain: syslinbit.com, ip: 178.32.127.22, mailfrom: louis.rannou@syslinbit.com)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.17.93])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4Z8JHn5Vkpz1R7L
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Mar 2025 07:45:57 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-jlktv (unknown [10.110.96.192])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id D116F1FE10;
	Fri,  7 Mar 2025 07:45:56 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.96])
	by ghost-submission-5b5ff79f4f-jlktv with ESMTPSA
	id +2iuJTSkymcrshAASOXjJw
	(envelope-from <louis.rannou@syslinbit.com>); Fri, 07 Mar 2025 07:45:56 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-96R00113b4b1d2-0a6c-4997-acc9-efa252f61537,
                    41C07068488AB225264E31DD5BD4A72BFCDE237E) smtp.auth=louis.rannou@syslinbit.com
X-OVh-ClientIp: 45.81.62.9
Message-ID: <6209fffe-ae60-4379-b991-9ac6c1bafde3@syslinbit.com>
Date: Fri, 7 Mar 2025 08:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] classes/kernel: add QA to check required or
 forbidden kernel configs
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, pascal.eberhard@se.com,
 Louis Rannou <louis.rannou@non.se.com>
References: <20250306-qa_kernel-v1-1-e83431c29799@syslinbit.com>
 <CADkTA4ObLCgE_Ra9QoxYSJXYE-Wb8L3VVZ8B9j3jv9=XszxKug@mail.gmail.com>
Content-Language: en-US
From: Louis Rannou <louis.rannou@syslinbit.com>
In-Reply-To: <CADkTA4ObLCgE_Ra9QoxYSJXYE-Wb8L3VVZ8B9j3jv9=XszxKug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Ovh-Tracer-Id: 11832363596044557633
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefnohhuihhsucftrghnnhhouhcuoehlohhuihhsrdhrrghnnhhouhesshihshhlihhnsghithdrtghomheqnecuggftrfgrthhtvghrnhepveehffefheekheevkedvfeehvdejhfegueehheeuvdeivdeitdeigedtjeetkedvnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucfkphepuddvjedrtddrtddruddpgeehrdekuddriedvrdelpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheplhhouhhishdrrhgrnhhnohhusehshihslhhinhgsihhtrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdfovfetjfhoshhtpehmohehhedtmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=7M5hgZrglV/VV3c7Ew87gLBtQdL9xxoNogKVON1KC3I=;
 c=relaxed/relaxed; d=syslinbit.com; h=From; s=ovhmo4479509-selector1;
 t=1741333557; v=1;
 b=QSr+OWSi0pPYkufJYG0S86Os63Ma3HhEfpgEjrZGkYTOCPB9ZZ07BVU8rpRmOAs219NrJWnw
 mamv+XoeGZoox3kWes5QqTxhgqRgkAP9e2BR9e6lB2Gq0T8Y73zcytjiswz1KSFyyw1E4mYXrDC
 0wk6PmabnmuXvm1gSfixqoH2k2x/HE1mX1qNEncD4vflu8ziLU+/0A4GTd6PAPb+xF09xHRrYcp
 mqxg/ia5yQDCI9Xeie3mVpi2Bue3lKDyllcGDnTN7OUqsjFRs8ylrLIiB/as/JoHh5bSTY6RDN2
 ZBfGRCRJ1ht35Movmyrr2LgPs6Jq8UcM8gw4oRLP8uHCA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 07:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212412



On 06/03/2025 16:36, Bruce Ashfield wrote:
>=20
>=20
> On Thu, Mar 6, 2025 at 10:04=E2=80=AFAM Louis Rannou via lists.openembe=
dded.org=20
> <http://lists.openembedded.org>=20
> <louis.rannou=3Dsyslinbit.com@lists.openembedded.org=20
> <mailto:syslinbit.com@lists.openembedded.org>> wrote:
>=20
>     From: Louis Rannou <louis.rannou@non.se.com
>     <mailto:louis.rannou@non.se.com>>
>=20
>     Add a QARECIPETEST kernel-config to the kernel to check the kernel
>     config has
>     set (or unset) config listed in variables QA_KERNEL_CONFIGS_REQUIRE=
D (or
>     QA_KERNEL_CONFIGS_FORBIDDEN).
>=20
>=20
> We already have audit tools that can do this, the approach of opening
> the .config, iterating and then hard binding ourselves to the very spec=
ific
> kernel configuration names has been considered and rejected many
> times.
>=20
> What exactly isn't working with the already supported mechanism ?

My ignorance I suppose. I didn't know about the audit phase and=20
kernel-cache. I guess I have to read the doc...

Louis

>=20
> Bruce
>=20
>     Signed-off-by: Louis Rannou <louis.rannou@non.se.com
>     <mailto:louis.rannou@non.se.com>>
>     ---
>      =C2=A0meta/classes-recipe/kernel.bbclass | 38 ++++++++++++++++++++=
++++++
>     ++++++++++++
>      =C2=A01 file changed, 38 insertions(+)
>=20
>     diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-
>     recipe/kernel.bbclass
>     index
>     64a685a964dab942db05b8d9e08cc22a3bbb152e..4a82b84d479667bf4a6e64ad3=
e99d934c6868b98 100644
>     --- a/meta/classes-recipe/kernel.bbclass
>     +++ b/meta/classes-recipe/kernel.bbclass
>     @@ -867,3 +867,41 @@ EXPORT_FUNCTIONS do_deploy
>=20
>      =C2=A0# Add using Device Tree support
>      =C2=A0inherit kernel-devicetree
>     +
>     +
>     +# Add QA test to check some required/forbidden kernel configs are
>     set or not.
>     +QA_KERNEL_CONFIGS_REQUIRED ??=3D ""
>     +QA_KERNEL_CONFIGS_FORBIDDEN ??=3D ""
>     +
>     +WARN_QA:append =3D " kernel-config"
>     +
>     +QARECIPETEST[kernel-config] =3D "package_qa_check_kernel_config"
>     +def package_qa_check_kernel_config(pn, d):
>     +=C2=A0 =C2=A0 from pathlib import Path
>     +=C2=A0 =C2=A0 import re
>     +
>     +=C2=A0 =C2=A0 config_path =3D Path(d.getVar("B"), ".config")
>     +=C2=A0 =C2=A0 if not config_path.exists():
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.handle_error("kernel-config",
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"Kernel configs have not been checked "\
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"as the kernel .config is not found: "\
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"%s." % config_path)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return
>     +
>     +=C2=A0 =C2=A0 config_list =3D {}
>     +=C2=A0 =C2=A0 with config_path.open('r') as f_config:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f_config.read().splitlines=
():
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 configset =3D re.match(r=
'# (\w+) is not set|
>     (\w+)=3D([ymn])', line)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if configset is not None=
:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if configs=
et.group(1) is not None:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 config_list[configset.group(1)] =3D "n"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 config_list[configset.group(2)] =3D
>     configset.group(3)
>     +
>     +=C2=A0 =C2=A0 for conf in d.getVar("QA_KERNEL_CONFIGS_REQUIRED").s=
plit():
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if conf not in config_list or config_l=
ist[conf] =3D=3D "n":
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.handle_error("kern=
el-config", "Kernel config is
>     required: %s" % conf, d)
>     +
>     +=C2=A0 =C2=A0 for conf in d.getVar("QA_KERNEL_CONFIGS_FORBIDDEN").=
split():
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if conf in config_list and config_list=
[conf] in "ym":
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.qa.handle_error("kern=
el-config", "Kernel config is
>     forbidden: %s" % conf, d)
>=20
>     ---
>     base-commit: b72823fc09674f78ad452250f453f6e47d9444de
>     change-id: 20250306-qa_kernel-061a37e316c4
>=20
>     Best regards,
>     --=20
>     Louis Rannou <louis.rannou@syslinbit.com
>     <mailto:louis.rannou@syslinbit.com>>
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#212394): https://lists.openembedded.org/g/
>     openembedded-core/message/212394 <https://lists.openembedded.org/g/
>     openembedded-core/message/212394>
>     Mute This Topic: https://lists.openembedded.org/mt/111549046/105081=
0
>     <https://lists.openembedded.org/mt/111549046/1050810>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/
>     unsub <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20
>=20
> --=20
> - Thou shalt not follow the NULL pointer, for chaos and madness await=20
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20


