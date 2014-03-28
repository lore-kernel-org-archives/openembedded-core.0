Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 58A056D759
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 13:05:28 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so4064105eek.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 06:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TE9Q7qlDywCGwDWP1TazXtDYZdJyNdVRjQJlTHmhAFA=;
	b=RuDurzqpePOWddByAomhaZqPEPeD7Ed9Fk28++ot8x26XAdEdioEdWbIj1vlGULlHG
	B6g/4ywGdHI1aj1C7G0nihE6pcZGNsRYi6ej+NPUS4Qk6K7Sivcet/fhlfOvwNrYR5oz
	JE850o/WktR+0xEyuw2V+oyOQ44P5f46kP/MWBC06rtf0pGY2xpBTnUykrIEvpShOjB0
	tEmUxRB6Z8RHyt4FKySWREPrnpQTbQx1MLDSe4KYfIdFd9mjD0BDkkDtWqiiFP2yODhU
	okiFT2zWncj0tRu53Hmmc1gtN7Zpe7a9ZBW7Z/yZfvCw5e+k2MDBmUnC/pNVqEfA/FmI
	Cdlg==
X-Received: by 10.14.87.201 with SMTP id y49mr2300098eee.62.1396011929427;
	Fri, 28 Mar 2014 06:05:29 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o7sm11525744eew.25.2014.03.28.06.05.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Mar 2014 06:05:28 -0700 (PDT)
Date: Fri, 28 Mar 2014 14:05:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20140328130530.GB3714@jama>
References: <cover.1395944068.git.bruce.ashfield@windriver.com>
	<a047b35664364fc8577f758f70cd781b9d675bb1.1395944068.git.bruce.ashfield@windriver.com>
	<1395999939.24890.170.camel@ted> <5335707F.7050105@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5335707F.7050105@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/13] linux-yocto/3.14: introduce versioned recipes
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
X-List-Received-Date: Fri, 28 Mar 2014 13:05:31 -0000
X-Groupsio-MsgNum: 51794
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline

--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2014 at 08:52:15AM -0400, Bruce Ashfield wrote:
> On 14-03-28 05:45 AM, Richard Purdie wrote:
> > On Thu, 2014-03-27 at 14:25 -0400, Bruce Ashfield wrote:
> >> The release kernel for Yocto 1.5 is the 3.14 kernel, so we introduce
> >> the versioned recipes here.
> >>
> >> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> ---
> >>   meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 21 ++++++++++++
> >>   meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 37 ++++++++++++=
++++++++++
> >>   2 files changed, 58 insertions(+)
> >>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
> >>   create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.14.bb
> >>
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta=
/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
> >> new file mode 100644
> >> index 000000000000..8faa9584acf0
> >> --- /dev/null
> >> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
> >> @@ -0,0 +1,21 @@
> >> +require recipes-kernel/linux/linux-yocto.inc
> >> +
> >> +KBRANCH =3D "standard/tiny/base"
> >> +LINUX_KERNEL_TYPE =3D "tiny"
> >> +KCONFIG_MODE =3D "--allnoconfig"
> >> +
> >> +LINUX_VERSION ?=3D "3.14-rc8"
> >> +
> >> +KMETA =3D "meta"
> >> +
> >> +SRCREV_machine ?=3D "fecc3fd7d31bd93766ff4f0431fecdbbfa4c3a7c"
> >> +SRCREV_meta ?=3D "3689f99f4d2a051e8d3ff72345a67d4d04a88020"
> >> +
> >> +PV =3D "${LINUX_VERSION}+git${SRCPV}"
> >
> > I'm afraid we can't do this in such a simple way. The big issue is that
> > according to our version comparison functions (in bitbake and in the
> > package managers), "3.14-rc8" > "3.14". This will then break updates
> > from package feeds.
> >
> > The traditional way we've worked around this in times gone by is the
> > rather ugly:
> >
> > PV =3D "3.13+3.14-rc8+git${SRCPV}"
> >
> > since in this case "3.14" > "3.13+3.14-rc8"
> >
> > The better way to handle this would be "3.14~rc8" however not all of our
> > package backends have support for "~" at this point so we can't do that.
> > There is a long standing bug open about this.
> >
> > The same issue also applies to the libc-headers recipe.
>=20
> eeee. Since I don't do package feeds, it's never been a problem for me.
>=20
> Wouldn't PE bump when I go to 3.14 work as well ?

yes, but we were trying to use PE bumps only in cases where it's really
needed, using sortable PV as RP suggested is IMHO better

> Or does that go away with the PR sever as well ?

no, sewer wont help

> I can muck with PV, or we can hold until Linus releases over the
> weekend, and I go with the released PVs.
>=20
> What's your preference ?
>=20
> Bruce
>=20
> >
> > Cheers,
> >
> > Richard
> >
> >
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM1c5oACgkQN1Ujt2V2gBwETACfecoTTO8TnqXNl8MLsb9bXO6D
OBMAn2yuQn0HEWEXlJ406cmpTL/5UGqG
=cfuX
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
