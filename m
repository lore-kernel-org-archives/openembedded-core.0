Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA246059F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 12:36:48 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id w22so729584ywa.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 05:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=q55LyYH6peI4FWJmMcDeKevObL50U4otks8D6rruqxE=;
	b=Xey/XqhSLv9WL3w+Wvq1Uv7LwdLgxJ7yB8LpU+895SjfVn6E0BOTXs42CFA9ZZlJ1s
	3zotuYrOQXNqomrm1qTSXftufbah2NFtIY+NDMdYPkqn9nb4GcxWQ0zU6j4t2PdHpSH8
	AVZGiOB/nbkiVRd9pP2Q/5ShWJvdXz7kn/Wu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=q55LyYH6peI4FWJmMcDeKevObL50U4otks8D6rruqxE=;
	b=FIXVHf5wj8GyKfSUFZcIGj75Vd4lhIdm8pmel/uRYBc208NX9OUEgNkwnNbLtjGdk1
	UdYHeMD+NZiytHNOVNhywWW6RgqTeIZqRwFAHSHsSruJ9JdbRjsm4rdoDp30STwP9ePk
	TeT6ES/qdaZz2O8/PE22Y+yEkSdmvEvD/97MByvdtRz6f3NJtPukFsppTFNGWjd2L/7b
	64L1TeL+9fKZcz1+WaCofxm9WY/wleF1hV0sA80p5pp2pYohOVVJGlpOlp0lUa9mmhR3
	tNVD0BbAGlz6f26AVv2+4mfTZnSqJNpmyFqurl4mTmtmoTalQQHfyfomSslixo95gE8d
	mm7A==
X-Gm-Message-State: AHPjjUiVqT/97qakPj6/RZZhLkEDmX/QV9dYm0AiIVdWCmmW6lX98Bln
	yGSWq18w6iNHUlDPiYa0CMfP996BDQQ=
X-Google-Smtp-Source: AOwi7QBnUkcyvWvl3PvXy8wSmS4+3ALpcHcFQLwL65gApvQuuUDRAO8Fr/J5E3bFGHZ0xnhFe7TS0A==
X-Received: by 10.37.199.80 with SMTP id w77mr5865654ybe.46.1506688609235;
	Fri, 29 Sep 2017 05:36:49 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:59d1:1e23:9925:e8d6])
	by smtp.gmail.com with ESMTPSA id
	o126sm1634080ywb.8.2017.09.29.05.36.48
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 29 Sep 2017 05:36:48 -0700 (PDT)
Date: Fri, 29 Sep 2017 08:36:52 -0400
From: Tom Rini <trini@konsulko.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20170929123652.GV3112@bill-the-cat>
References: <1506531609-5917-1-git-send-email-trini@konsulko.com>
	<20170929111621.is7opcm5chmk5czu@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20170929111621.is7opcm5chmk5czu@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types: Fix bmaptool support for RSS
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
X-List-Received-Date: Fri, 29 Sep 2017 12:36:48 -0000
X-Groupsio-MsgNum: 103506
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yahdd2r5OMEJJ+pI"
Content-Disposition: inline

--yahdd2r5OMEJJ+pI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2017 at 02:16:21PM +0300, Ed Bartosh wrote:
> On Wed, Sep 27, 2017 at 01:00:09PM -0400, Tom Rini wrote:
> > With RSS we need to ensure that when making a bmap image that the
> > python3 that we created is found via /usr/bin/env rather than the host
> > python3.  Otherwise we're relying on the build host to have bmaptool
> > support installed.
> >=20
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> > ---
> > I played around with a few ways to try and fix this problem, and this
> > was the best I could come up with.  Once this is in we need this in pyro
> > as well as it's broken there too.
> > ---
> >  meta/classes/image_types.bbclass | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_type=
s.bbclass
> > index 61dca626311e..3ff960e3a889 100644
> > --- a/meta/classes/image_types.bbclass
> > +++ b/meta/classes/image_types.bbclass
> > @@ -311,3 +311,6 @@ DEPLOYABLE_IMAGE_TYPES ?=3D "hddimg iso"
> >  # The IMAGE_TYPES_MASKED variable will be used to mask out from the IM=
AGE_FSTYPES,
> >  # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, h=
dddirect, hddimg, iso, etc.
> >  IMAGE_TYPES_MASKED ?=3D ""
> > +
> > +# bmap requires python3 to be in the PATH
> > +EXTRANATIVEPATH +=3D "${@'python3-native' if d.getVar('IMAGE_FSTYPES')=
=2Efind('bmap') else ''}"
>=20
> +1
>=20
> Would ...find('.bmap') be a bit more safe?

Could be.  Do I need to v2 or can someone just fix up while applying?
Thanks!

--=20
Tom

--yahdd2r5OMEJJ+pI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZzj5kAAoJEIf59jXTHXZSZKIP/ilBJXMWvdKtYhV0urEmXKvK
0lO0EzrmXvHt4GN+Zx0T9/v5fHJHIG/k1/dUGU78fgNRPjVYMC/w7XGOFEnS4r52
1dWX7uS/ti2IjjPg6rQ8d5bHivKiRZNoV0MzjVPTu8klS6g+2x3aIYaz/JrXOqui
EQgJYdyUatnC9msFxY3yHzKhV2SpQaUHGyRZ+fpb9q5dCVkzerMqMQ8xvJ5R9YfZ
GamyPetASPWSkd9lf/8SLsU9TAs1tPjudSy3qeTSpab5qAAf4IOmEpnnI0zmMBaJ
RwbqJa+8I43tTULPJw1jny5BVHDg79xU2ehlvT5SiWFRedYpcm2OqRX6OwOtT2Tz
ih9nFSiWVRffVbqJTlkl4U5lpwwSIkZMU0TeIC39ZSw9SLagKM9mmrRfCQCR/UgQ
CD7tOfpmWJ2s2CrQ2H44YNMVfpxzBKi+L4vZP4cdd02tvD5O416Ck2u4OeVAFNli
Mg8EuK9ybGKI5qooBkuUXb5Gr0DrGvTQI4WjfUn4Iqe1k4qoQ+Wh5yeduTfzMOVG
Zw8b2/I86YltyGFboqJiMi1E9jAP4ucj2rNPrCDdkkzDGaXfyQvHBAYKEkKqbrEq
HxhW2/kIy7l2t8p7XMcy6nvdcusFMq2hoo7c5TcFq7mu/7YBmdCQBTWMwLYo3sRX
LLR+mHW+GNOCTKL54V80
=jy3B
-----END PGP SIGNATURE-----

--yahdd2r5OMEJJ+pI--
