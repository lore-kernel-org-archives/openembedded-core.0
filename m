Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41311.1793189114315883045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 05:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@pengutronix.de header.s=20260414 header.b=PTzGLPuu;
 spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: mfe@pengutronix.de)
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C646F202923;
	Wed, 28 Oct 2026 13:05:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793189111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zahSUa8ylIDHjJyqsd5jqfvv6SU7hZCTnOOp6pbWWEo=;
	b=PTzGLPuulqJ//9l+xuhHHxsj+OhoxjYe3l6TEtOJkwsWS79qoFQzA7MC1q618CttjdjSOR
	q8lZr7SOEwAf3Yhw4Lx7yh2b6yeSGN6mnAzNsy4W4WMUDFi5krRtlhHH7Xhg0UQOJHtocD
	d59dZmdToICW7nH5Y01s1J3V4pjFF+FnAyqebUv8CEIVIdY9XJKalatC2Grc3opQx2Uwzj
	rJzY+Z7hwf1U7a5j/ZUHAz6eesOeAdQ24yN7qiJkbjQB3rb6EaR4auM1GAw/oqYiCIzRCW
	h0ABDXPFV0IvQ9daquX8vSXi97sYw8OJvYEc5FkmdJs2MdN3klGo9DvrqwOJ2w==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793189111; a=rsa-sha256;
	cv=none;
	b=FtsYE7WCls790ozSHCHJ6aeHSWZAf8dSxDDpToXKQiiX7fiAZx4/Va+rKXmiLEwvyM+apT
	ix2muMCdBLmJpzROlMS8TpCwctRhNwDiQ61B3DgqM+i1OoARz8GTev/OYRlb40l8Zk2l27
	r+JQaoMDUeW1mdXYzkyvJBpbD7IT3axxgcpzD+8rJjMFLIr/m7O6hC6eaYWngLYPIQZTB2
	TDdUVHq0ov39xKm2sLl8jmSt1DnYNH4kbMJnJkcluZnVhwlK98kbTGyMUkwSm6tFngNF3J
	o4zaxPjbMzlBgTMKUDMCXGrQTPC4P0VgS2lSGSDZtIFWGRtLWuRaurBb76HnsA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793189111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zahSUa8ylIDHjJyqsd5jqfvv6SU7hZCTnOOp6pbWWEo=;
	b=FUfwDs9scHZFSmqDCTZsP+dNSfFo+1S/L+t0mJegUyHohoYCW/bO5UbY3jcs20GV8OVnFj
	/7BFYm5q7UV7BQEGJ5W+hsatYas8PMfBcsY3FmxuGVv9SmseE2NQlBWw5YoC5sqGZKaUUj
	2RCUUPWs7FA3gBmcRoklyHSjlNQqcaCHQwgECpj4oNssr2UyTyUc0s1RgzXboYrOXGknEx
	xKLo2UAX3ucNcuJuAEzb1p1CtPVF2BIDy/ib039i5xEDuXjcKazFu1v4dpq4em5o4G6oDg
	aw2lh7P7MMECyyGhtxT3xAsDkQYVlNr2m2ocOzArw8jsUR/LYsO5JrOsZ3xxow==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id AF2D61BFBF1; Wed, 28 Oct 2026 13:05:11 +0100 (CET)
Date: Wed, 28 Oct 2026 13:05:11 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"yocto@pengutronix.de" <yocto@pengutronix.de>
Subject: Re: [OE-core] [PATCH 2/2] classes/cargo-update-recipe-crates:
 support multiple Cargo.lock search directories
Message-ID: <fjyennz2eq7srovqzmtilh7mz47mjmdmn3hjwrl3pv4t4tllkt@3uz5fdq76dpq>
References: <20261021-mfe-multi-cargo-lock-files-v1-0-d3510d4ad963@pengutronix.de>
 <20261021-mfe-multi-cargo-lock-files-v1-2-d3510d4ad963@pengutronix.de>
 <CA25B707-72A7-4DD0-9834-EBF7BE50931E@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA25B707-72A7-4DD0-9834-EBF7BE50931E@arm.com>
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 12:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248812

On 26-10-28 11:13, Ross Burton wrote:
> On 21 Oct 2026, at 19:46, Marco Felsch via lists.openembedded.org <m.fe=
lsch=3Dpengutronix.de@lists.openembedded.org> wrote:
> > # The directory where to search for Cargo.lock files
> > CARGO_LOCK_SRC_DIR ??=3D "${S}"
> > +# Comma-separated list of directories where to search for Cargo.lock=
 files.
> > +# Crates found in multiple Cargo.lock files are listed only once, in=
 the
> > +# section of the first Cargo.lock file that contains them.
> > +CARGO_LOCK_SRC_DIRS ??=3D "${CARGO_LOCK_SRC_DIR}=E2=80=9D
>=20
> I don=E2=80=99t like having two variables, especially when a recipe cou=
ld set both.

Yeah setting both seems wrong in the first place, but I get your point.

> I think we either just split _DIR, or take advantage of just having
> released and rename _DIR to _DIRS (adding the relevant bitbake markup
> to tell the user this has happened).  The choice depends on whether
> this change is suitable for master only, or if you=E2=80=99d then be
> submitting a backport to stable branches=E2=80=A6

IMHO the change is only relevant for master.

However, changing it to _DIRS would produce a lot of unnecessary
breakage. If this is fine for oe-core I'm happy to go this way.

I could also keep the _DIR naming which is not very obvious of course
but doesn't introduce the breakage.

What is the oe-core preferred solution here?

Regards,
  Marco


>=20
> Ross
