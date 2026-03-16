Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C1AF53D78
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 16:58:29 +0000 (UTC)
Subject: Re: [PATCH v9 02/14] linux-yocto: conditionally add clang/rust/bindgen-cli-native to DEPENDS
To: openembedded-core@lists.openembedded.org
From: "Varatharajan, Deepesh" <deepesh.varatharajan@windriver.com>
X-Originating-Location: Chennai, Tamil Nadu, IN (49.37.209.89)
X-Originating-Platform: Windows Chrome 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 16 Mar 2026 09:58:20 -0700
References: <20260313155920.2347101-1-Harish.Sadineni@windriver.com> <20260313155920.2347101-3-Harish.Sadineni@windriver.com>
In-Reply-To: <20260313155920.2347101-3-Harish.Sadineni@windriver.com>
Message-ID: <411950.1773680300117270626@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="fohQ6cJ12dbhRY5Fghbu"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 16:58:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233262

--fohQ6cJ12dbhRY5Fghbu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 09:29 PM, Sadineni, Harish wrote:

>=20
> RUST_KERNEL_DEPENDS ?=3D "${@bb.utils.contains('KERNEL_FEATURES', 'rust',
> 'clang-native rust-native bindgen-cli-native', '', d)}"

Hi All,

As discussed in review call, *RUST_KERNEL_DEPENDS* will be moved to *"kerne=
l-yocto-rust.bbclass"* as a follow-up patch
once this series got merged.

Regards,
Deepesh

--fohQ6cJ12dbhRY5Fghbu
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Fri, Mar 13, 2026 at 09:29 PM, Sadineni, Harish wrote:</div>
<div>
<blockquote>RUST_KERNEL_DEPENDS ?=3D "${@bb.utils.contains('KERNEL_FEATURES=
', 'rust', 'clang-native rust-native bindgen-cli-native', '', d)}"</blockqu=
ote>
Hi All,<br /><br />As discussed in review call, <strong>RUST_KERNEL_DEPENDS=
</strong> will be moved to <strong>"kernel-yocto-rust.bbclass" </strong>as =
a follow-up patch<br />once this series got merged.</div>
<div>&nbsp;</div>
<div>Regards,<br />Deepesh</div>

--fohQ6cJ12dbhRY5Fghbu--

