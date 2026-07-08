Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4CEC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 02:44:41 +0000 (UTC)
Subject: Re: [PATCH 0/3] kernel: make the kernel toolchain switchable to clang
To: openembedded-core@lists.openembedded.org
From: "mark.yang" <mark.yang@lge.com>
X-Originating-Location: Nowon-gu, Seoul, KR (27.122.242.71)
X-Originating-Platform: Windows Chrome 149
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 07 Jul 2026 19:44:33 -0700
References: <20260708022856.2087339-1-mark.yang@lge.com> <CADkTA4O5hcXQxCp-pqTM0yCVLCi3Bt6T=xzZeFkMLX7f17ayyQ@mail.gmail.com>
In-Reply-To: <CADkTA4O5hcXQxCp-pqTM0yCVLCi3Bt6T=xzZeFkMLX7f17ayyQ@mail.gmail.com>
Message-ID: <400669.1783478673234550269@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="CUHZSNbSkVWnrQ5WjLpz"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 02:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240417

--CUHZSNbSkVWnrQ5WjLpz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Bad timing on my part - I posted this before spotting Harish's series,
sorry for the noise.

It's not quite the same though: the point of this series is patches 1
and 3, keeping the kernel, out-of-tree modules and make-mod-scripts on
one toolchain. With only the kernel recipe switched to clang, modules
and make-mod-scripts still run make against the shared kernel build
tree with the gcc defaults; kbuild notices the CC_VERSION_TEXT mismatch
and re-runs syncconfig, silently dropping compiler-dependent options
from the shared .config - CONFIG_CFI_CLANG for example disappears as
soon as any out-of-tree module is built, with no error anywhere.
Reproduced on qemux86-64 with cryptodev-module.

I'll drop the two patches that overlap with Harish's series and send a
v2 with the module/make-mod-scripts side rebased on top of his.

Mark

--CUHZSNbSkVWnrQ5WjLpz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Bruce,<br /><br />Bad timing on my part - I posted this before spot=
ting Harish's series,<br />sorry for the noise.<br /><br />It's not quite t=
he same though: the point of this series is patches 1<br />and 3, keeping t=
he kernel, out-of-tree modules and make-mod-scripts on<br />one toolchain. =
With only the kernel recipe switched to clang, modules<br />and make-mod-sc=
ripts still run make against the shared kernel build<br />tree with the gcc=
 defaults; kbuild notices the CC_VERSION_TEXT mismatch<br />and re-runs syn=
cconfig, silently dropping compiler-dependent options<br />from the shared =
.config - CONFIG_CFI_CLANG for example disappears as<br />soon as any out-o=
f-tree module is built, with no error anywhere.<br />Reproduced on qemux86-=
64 with cryptodev-module.<br /><br />I'll drop the two patches that overlap=
 with Harish's series and send a<br />v2 with the module/make-mod-scripts s=
ide rebased on top of his.<br /><br />Mark</div>

--CUHZSNbSkVWnrQ5WjLpz--

