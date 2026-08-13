Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6F0C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 10:48:09 +0000 (UTC)
Subject: Re: [PATCH] rust: Upgrade 1.96.1 -> 1.97.1
To: openembedded-core@lists.openembedded.org
From: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>
X-Originating-Location: SE (192.176.1.79)
X-Originating-Platform: Mac Firefox 153
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 03:48:08 -0700
References: <20260717091912.1752666-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260717091912.1752666-1-Deepesh.Varatharajan@windriver.com>
Message-ID: <1500499.1786618088330989780@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="KmmW3DfyL7SZfdbL2yTJ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 10:48:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243344

--KmmW3DfyL7SZfdbL2yTJ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Deepesh,

I see this patch got "Changes Requested" on patchwork =E2=80=94 do you know=
 what needs to be fixed?
I'm asking because I'm upgrading OpenSSL to 4.0.1 and cargo-native fails to=
 build without Rust 1.97.1 (the vendored openssl-sys in 1.96.1 doesn't supp=
ort OpenSSL 4.x).

The current Rust 1.96.1 ships openssl-sys 0.9.107 which fails=C2=A0 when bu=
ilding against OpenSSL 4.0:

"This crate is only compatible with OpenSSL (version 1.1.0, 1.1.1, or 3.x)"

If there's anything I can help with to get this patch merged, happy to assi=
st.

Regards,
Jaipaul

--KmmW3DfyL7SZfdbL2yTJ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Deepesh,<br />&nbsp;&nbsp;<br />I see this patch got "Changes Reque=
sted" on patchwork &mdash; do you know what needs to be fixed?</div>
<div>I'm asking because I'm upgrading OpenSSL to 4.0.1 and cargo-native fai=
ls to build without Rust 1.97.1 (the vendored openssl-sys in 1.96.1 doesn't=
 support OpenSSL 4.x).</div>
<div>&nbsp;</div>
<div>The current Rust 1.96.1 ships openssl-sys 0.9.107 which fails&nbsp; wh=
en building against OpenSSL 4.0:<br />&nbsp;&nbsp;<br />&nbsp; &nbsp; "This=
 crate is only compatible with OpenSSL (version 1.1.0, 1.1.1, or 3.x)"<br /=
>&nbsp;&nbsp;<br />If there's anything I can help with to get this patch me=
rged, happy to assist.&nbsp;</div>
<div>&nbsp;</div>
<div>Regards,</div>
<div>Jaipaul</div>

--KmmW3DfyL7SZfdbL2yTJ--

