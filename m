Return-Path: <contact@schnwalter.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3328CD4F2C
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 09:19:37 +0000 (UTC)
Subject: Re: [PATCH] meson: remove -mcpu from bindgen_clang_arguments
To: openembedded-core@lists.openembedded.org
From: "Walter Werner SCHNEIDER" <contact@schnwalter.eu>
X-Originating-Location: Arad, Arad County, RO (84.232.135.182)
X-Originating-Platform: Linux Firefox 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 12 Jun 2026 02:19:21 -0700
References: <20260610-fix-rust-bindgen-for-big-little-arch-v1-1-c3146ce76ea2@schnwalter.eu>
In-Reply-To: <20260610-fix-rust-bindgen-for-big-little-arch-v1-1-c3146ce76ea2@schnwalter.eu>
Message-ID: <82309.1781255961942878285@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="XJAgsqsTzAk4QOFGlulY"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 09:19:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238597

--XJAgsqsTzAk4QOFGlulY
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable

I've noticed that this doesn't work when building for the eSDK (`bitbake -c=
 populate_sdk_ext image`), at least not on my image. It works for normal bu=
ilds and the normal SDK (`bitbake -c populate_sdk image`). I'll work on a b=
etter fix.

--XJAgsqsTzAk4QOFGlulY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>I've noticed that this doesn't work when building for the eSDK (<code>bi=
tbake -c populate_sdk_ext image</code>), at least not on my image. It works=
 for normal builds and the normal SDK (<code>bitbake -c populate_sdk image<=
/code>). I'll work on a better fix.</p>

--XJAgsqsTzAk4QOFGlulY--

