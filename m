Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 141AB701D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:17:14 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so5739465wib.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 04:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kOWWsxw3j9vHpHeYWMSvLy68SjVmnrLGtQ4zGFs1NDo=;
	b=SRkyVJ/buo7reN1Kw7WFYpIV8qHkdlrqLuo+DibtXNTK5zHQ8GAc9zWBbCMu5HwzVu
	heIPqNfa3GH+ZpWOWj8vuSWi3xM5WKMA+pCi5VXW+BWLuP+Jre865ycwbIOipyZsUrSf
	gwrII+vrzy9TKCjvBzXITpLBVO66+ozssWIFMUbRJc4SFbY32TW4mrWEnJnGM1+887FI
	xzn97OmgFQ71O1IrVYZu0dRn8NMx2pmmTtlLaSW3wcwCS4g/h6AtCq2fD09GIBC3Qf/1
	WBJahgK/QrNoSgqbY7gQQKpRF+Of/g5m9hIZbzA4XnqxhAOQTozszSdxWXc34xWWXeY3
	qpLw==
X-Received: by 10.194.192.201 with SMTP id hi9mr33171591wjc.28.1406027835404; 
	Tue, 22 Jul 2014 04:17:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w5sm52845553wif.3.2014.07.22.04.17.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 04:17:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Jul 2014 13:17:30 +0200
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20140722111729.GQ22875@jama>
References: <1402674385.29913.6.camel@ted>
	<CADkTA4MtGT145NMXzwfL9z6HDnrLzbvcDdeGeCjC5AJuN-Ad+g@mail.gmail.com>
	<20140613191356.GR27324@denix.org>
	<CFC5A0C1.97B0E%darren.hart@intel.com>
	<1403023618.2104.2.camel@ted> <20140623225457.GA1580@denix.org>
MIME-Version: 1.0
In-Reply-To: <20140623225457.GA1580@denix.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "Hart, Darren" <darren.hart@intel.com>,
	Scott Rifenbark <srifenbark@gmail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-module-split: Add support for KERNEL_MODULE_AUTOLOAD and KERNEL_MODULE_PROBECONF
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
X-List-Received-Date: Tue, 22 Jul 2014 11:17:17 -0000
X-Groupsio-MsgNum: 55355
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tn/+KOyBVBGpvvUM"
Content-Disposition: inline

--tn/+KOyBVBGpvvUM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2014 at 06:54:57PM -0400, Denys Dmytriyenko wrote:
> Sorry for the delay...
>=20
> On Tue, Jun 17, 2014 at 05:46:58PM +0100, Richard Purdie wrote:
> > On Tue, 2014-06-17 at 14:53 +0000, Hart, Darren wrote:
> > > Adding Scott R.
> >=20
> > I do need to sort out a documentation update.
> >=20
> > > I was just looking into that. It appears the ref-manual.html is the p=
lace
> > > to update. The glossary has a module_autoload definition, which I sup=
pose
> > > needs to be replaced with KERNEL_MODULE_AUTOLOAD, which  will have
> > > slightly different semantics.
> > >=20
> > > If I understand this correctly, the old model was:
> > >=20
> > > 	module_autoload_foo =3D "foo"
> > > 	module_autoload_bar =3D "bar"
> > >=20
> > > Although the following line in the docs confuses me:
> > >=20
> > > 	module_autoload_<modname> =3D "modname1 modname2 modname3"
> >=20
> > That is just wrong.
>=20
> Yeah, I think I confused people here... During one of the discussions I t=
ried=20
> to mention that standard /etc/modules-load.d/ can have a single file with=
=20
> multiple module entries in it (and the above line was given as an example=
).=20
> Unfortunately, kernel-module-split class couldn't handle that and require=
d=20
> placing one module entry per file. So the old syntax would look like this:
>=20
> module_autoload_<modname1> =3D "modname1"
> module_autoload_<modname2> =3D "modname2"
> etc.
>=20
> Sorry for the confusion.

Sometimes basename !=3D module name and having multiple entries in one
/etc/modules-load.d/file is sometimes useful, see

http://lists.openembedded.org/pipermail/openembedded-core/2014-July/094645.=
html

which returns support for both features

> > > And now, if I interpreted the commit comment correctly, it should look
> > > like:
> > >=20
> > > 	KERNEL_MODULE_AUTOLOAD =3D "foo"
> > > 	...
> > > 	KERNEL_MODULE_AUTOLOAD +=3D "bar"
> >=20
> > Correct.
> >=20
> > > I'm not sure how KERNEL_MODULE_PROBECONF is involved, or what value it
> > > brings beyond module_conf. From what I can tell, the changes now requ=
ire:
> > >=20
> > > 	KERNEL_MODULE_PROBECONF =3D "foo"
> > >=20
> > > 	module_conf_foo =3D "options foo baz=3D1"
> > >=20
> > > (/me notes the order of operations is non-obvious here "if modconf and
> > > basename in modconflist")
> >=20
> > For module_conf, the value is the build system can know which variables
> > were set and account for them in the task checksums. If it doesn't have
> > the list, we'd have to iterate the whole data store and that is a
> > *painfully* slow operation.
> >=20
> > module_conf isn't commonly used so maintaining a list isn't too much of
> > a hardship IMO.
> >=20
> > > Do I have this correct?
> >=20
> > Yes.
> >=20
> > CHeers,
> >=20
> > Richard
> >=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tn/+KOyBVBGpvvUM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPOSEkACgkQN1Ujt2V2gBytcgCfRqBXYfuIpzD2dFrq7Z0UT5nJ
3j4Anjgc9QgCNlIiDJkj9g0RYeDxDyJc
=rxz+
-----END PGP SIGNATURE-----

--tn/+KOyBVBGpvvUM--
