Return-Path: <trini@konsulko.com>
Received: from mail-yb0-f172.google.com (mail-yb0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1A46C77E5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 16:52:23 +0000 (UTC)
Received: by mail-yb0-f172.google.com with SMTP id 84so48309012ybe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jun 2017 09:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0iJCEOu7vc3diBlIcEopiPyNjlWQqSPA6X1/I1K60SU=;
	b=mIGcXpkWXAcYEmiD5HN3YtjCDzMcy5Idi31qeS/bd29O9J0LlwrvLVemhL8rVr2SGt
	gOq7vQKzpNvd3f6F/cAbhGD/bHFbG08wL72KpHMjHj13lDkX/K3dUBUZepsxWWD3aau9
	Nttko6c0D8CGnKFpcJbgzD/JOvwqePoc8JeuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0iJCEOu7vc3diBlIcEopiPyNjlWQqSPA6X1/I1K60SU=;
	b=cIlYYUNJfS9tcnlGpDB427y60KhwTNMSBPASxcTwSOYjOdjjDhVys1FQ2Lu1J91Rp7
	GcFudYa3QXfIP5O/ghmKka7PY/Lrz/SXACzKjZAROv+UFydZ2aw+6Ss1/EcYHhGV1Dcf
	4Wigk3RV4nZP2KQ5gLzSAWRvB1+YC5yzxgP63lQuDHEzxumIti+Pa84rhjwGa+FFLpaK
	F5GT7ohLMsvgmA2kfpaCH3H9vMkRWCMS0Kso0DegOQpINPT8ohhEBnfilPYptvgX5xWt
	2Px5AuKnMnG6vb53Xj2PoX4LKK6PyCntA6fWgNADiooynX+Mby0ugBvFCdv0XeE8iOnt
	SMmg==
X-Gm-Message-State: AKS2vOx5rzjKx+CJMp6YhrogSMmfU9bUUDqfQHH2U8LAbwRAt/0+CI4L
	AqTft96v0tEqZJSi
X-Received: by 10.37.177.27 with SMTP id g27mr16752278ybj.50.1498063944852;
	Wed, 21 Jun 2017 09:52:24 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133]) by smtp.gmail.com with ESMTPSA id
	i129sm2789667ywf.46.2017.06.21.09.52.23
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 21 Jun 2017 09:52:24 -0700 (PDT)
Date: Wed, 21 Jun 2017 12:52:56 -0400
From: Tom Rini <trini@konsulko.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20170621165256.GL27196@bill-the-cat>
References: <20170620221512.21860-1-otavio@ossystems.com.br>
	<20170620235544.GO28053@denix.org>
	<20170621120317.GG27196@bill-the-cat>
	<20170621155023.GQ28053@denix.org>
MIME-Version: 1.0
In-Reply-To: <20170621155023.GQ28053@denix.org>
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
X-List-Received-Date: Wed, 21 Jun 2017 16:52:24 -0000
X-Groupsio-MsgNum: 99201
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Z1OTrj3C7qypP14j"
Content-Disposition: inline

--Z1OTrj3C7qypP14j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2017 at 11:50:23AM -0400, Denys Dmytriyenko wrote:
> On Wed, Jun 21, 2017 at 08:03:17AM -0400, Tom Rini wrote:
> > On Tue, Jun 20, 2017 at 07:55:44PM -0400, Denys Dmytriyenko wrote:
> > > On Tue, Jun 20, 2017 at 07:15:12PM -0300, Otavio Salvador wrote:
> > > > If a fw_env.config file is found in workdir, this is preferred over
> > > > the U-Boot example.
> > > >=20
> > > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > > > ---
> > > >=20
> > > >  meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb | 9 ++++++++-
> > > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb b/m=
eta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> > > > index c2e8f0fb84..0682f9274b 100644
> > > > --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> > > > +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> > > > @@ -19,7 +19,14 @@ do_install () {
> > > >  	install -d ${D}${sysconfdir}
> > > >  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_=
printenv
> > > >  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_=
setenv
> > > > -	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw=
_env.config
> > > > +
> > > > +	# If a specific file is added in a .bbappend, this is used instead
> > > > +	# of the generic one
> > > > +	if [ -e ${WORKDIR}/fw_env.config ]; then
> > > > +		install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_en=
v.config
> > >=20
> > > I don't get it - if it's expected that a .bbappend will be adding a m=
ore=20
> > > specific version of fw_env.config, why that .bbappend can't simply in=
stall=20
> > > it with do_install_append()?
> >=20
> > Well, this is a lot more user friendly, and it's quite likely that if a
> > platform intends to ship u-boot-fw-utils they intend to provide a
> > functional one as well.  It would be a best-practices to provide one
> > that works for a machine.conf that supports U-Boot, even (and has env
> > stored somewhere, I mean it even supports env as a file).
>=20
> Why don't we go all the way there? If we say machine.conf is meant to def=
ine a=20
> machine-specific env config, let's do it generically.
>=20
> What I'm arguing against here is some partial solution - modifying the gl=
obal=20
> recipe in oe-core, but still require .bbappend to provide a file. It's sh=
ould=20
> either be "do everything in .bbappend, like we all do now" or "do everyth=
ing=20
> in main oe-core recipe and let machine.conf define it".

OK, we should do it globally with a ??=3D of the in-tree example only?  Or
just let u-boot-fw-utils fail to build?

--=20
Tom

--Z1OTrj3C7qypP14j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZSqRoAAoJEIf59jXTHXZSnogP/ikUmwLB5F3n+7xPn+UEvPOa
EP1gln+wbVw7Oust1xspUZJX2mlmFt0aD5nG1kH1oGue2/0/4uWPMkL+48mcfC4T
NHytmyYIUughUmkxS0VmtaTtF4dSGIaSfMAfFGC1zzQoivhsSqJ7K6ToGbseKjkP
IBTohkbBEHCzGcpaCyVqvAMylxs/JrnYKd+U9KZlb/YNxW4KK7U2GrmXZSZ5VpQR
7kLz/5KJ3Mo8VM2tR9cog5Tkuhr6Ofs1PDW+eW8xFQmCuhQh/cWE+D9FU9PKEahH
52J83fVRqxt5Q2mznL8yxcHki5G5hAqn7/mmbuiz/MtsYQB8dUornZuBrmUZ+zJJ
OH7o/4Zr3EqJQ2b/tsANhGnYiV2WW6bMqHy8DgZzX+FkgqP9j5AQ3umMvYM5gJIv
sDkkTYoUFzxXutCbgIagxbMnksswxVmal7l2Td9D96lUdCFr3QdLSrtCtndbkyrm
Ru9zLVjSCkwRnzDWUFPOx02U+T9DAg48mggjf1Ba7d/q6svbd/4wfeyQY/5bkQLd
fNx9RP9+h1U+29YDA8hXBrWkq9JRTMx/6R5aeBWlCu5pZ4zsyNSzzpSSF+V4J/Z/
AIO1Tk17EMOweP2xQ6wXlsaQ1QwBlAQCm/YZBu57ydlHtqxx1bxWJR7AfYM3FW3T
NvJ59kgLeR9n2nbeiIZu
=PUpH
-----END PGP SIGNATURE-----

--Z1OTrj3C7qypP14j--
