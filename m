Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6112FCD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 03:42:35 +0000 (UTC)
Subject: Re: [PATCH 0/7] gcc: Upgrade GCC to 16.1 release
To: openembedded-core@lists.openembedded.org
From: "Hemanth Kumar M D" <Hemanth.KumarMD@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (122.171.18.69)
X-Originating-Platform: Windows Chrome 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 14 May 2026 20:42:30 -0700
References: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com> <DIF0RD92PLUT.GBWK3UG1TBKH@bootlin.com>
In-Reply-To: <DIF0RD92PLUT.GBWK3UG1TBKH@bootlin.com>
Message-ID: <2134633.1778816550876239719@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="tzu68A53eRHz70GdXkAp"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 03:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237065

--tzu68A53eRHz70GdXkAp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Thanks for the review and testing.
Here is the current status:
- gn build failure with musl: fixed.
- libgfortran QA failure (libcaf_shmem.a): fixed.
- elfutils ptest failures (run-strip-nothing.sh, run-strip-g.sh): fixed.
- libc-test static test failures (musl only): fixed.

We also ran into a GCC 16 ICE during testing (extract_insn during IRA
pass with UNSPEC_IEEE_MAX on i386 with -ffloat-store) and have reported
it upstream: =C2=A0https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D125308

Still looking into the remaining failures. Will keep this thread
updated and send v2 once everything is sorted.

Thanks,
Hemanth Kumar M D

--tzu68A53eRHz70GdXkAp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Hi Mathieu,</div>
<div><br />Thanks for the review and testing.</div>
</div>
<div>Here is the current status:</div>
<div>- gn build failure with musl: fixed.<br />- libgfortran QA failure (li=
bcaf_shmem.a): fixed.<br />- elfutils ptest failures (run-strip-nothing.sh,=
 run-strip-g.sh): fixed.<br />- libc-test static test failures (musl only):=
 fixed.</div>
<div>
<div><br />We also ran into a GCC 16 ICE during testing (extract_insn durin=
g IRA<br />pass with UNSPEC_IEEE_MAX on i386 with -ffloat-store) and have r=
eported<br />it upstream: &nbsp;https://gcc.gnu.org/bugzilla/show_bug.cgi?i=
d=3D125308</div>
<div>&nbsp;</div>
<div>Still looking into the remaining failures. Will keep this thread<br />=
updated and send v2 once everything is sorted.</div>
</div>
<div><br />Thanks,<br />Hemanth Kumar M D</div>

--tzu68A53eRHz70GdXkAp--

