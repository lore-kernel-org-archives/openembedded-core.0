Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdQjF-0003lV-MJ
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 20:21:57 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so6924654eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 11:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=o+hCz10wd03TwBIJcdqj1wVyuqDIxmkc8ftflMVhww4=;
	b=0JSxExWBCqfFcoAQ/ZQWE9qKRWEYetvZawvNHoOPu9Z8LZ1WlYLUCZarAAZUD+/a4t
	LcED+kmNiYPQCfVnrTmWm/Y3WDs1Elh1xQSjHQRQxwxKuzrFCNQYYGTqT2a/b6dJ6OiL
	WQU2dR3fY8AgOKQM6zSBraQCwRAoFUc0DSugLfebwWfWHeQHj7jRRzxOeaRiIqqeLlas
	oxMYSQ8utNDzF5ApwLpcsUzvCFFpV5vVsNbidADC2/1cTW1H/1GDVWpovzNn9Dd4m3mY
	9/42dNTd7zsX3BtH1mLyOJjBUEKg5T6dCdIm0h5pMq7Epq4ipCVSGQGhjq3/0cmW3BSz
	4h6w==
Received: by 10.14.174.194 with SMTP id x42mr61376333eel.22.1354043264525;
	Tue, 27 Nov 2012 11:07:44 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm42394051eem.3.2012.11.27.11.07.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 11:07:43 -0800 (PST)
Date: Tue, 27 Nov 2012 20:07:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20121127190739.GH3692@jama.jama.net>
References: <20121127182306.GE3692@jama.jama.net>
	<50B50A05.9020201@windriver.com>
MIME-Version: 1.0
In-Reply-To: <50B50A05.9020201@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: locale data broken in gstreamer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2012 19:21:57 -0000
X-Groupsio-MsgNum: 31805
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="S5HS5MvDw4DmbRmb"
Content-Disposition: inline

--S5HS5MvDw4DmbRmb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 27, 2012 at 12:44:21PM -0600, Mark Hatle wrote:
> On 11/27/12 12:23 PM, Martin Jansa wrote:
> > In last rebuild from scratch I've noticed couple of weird locale data:
>=20
> Paul E and I just observed this as well...  My build machine is an -old- =
FC13=20
> machine..  system we found it on was x86.

Mine is bleading edge gentoo x86_64 and system gettext wasn't changed
too (using sys-devel/gettext-0.18.1.1-r2 since Apr 2011)

Cheers,

>=20
> --Mark
>=20
> > Collected errors:
> >   * check_data_file_clashes: Package gst-plugins-base-locale-en-gb wants
> >   * to install file /usr/share/locale/en_GB/LC_MESSAGES/.mo
> >          But that file is already provided by package  * gstreamer-loca=
le-en-gb
> >   * check_data_file_clashes: Package gst-plugins-base-locale-cs wants to
> >   * install file /usr/share/locale/cs/LC_MESSAGES/.mo
> >          But that file is already provided by package  * gstreamer-loca=
le-cs
> >
> > All gstreamer and gst-plugins-base locales package just .mo file.
> >
> > from log.do_install:
> > make[1]: Entering directory `/OE/shr-core/tmp-eglibc/work/armv4t-oe-lin=
ux-gnueabi/gstreamer/0.10.36-r1/gstreamer-0.10.36/po'
> > installing af.gmo as /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnuea=
bi/gstreamer/0.10.36-r1/image/usr/share/locale/af/LC_MESSAGES/.mo
> > installing az.gmo as /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnuea=
bi/gstreamer/0.10.36-r1/image/usr/share/locale/az/LC_MESSAGES/.mo
> > installing be.gmo as /OE/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnuea=
bi/gstreamer/0.10.36-r1/image/usr/share/locale/be/LC_MESSAGES/.mo
> >
> > They are installed to $(DOMAIN).mo
> > gstreamer-0.10.36/po/Makefile.in.in:$(INSTALL_DATA) $$realcat $(DESTDIR=
)$$dir/$(DOMAIN).mo; \
> > gstreamer-0.10.36/po/Makefile.in.in:echo "installing $$realcat as $(DES=
TDIR)$$dir/$(DOMAIN).mo"; \
> >
> > and DOMAIN should be set to GETTEXT_PACKAGE (gstreamer-0.10)
> > ./gstreamer-0.10.36/po/Makevars:DOMAIN =3D $(GETTEXT_PACKAGE)
> > ./gstreamer-0.10.36/po/Makefile:DOMAIN =3D $(GETTEXT_PACKAGE)
> >
> > Anyone else seen this, any idea why it fails now? gst* recipes weren't =
changed lately IIRC,
> > so maybe some change in gettext which can break more recipes?
> >
> > Cheers,
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--S5HS5MvDw4DmbRmb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC1D3sACgkQN1Ujt2V2gBwm8ACeLLHK1GQvu+OxWcQn3TjFtXsg
fEoAn3b0SHFq1qxFpwBGKQaNKRPz3sN4
=qrnh
-----END PGP SIGNATURE-----

--S5HS5MvDw4DmbRmb--
