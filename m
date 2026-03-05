Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A15CF47CC1
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 19:34:37 +0000 (UTC)
Subject: Re: [PATCH v2] rust: Install the Rust source
To: openembedded-core@lists.openembedded.org
From: "Varatharajan, Deepesh" <deepesh.varatharajan@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (152.57.125.140)
X-Originating-Platform: Windows Chrome 145
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 05 Mar 2026 11:34:37 -0800
References: <20260305053612.1632965-1-alistair.francis@wdc.com>
In-Reply-To: <20260305053612.1632965-1-alistair.francis@wdc.com>
Message-ID: <245205.1772739277344203196@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="nESDmWKYvMc8ZVWnN8l2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 19:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232515

--nESDmWKYvMc8ZVWnN8l2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 11:06 AM, Alistair Francis wrote:

>=20
> +inherit pkgconfig
>=20
> -DEPENDS +=3D "llvm"
> +DEPENDS +=3D "llvm openssl"

Hi Alistair,

As you already know, there is an ongoing series of patches to enable Rust
support in the kernel. The latest version of this series can be found here:
https://lists.openembedded.org/g/openembedded-core/topic/patch_v7_00_14_ena=
ble_rust/118136908

With the newest version, the relevant changes are now controlled via the
KERNEL_RUST_SUPPORT variable. Therefore, instead of introducing additional
dependencies directly, Can you make it optional by using the same variable.

Regards,
Deepesh

--nESDmWKYvMc8ZVWnN8l2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, Mar 5, 2026 at 11:06 AM, Alistair Francis wrote:</div>
<div>
<blockquote>+inherit pkgconfig<br /><br />-DEPENDS +=3D "llvm"<br />+DEPEND=
S +=3D "llvm openssl"</blockquote>
Hi Alistair,<br /><br />
<div>As you already know, there is an ongoing series of patches to enable R=
ust<br />support in the kernel. The latest version of this series can be fo=
und here:<br /><a href=3D"https://lists.openembedded.org/g/openembedded-cor=
e/topic/patch_v7_00_14_enable_rust/118136908" target=3D"_blank" rel=3D"noop=
ener">https://lists.openembedded.org/g/openembedded-core/topic/patch_v7_00_=
14_enable_rust/118136908</a><br /><br /></div>
<div>With the newest version, the relevant changes are now controlled via t=
he&nbsp;<br />KERNEL_RUST_SUPPORT variable. Therefore, instead of introduci=
ng additional<br />dependencies directly, Can you make it optional by using=
 the same variable.<br /><br />Regards,<br />Deepesh</div>
</div>

--nESDmWKYvMc8ZVWnN8l2--

