Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10853.1795686686731934081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 01:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pengutronix.de header.s=20260414 header.b=RJXhdKV/;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: mfe@pengutronix.de)
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id E6834201941;
	Thu, 26 Nov 2026 10:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795686682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FDmitCSsaZEi2r7cUYILwCnVA0oGn2Oqq7htHei5VuQ=;
	b=RJXhdKV/Ded1vxEScZ2Z2ZQq8m59aHauLKZbJYwqACUkfArocyeOBfwLeSoH/3KiKFrOn4
	GxbZgvJpld1pAlenj2bp4wy/AxWwMAjqQKPXHxAZl2YRxAoofLgc9Eac/+Ae+vgVw88J1G
	tya9NG6VTomUO2kejZtFLzO8l3xw6J2v+gYA0huab4/xd2O9U3WJJVBX8QGEjGjXRcky/c
	Uq7kuXMseI2IVzMlr2u5dukmLy1TL2mip+DW4TgViS+QmuUVc7zPA9+NCjEawRm9efupWK
	LW/v1vom4auJfr1Eomf7bVvt11ifxfAZD4ID/15VVySX9UZ9U5uvLKWtcUDNtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795686682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FDmitCSsaZEi2r7cUYILwCnVA0oGn2Oqq7htHei5VuQ=;
	b=VgsgTGmrC0LRGm4lFwfWu6VC5CyV1VYKXVo+WYis/oftkbeBH43c76sAfP77HO/DkGMphh
	ahO3+XG25IDzfZQjBmGrVzUxb6SltbV0f637fKWX5t/t5Ej3qTmVSgJBcFpbmi4bsC6ss4
	5ZQjGDsSNbE/t7mZxwb/M5+yz6HbK06p411srITZSoRlvUYI+epQveGPCLIkgQfl7+Ue7X
	Taun0G2gcbZbgQAusFjfAlasA0daiqe7XkMpdTBkk+Du6f+u88+V5jBdaPI0pqNeGOLhLn
	4jYJHMIKEbsOyaQ/TtXqxRIvSpVgu5WIcKDiRv+bCK7wDMMy1y0iKVZ3lC9KtQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795686682; a=rsa-sha256;
	cv=none;
	b=UnR7Mh6OUaeyz7KIxp+4m0Dy4q6YubbONTkETKuAtQNXlbcz0FUhumxK3Khx8XoFGTw5a+
	mtW8KOrA6JTFKYVcPQWHk2HXY+g9+5R+R4E85WmB9m48eygd3916pMcxhsOonvBoGmkH3D
	zhu2ZrBCvOpFBZc7mRNpS9xr0hnkwg0MQg6fTqQwJMuVvInMEzPDoy77u9ZNPkYtv8Eu+D
	TvZh/PHKpC2DIht+3ydHJ9wZzax7a9kk6G/Q0o/LiJrXFH+qk6RCM1TQiZnSrJwQVEHn5T
	ebQyq1qUMIeSqXG6Cp0/pq0g2vCXKAkq19H6iU+/Ky2QqQP1K5enl7RE3+jrmA==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id C99E71BF383; Thu, 26 Nov 2026 10:51:22 +0100 (CET)
Date: Thu, 26 Nov 2026 10:51:22 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org, peter.kjellerstedt@axis.com, 
	yocto@pengutronix.de
Subject: Re: [PATCH v3] classes/cargo-update-recipe-crates: support multiple
 Cargo.lock search directories
Message-ID: <mgcpigspsivy5garwzkiya6f3mrrscheag6kgy2ejumly7j7ea@mhcday4eyien>
References: <20261126-mfe-multi-cargo-lock-files-v3-1-7ee885214204@pengutronix.de>
 <DN512WUV1N5T.37DXG9FP6FCI6@pbarker.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DN512WUV1N5T.37DXG9FP6FCI6@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 09:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251290

On 26-11-26 09:17, Paul Barker wrote:
> On Thu Nov 26, 2026 at 8:37 AM GMT, Marco Felsch wrote:
> > Recipes using cargo's -Z build-std must also vendor the standard
> > library's dependencies. The std sources staged by rust-native
> > (.../rustlib/src/rust/library) ship a Cargo.lock but no vendor
> > directory, so those crates need crate:// entries in SRC_URI as well.
> > Until now only a single directory could be scanned (CARGO_LOCK_SRC_DIR),
> > which forced the std crate list to be maintained by hand and go stale on
> > toolchain upgrades, breaking do_compile with:
> >
> >   error: failed to select a version for the requirement
> >   `cfg-if = "^1.0"` (locked to 1.0.4)
> >
> > Keep the existing CARGO_LOCK_SRC_DIR and extend it to support a
> > space-separated list of directories, to allow:
> >
> >   CARGO_LOCK_SRC_DIR = "${S} ${STAGING_LIBDIR_NATIVE}/rustlib/src/rust/library"
> >
> > This way the behavior can be backported.
> >
> > Crates found in multiple lockfiles are listed only once, in the section
> > of the first Cargo.lock containing them; conflicting checksums for the
> > same crate version now fail the task. The crates.io warning now names the
> > lockfile it came from. Output for recipes with a single lockfile is
> > unchanged.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > Hi,
> >
> > this patch adds the support to reference multiple Cargo.lock files which
> > is handy once a recipe want to rebuild the std-crate for minimized
> > special purpose builds.
> > ---
> > Changes in v3:
> > - Link to v2: https://lore.kernel.org/r/20261124-mfe-multi-cargo-lock-files-v2-1-8fd15cf316aa@pengutronix.de
> > - Convert to space-separated list to simplify :remove handling and align
> >   with standard bitbake behavior
> >
> > Changes in v2:
> > - Link to v1: https://lore.kernel.org/r/20261021-mfe-multi-cargo-lock-files-v1-0-d3510d4ad963@pengutronix.de
> > - Drop mainlined fixes patch
> > - Re-use CARGO_LOCK_SRC_DIR to make it backportable
> > - Add support for v1 Cargo.lock file format
> > ---
> >  .../cargo-update-recipe-crates.bbclass             | 87 ++++++++++++++++------
> >  1 file changed, 65 insertions(+), 22 deletions(-)
> >
> > diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> > index 0767b566ee287d11dc2e1e6d0aeea0a0d3b225b8..092dce21fe27bd1c693e8e68c4d6405ad2f03c71 100644
> > --- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> > +++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
> > @@ -9,6 +9,10 @@
> >  ## This class is used to update the list of crates in SRC_URI
> >  ## by reading Cargo.lock in the source tree.
> >  ##
> > +## Both the current Cargo.lock format (checksum stored per [[package]])
> > +## and the old v1 format (checksums stored in the [metadata] table as
> > +## "checksum <name> <version> (<source>)" checksum-val) are supported.
> 
> Hi,
> 
> It looks like this patch is making two changes at once: Adding support
> for multiple Cargo.lock dirs and adding support for multiple Cargo.lock
> format versions. There's no mention of the second change in the commit
> message.
> 
> This would be better as two separate patches.

Sure, I hoped that it can go in one patch since it's only a minor
addition. However, I get your point.

Regards,
  Marco

> Best regards,
> 
> -- 
> Paul Barker
> 
