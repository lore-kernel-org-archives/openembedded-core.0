Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id E45436F884;
	Sat, 15 Mar 2014 16:01:17 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so2483066eek.4
	for <multiple recipients>; Sat, 15 Mar 2014 09:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=D8AyiAjj5uCjc3PdlDBzG5uTnHCrYEhFbERYiE0x3B8=;
	b=F719BX89DFHg+ioZd3TaqbIx7gFW5zHzQdJwkowxUQU9Us/kP9CRIfzVn8E6IvSSOg
	ATuGwcAbZDx1U84pVJtmgkZEepSyTLcU0GksVs7Gv+IyelC4sBj1Y78VFcWnGS9o2Hc+
	x1lFqnDLL5gCFAXt+WPF0UFukfjhRvLGVHTCZlZAgb3qkhYjEvwcI2pcTi676gGzkAul
	4kzKT+CIQ/y/LfcQtcVB3CsgiQv0ZibbK8oJFKx/khr20pwPHurJnAV2MXMo3sGg6wTt
	3sUj9zc981MJGSIqu5SM7jp0O/6nRhTOFgCnYrfj7IfXFKE0IixZvDUIW9dN8AejGc2R
	Zucg==
X-Received: by 10.15.35.200 with SMTP id g48mr83482eev.111.1394899277984;
	Sat, 15 Mar 2014 09:01:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x3sm25553593eep.17.2014.03.15.09.01.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Mar 2014 09:01:16 -0700 (PDT)
Date: Sat, 15 Mar 2014 17:01:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140315160132.GM3759@jama>
References: <1394125490-2945-1-git-send-email-Martin.Jansa@gmail.com>
	<2403049.xWs40izQYL@peggleto-mobl5.ger.corp.intel.com>
	<20140306192122.GJ26981@jama>
	<3158053.US3HkBfSAc@peggleto-mobl5.ger.corp.intel.com>
	<20140307182858.GL26981@jama>
MIME-Version: 1.0
In-Reply-To: <20140307182858.GL26981@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] bash-completion: remove allarch
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
X-List-Received-Date: Sat, 15 Mar 2014 16:01:19 -0000
X-Groupsio-MsgNum: 51246
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g6DVDhPhk1bqxDrC"
Content-Disposition: inline

--g6DVDhPhk1bqxDrC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2014 at 07:28:58PM +0100, Martin Jansa wrote:
> On Fri, Mar 07, 2014 at 10:09:00AM +0000, Paul Eggleton wrote:
> > On Thursday 06 March 2014 20:21:22 Martin Jansa wrote:
> > > On Thu, Mar 06, 2014 at 05:59:29PM +0000, Paul Eggleton wrote:
> > > > On Thursday 06 March 2014 18:04:50 Martin Jansa wrote:
> > > > > * it has runtime dependency on TUNE_PKGARCH bash, so it cannot be
> > > > > allarch
> > > >=20
> > > > As we've already discussed this is not universally true. There are =
other
> > > > ways to solve this.
> > >=20
> > > Like making it special case like packagegroups? That is still making =
me
> > > headaches when some library (for some reason) included in packagegroup
> > > is renamed thanks to debian.bbclass and packagegroup isn't rebuilt, so
> > > it breaks do_rootfs..
> >=20
> > Did you report this? FWIW it's the first I recall hearing of the proble=
m;=20
> > perhaps I just missed it.
>=20
> I've discussed this with RP on IRC, but haven't filled the bugzilla
> ticket, my fault, will do that later.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5970

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--g6DVDhPhk1bqxDrC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMkeVwACgkQN1Ujt2V2gByodgCeM2eqlxB/Nh6o6yYwt+hrIKDm
soMAoKC/rZmsWthPabK+O8sYexRGkp0I
=a23b
-----END PGP SIGNATURE-----

--g6DVDhPhk1bqxDrC--
