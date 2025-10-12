Return-Path: <kavinaya@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78158CCD184
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 16:17:52 +0000 (UTC)
Subject: Re: [PATCH v5] kernel-fit-image: allow extending compatible string property for DTBs
To: openembedded-core@lists.openembedded.org
From: "Kavinaya S" <kavinaya@qti.qualcomm.com>
X-Originating-Location: Hyderabad, Telangana, IN (163.116.219.41)
X-Originating-Platform: Windows Chrome 141
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 12 Oct 2025 09:17:50 -0700
References: <zrwonq2yfn75ymhosfncxsrr2yqt4zbbdnllqelbea3sv577nz@nbav227oqsfx>
In-Reply-To: <zrwonq2yfn75ymhosfncxsrr2yqt4zbbdnllqelbea3sv577nz@nbav227oqsfx>
Message-ID: <27294.1760285870486275177@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 16:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224739

On Sun, Oct 12, 2025 at 08:37 PM, Dmitry Baryshkov wrote:

>
> On Sat, Oct 11, 2025 at 09:18:02PM -0700, Kavinaya S wrote:
>=20
> >=20
> > Hi Dmitry,
> >=20
> > If other reviewers agree I have no concern with replacement of complete
> > compatible string.
>=20
> Please don't trim the contents. What are you replying to? How would one
> know it?
>=20
> Anyway, what is the plan to handle our DTB fitImages?
>=20
> --
> With best wishes
> Dmitry
>
Hi Dmitry,

For Qualcomm DTBs extending the compatible string would be sufficient as th=
e format planned is=20
compatible =3D "qcom,<SoC>[-<soc_version>][-<foundry_id>]-<board>[/<subtype=
>][-<pmic>][-<board_version>]"
=20
In this "qcom,<SoC>" would be from base Kernel device tree and remaining pa=
rt to be added via extension.=20
If others also agree to replace the entire compatible sting, then entire st=
ring can be updated in the format we like.=20
Either case the Qualcomm DTB fitImages have a path forward.=20

Thanks,
Kavinaya

