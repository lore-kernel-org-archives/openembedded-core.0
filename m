Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6613DC71159
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 05:56:42 +0000 (UTC)
Subject: Re: [PATCH v2] meta/meta-selftest: add selftest-hello-mod recipe
To: openembedded-core@lists.openembedded.org
From: "Dixit Parmar" <dixitparmar19@gmail.com>
X-Originating-Location: Pune, Maharashtra, IN (223.233.85.212)
X-Originating-Platform: Windows Chrome 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 18 Jun 2025 22:56:40 -0700
References: <DAQ8IV6QATNI.5KU5EZV9S8MH@bootlin.com>
In-Reply-To: <DAQ8IV6QATNI.5KU5EZV9S8MH@bootlin.com>
Message-ID: <22191.1750312600030991891@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="3x38KEtRxRnBVGuDBl5K"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 05:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219050

--3x38KEtRxRnBVGuDBl5K
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 10:15 AM, Mathieu Dubois-Briand wrote:

>=20
> On Mon Jun 9, 2025 at 3:41 PM CEST, Dixit Parmar via
> lists.openembedded.org wrote:
>=20
>> Kernel module specific oe test cases requires a test kernel
>> module package to work with. Added selftest-hello-mod
>> derived from meta-skeleton/recipes-kernel/hello-mod.
>>=20
>> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
>> ---
>=20
> Thanks or your patch.
>=20
>=20
>> +S =3D "${WORKDIR}/hello-mod"
>=20
> This will trigger an error if some patches in master-next are merged,
> you can rebase on master-next to see the error. The hello-mod recipe of
> meta-skeleton was also updated accordingly.

Do you mean I should take the latest reference from master-next for the met=
a-skeleton/hello-mod to meta-selftest?

>=20
> https://lists.openembedded.org/g/openembedded-core/message/218806
> https://lists.openembedded.org/g/openembedded-core/message/218804
>=20
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--3x38KEtRxRnBVGuDBl5K
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, Jun 19, 2025 at 10:15 AM, Mathieu Dubois-Briand wrote:</div>
<div>
<blockquote>On Mon Jun 9, 2025 at 3:41 PM CEST, Dixit Parmar via lists.open=
embedded.org wrote:<br />
<blockquote>Kernel module specific oe test cases requires a test kernel<br =
/>module package to work with. Added selftest-hello-mod<br />derived from m=
eta-skeleton/recipes-kernel/hello-mod.<br /><br />Signed-off-by: Dixit Parm=
ar &lt;dixitparmar19@gmail.com&gt;<br />---</blockquote>
Thanks or your patch.<br /><br />
<blockquote>+S =3D "${WORKDIR}/hello-mod"</blockquote>
This will trigger an error if some patches in master-next are merged,<br />=
you can rebase on master-next to see the error. The hello-mod recipe of<br =
/>meta-skeleton was also updated accordingly.</blockquote>
</div>
<div>Do you mean I should take the latest reference from master-next for th=
e meta-skeleton/hello-mod to meta-selftest?<br />
<blockquote><a href=3D"https://lists.openembedded.org/g/openembedded-core/m=
essage/218806" target=3D"_blank" rel=3D"noopener">https://lists.openembedde=
d.org/g/openembedded-core/message/218806</a><br /><a href=3D"https://lists.=
openembedded.org/g/openembedded-core/message/218804" target=3D"_blank" rel=
=3D"noopener">https://lists.openembedded.org/g/openembedded-core/message/21=
8804</a><br /><br />-- <br />Mathieu Dubois-Briand, Bootlin<br />Embedded L=
inux and Kernel engineering<br /><a href=3D"https://bootlin.com" target=3D"=
_blank" rel=3D"noopener">https://bootlin.com</a></blockquote>
</div>

--3x38KEtRxRnBVGuDBl5K--

