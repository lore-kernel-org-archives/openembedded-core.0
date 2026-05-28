Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7140CD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 23:38:06 +0000 (UTC)
Subject: Re: [PATCH 1/2] clang: introduce thin-lto-pgo PACKAGECONFIG for PGO bootstrap
To: openembedded-core@lists.openembedded.org
From: "mark.yang" <mark.yang@lge.com>
X-Originating-Location: Nowon-gu, Seoul, KR (27.122.242.71)
X-Originating-Platform: Windows Chrome 148
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 28 May 2026 16:37:57 -0700
References: <20260521003929.14947-1-mark.yang@lge.com> <b4e726b5a3803edce5545f6b504e3ecb072dcdcc.camel@linuxfoundation.org>
In-Reply-To: <b4e726b5a3803edce5545f6b504e3ecb072dcdcc.camel@linuxfoundation.org>
Message-ID: <1873030.1780011477430661283@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="FmpRvSd9Ge4wDzgAwHSR"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 23:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237738

--FmpRvSd9Ge4wDzgAwHSR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review.

On the patches: upstream's PGO CMake flow assumes clang and llvm are built =
together in a single monorepo build,
which doesn't match how OE-core currently splits clang-native and llvm-nati=
ve into separate recipes. That mismatch
is what forces most of the carried patches. I'll look into fixing this in L=
LVM upstream first so we don't have to
carry the "Inappropriate" patches downstream.

Cheers,
mark.yang

--FmpRvSd9Ge4wDzgAwHSR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Thank you for the review.<br /><br />On the patches: upstream's PGO CM=
ake flow assumes clang and llvm are built together in a single monorepo bui=
ld,<br />which doesn't match how OE-core currently splits clang-native and =
llvm-native into separate recipes. That mismatch<br />is what forces most o=
f the carried patches. I'll look into fixing this in LLVM upstream first so=
 we don't have to<br />carry the "Inappropriate" patches downstream.<br /><=
br />Cheers,<br />mark.yang</div>

--FmpRvSd9Ge4wDzgAwHSR--

