Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 04A8560EFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 16:33:26 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id h14so971381eaj.35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 08:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sRzCIBCBgnhWsPHfphiTZFTfadKr1NvuaEKaWFukDHw=;
	b=BfC6X/gVB6ehzkmB+hYZ6TNDEziEqTmGkNUEnWGCoN7VpRBkyCjfeHvCI8mRwBSXQd
	JCd10z4m0x9tmqHHRJ9shB9MeWBlkw/qqEunwQ08pbWfE+6IE4oFmpHG35GfAD1kuH8M
	4tdnVZVoil0tCiNNRskKKniWQdO8X9meN8sVGN+u9FnK91MlLLMDa4WeFEVsrWq8voZF
	TuAIFxbOlY1Fa3vuj2LMOYo8qB8dMXEx8j6rdVukFn7zjP1cfqtzzZkjY7KlGrSsuIbv
	fTC97syN7arbkSV3ncXPz4VF6Fvp1psWxaTftJ4uQPFlCljJSkgJR6+C5vdWsdupY5r5
	2U2g==
X-Received: by 10.15.54.130 with SMTP id t2mr3918441eew.72.1386952404475;
	Fri, 13 Dec 2013 08:33:24 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 4sm8498989eed.14.2013.12.13.08.33.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Dec 2013 08:33:23 -0800 (PST)
Date: Fri, 13 Dec 2013 17:33:48 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Chris Larson <kergoth@gmail.com>
Message-ID: <20131213163348.GE3715@jama>
References: <cover.1386946335.git.kergoth@gmail.com>
	<6122710ad05d4a2c1fa2d42fba3025cae6dab5ed.1386946335.git.kergoth@gmail.com>
	<20131213150826.GC3715@jama>
	<CABcZAN=usCwUpjWFy2G9D2VPUAhPhBFCVRp0UzVpg6=Lks3goQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZAN=usCwUpjWFy2G9D2VPUAhPhBFCVRp0UzVpg6=Lks3goQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 1/2] os-release: add new operating system identification recipe
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
X-List-Received-Date: Fri, 13 Dec 2013 16:33:27 -0000
X-Groupsio-MsgNum: 48213
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k3qmt+ucFURmlhDS"
Content-Disposition: inline

--k3qmt+ucFURmlhDS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 08:12:51AM -0700, Chris Larson wrote:
> On Fri, Dec 13, 2013 at 8:08 AM, Martin Jansa <martin.jansa@gmail.com>wro=
te:
>=20
> > > +do_compile () {
> > > +    for field in ${OS_RELEASE_FIELDS}; do
> > > +        if eval "test -n \"\$$field\""; then
> > > +            eval "printf \"%s=3D%s\n\" \"\$field\" \"\$$field\""
> > > +        fi
> > > +    done >os-release
> > > +}
> > > +do_compile[vardeps] +=3D "${OS_RELEASE_FIELDS}"
> >
> > Isn't this dependency picked automatically?
> >
>=20
> No, this is expanded, so this adds the dependency on the variables whose
> names are in the OS_RELEASE_FIELDS variable, not just on OS_RELEASE_FIELDS
> itself. Due to the use of eval, bitbake doesn=E2=80=99t know we=E2=80=99r=
e using the
> iterated values as variable names.

Ah I see, thanks for explanation.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k3qmt+ucFURmlhDS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKrNuwACgkQN1Ujt2V2gBxD9QCfY9z/5czjnK6i2/VfTX0qFPcP
i8cAn272hC4dgJgqPsolCK4jd5YwDPRB
=+XyQ
-----END PGP SIGNATURE-----

--k3qmt+ucFURmlhDS--
