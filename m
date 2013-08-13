Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4563960664
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 20:08:52 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so4412209eae.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 13:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7R5SiS9ndsqEbo5yXD7XrkPjpCr0NDUCrCVMUqUy26A=;
	b=Zq31vtdNV5/Q3Z48eu3e2Law5vK5ZMIHeWXryKBN0FUL3Z90HZRs3agAehYcEG1sVg
	i3AL8aKwdvuJ8382RIepoZmIMTnesOQ+krdFuUeYWJlAkk6YMBVZf5YyFnSevHAEA75P
	TCUxRdRupKH20VFoDe6LhjX1h25ErUwif/ZPNa7au4B7hUS0lyU13YgI75brL2CVxICb
	eBktDptr1QZ4u1MMh8wgS09s9Jih8QXF+K1EtKW0rggBjAkb6JiwWC3/i+3TxE+v70sv
	F1+lxvuLBd18zZ4biwjRgNf5+RsWkqERqXUla1P6dscCNEury02UPDhCFpDx3p4ZS9EO
	rDnA==
X-Received: by 10.14.173.194 with SMTP id v42mr44678eel.111.1376424531830;
	Tue, 13 Aug 2013 13:08:51 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm69112956eeg.17.2013.08.13.13.08.50 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 13 Aug 2013 13:08:51 -0700 (PDT)
Date: Tue, 13 Aug 2013 22:09:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20130813200941.GO17945@jama>
References: <520A6CE6.3010000@mlbassoc.com> <20130813173641.GN17945@jama>
	<520A8864.4020803@mlbassoc.com>
	<1376422569.5025.20.camel@x121e.pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1376422569.5025.20.camel@x121e.pbcl.net>
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
X-List-Received-Date: Tue, 13 Aug 2013 20:08:52 -0000
X-Groupsio-MsgNum: 43296
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GPOl6LAGMgeiWDic"
Content-Disposition: inline

--GPOl6LAGMgeiWDic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2013 at 08:36:09PM +0100, Phil Blundell wrote:
> On Tue, 2013-08-13 at 13:26 -0600, Gary Thomas wrote:
> > On 2013-08-13 11:36, Martin Jansa wrote:
> > > On Tue, Aug 13, 2013 at 11:29:10AM -0600, Gary Thomas wrote:
> > >> I see that some of the gstreamer recipes have changed so that x264
> > >> is now a PACKAGECONFIG option.  However, I don't see anything that
> > >> enables this option anywhere.
> > >>
> > >> How do I get x264 support back - it was working with Poky/Yocto
> > >> just a few weeks back...
> > >>
> > >> Note: I have imported meta-oe/recipes-multimedia/x264 from meta-open=
embedded
> > >> into my layers for this [library] package.
> > >
> > > Add x264 to PACKAGECONFIG in your .bbappend or distro config as
> > > PACKAGECONFIG_append_pn-gst-foo =3D " x264"
> >=20
> > Thanks, although this seems very cumbersome to me.  Is this the only
> > (or at least expected) way for this to work?
>=20
> Well, if it's in a .bbappend (rather than distro.conf) then you don't
> need the _append_pn-gst-foo bit, you can just write
>=20
> PACKAGECONFIG +=3D "x264"
>=20
> which is probably a bit neater and more intuitive.  But if you don't
> already have a .bbappend for that recipe then you might not want to add
> one just for that, it's just a matter of taste which you prefer.
>=20
> Other than that, yes, this is basically how PACKAGECONFIG is intended to
> be used.  Some recipes set a default PACKAGECONFIG based on
> DISTRO_FEATURES, but in the general case it's just a variable that you
> need to set appropriately.
>=20
> The thing that's a bit unsatisfactory about this approach is that we
> don't have any equivalent to DISTRO_FEATURES_BACKFILL for recipe-local
> PACKAGECONFIG options, which means that introducing new switches for
> things that were previously default-on tends to cause unexpected
> breakage of the sort that you've observed.  It would be good to figure
> out a better way of dealing with that.

Well on this case x264 cannot be enabled in gst-* recipe in oe-core,
because x264 is in different layer.

The old behavior Gary was depending on wasn't deterministic as x264 was
enabled only when he built x264 before gst-*.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GPOl6LAGMgeiWDic
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIKkoUACgkQN1Ujt2V2gBzoKgCfW0RIhhQ4zgNWaVXZ3cJmchVE
G/8AnA9eT486me5wFgGqhRzyVOrmV4Ev
=LRwL
-----END PGP SIGNATURE-----

--GPOl6LAGMgeiWDic--
