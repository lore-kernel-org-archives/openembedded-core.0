Return-Path: <contact@schnwalter.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA028C43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 15:31:33 +0000 (UTC)
Subject: Re: [PATCH] meson: remove -mcpu from bindgen_clang_arguments
To: openembedded-core@lists.openembedded.org
From: "Walter Werner SCHNEIDER" <contact@schnwalter.eu>
X-Originating-Location: Arad, Arad County, RO (81.196.204.100)
X-Originating-Platform: Linux Firefox 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 29 Jun 2026 08:31:24 -0700
References: <20260610-fix-rust-bindgen-for-big-little-arch-v1-1-c3146ce76ea2@schnwalter.eu>
In-Reply-To: <20260610-fix-rust-bindgen-for-big-little-arch-v1-1-c3146ce76ea2@schnwalter.eu>
Message-ID: <330317.1782747084860562112@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="3SOIuvAiyqHISOvr6PPR"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 15:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239810

--3SOIuvAiyqHISOvr6PPR
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable

I think that I found a better fix by looking at what GCC does with the `-mc=
pu` argument, see `aarch64_rewrite_mcpu` and the `aarch64-cores.def` file. =
I'll look into making a new patch.

--3SOIuvAiyqHISOvr6PPR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>I think that I found a better fix by looking at what GCC does with the <=
code>-mcpu</code> argument, see <code>aarch64_rewrite_mcpu</code> and the <=
code>aarch64-cores.def</code> file. I'll look into making a new patch.</p>

--3SOIuvAiyqHISOvr6PPR--

