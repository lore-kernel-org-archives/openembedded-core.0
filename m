Return-Path: <iwanicki92@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B35C5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 20:29:54 +0000 (UTC)
Subject: Re: [PATCH] sbom30.py/spdx30_tasks.py: fix SPDX_* prefix lookup
To: openembedded-core@lists.openembedded.org
From: "iwanicki92" <iwanicki92@gmail.com>
X-Originating-Location: Gdansk, Pomerania, PL (77.236.16.240)
X-Originating-Platform: Linux Firefox 153
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Aug 2026 13:29:50 -0700
References: <20260822211734.3596359-1-iwanicki92@gmail.com> <DKWYM6BJ4WFN.3HWMLSORAJFPP@bootlin.com>
In-Reply-To: <DKWYM6BJ4WFN.3HWMLSORAJFPP@bootlin.com>
Message-ID: <2283556.1787603390860269556@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="F065mPAQ125CeVZQX5cM"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 20:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244151

--F065mPAQ125CeVZQX5cM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Posted v2 patch, issue was that I changed it to be more consistent with doc=
umentation e.g. for SPDX_IMAGE_SUPPLIER ( https://docs.yoctoproject.org/ref=
-manual/variables.html#term-SPDX_IMAGE_SUPPLIER ) :

>=20
> If not set, no supplier information is added to the image SBOM
>=20

but maybe it meant that if `<PREFIX>_*` is not set (e.g. _name or _type), t=
hen this information is not added.
So with this change it'll be possible to use `SPDX_IMAGE_SUPPLIER =3D "MY_C=
OMPANY"` or undocumented `SPDX_IMAGE_SUPPLIER_ref =3D "MY_COMPANY"` (which =
doesn't pass all arguments it was called with (e.g. `add`), so it feels lik=
e a bug but I don't know enough about this subsystem to tell) with variable=
 with no suffix having priority.

Another way to fix it would be to maybe change documentation and say explic=
itly to use SPDX_IMAGE_SUPPLIER_ref and that SPDX_IMAGE_SUPPLIER without an=
y suffix is not used.

--F065mPAQ125CeVZQX5cM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Posted v2 patch, issue was that I changed it to be more consistent wit=
h documentation e.g. for <a class=3D"reference internal" href=3D"https://do=
cs.yoctoproject.org/ref-manual/variables.html#term-SPDX_IMAGE_SUPPLIER"><sp=
an class=3D"xref std std-term">SPDX_IMAGE_SUPPLIER</span></a>:</div>
<blockquote>
<div>If not set, no supplier information is added to the image SBOM</div>
</blockquote>
<div>but maybe it meant that if `&lt;PREFIX&gt;_*` is not set (e.g. _name o=
r _type), then this information is not added.</div>
<div>So with this change it'll be possible to use `SPDX_IMAGE_SUPPLIER =3D =
"MY_COMPANY"` or undocumented `SPDX_IMAGE_SUPPLIER_ref =3D "MY_COMPANY"` (w=
hich doesn't pass all arguments it was called with (e.g. `add`), so it feel=
s like a bug but I don't know enough about this subsystem to tell) with var=
iable with no suffix having priority.</div>
<div>&nbsp;</div>
<div>Another way to fix it would be to maybe change documentation and say e=
xplicitly to use SPDX_IMAGE_SUPPLIER_ref and that SPDX_IMAGE_SUPPLIER witho=
ut any suffix is not used.</div>

--F065mPAQ125CeVZQX5cM--

