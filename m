Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA21FEA83D
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 09:47:28 +0000 (UTC)
Subject: Re: [PATCH 1/5] clang/llvm: Upgrade to 22.x major release
To: openembedded-core@lists.openembedded.org
From: "Varatharajan, Deepesh" <deepesh.varatharajan@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 25 Mar 2026 02:47:20 -0700
References: <20260324230835.2363568-1-khem.raj@oss.qualcomm.com> <50afa4d55645c2ea126726c30ff2272bf0a9a499.camel@linuxfoundation.org>
In-Reply-To: <50afa4d55645c2ea126726c30ff2272bf0a9a499.camel@linuxfoundation.org>
Message-ID: <564384.1774432040914167813@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="kuSWbYDe12EG1XbXM4qd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 09:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233868

--kuSWbYDe12EG1XbXM4qd
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 03:01 PM, Richard Purdie wrote:

>=20
> error: data-layout for target `amdgcn-amd-amdhsa`,
> `e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:2=
56:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v=
48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A=
5-G1-ni:7:8:9`,
>=20
> differs from LLVM target's `amdgcn-amd-amdhsa` default layout,
> `e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:1=
60:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:=
32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S=
32-A5-G1-ni:7:8:9`
>=20

I think this commit needs to be backported from upstream to fix this issue
https://github.com/rust-lang/rust/commit/bf3ac98d6930ba4e258cf33240c2fe7c99=
d19eae

Regards,
Deepesh

--kuSWbYDe12EG1XbXM4qd
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Mar 25, 2026 at 03:01 PM, Richard Purdie wrote:</div>
<div>
<blockquote>error: data-layout for target `amdgcn-amd-amdhsa`,&nbsp;<br />`=
e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:=
256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:=
64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G=
1-ni:7:8:9`,&nbsp;<br />differs from LLVM target's `amdgcn-amd-amdhsa` defa=
ult layout,&nbsp;<br />`e-m:e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p=
5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:=
64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:102=
4-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9`</blockquote>
I think this commit needs to be backported from upstream to fix this issue<=
br /><a href=3D"https://github.com/rust-lang/rust/commit/bf3ac98d6930ba4e25=
8cf33240c2fe7c99d19eae" target=3D"_blank" rel=3D"noopener">https://github.c=
om/rust-lang/rust/commit/bf3ac98d6930ba4e258cf33240c2fe7c99d19eae</a><br />=
<br />Regards,<br />Deepesh</div>

--kuSWbYDe12EG1XbXM4qd--

