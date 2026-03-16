Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3211F53D79
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 17:01:09 +0000 (UTC)
Subject: Re: [PATCH V5 1/1] gdb: Upgrade 16.3 -> 17.1
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.218.26)
X-Originating-Platform: Windows Chrome 145
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 16 Mar 2026 10:01:01 -0700
References: <20260316040958.122568-1-sunilkumar.dora@windriver.com> <20260316040958.122568-2-sunilkumar.dora@windriver.com> <CANNYZj_yj4wubgwkd+2uvkQ_p=ZXGc-MVhRcrHEdd6AM7JaDwQ@mail.gmail.com>
In-Reply-To: <CANNYZj_yj4wubgwkd+2uvkQ_p=ZXGc-MVhRcrHEdd6AM7JaDwQ@mail.gmail.com>
Message-ID: <411950.1773680461337707635@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="kkT9lLyEU7SBg6LCQdQ6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233263

--kkT9lLyEU7SBg6LCQdQ6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 04:29 PM, Alexander Kanavin wrote:

>=20
> But Pending is not an appropriate status here, as
> it means something is preventing the patch from being submitted, or it
> isn't clear whether it should be submitted

Hi Alex,

Thanks for the Feedback.
You're right =E2=80=94 "Pending" isn't the best fit here. The patch is a pa=
rtial adaptation/backport of
Thiago Jung Bauermann=E2=80=99s V4 series, which is still under review on g=
db-patches and has not
landed in master yet. ( https://sourceware.org/pipermail/gdb-patches/2026-M=
arch/225502.html )

Thiago has indicated he will prepare a 17.1-specific version once the maste=
r series is resolved.

I=E2=80=99ve updated the Upstream-Status line to:

Upstream-Status: Submitted [gdb-patches, Thiago Jung Bauermann v4 series (n=
ot yet merged): https://sourceware.org/pipermail/gdb-patches/2026-March/225=
502.html =E2=80=94 partial adaptation for the GDB 17.1 header layout]

Would you prefer using Backport [...] here instead, even though there is no=
 master commit yet,
or does Submitted better reflect the current upstream situation?

Thanks,
Sunil Dora

--kkT9lLyEU7SBg6LCQdQ6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Mar 16, 2026 at 04:29 PM, Alexander Kanavin wrote:</div>
<div>
<blockquote>But Pending is not an appropriate status here, as<br />it means=
 something is preventing the patch from being submitted, or it<br />isn't c=
lear whether it should be submitted</blockquote>
Hi Alex,<br /><br />Thanks for the Feedback.&nbsp;<br />You're right &mdash=
; "Pending" isn't the best fit here. The patch is a partial adaptation/back=
port of <br />Thiago Jung Bauermann&rsquo;s V4 series, which is still under=
 review on gdb-patches and has not <br />landed in master yet. ( https://so=
urceware.org/pipermail/gdb-patches/2026-March/225502.html )<br /><br />Thia=
go has indicated he will prepare a 17.1-specific version once the master se=
ries is resolved.<br /><br />
<div>I&rsquo;ve updated the Upstream-Status line to:<br /><br /></div>
<div>Upstream-Status: Submitted [gdb-patches, Thiago Jung Bauermann v4 seri=
es (not yet merged): https://sourceware.org/pipermail/gdb-patches/2026-Marc=
h/225502.html &mdash; partial adaptation for the GDB 17.1 header layout]<br=
 /><br /></div>
<div>Would you prefer using Backport [...] here instead, even though there =
is no master commit yet, <br />or does Submitted better reflect the current=
 upstream situation?<br /><br />Thanks,<br />Sunil Dora</div>
</div>

--kkT9lLyEU7SBg6LCQdQ6--

