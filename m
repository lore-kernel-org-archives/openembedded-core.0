Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2DAAE71ABC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 12:02:44 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id v7so63424503ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 05:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3Rtih1dMI2R26mjuJYxACfPE91MCz0niR6laZ2sUxuE=;
	b=hXmBDmY+nasQUSMneBr7e3ccnTqi+prUb4cFBhfPlxdlWQ98W/oFUq7ZdPpopiAhXd
	ao+W3qY0kjELeso965VEwqnmhNqDZ8IJnifCO75t6l12j0Fdmyc6jQHUEL8T42fbcLAj
	7o6zEmLJbe1kPsEbqWXpXSIgoTpsJ1eUR4ILk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3Rtih1dMI2R26mjuJYxACfPE91MCz0niR6laZ2sUxuE=;
	b=DkALL/cj2393qwRuYAOy/W9sVqdCSlA4OSuYaBzOtYfOPWrTP/Ltqz2g2CtlrvZFoB
	FbayxxGQWC/GAMb11YipDXv0bwd5CgfCDMlWww3weW6r27A7JZcCYWtc/yurbNEmPpn6
	W48xq6nkruhG2jPwAbQH+jnI6roo4Gwgsyzn7aLd/uLbGvbKvtV4BAUlnMHWDTBl+Wi9
	WIo64dTmE+1MKOqVcDrQUISxvm9g2uOOCumAa+d2jJn9U8uhlzuM8H0MMQmYgoVkzNlV
	OzDs9A+2E5Sf9Ic5cYUIw8H04yOK2gFAMNZlu8tooHM5yqnaHJhEPeE0YLE5PL/CWb0Q
	I5sA==
X-Gm-Message-State: AKS2vOyNdKgFjA0gLw5ewFW97FDp2B/csYbOGqO3HEtRMWa3dv4C/IqR
	JWW+aQyn71rzFMRt
X-Received: by 10.129.79.151 with SMTP id d145mr295295ywb.92.1498046565716;
	Wed, 21 Jun 2017 05:02:45 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	e62sm6680948ywh.61.2017.06.21.05.02.44
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 21 Jun 2017 05:02:45 -0700 (PDT)
Date: Wed, 21 Jun 2017 08:03:17 -0400
From: Tom Rini <trini@konsulko.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20170621120317.GG27196@bill-the-cat>
References: <20170620221512.21860-1-otavio@ossystems.com.br>
	<20170620235544.GO28053@denix.org>
MIME-Version: 1.0
In-Reply-To: <20170620235544.GO28053@denix.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: marex@denx.de, brad.mouring@ni.com,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-fw-utils: Allow replacement of fw_env.config
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
X-List-Received-Date: Wed, 21 Jun 2017 12:02:46 -0000
X-Groupsio-MsgNum: 99183
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2NLGdgz3UMHa/lqP"
Content-Disposition: inline

--2NLGdgz3UMHa/lqP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2017 at 07:55:44PM -0400, Denys Dmytriyenko wrote:
> On Tue, Jun 20, 2017 at 07:15:12PM -0300, Otavio Salvador wrote:
> > If a fw_env.config file is found in workdir, this is preferred over
> > the U-Boot example.
> >=20
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >=20
> >  meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb b/meta/=
recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> > index c2e8f0fb84..0682f9274b 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> > +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> > @@ -19,7 +19,14 @@ do_install () {
> >  	install -d ${D}${sysconfdir}
> >  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_prin=
tenv
> >  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_sete=
nv
> > -	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env=
=2Econfig
> > +
> > +	# If a specific file is added in a .bbappend, this is used instead
> > +	# of the generic one
> > +	if [ -e ${WORKDIR}/fw_env.config ]; then
> > +		install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.co=
nfig
>=20
> I don't get it - if it's expected that a .bbappend will be adding a more=
=20
> specific version of fw_env.config, why that .bbappend can't simply instal=
l=20
> it with do_install_append()?

Well, this is a lot more user friendly, and it's quite likely that if a
platform intends to ship u-boot-fw-utils they intend to provide a
functional one as well.  It would be a best-practices to provide one
that works for a machine.conf that supports U-Boot, even (and has env
stored somewhere, I mean it even supports env as a file).

--=20
Tom

--2NLGdgz3UMHa/lqP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZSmCFAAoJEIf59jXTHXZS7rsP/i7XaNX3hLDwfYde4qfJ+7lu
5c/U3+TLn3lfmTVZRfwESlnm8noNCP+SXdPP4AJt4v/jT6UTJb41M8rPhefwj0Sr
RMvVK5F/yWFYLH34NHmLtOT5aHnSl+vHBTGq0/k69nseuESbYjNaXOMuHnC6YjR9
01+PGmyErcgwLIwxGqWbzvd5wlf0QIl4DHrafOJqnMa3OIKqo3rOnDWhmnPTVULq
muGbybF0xhEaaMfxCh3s/H43UAb6C7Cze1MXd/iYyHNbo/hRX8RfbEltyG1yde4L
fToh1ctg/lyLA5UOQlleF7+ZDwQ6+DEwgmq/yd6L0l8l7H8fnHN/A7MpTsV1aXnD
4vo8MwUodv2IswDXfjmDtLvGKILAAJ8Xfu/AjX8pPNJlvzB8zfGif5Hr1jVbR/Jb
Bw7r62r/KDa6qP1iY+L7wLMAUa5ROpPQDw4bRKmeH5hD8XIJTNjQM4BhfRFPwylF
AbyVynasvq5Pxalf0XFbPLFdU7wXs7/EvpTpCXFKhe77wQJIlVOq9h2TV93+B+dN
hwsSJWdrwjxHfHhFJ++S7itJMjo4ePhnQHB9Kt7NNfy+kPBnDYHLbTbMK738+F2T
D0/eVbdFzKi1GD6b8cpXJGLFNlC0IeYgZwvltOAnxvMpqUdKtyzb5VEE1WyxYLRk
AN9KWdsCRh5y9dz9BEkD
=r3uk
-----END PGP SIGNATURE-----

--2NLGdgz3UMHa/lqP--
