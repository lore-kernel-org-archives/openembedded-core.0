Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9176.1795675979362981177
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 22:53:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pengutronix.de header.s=20260414 header.b=QbN7IDMP;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: mfe@pengutronix.de)
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.4.pengutronix.de [10.9.0.3])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D0B62202001;
	Thu, 26 Nov 2026 07:52:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795675976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rEczK2K0q04XQK8svw+c0eTO2oAgaPnvf5sSaGM6Okg=;
	b=QbN7IDMP5wqxtW61iIChaPSQ4MKb7YMZwiz5TrpJisSF/n5mzs8sP7jwwtZ+s/VMzDKrbQ
	4Cei/GjFAVYFdd+S+4ILH1g5whZqrx+2B6CrXFmR08PjfEsYXRQhlkckfZQ/arHqSsMWyB
	OZhB58fBkbtesbL9vIAHS7Qc2WkOqhiZpqM6OAUKng42LPma+fXsu/8bTJeL+B8VGNDXK9
	S0/gyQVddpFSTo2tJj3x4vBzF5/VAqcBYDmICCDA5edO9VgFOhRa/TWULeMdSKo0RzJXVr
	biF7rhaux5RK4ojkpktr95Qh6FvL/kpQbshbtEmqqlywVrwM1YCC2EGjPETT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795675976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rEczK2K0q04XQK8svw+c0eTO2oAgaPnvf5sSaGM6Okg=;
	b=eLqtOXBcUbfd4iFMnyKDQ/weyCZGKdzaoUqTHy/yilUjr7dRjXo4pRFOAcifyOnZSmFG9y
	bpLlgZq/DBZrQTlUUOy1vutPnCTaK3hSi+P5B8+ieUgSrQh1Ujtc878xm46tZMzZ1PIU2d
	MGxvrpChVIuJ1yitJOxhTTR9Uur9YEh3Zb7cqD2hl56VyrvaXCa74GzIDC8f9V47aeeTcC
	beWkNXEKyNtheZz1dZRvI2/RYbU6M/cNlR8JGJtFBmmkrDa1NBD0HLavlpW6FdJwMHBiTQ
	rOTE3HiOm2o63sZTiR4Dir4YBGZ5uNBdlis1WethJrl9Q74sQPPGOtk/SrwrHQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795675976; a=rsa-sha256;
	cv=none;
	b=W6Eu8b8nAQoaLpMdGxuxw8Y1C9Gm7rZCu8MFBB8qJ066hCY26yuP2cjUH094x4wvMgSR3e
	z4AJ13lNW59JU/lKDqUW+CbXdv4uRhQMYfsVogJUf3d6ecKZQXj+i+b4jKL3egE3ah7dEx
	hYdz4NF79bulbj7EYDKmTGxcE+cZ0QSuF5cLO+Y0lGChEieC97ftLJ2oPWOF2KH0j4aSfs
	3jOP9CbbBo/8LjNIA+KsLaJNt3NRBeL8t4JuBgjJ6CmcBRM9emADZcy9VpzvBamMIfaLGb
	tIfVmWQeXSgniqa5qxXmDsNCwkal5pXEbkpgm4UhTy0W82ALfOjBZxfuMDysaw==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id B267D1BF383; Thu, 26 Nov 2026 07:52:56 +0100 (CET)
Date: Thu, 26 Nov 2026 07:52:56 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"yocto@pengutronix.de" <yocto@pengutronix.de>
Subject: Re: [OE-core] [PATCH v2] classes/cargo-update-recipe-crates: support
 multiple Cargo.lock search directories
Message-ID: <cstxpjsty6wf4cjk37nk474txxkwxims4csjha7z72oeyshggu@3cwiz5etuhea>
References: <20261124-mfe-multi-cargo-lock-files-v2-1-8fd15cf316aa@pengutronix.de>
 <DB5PR02MB10213B2EC40B63599E3F09C4BEF422@DB5PR02MB10213.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB5PR02MB10213B2EC40B63599E3F09C4BEF422@DB5PR02MB10213.eurprd02.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 06:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251280

Hi Peter,

thanks for the review.

On 26-11-26 01:41, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Marco Felsch
> > Sent: den 24 november 2026 22:22
> > To: openembedded-core@lists.openembedded.org
> > Cc: yocto@pengutronix.de; Marco Felsch <m.felsch@pengutronix.de>
> > Subject: [OE-core] [PATCH v2] classes/cargo-update-recipe-crates: support multiple Cargo.lock search directories
> > 
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
> > comma-separated list of directories, to allow:
> 
> Why comma-separated? From a bitbake perspective, working with whitespace-
> separated lists is preferred as it, e.g., allows :remove to work.

Because no one questioned it during my v1. Good point regarding the
:append syntax!

Is this the only change requested?

Regards,
  Marco

> 
> > 
> >   CARGO_LOCK_SRC_DIR = "${S},${STAGING_LIBDIR_NATIVE}/rustlib/src/rust/library"
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
> 
> //Peter
> 
