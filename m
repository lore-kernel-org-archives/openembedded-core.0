Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51269C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 17:31:01 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.50715.1681147855499594418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 10:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ez6i0YZt;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4E483240005;
	Mon, 10 Apr 2023 17:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681147852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qnGdCHU8yhZXYjA2418lJcdCV4P9DuEnP4rLEVArWPA=;
	b=Ez6i0YZtn7BYpxJ4QIw02t+8NmnN3OY6SH0PsPCjcE2NlA/rBVPU0LCrR7npwISubpKJ/3
	gE4VbjPhfDmRD/OUp7A2tBE7ZWLjmilHA6JaFQPYSX/HWl7DXWoUZPOiPqtkxw3S9MK4HS
	WXtxwi68g/HIxFB0bmQokseh6N9xRaVLSx8tTguxMs6zqmuBtudwf23M21OpiH0MOy8SZh
	UJYR2g8MfBwYAH/Igxdpy8/G1YD08IRb+VVvv7lcch5ccmdd+ZyjxS5wAVN6lS+NzpNl42
	1mBU5+Da+FVMasCOoc8GsdFdiPFGsbfh/Ws9FXeFfWuM4pQyQ+bbOw9rFz0Arw==
Date: Mon, 10 Apr 2023 19:30:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.68.1 -> 1.68.2
Message-ID: <2023041017305195b4c7aa@mail.local>
References: <20230410094122.5865-1-alex.kiernan@gmail.com>
 <CAMKF1sq_jvEn5VYmAnRj8HKrXtGAWj8cmD+O6eRHiBqdsLf_EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1sq_jvEn5VYmAnRj8HKrXtGAWj8cmD+O6eRHiBqdsLf_EQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 17:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179901

My current a-full has this patch.

On 10/04/2023 10:21:16-0700, Khem Raj wrote:
> If possible, Can you test this on top of contrib/abelloni/master-next
> for musl target ?
> 
> On Mon, Apr 10, 2023 at 2:42 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > Changes:
> >
> > * Update the GitHub RSA host key bundled within Cargo. The key was
> >   rotated by GitHub on 2023-03-24 after the old one leaked.
> > * Mark the old GitHub RSA host key as revoked. This will prevent Cargo
> >   from accepting the leaked key even when trusted by the system.
> > * Add support for @revoked and a better error message for
> >   @cert-authority in Cargo’s SSH host key verification
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  meta/recipes-devtools/rust/{cargo_1.68.1.bb => cargo_1.68.2.bb} | 0
> >  .../rust/{libstd-rs_1.68.1.bb => libstd-rs_1.68.2.bb}           | 0
> >  ...t-cross-canadian_1.68.1.bb => rust-cross-canadian_1.68.2.bb} | 0
> >  .../rust/{rust-llvm_1.68.1.bb => rust-llvm_1.68.2.bb}           | 0
> >  meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
> >  meta/recipes-devtools/rust/{rust_1.68.1.bb => rust_1.68.2.bb}   | 0
> >  6 files changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-devtools/rust/{cargo_1.68.1.bb => cargo_1.68.2.bb} (100%)
> >  rename meta/recipes-devtools/rust/{libstd-rs_1.68.1.bb => libstd-rs_1.68.2.bb} (100%)
> >  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.68.1.bb => rust-cross-canadian_1.68.2.bb} (100%)
> >  rename meta/recipes-devtools/rust/{rust-llvm_1.68.1.bb => rust-llvm_1.68.2.bb} (100%)
> >  rename meta/recipes-devtools/rust/{rust_1.68.1.bb => rust_1.68.2.bb} (100%)
> >
> > diff --git a/meta/recipes-devtools/rust/cargo_1.68.1.bb b/meta/recipes-devtools/rust/cargo_1.68.2.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/cargo_1.68.1.bb
> > rename to meta/recipes-devtools/rust/cargo_1.68.2.bb
> > diff --git a/meta/recipes-devtools/rust/libstd-rs_1.68.1.bb b/meta/recipes-devtools/rust/libstd-rs_1.68.2.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/libstd-rs_1.68.1.bb
> > rename to meta/recipes-devtools/rust/libstd-rs_1.68.2.bb
> > diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.68.1.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.68.2.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/rust-cross-canadian_1.68.1.bb
> > rename to meta/recipes-devtools/rust/rust-cross-canadian_1.68.2.bb
> > diff --git a/meta/recipes-devtools/rust/rust-llvm_1.68.1.bb b/meta/recipes-devtools/rust/rust-llvm_1.68.2.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/rust-llvm_1.68.1.bb
> > rename to meta/recipes-devtools/rust/rust-llvm_1.68.2.bb
> > diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
> > index c8f5a5a9c4c4..6d3a4b131e26 100644
> > --- a/meta/recipes-devtools/rust/rust-source.inc
> > +++ b/meta/recipes-devtools/rust/rust-source.inc
> > @@ -7,7 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
> >              file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=${RUSTSRC} \
> >              file://zlib-off64_t.patch;patchdir=${RUSTSRC} \
> >  "
> > -SRC_URI[rust.sha256sum] = "5b8ea94085b65e75c1fa6310e2f90bd706fa80bfcb3544fe26f4037b911d9fb2"
> > +SRC_URI[rust.sha256sum] = "ce1a115f6aafa912b4622906a92b626354973afa9288e2c7750df4dcf3390fc0"
> >
> >  RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
> >
> > diff --git a/meta/recipes-devtools/rust/rust_1.68.1.bb b/meta/recipes-devtools/rust/rust_1.68.2.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/rust/rust_1.68.1.bb
> > rename to meta/recipes-devtools/rust/rust_1.68.2.bb
> > --
> > 2.39.0
> >
> >
> > 
> >

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179897): https://lists.openembedded.org/g/openembedded-core/message/179897
> Mute This Topic: https://lists.openembedded.org/mt/98172309/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

