Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF82CC77B6F
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 16:54:12 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.19859.1681232046548308125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 09:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BZdZomxx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4BA35FF805;
	Tue, 11 Apr 2023 16:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681232044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUlEuwsK8lWzH07XHFVqPYMtq9cmfL4OjIBD0pQBXBk=;
	b=BZdZomxxTOYkUaLrGG1pr7eeaeYaXN/BewKU5BjaJmxVWKgOZjMQJsxzY0N4dHSK6oBqg/
	wOFNtSy/ys9YM4e6p2XpORrlpm+N3amxv2GHSmqShkOvP66wJosrhmliOG6eBhINA9d8xp
	jJRiVIJbORBjlaDIhdWY/oWwYOY1ZG7BxOzlIPNn7cAXIdJFGPUmORRvrWr32Ly9WtOUhR
	NUIYnDQ0uNxG9T415WXuBtBTyb01SvPV30VIjLVzEs2e1BS3VPIrzgPiByw0zStTviQ0Py
	YatiRyZ30ZRyTmCfSkc4zg2bf8ysJISbPbcHPTfv9ZyH8I+H9UeGdu3mLkNYlw==
Date: Tue, 11 Apr 2023 18:53:48 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.68.1 -> 1.68.2
Message-ID: <20230411072903b6262692@mail.local>
References: <20230410094122.5865-1-alex.kiernan@gmail.com>
 <CAMKF1sq_jvEn5VYmAnRj8HKrXtGAWj8cmD+O6eRHiBqdsLf_EQ@mail.gmail.com>
 <2023041017305195b4c7aa@mail.local>
 <CAMKF1sp-r4THLG2xfSDiVf=gkaO3aH8SvM0s+keNgAR9mow0tQ@mail.gmail.com>
 <CAMKF1sqyY+MAk_JtE831a7h0SaARKmMtNDf4Vfznx0h4j1d8rA@mail.gmail.com>
 <CAO5Uq5RRmUVzuC9tpo1ifPWwfjMJJV1K9i7hcF2adq-VuOCQ5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO5Uq5RRmUVzuC9tpo1ifPWwfjMJJV1K9i7hcF2adq-VuOCQ5g@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 16:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179935

I confirm it didn't cause any particular issue to the autobuilders.

On 11/04/2023 08:18:23+0100, Alex Kiernan wrote:
> Cool, was just picking up the pieces to check it, but I'll leave it now!
> 
> On Tue, 11 Apr 2023, 08:07 Khem Raj, <raj.khem@gmail.com> wrote:
> 
> > alright my builds for cargo on qemuriscv32/musl went ok so I guess its ok.
> >
> > On Mon, Apr 10, 2023 at 11:11 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Thanks, I'll also check it out. I think the checksums for the musl
> > > patch would need updating I think as the versions of these crates
> > > might have changed.
> > >
> > > On Mon, Apr 10, 2023 at 10:30 AM Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> wrote:
> > > >
> > > > My current a-full has this patch.
> > > >
> > > > On 10/04/2023 10:21:16-0700, Khem Raj wrote:
> > > > > If possible, Can you test this on top of contrib/abelloni/master-next
> > > > > for musl target ?
> > > > >
> > > > > On Mon, Apr 10, 2023 at 2:42 AM Alex Kiernan <alex.kiernan@gmail.com>
> > wrote:
> > > > > >
> > > > > > Changes:
> > > > > >
> > > > > > * Update the GitHub RSA host key bundled within Cargo. The key was
> > > > > >   rotated by GitHub on 2023-03-24 after the old one leaked.
> > > > > > * Mark the old GitHub RSA host key as revoked. This will prevent
> > Cargo
> > > > > >   from accepting the leaked key even when trusted by the system.
> > > > > > * Add support for @revoked and a better error message for
> > > > > >   @cert-authority in Cargo’s SSH host key verification
> > > > > >
> > > > > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > > > > ---
> > > > > >
> > > > > >  meta/recipes-devtools/rust/{cargo_1.68.1.bb => cargo_1.68.2.bb}
> > | 0
> > > > > >  .../rust/{libstd-rs_1.68.1.bb => libstd-rs_1.68.2.bb}
> >  | 0
> > > > > >  ...t-cross-canadian_1.68.1.bb => rust-cross-canadian_1.68.2.bb}
> > | 0
> > > > > >  .../rust/{rust-llvm_1.68.1.bb => rust-llvm_1.68.2.bb}
> >  | 0
> > > > > >  meta/recipes-devtools/rust/rust-source.inc                      |
> > 2 +-
> > > > > >  meta/recipes-devtools/rust/{rust_1.68.1.bb => rust_1.68.2.bb}
> >  | 0
> > > > > >  6 files changed, 1 insertion(+), 1 deletion(-)
> > > > > >  rename meta/recipes-devtools/rust/{cargo_1.68.1.bb =>
> > cargo_1.68.2.bb} (100%)
> > > > > >  rename meta/recipes-devtools/rust/{libstd-rs_1.68.1.bb =>
> > libstd-rs_1.68.2.bb} (100%)
> > > > > >  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.68.1.bb
> > => rust-cross-canadian_1.68.2.bb} (100%)
> > > > > >  rename meta/recipes-devtools/rust/{rust-llvm_1.68.1.bb =>
> > rust-llvm_1.68.2.bb} (100%)
> > > > > >  rename meta/recipes-devtools/rust/{rust_1.68.1.bb =>
> > rust_1.68.2.bb} (100%)
> > > > > >
> > > > > > diff --git a/meta/recipes-devtools/rust/cargo_1.68.1.bb
> > b/meta/recipes-devtools/rust/cargo_1.68.2.bb
> > > > > > similarity index 100%
> > > > > > rename from meta/recipes-devtools/rust/cargo_1.68.1.bb
> > > > > > rename to meta/recipes-devtools/rust/cargo_1.68.2.bb
> > > > > > diff --git a/meta/recipes-devtools/rust/libstd-rs_1.68.1.bb
> > b/meta/recipes-devtools/rust/libstd-rs_1.68.2.bb
> > > > > > similarity index 100%
> > > > > > rename from meta/recipes-devtools/rust/libstd-rs_1.68.1.bb
> > > > > > rename to meta/recipes-devtools/rust/libstd-rs_1.68.2.bb
> > > > > > diff --git a/meta/recipes-devtools/rust/
> > rust-cross-canadian_1.68.1.bb b/meta/recipes-devtools/rust/
> > rust-cross-canadian_1.68.2.bb
> > > > > > similarity index 100%
> > > > > > rename from meta/recipes-devtools/rust/
> > rust-cross-canadian_1.68.1.bb
> > > > > > rename to meta/recipes-devtools/rust/rust-cross-canadian_1.68.2.bb
> > > > > > diff --git a/meta/recipes-devtools/rust/rust-llvm_1.68.1.bb
> > b/meta/recipes-devtools/rust/rust-llvm_1.68.2.bb
> > > > > > similarity index 100%
> > > > > > rename from meta/recipes-devtools/rust/rust-llvm_1.68.1.bb
> > > > > > rename to meta/recipes-devtools/rust/rust-llvm_1.68.2.bb
> > > > > > diff --git a/meta/recipes-devtools/rust/rust-source.inc
> > b/meta/recipes-devtools/rust/rust-source.inc
> > > > > > index c8f5a5a9c4c4..6d3a4b131e26 100644
> > > > > > --- a/meta/recipes-devtools/rust/rust-source.inc
> > > > > > +++ b/meta/recipes-devtools/rust/rust-source.inc
> > > > > > @@ -7,7 +7,7 @@ SRC_URI += "
> > https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
> > > > > >
> > file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=${RUSTSRC} \
> > > > > >              file://zlib-off64_t.patch;patchdir=${RUSTSRC} \
> > > > > >  "
> > > > > > -SRC_URI[rust.sha256sum] =
> > "5b8ea94085b65e75c1fa6310e2f90bd706fa80bfcb3544fe26f4037b911d9fb2"
> > > > > > +SRC_URI[rust.sha256sum] =
> > "ce1a115f6aafa912b4622906a92b626354973afa9288e2c7750df4dcf3390fc0"
> > > > > >
> > > > > >  RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
> > > > > >
> > > > > > diff --git a/meta/recipes-devtools/rust/rust_1.68.1.bb
> > b/meta/recipes-devtools/rust/rust_1.68.2.bb
> > > > > > similarity index 100%
> > > > > > rename from meta/recipes-devtools/rust/rust_1.68.1.bb
> > > > > > rename to meta/recipes-devtools/rust/rust_1.68.2.bb
> > > > > > --
> > > > > > 2.39.0
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > >
> > > > >
> > > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#179897):
> > https://lists.openembedded.org/g/openembedded-core/message/179897
> > > > > Mute This Topic: https://lists.openembedded.org/mt/98172309/3617179
> > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub [
> > alexandre.belloni@bootlin.com]
> > > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > >
> > > >
> > > >
> > > > --
> > > > Alexandre Belloni, co-owner and COO, Bootlin
> > > > Embedded Linux and Kernel engineering
> > > > https://bootlin.com
> >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

