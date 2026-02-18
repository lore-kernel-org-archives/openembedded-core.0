Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E72E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 17:34:13 +0000 (UTC)
Subject: Re: [PATCH v2] rust: Enable dynamic linking with llvm
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.216.76)
X-Originating-Platform: Windows Chrome 144
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 18 Feb 2026 09:34:08 -0800
References: <20260217131636.3155022-1-sunilkumar.dora@windriver.com>
In-Reply-To: <20260217131636.3155022-1-sunilkumar.dora@windriver.com>
Message-ID: <33657.1771436048824359215@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="uRV9owOLvimx5peXjtky"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 17:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231313

--uRV9owOLvimx5peXjtky
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

There was some discussion on V1 here:
https://lists.openembedded.org/g/openembedded-core/message/231312

Based on that feedback, I=E2=80=99ve updated the approach so that:
- rust-native links with LLVM dynamically
- rust-target links with LLVM statically

This keeps the workaround only in -native and avoids changing how the targe=
t toolchain is built.
I=E2=80=99ve tested this change and didn=E2=80=99t see any regressions.

I=E2=80=99ll send V3 shortly with this update.

Thanks,
Sunil Dora

--uRV9owOLvimx5peXjtky
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>There was some discussion on V1 here:<br /><a href=3D"https://lists.op=
enembedded.org/g/openembedded-core/message/231312" target=3D"_blank" rel=3D=
"noopener">https://lists.openembedded.org/g/openembedded-core/message/23131=
2</a><br /><br />
<p data-start=3D"342" data-end=3D"400">Based on that feedback, I&rsquo;ve u=
pdated the approach so that:<br />&nbsp; - rust-native links with LLVM dyna=
mically<br />&nbsp; - rust-target links with LLVM statically</p>
<p data-start=3D"490" data-end=3D"586">This keeps the workaround only in -n=
ative and avoids changing how the target toolchain is built.<br />I&rsquo;v=
e tested this change and didn&rsquo;t see any regressions.<br /><br />I&rsq=
uo;ll send V3 shortly with this update.<br /><br /></p>
Thanks,<br />Sunil Dora</div>

--uRV9owOLvimx5peXjtky--

