Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id D0D5C7C8C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 18:02:43 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id h58so4998163edb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 10:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ab+D7nr8v5C1EWInhxyExSstIO3YxPTt/z7sefYBLh0=;
	b=emCApOBMLQ0Zl1641HPa/bxVOYMTpxNEdu970pSPFj6FM4M3kzyo/Duo578eAdP9v0
	tHJ3VqS38Rsp3RnpJZZGfLpmkPkuo5gHva6Scwj8sjIleZA3lHUzWCaycbST9OBvGe57
	v0cRRcJ6FTwsmz2mMBCrGuLUaxITU+KivkMKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ab+D7nr8v5C1EWInhxyExSstIO3YxPTt/z7sefYBLh0=;
	b=WBXNV3StaRE5Ta+d89PqQ826ybEVmweN4sfytRMN8Qpb6G0WJNKV98R61H6DSakorP
	rYWNTUK4PJuFWeozrqWNmqNT1eP3OQoT1V7bYvHH9AL9HiprPHIqKTIjiug1VXjSdBG3
	BddU5S4+5tgRLK1QNfLdtdmlBRF7V8UMAmmPE0n54I9GYhGJqF+khdVihqeQV68yYnRH
	+bKgZ3WdSz5fFne6DfG11BBiX6UYc8oo+Vhjr31wMzoXdygj8cuVZhciNq9QsBNcbBrC
	PMclUoqufIogOAU06Avy1znCu/FO1Y4EJWjs7aKM5A+EYchDOevWUT96J96/EMSScTUb
	UXpg==
X-Gm-Message-State: APjAAAUTON7vRCDxIaTibUikCbtg/nIfA6IYj795c/znWEUiuNNLRkTM
	AYCQpiUIedahIWVSELVFpVGMKg==
X-Google-Smtp-Source: APXvYqygoggpcdkGIU+2T99OZVDCxooaCbyYSrAOyzbbSQM6e6tpIYQcHsMhtmHIx5UKWimlKQ0yiQ==
X-Received: by 2002:a50:9484:: with SMTP id s4mr16670637eda.82.1551722564143; 
	Mon, 04 Mar 2019 10:02:44 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-D0BF-27DA-BE9A-269E.dyn6.twc.com.
	[2606:a000:1401:880d:d0bf:27da:be9a:269e])
	by smtp.gmail.com with ESMTPSA id
	z42sm2307477edd.29.2019.03.04.10.02.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 10:02:43 -0800 (PST)
Date: Mon, 4 Mar 2019 13:02:38 -0500
From: Tom Rini <trini@konsulko.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20190304180238.GU5026@bill-the-cat>
References: <1551479212-28944-1-git-send-email-trini@konsulko.com>
	<1551479212-28944-4-git-send-email-trini@konsulko.com>
	<af18c06a-189c-e3ab-9e42-2597e32c0d0e@windriver.com>
MIME-Version: 1.0
In-Reply-To: <af18c06a-189c-e3ab-9e42-2597e32c0d0e@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] packagegroup-core-base-utils: Introduce new base-utils packagegroup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Mar 2019 18:02:44 -0000
X-Groupsio-MsgNum: 121928
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FiqEyLLt06qkB6ow"
Content-Disposition: inline

--FiqEyLLt06qkB6ow
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2019 at 10:44:00AM -0600, Mark Hatle wrote:
> On 3/1/19 4:26 PM, Tom Rini wrote:
> > This packagegroup is intended to provide all of the functionality found
> > in other VIRTUAL-RUNTIME_base-utils providers through full packages
> > rather than an all-on-one package.  Document how to make use of this
> > in local.conf.sample.extended.  Introduce VIRTUAL-RUNTIME-vim and
> > default this to vim-tiny to allow for a differently features vim to be
> > used instead.
> >=20
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> > ---
> >  meta/conf/local.conf.sample.extended               |  8 ++++
> >  .../packagegroups/packagegroup-core-base-utils.bb  | 49 ++++++++++++++=
++++++++
> >  2 files changed, 57 insertions(+)
> >  create mode 100644 meta/recipes-extended/packagegroups/packagegroup-co=
re-base-utils.bb
> >=20
> > diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.con=
f.sample.extended
> > index 8062e4c5721b..d00221893ad9 100644
> > --- a/meta/conf/local.conf.sample.extended
> > +++ b/meta/conf/local.conf.sample.extended
> > @@ -384,3 +384,11 @@
> >  #VIRTUAL-RUNTIME_login_manager =3D "shadow-base"
> >  #VIRTUAL-RUNTIME_init_manager =3D "systemd"
> >  #VIRTUAL-RUNTIME_initscripts =3D "systemd-compat-units"
> > +
> > +#
> > +# Use a full set of packages instead of busybox for base utils
> > +#
> > +#PREFERRED_PROVIDER_base-utils =3D "packagegroup-core-base-utils"
> > +#VIRTUAL-RUNTIME_base-utils =3D "packagegroup-core-base-utils"
> > +#VIRTUAL-RUNTIME_base-utils-hwclock =3D "util-linux-hwclock"
> > +#VIRTUAL-RUNTIME_base-utils-syslog =3D "syslog"
> > diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-base=
-utils.bb b/meta/recipes-extended/packagegroups/packagegroup-core-base-util=
s.bb
> > new file mode 100644
> > index 000000000000..061dade0bc03
> > --- /dev/null
> > +++ b/meta/recipes-extended/packagegroups/packagegroup-core-base-utils.=
bb
> > @@ -0,0 +1,49 @@
> > +#
> > +# Copyright (C) 2019 Konsulko Group
> > +#
> > +
> > +SUMMARY =3D "Full-featured set of base utils"
> > +DESCRIPTION =3D "Package group bringing in packages needed to provide =
much of the base utils type functionality found in busybox"
> > +
> > +inherit packagegroup
> > +
> > +VIRTUAL-RUNTIME_vim ?=3D "vim-tiny"
> > +
> > +RDEPENDS_${PN} =3D "\
> > +    base-passwd \
> > +    bash \
> > +    bind-utils \
> > +    bzip2 \
> > +    coreutils \
> > +    cpio \
> > +    dhcp-client \
> > +    diffutils \
> > +    e2fsprogs \
> > +    ed \
> > +    file \
> > +    findutils \
> > +    gawk \
> > +    grep \
> > +    gzip \
> > +    inetutils \
> > +    iproute2 \
> > +    kmod \
> > +    less \
> > +    lzip \
> > +    ncurses-tools \
> > +    net-tools \
> > +    parted \
> > +    patch \
> > +    procps \
> > +    psmisc \
> > +    sed \
> > +    shadow-base \
> > +    tar \
> > +    time \
> > +    unzip \
> > +    util-linux \
> > +    ${VIRTUAL-RUNTIME_vim} \
> > +    wget \
> > +    which \
> > +    xz \
> > +    "
> >=20
>=20
> Sorry missed this earlier.  On note, we have a similar recipe in our loca=
l layer.
>=20
> I figured you may want to look at it to determine if anything might be mi=
ssing.
>=20
> https://github.com/WindRiver-OpenSourceLabs/wrlinux/blob/master-wr/recipe=
s-base/packagegroups/packagegroup-busybox-replacement.bb
>=20
> The parts I see missing (when comparing them) are:
>=20
> bc

I had this initially but bc isn't enabled in busybox (anymore?).

> debianutils-run-parts
> dhcp-server (likely not needed)
> dpkg-start-stop
> ifupdown

These fall into the category of "Oh, I need to try without systemd".
I'll put those in and give it a spin.

> kbd

This is in, but via a dep rather than explicit, so I'll list it.

> In some configurations we also add "fbset, netcat, and usleep" as well...=
 but I
> think the reasonable approach is to match the default busybox configurati=
on to
> whatever is in this list.

Ah fbset, going off on a quick tangent, I see 2.1 from 1999 is still the
latest and greatest.  Good times!  I'm not sure if we should move fbset
to oe-core however.  For netcat, we have netcat-openbsd in meta-oe which
is 'nc' and would match busybox saying CONFIG_NC=3Dy and CONFIG_NETCAT=3Dn.
For usleep, real sleep (and busybox sleep when configured) supports
decimals so I would be inclined to say sleep is good enough.

--=20
Tom

--FiqEyLLt06qkB6ow
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcfWg+AAoJEIf59jXTHXZSHcEQALLzMnX86CoIsawIg21h9eOe
M9019dIdk9+T89SrDPUEQ/J7GVvWto1Zb1p21wkPZWBuWQs7TD0j1/qIYuN37EEg
Mt/NlyryB4eUojMKvSf8sCZ5wtmJr/0YAVxQKTxYixbdtNY0c6HfsZU4NYJspsob
qgWrYjjfPEhs3jrmjGcghmtiWjBz/ho6oi0PUNHJxW4Jx3OAMcTTMmBLfZ/o+4xi
v10HZxMMcmpOuphiXBc1C3hVzDc4DnEOF2VdzM/vn6VG0uRf5zkuNUWvnlwXvaxC
io4hLBapdNMY50SISeCrs09qb2KQyckFYpMSDSmHO78A1Adb5blHQgkny7EYVPsd
cCCtnnAq1+B10BKdzX2QNUyHG4HAjgDmy0KWMmgD/aM51uULM6uh3tTxeFWgd7Xy
Pjf1ZjQ6LzdBrArPiW04+iG5K2ill54GwgKKRO/SqHXaeUt6D+1d0U6/R2EJt2iM
7vxC2VyYO9O0MEovy85H/y1NFuYnCYGho7NCrjfksFwm6pU6uUAH7bZ0lHxD3E1P
XyRFgUUaREMxNfYVPQB9I+4r1Mm49l6orcc0mpoPhzebrqqtn4wTnrUi1eaG+WGw
fgRWOTjyeBt63e/BwKIm5yOgC1VehOK4M3rCLtpLR7EqBV6FXjGHQCHM65PeDXDe
+TK9Bt0I66g8DVfVaDHc
=Vvfv
-----END PGP SIGNATURE-----

--FiqEyLLt06qkB6ow--
