Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C76C7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 11:56:14 +0000 (UTC)
Subject: Re: [PATCH v2] meta/meta-selftest: add selftest-hello-mod recipe
To: openembedded-core@lists.openembedded.org
From: "Dixit Parmar" <dixitparmar19@gmail.com>
X-Originating-Location: Pune, Maharashtra, IN (223.233.81.81)
X-Originating-Platform: Windows Chrome 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 19 Jun 2025 04:56:05 -0700
References: <DAQHCF8TSZCA.2ZCCQ2WA746D1@bootlin.com>
In-Reply-To: <DAQHCF8TSZCA.2ZCCQ2WA746D1@bootlin.com>
Message-ID: <22191.1750334165882624180@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="o4HkCPngCRMUrwegS0xg"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 11:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219072

--o4HkCPngCRMUrwegS0xg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 05:10 PM, Mathieu Dubois-Briand wrote:

>=20
> On Thu Jun 19, 2025 at 7:56 AM CEST, Dixit Parmar via
> lists.openembedded.org wrote:
>=20
>> On Thu, Jun 19, 2025 at 10:15 AM, Mathieu Dubois-Briand wrote:
>>=20
>>=20
>>> On Mon Jun 9, 2025 at 3:41 PM CEST, Dixit Parmar via
>>> lists.openembedded.org wrote:
>>>=20
>>>=20
>>>> Kernel module specific oe test cases requires a test kernel
>>>> module package to work with. Added selftest-hello-mod
>>>> derived from meta-skeleton/recipes-kernel/hello-mod.
>>>>=20
>>>> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
>>>> ---
>>>=20
>>> Thanks or your patch.
>>>=20
>>>=20
>>>=20
>>>> +S =3D "${WORKDIR}/hello-mod"
>>>=20
>>> This will trigger an error if some patches in master-next are merged,
>>> you can rebase on master-next to see the error. The hello-mod recipe of
>>> meta-skeleton was also updated accordingly.
>>=20
>> Do you mean I should take the latest reference from master-next for the
>> meta-skeleton/hello-mod to meta-selftest?
>=20
> All I can say for sure is we cannot take both the series from Alexander
> and your patch as-is.
>=20
> So as I believe the said series is likely to be merged, I would indeed
> suggest to modify your patch accordingly, and this can be done by taking
> the last version of meta-skeleton/hello-mod. But again, I'm not the one
> deciding what gets merged, so I cannot be sure if and when it will be
> merged.

Understood. A failure was reported with the previous version of this patch,=
 where the .bb file was missing the WORKDIR-related changes for ${S} as it =
was directly taken from the meta-skeleton/hello-mod. Now, to fix that, I ha=
ve incorporated the solution this way. do you think this will give errors t=
oo? Pls don't misunderstand me, I get your point of rebasing to the latest =
meta-skeleton as reference but I just want to understand if this will get f=
ailed or not. because the said master-next patch sets are still yet to get =
merged.

>=20
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--o4HkCPngCRMUrwegS0xg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, Jun 19, 2025 at 05:10 PM, Mathieu Dubois-Briand wrote:</div>
<div>
<blockquote>On Thu Jun 19, 2025 at 7:56 AM CEST, Dixit Parmar via lists.ope=
nembedded.org wrote:<br />
<blockquote>On Thu, Jun 19, 2025 at 10:15 AM, Mathieu Dubois-Briand wrote:<=
br /><br />
<blockquote>On Mon Jun 9, 2025 at 3:41 PM CEST, Dixit Parmar via<br />lists=
.openembedded.org wrote:<br /><br />
<blockquote>Kernel module specific oe test cases requires a test kernel<br =
/>module package to work with. Added selftest-hello-mod<br />derived from m=
eta-skeleton/recipes-kernel/hello-mod.<br /><br />Signed-off-by: Dixit Parm=
ar &lt;dixitparmar19@gmail.com&gt;<br />---</blockquote>
Thanks or your patch.<br /><br /><br />
<blockquote>+S =3D "${WORKDIR}/hello-mod"</blockquote>
This will trigger an error if some patches in master-next are merged,<br />=
you can rebase on master-next to see the error. The hello-mod recipe of<br =
/>meta-skeleton was also updated accordingly.</blockquote>
Do you mean I should take the latest reference from master-next for the met=
a-skeleton/hello-mod to meta-selftest?</blockquote>
All I can say for sure is we cannot take both the series from Alexander<br =
/>and your patch as-is.<br /><br />So as I believe the said series is likel=
y to be merged, I would indeed<br />suggest to modify your patch accordingl=
y, and this can be done by taking<br />the last version of meta-skeleton/he=
llo-mod. But again, I'm not the one<br />deciding what gets merged, so I ca=
nnot be sure if and when it will be<br />merged.</blockquote>
Understood. A failure was reported with the previous version of this patch,=
 where the .bb file was missing the WORKDIR-related changes for ${S} as it =
was directly taken from the meta-skeleton/hello-mod. Now, to fix that, I ha=
ve incorporated the solution this way. do you think this will give errors t=
oo? Pls don't misunderstand me, I get your point of rebasing to the latest =
meta-skeleton as reference but I just want to understand if this will get f=
ailed or not. because the said master-next patch sets are still yet to get =
merged.<br />
<blockquote>-- <br />Mathieu Dubois-Briand, Bootlin<br />Embedded Linux and=
 Kernel engineering<br /><a href=3D"https://bootlin.com" target=3D"_blank" =
rel=3D"noopener">https://bootlin.com</a></blockquote>
</div>

--o4HkCPngCRMUrwegS0xg--

