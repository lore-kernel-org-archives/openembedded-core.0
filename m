Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10620.1795684646541581744
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 01:17:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=hldj6VCy;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=PdiHj8p2;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 86507140026E
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 04:17:25 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 26 Nov 2026 04:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795684645;
	 x=1795771045; bh=zSBYbC2yRtCeHtRWxyMvqxn9S3Gm2pIyhCf+vVUZEZQ=; b=
	hldj6VCyMiOqzvNCuzI4S/HSuLY2RmDxmkQKdmke6y8AHa0WegcO4cGKE5wrU709
	yVRWx/F1qvA+LEt8CxF1NM9DKRnrtKuQCvFAUAWeunncKN0xCfGxx0+9qQDiuo1c
	954bTnGFdyJWAujmNdMycmO7zuVXFxSOY2p1agzZ31fBE3Jv8kWDFQIqUOdOVpiu
	2TWDQaJQkU0j7JOU6CciHkw9UO+XUQhgYM3XT2v00CZ5Gv9T5Iy5TYNzyJGmQOY5
	0YRNbmMVUUjpUNfz0Dnu52u2xVlgF8xohmblf4XoLx+/Jeym5iXj7SQkIhckv4Np
	d64tmsEWkF3RZkLSqeboXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795684645; x=
	1795771045; bh=zSBYbC2yRtCeHtRWxyMvqxn9S3Gm2pIyhCf+vVUZEZQ=; b=P
	diHj8p26kD6gi5l9clI4NhhEExUc/4ygNyATr4tpHZ2zRBEFhli4uwjHolFSXSSz
	qNP0fDjGOWfujOCljL+3Kkr9wEhJRKKwIEGtxs+v1i8eqhjNHCYeF8ZwwtRHfUKs
	ZBv4IlfACwWs4eIbLQnnUp5/CZYv5z6QbWe6ds7RbzykA7TqeHxnx27nsTnrIP89
	ZRL23Ds0iDp8e1f8BBe221xs3uG6Ncnnit5ifWAcNNIxqdS5NzVDQzay86Aq1038
	qeDzSJUTZy99E1eIBlQvldq3M7sraqLWRGZgrKE1KmFSBLGlhH599auniNqgroQE
	rMVHTTqFW+xu0Kze6FTrQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795684645; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:TbbwOie/oJ4SUaNiNZPAInPDZNBlcTo2PkAs3w/jKji8gBG
	ouAzt33wudiSL6e7rdQKw2Y3iTZ4O3rU117zjIKgjBhXjQD0G2+FFBuxAiXmhPl+
	XmZseqPRnkEqKeecWmjboDHPNxVoULF33v/DMkxxYlg1ZxSmAeQoFuICz1KU/go9
	BDSuwF4W3Ll2udg2YtBo/iwGlQTqAQJNGr5syMa1W5fr2j3JwRuNQueyS3tNu/Gy
	5I+hJukGeafWiOWIn2Zoq1wqtM8LFAgUS1rKgPjdAydi47x5OA/aQU0NMSv76D1J
	LNO9JY51//qu4paIIfVR8WJ5JPOl7CF6cycXfIA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:LtdJ6YPB7PCCqJWPwtJEZNdi8Mztw//zzoxtjoJgsGs=:ClPSuOxiGTedt9EnAslnU9VC9xJV7pWBwkElSCMiESk=;
X-ME-Sender: <xms:JfkHa1iO4SPm5Nu0kX26c0DAS6WHJx5VsS7Wyn2VyqMXOQdFv-TDvA>
    <xme:JfkHaxBsO9kIXc11lbS95GC6EnBGqThYWFmb-gMsm9bkpNxqGN4C6D5VlNkvJCFKJ
    aMjad1bTMyHxafvmSCkotbptOFb2-wvqKDuc8cNkKHaV-O0wl4B10n2>
X-ME-Received: <xmr:JfkHa6FwDc4ltXb3eB1DxMMn0zsE8lQ7fTiaIDC7JP9WmvPrYro1oIb-CM8aEYMpFwJ1EYOxOJVDMy7s8GgNj65jy_I6>
X-ME-Proxy-Cause: dmFkZTFY+ICz8QyYW6zNOtjBhcZrpEw1y8OZGxs8kDyjnZXK0/AflQ3m3PIGiQm0ZSpbV/
    SM0gzTvpppOMkZc85oNMtzKQu9MiPwG7bCsTc8I/nzlrHLZaU5QwbHa2YL4vj2iqvqpfvQ
    YamaObJlwZ9hvPkXMydVFKsoPKVWAnvzJknHUK9a4MGHI0PeJ1UxzecyjhoURfmoaMVjpK
    gJd4gh8tgBOZvSy5dsWjCU+CHFB4ctQrRFtt9V7i8VCpuHTC30eUo0v30jG1BKsq05Dq+y
    SVq1GJDlyJYbZ98BEZt2qnRCc7vAxhxret4nhxtD6EE22C4oT/gv23SGBddMAfIs98dLPo
    YOMyokvXtyJk1kVZnL+19EOw4u9GwIyZ+r/7v3uatiBIdnopBS28mSP8+ZvRB5S5LfaTRh
    BD60oy5hV7iaSygRCmswu5/cd2tl1o7uslw4gJYg51nSVL+hHJ6kJZyYf4VqMmkfM8glNH
    WioAUsXXGtzIlf67yWr9HXJ4WiWkCdQRm1QBBixvmLiMMpNlutbJmPXFwsO5E4I6zlCOcn
    2Dv7r6uLokW7YK+AE9wun0MeQJDiCt4NmOjql5Uc/jToaMkawrJjRi01AjUNsfmoUhwsvB
    q7lr//FGX6OtWcAIX4xK7FT1l6NWg433Ulzq9v1wnDCrg+71Qf0RMau6Awrw
X-ME-Proxy: <xmx:JfkHa5KodRoW4BsgPc75Xp4_yk94CuTP3Fo5laHhV5xHq5lrtFxxhQ>
    <xmx:JfkHa-knZanc4sBF6JGPXqVpr5EhfQD6e09CbLkwr4hWiJLoMvP3Dw>
    <xmx:JfkHaxSiTynhkCwmJjPygiDBxgyz0v9dgAdmAYtLCE74rFB4N_vZFA>
    <xmx:JfkHawIO4Wzii_XxMAQ6jTzLuXUqu9fI5LMwrZLanGVlilZGresTeQ>
    <xmx:JfkHa-Yr6DLBjIrI5Njj6vjdHwsU40Uz3advLgbLkHminQKzq5W0gp36>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Nov 2026 04:17:24 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 09:17:23 +0000
Message-Id: <DN512WUV1N5T.37DXG9FP6FCI6@pbarker.dev>
Subject: Re: [PATCH v3] classes/cargo-update-recipe-crates: support multiple
 Cargo.lock search directories
From: "Paul Barker" <paul@pbarker.dev>
To: "Marco Felsch" <m.felsch@pengutronix.de>,
 <openembedded-core@lists.openembedded.org>
Cc: <peter.kjellerstedt@axis.com>, <yocto@pengutronix.de>
X-Mailer: aerc 0.22.0
References: <20261126-mfe-multi-cargo-lock-files-v3-1-7ee885214204@pengutronix.de>
In-Reply-To: <20261126-mfe-multi-cargo-lock-files-v3-1-7ee885214204@pengutronix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 09:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251289

On Thu Nov 26, 2026 at 8:37 AM GMT, Marco Felsch wrote:
> Recipes using cargo's -Z build-std must also vendor the standard
> library's dependencies. The std sources staged by rust-native
> (.../rustlib/src/rust/library) ship a Cargo.lock but no vendor
> directory, so those crates need crate:// entries in SRC_URI as well.
> Until now only a single directory could be scanned (CARGO_LOCK_SRC_DIR),
> which forced the std crate list to be maintained by hand and go stale on
> toolchain upgrades, breaking do_compile with:
>
>   error: failed to select a version for the requirement
>   `cfg-if =3D "^1.0"` (locked to 1.0.4)
>
> Keep the existing CARGO_LOCK_SRC_DIR and extend it to support a
> space-separated list of directories, to allow:
>
>   CARGO_LOCK_SRC_DIR =3D "${S} ${STAGING_LIBDIR_NATIVE}/rustlib/src/rust/=
library"
>
> This way the behavior can be backported.
>
> Crates found in multiple lockfiles are listed only once, in the section
> of the first Cargo.lock containing them; conflicting checksums for the
> same crate version now fail the task. The crates.io warning now names the
> lockfile it came from. Output for recipes with a single lockfile is
> unchanged.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Hi,
>
> this patch adds the support to reference multiple Cargo.lock files which
> is handy once a recipe want to rebuild the std-crate for minimized
> special purpose builds.
> ---
> Changes in v3:
> - Link to v2: https://lore.kernel.org/r/20261124-mfe-multi-cargo-lock-fil=
es-v2-1-8fd15cf316aa@pengutronix.de
> - Convert to space-separated list to simplify :remove handling and align
>   with standard bitbake behavior
>
> Changes in v2:
> - Link to v1: https://lore.kernel.org/r/20261021-mfe-multi-cargo-lock-fil=
es-v1-0-d3510d4ad963@pengutronix.de
> - Drop mainlined fixes patch
> - Re-use CARGO_LOCK_SRC_DIR to make it backportable
> - Add support for v1 Cargo.lock file format
> ---
>  .../cargo-update-recipe-crates.bbclass             | 87 ++++++++++++++++=
------
>  1 file changed, 65 insertions(+), 22 deletions(-)
>
> diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/met=
a/classes-recipe/cargo-update-recipe-crates.bbclass
> index 0767b566ee287d11dc2e1e6d0aeea0a0d3b225b8..092dce21fe27bd1c693e8e68c=
4d6405ad2f03c71 100644
> --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> @@ -9,6 +9,10 @@
>  ## This class is used to update the list of crates in SRC_URI
>  ## by reading Cargo.lock in the source tree.
>  ##
> +## Both the current Cargo.lock format (checksum stored per [[package]])
> +## and the old v1 format (checksums stored in the [metadata] table as
> +## "checksum <name> <version> (<source>)" checksum-val) are supported.

Hi,

It looks like this patch is making two changes at once: Adding support
for multiple Cargo.lock dirs and adding support for multiple Cargo.lock
format versions. There's no mention of the second change in the commit
message.

This would be better as two separate patches.

Best regards,

--=20
Paul Barker

