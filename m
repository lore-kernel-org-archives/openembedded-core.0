Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38ABDE9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 17:26:13 +0000 (UTC)
Subject: Re: [PATCH] rust: Enable dynamic linking with llvm
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.216.76)
X-Originating-Platform: Windows Chrome 144
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 18 Feb 2026 09:26:11 -0800
References: <20260212165035.1806068-1-sunilkumar.dora@windriver.com> <D0F37E52-3E1F-4477-932A-02BEDB07AE2A@arm.com> <675892.1771012298240808740@lists.openembedded.org> <5f3097df-5e24-41f8-9293-db01248e383c@windriver.com>
In-Reply-To: <5f3097df-5e24-41f8-9293-db01248e383c@windriver.com>
Message-ID: <976428.1771435571945028979@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="XzRH7EdURpM3u0dLm0JL"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 17:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231312

--XzRH7EdURpM3u0dLm0JL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 07:54 PM, Randy MacLeod wrote:

>=20
> I'm still a bit uncomfortable with changing the way that target Rust is
> built to deal with
> a Rust-native problem. Also there's the question about dynamic linking
> increasing runtime
> by a small amount. Finally, I worry that few people/distros change the
> default linking to by dynamic.
>=20
> So I won't object to this work-around especially if we can easily limit i=
t
> to -native. Have you tried that?

Hi Randy,

I=E2=80=99ve now limited the change as you suggested:
- rust-native links with LLVM dynamically
- rust-target links with LLVM statically

This keeps the workaround only in -native and avoids changing how the targe=
t toolchain is built.
I reran the relevant tests and didn=E2=80=99t see any regressions or runtim=
e issues.
I=E2=80=99ll send V3 shortly with this approach.

Thanks,
Sunil Dora

--XzRH7EdURpM3u0dLm0JL
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Tue, Feb 17, 2026 at 07:54 PM, Randy MacLeod wrote:</div>
<div>
<blockquote>I'm still a bit uncomfortable with changing the way that target=
 Rust is built to deal with<br />a Rust-native problem. Also there's the qu=
estion about dynamic linking increasing runtime<br />by a small amount. Fin=
ally, I worry that few people/distros change the default linking to by dyna=
mic.<br /><br />So I won't object to this work-around especially if we can =
easily limit it to -native. Have you tried that?</blockquote>
<div>Hi Randy,</div>
<div>&nbsp;</div>
<div>I&rsquo;ve now limited the change as you suggested:</div>
<div>&nbsp; - rust-native links with LLVM dynamically</div>
<div>&nbsp; - rust-target links with LLVM statically</div>
<div><br />This keeps the workaround only in -native and avoids changing ho=
w the target toolchain is built.</div>
<div>I reran the relevant tests and didn&rsquo;t see any regressions or run=
time issues. <br />I&rsquo;ll send V3 shortly with this approach.<br /><br =
/></div>
<div>Thanks,<br />Sunil Dora</div>
</div>

--XzRH7EdURpM3u0dLm0JL--

