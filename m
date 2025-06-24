Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D31C71157
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 06:38:06 +0000 (UTC)
Subject: Re: [PATCH v3] meta/meta-selftest: add selftest-hello-mod recipe
To: openembedded-core@lists.openembedded.org
From: "Dixit Parmar" <dixitparmar19@gmail.com>
X-Originating-Location: IN (1.7.171.2)
X-Originating-Platform: Windows Chrome 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 23 Jun 2025 23:37:57 -0700
References: <A36DC5A7-62C8-4208-B5AF-72F16019A6D0@arm.com>
In-Reply-To: <A36DC5A7-62C8-4208-B5AF-72F16019A6D0@arm.com>
Message-ID: <4249.1750747077194924898@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="UWO9ZDxSuGH2tDBkFqI4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 06:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219228

--UWO9ZDxSuGH2tDBkFqI4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 10:20 PM, Ross Burton wrote:

>=20
> On 21 Jun 2025, at 08:31, Dixit Parmar via lists.openembedded.org
> <dixitparmar19=3Dgmail.com@lists.openembedded.org> wrote:
>=20
>> Kernel module specific oe test cases requires a test kernel
>> module package to work with. Added selftest-hello-mod
>> derived from meta-skeleton/recipes-kernel/hello-mod.
>=20
> Is there meant to be an actual test case to follow this up?

Yes, it's here https://lists.openembedded.org/g/openembedded-core/message/2=
18013 - please review this too ;)

>=20
> There=E2=80=99s already a kernel module in oeqa under
> meta/lib/oeqa/runtime/files/hellomod.c, I=E2=80=99ve previously tried add=
ing more
> test cases around them (for SDKs not selftest though):
>=20
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dross/module
>=20
> Maybe instead of duplicating the kernel module more we move the source an=
d
> Makefile into meta/lib/oeqa/files/kmodule/ and then the tests can easily
> use them, and the recipe could set SRC_URI to
> ${COREBASE}/lib/oeqa/files/kmodule/hellomod.c.

I created a new recipe with the corresponding source files with the idea of=
 having an independent self-test package for hello-mod. This is included in=
 the meta-selftest so it can be used for other kernel module-related test c=
ases in the future. I can modify it to point to the source and Makefile out=
side of the package if you recommend, though.

>=20
> Cheers,
> Ross

--UWO9ZDxSuGH2tDBkFqI4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Jun 23, 2025 at 10:20 PM, Ross Burton wrote:</div>
<div>
<blockquote>On 21 Jun 2025, at 08:31, Dixit Parmar via lists.openembedded.o=
rg &lt;dixitparmar19=3Dgmail.com@lists.openembedded.org&gt; wrote:<br />
<blockquote>Kernel module specific oe test cases requires a test kernel<br =
/>module package to work with. Added selftest-hello-mod<br />derived from m=
eta-skeleton/recipes-kernel/hello-mod.</blockquote>
Is there meant to be an actual test case to follow this up?</blockquote>
Yes, it's here <a href=3D"https://lists.openembedded.org/g/openembedded-cor=
e/message/218013" target=3D"_blank" rel=3D"noopener">https://lists.openembe=
dded.org/g/openembedded-core/message/218013</a> - please review this too ;)=
<br />
<blockquote>There&rsquo;s already a kernel module in oeqa under meta/lib/oe=
qa/runtime/files/hellomod.c, I&rsquo;ve previously tried adding more test c=
ases around them (for SDKs not selftest though):<br /><br /><a href=3D"http=
s://git.yoctoproject.org/poky-contrib/log/?h=3Dross/module" target=3D"_blan=
k" rel=3D"noopener">https://git.yoctoproject.org/poky-contrib/log/?h=3Dross=
/module</a><br /><br />Maybe instead of duplicating the kernel module more =
we move the source and Makefile into meta/lib/oeqa/files/kmodule/ and then =
the tests can easily use them, and the recipe could set SRC_URI to ${COREBA=
SE}/lib/oeqa/files/kmodule/hellomod.c.</blockquote>
I created a new recipe with the corresponding source files with the idea of=
 having an independent self-test package for hello-mod. This is included in=
 the meta-selftest so it can be used for other kernel module-related test c=
ases in the future. I can modify it to point to the source and Makefile out=
side of the package if you recommend, though.<br />
<blockquote>Cheers,<br />Ross</blockquote>
</div>

--UWO9ZDxSuGH2tDBkFqI4--

