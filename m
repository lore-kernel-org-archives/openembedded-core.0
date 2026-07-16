Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2EAC44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 23:20:23 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2720.1784244015712699829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 16:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mdwH89fz;
 spf=pass (domain: konsulko.com, ip: 209.85.161.43, mailfrom: trini@konsulko.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6a382104a85so2240091eaf.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 16:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784244015; x=1784848815; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JiM2CPMIMt2HJBzFcS5lMXTldsU0wvqCoJMT1aO909Y=;
        b=mdwH89fzk1ut5DHHm/vPA6+22xRI0Y8aoGGG+CgIwHYRzUAO0qmYa+ixaRifIQ9jXu
         BGwYL9LKiTfLKyegXgVvG2l7yDc8N3DCGlzqV6Yt9C38h7cJevk2bv6xt+tlOC9eGnIU
         oaWBf8tLh1qnY993Y6/FMavtbIJ4l2MjpN56I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784244015; x=1784848815;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JiM2CPMIMt2HJBzFcS5lMXTldsU0wvqCoJMT1aO909Y=;
        b=b/MeEHW+hWxyxEK+BMK/RDlRnJBMcpLS6DoFTg16dc9HwpEB/XeKu2raKEx6hGqbCw
         4HT0hARAS6ivhLNGR6RJDx7fHNRSv+CmlsFyjMgTsf1mj8Cg5oiEHZELMgwxWTKECWV6
         l8BaIQlOiXJmH5qiMl3TdK5obTOENrVz8SVH+/8oWxSg9YcmnqMuLXJzgU0GSocabUfu
         0VA6piFRsaPSdpIRu5827tFoEm0BnSMH09A4nL8cFOYcTvOhAG/CZoPnpdYdYhufHpCD
         esef52Zz+3lDHfigUxz1yGKcgCZzeoGtT3uknYRVPeCvSsTuUZlWrodXYz5Xo2Ia3plG
         y28w==
X-Forwarded-Encrypted: i=1; AHgh+Rqjb+zDvxccoE9BDXX/SznALCuea7owQiPJzmyD35hKyHVh/X+SKkEIN0QyN+tptzcBk/20BtqTs+HGmj02V4AnUg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzBwz4dv3fNgbNySsthY9eAZM2I2lJd4wCoXa+fWhfVqqhpfEbR
	0bWyH931V61hnFGPZA1S+7CdU+6rBVfELynOukfKDoJ/VhcJHOychMCYUwKleoxFK+k=
X-Gm-Gg: AfdE7clz62dALxshjaoPdLDMXHYWrjIQ68aQwrL34Gy9VS5iRyxIoWVHL4z2jViBAbT
	bzyXOriMkaViJjK2mSI4ecGkCeOclDAG8EbgoPFyVOYBh30/a0UQD9Lyj+U3Z2kZ1jOynKtoail
	jRkUdCMpA085/P0FQI5eoTlKuxeoV4gGsTSXZGG55zuI7tajOa8rGQ93FD1OjN5nLFqPz5nLivu
	8QJgrQgYkSqyRuV185HDbLki4uJ9J14mCEAzKi1fP+v3NMl+nzTYxuF6XtAlsWxY8kJtiMVqAhE
	hhqsVyGur+8nVeBIat969WclotN8Ap6NH3J35OW9qBldEamljCx25fpkp3iWLf7qlQb64+hyy5T
	WOrTp31QZWnDNzgl455FVJgu+2yzL5B+74QIer4UNQ43ZfCpUXDO5MmcqF6b92pTDRr3oVzRQik
	QNOhugZKcRXldtfKh+2lJ/PwZU5cehH8vC6oyARYXTA7N3E+x6bVFUt9fPdfBrUmh3KGAaE+rZQ
	TYLzx82oA7ez+r0qdUAq8ZW+I09E457oqWvwgFQXOx+RDM0
X-Received: by 2002:a05:6820:184a:b0:6a3:7e5d:3e26 with SMTP id 006d021491bc7-6a47b02894fmr813412eaf.46.1784244014729;
        Thu, 16 Jul 2026 16:20:14 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-100-56.totalplay.net. [189.203.100.56])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm21586960fac.7.2026.07.16.16.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 16:20:13 -0700 (PDT)
Date: Thu, 16 Jul 2026 17:20:11 -0600
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: leon.anavi@konsulko.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [[PATCHv3] meta: Add pam to the defaults if using
 systemd
Message-ID: <20260716232011.GR749385@bill-the-cat>
References: <20260708143704.2643050-1-leon.anavi@konsulko.com>
 <7e6827804a7b8da37204e54171d8fb9f7b490b35.camel@linuxfoundation.org>
 <20260716182737.GP749385@bill-the-cat>
 <ea3daf0012f4f0d582081fef8f4b6f0a7e2a9556.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hH4G+nnAV0e1rXZn"
Content-Disposition: inline
In-Reply-To: <ea3daf0012f4f0d582081fef8f4b6f0a7e2a9556.camel@linuxfoundation.org>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 23:20:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241110


--hH4G+nnAV0e1rXZn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 09:28:26PM +0100, Richard Purdie wrote:
> On Thu, 2026-07-16 at 12:27 -0600, Tom Rini wrote:
> > On Thu, Jul 16, 2026 at 12:25:00PM +0100, Richard Purdie wrote:
> > > On Wed, 2026-07-08 at 17:37 +0300, Leon Anavi via
> > > lists.openembedded.org wrote:
> > > > This fixes issues with test_machine_world when running the
> > > > yocto-check-layer script for BSP layers that include weston in
> > > > the
> > > > dependency chain, for example meta-tegra:
> > > >=20
> > > > ERROR: Required build target 'meta-world-pkgdata' has no
> > > > buildable
> > > > providers.
> > > > Missing or unbuildable dependency chain was: ['meta-world-
> > > > pkgdata',
> > > > 'l4t-graphics-demos', 'weston']
> > >=20
> > > Why wouldn't l4t-graphics-demos just list pam as a required distro
> > > feature for that recipe?
> >=20
> > Because it doesn't come from l4t-graphics-demos it comes from weston?
> > And l4t-graphics-demos supports wayland or x11. Doing something here
> > would be the not satisfying approach Paul mentioned on v1 or so of
> > this thread. It shuts yocto-check-layer up while doing nothing of
> > value.
>=20
> I should explain a little about the unfortunate way that
> REQUIRED_DISTRO_FEATURES works.
>=20
> Anything that needs a specific distro feature uses that but it has a
> unfortunate ripple side effect where anything with that recipe as a
> dependency, must also then have the same REQUIRED_DISTRO_FEATURES line
> (or more restrictive).
>=20
> This was discussed extensively in the past and you will see this in the
> way x11 is rippled through recipes.
>=20
> I appreciate you will then argue this should be automatic as obviously
> anything depending on X will require Y as a DISTRO_FEATURE. I have
> refused to implement any such magic as it turns out it can misfire
> spectacularly badly and end up just masking every recipe out as a
> ripple effect for a poorly thought out change as the worst case
> scenario. There are plenty of scenarios where unexpected bad things can
> happen which would be hard to spot. This was discussed in the past too.
>=20
> So, my point is that if you have weston-init as a dependency, even
> indirectly, you have the required distro features requirement passed to
> that recipe and need to mark the recipe as such.
>=20
> No, it isn't great, but the alternatives can go spectacularly wrong too
> and you can't work out how to do this correctly automatically in a safe
> way.
>=20
> You are doing something of value, you're clearly marking the
> requirement of the recipe (which it has via it's dependencies).
>=20
> I think the question is marking the recipe in question to say it
> requires "pam+systemd+weston" or "x11", which might mean anonymous
> python but is definitely doable.

This specific problem has (will be) fixed in meta-tegra since weston can
just be dropped. But if I follow what you're saying right, since
meta/recipes-graphics/wayland/weston_15.0.0.bb ends up with:
REQUIRED_DISTRO_FEATURES =3D "wayland opengl ${@oe.utils.conditional('VIRTU=
AL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"
essentially every recipe that has DEPENDS on a PACKAGECONFIG that
brings in weston *also* needs that same logic, to not run in to a
problem later on.

Is there tooling to find and check that? And is the answer yes, we just
ran in to it?

--=20
Tom

--hH4G+nnAV0e1rXZn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCallnKAAKCRAr4qD1Cr/k
CrHEAQCCtOtn/uR/9B/aXTsDvVrkEb5Q8BYcEQEb/19fpn8S9gEAjSglecKemEv6
ieRlVwWv3qkI16gI/HwroVfgc4ObDQA=
=GE9e
-----END PGP SIGNATURE-----

--hH4G+nnAV0e1rXZn--

