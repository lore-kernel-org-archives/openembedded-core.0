Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id C78DC6B516
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 17:35:51 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so4458604eek.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 10:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fe9UadeyBfzDCN1qPm/rsvsU+AZmZL6i+N70t05LZm0=;
	b=Y89+yTvxS32sYC+9q9mBHU1Dsvam65N/axnXgb7PVfsTorDYogOreTiGSeHDMbgudb
	rTFj9CpkkRyacmLx7MooT/56E1Tr9Xhe+Kh6dab2C6nbaqKr7mD/bn8u61TGkaSC5pT1
	x3KFTInAqpqFvERIc2bh1YJaP2Z7sgqt7YrugMqnj3ROXg1HTG5j8vTxanjSRr+JIexj
	ZYw84Lk3BO4O9TaBrTMTO+L1e1LFQ5HZYOJi5uExFWurmFIBRdZkyDkXh81iQGccwW6h
	5En343l/rXqBX6VDqZbETE7/0eaLCzoW9Ta+ZsxER6IpXffg5PXFDhy7/vis/sxR6Ypi
	g6Ew==
X-Received: by 10.15.27.133 with SMTP id p5mr4462288eeu.65.1376415351741;
	Tue, 13 Aug 2013 10:35:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bp43sm67937274eeb.4.2013.08.13.10.35.50 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 13 Aug 2013 10:35:51 -0700 (PDT)
Date: Tue, 13 Aug 2013 19:36:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20130813173641.GN17945@jama>
References: <520A6CE6.3010000@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <520A6CE6.3010000@mlbassoc.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Enabling x264 support in gstreamer
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
X-List-Received-Date: Tue, 13 Aug 2013 17:35:52 -0000
X-Groupsio-MsgNum: 43277
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+cfQkLQGU7KOA/8T"
Content-Disposition: inline

--+cfQkLQGU7KOA/8T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2013 at 11:29:10AM -0600, Gary Thomas wrote:
> I see that some of the gstreamer recipes have changed so that x264
> is now a PACKAGECONFIG option.  However, I don't see anything that
> enables this option anywhere.
>=20
> How do I get x264 support back - it was working with Poky/Yocto
> just a few weeks back...
>=20
> Note: I have imported meta-oe/recipes-multimedia/x264 from meta-openembed=
ded
> into my layers for this [library] package.

Add x264 to PACKAGECONFIG in your .bbappend or distro config as
PACKAGECONFIG_append_pn-gst-foo =3D " x264"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+cfQkLQGU7KOA/8T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIKbqkACgkQN1Ujt2V2gByFIwCfbfv512EPwH/yn4mhfbWsMDj6
SyMAoKkk5jcB1Cb4ZBchBHwS38S9afim
=AePY
-----END PGP SIGNATURE-----

--+cfQkLQGU7KOA/8T--
