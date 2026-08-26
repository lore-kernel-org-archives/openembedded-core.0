Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215C7C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 18:25:55 +0000 (UTC)
Subject: Re: [PATCH v3] rust: Avoid passing host-specific information to crates Strict Version Hash
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.220.149)
X-Originating-Platform: Windows Chrome 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 11:25:49 -0700
References: <20260826155417.2774608-1-alhe@linux.microsoft.com>
In-Reply-To: <20260826155417.2774608-1-alhe@linux.microsoft.com>
Message-ID: <2326647.1787768749336187635@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="GKWLka6GSK57lYKzyqvI"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 18:25:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244411

--GKWLka6GSK57lYKzyqvI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

Thanks for chasing this one down. Small notes on v3:

The commit is tagged [YOCTO #15554], but that bug is "reproducibility
failures with 'rustdoc' on rust 1.75" (path-length dependent), RESOLVED FIX=
ED
since 2024-08-01 via codegen-units=3D1 / lto=3Doff.

What you describe here - artifacts differing by build host arch, causing
cross-architecture sstate matches - looks like:

[YOCTO #16376] AB-INT: build system architecture reproducibility issue
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16376

which is still open. Could you retag it in v4, unless you had a reason to
point at 15554 that I'm missing?
---
One pointer that may or may not be relevant: the 1.97.1 upgrade (65271a5d3b=
)
carries an LLVM backport:

0043-LoopUnroll-Iterate-exit-fold-candidates-in-determini.patch

added for a repro issue seen with rust 1.97.0. I haven't looked at whether =
it
interacts with the SVH path at all - just flagging it in case it's useful c=
ontext.

Thanks,
Sunil Dora

--GKWLka6GSK57lYKzyqvI
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Alejandro,<br /><br />Thanks for chasing this one down. Small notes=
 on v3:<br /><br />The commit is tagged [YOCTO #15554], but that bug is "re=
producibility<br />failures with 'rustdoc' on rust 1.75" (path-length depen=
dent), RESOLVED FIXED<br />since 2024-08-01 via codegen-units=3D1 / lto=3Do=
ff.<br /><br />What you describe here - artifacts differing by build host a=
rch, causing<br />cross-architecture sstate matches - looks like:<br /><br =
/>&nbsp; [YOCTO #16376] AB-INT: build system architecture reproducibility i=
ssue<br />&nbsp; https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16376<=
br /><br />which is still open. Could you retag it in v4, unless you had a =
reason to<br />point at 15554 that I'm missing?<br />---<br />One pointer t=
hat may or may not be relevant: the 1.97.1 upgrade (65271a5d3b)<br />carrie=
s an LLVM backport:<br /><br />&nbsp; 0043-LoopUnroll-Iterate-exit-fold-can=
didates-in-determini.patch<br /><br />added for a repro issue seen with rus=
t 1.97.0. I haven't looked at whether it<br />interacts with the SVH path a=
t all - just flagging it in case it's useful context.<br /><br />Thanks,<br=
 />Sunil Dora</div>

--GKWLka6GSK57lYKzyqvI--

