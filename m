Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id DE39570478;
	Tue, 29 Jul 2014 08:22:33 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so525763wiw.12
	for <multiple recipients>; Tue, 29 Jul 2014 01:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gYeEnTp1Ub7o7CKI5ThhjONSLD3Eaqshosv/0/5V384=;
	b=Jx75xoVJSA/bWBO2FU/tPDVBhrFRuPqqKUxNA1xMDa+AJe59t3ax/bBfMj0we/D68S
	OTB0rB4YNcwxY5wWu4WQT8EgTDtQNcfeO1P/Qs+Kt/QCU4L8NlSatsDqBvDjCrYDaeEQ
	gzf/HxG4j8N8YArm+kL93HY4gy1MnJIBdeEZFa8LMF0/aiifJcC0X3Qmc0ILWr6OcXjP
	mrwTNtHyQZ6szRhbQJatoD+eljv8UGDnJ9Rp4E1dXbOhENaibEvoBv+gYj7Ien5w/rrH
	KKtXw+uwBN+tgmG73c3tVwzqXQP+ilnvhtqAniGaOBjaYOvpxPutxjLKfGdDY9nGaeEk
	D3rg==
X-Received: by 10.180.210.172 with SMTP id mv12mr38519856wic.14.1406622154087; 
	Tue, 29 Jul 2014 01:22:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fr4sm40756801wic.16.2014.07.29.01.22.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jul 2014 01:22:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 29 Jul 2014 10:22:54 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140729082254.GD16445@jama>
References: <1406012813-21233-1-git-send-email-rongqing.li@windriver.com>
	<20140724111438.GI2492@jama> <53D1E6E3.5000202@windriver.com>
	<53D6FECB.6060202@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53D6FECB.6060202@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH v2][meta-perl] libxml-sax-writer-perl: add recipe
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
X-List-Received-Date: Tue, 29 Jul 2014 08:22:35 -0000
X-Groupsio-MsgNum: 55698
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yH1ZJFh+qWm+VodA"
Content-Disposition: inline

--yH1ZJFh+qWm+VodA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2014 at 09:54:19AM +0800, Rongqing Li wrote:
>=20
>=20
> On 07/25/2014 01:10 PM, Rongqing Li wrote:
> >
> >
> > On 07/24/2014 07:14 PM, Martin Jansa wrote:
> >> On Tue, Jul 22, 2014 at 03:06:53PM +0800, rongqing.li@windriver.com
> >> wrote:
> >>> From: Roy Li <rongqing.li@windriver.com>
> >>
> >> Sorry, but it still isn't correct even with allarch, because there is
> >> dependency on TUNE_PKGARCH perl:
> >>
> >> ERROR: libxml-filter-buffertext-perl different signature for task
> >> do_configure.sigdata between qemux86copy and qemuarm
> >> Hash for dependent task perl_5.20.0.bb.do_populate_sysroot changed
> >> from a5827c8deafb0ace555794c62c44e19f to 1a07f7ac7ad2a2750b58dfa601361=
14b
> >>
> >> ERROR: libxml-sax-writer-perl different signature for task
> >> do_configure.sigdata between qemux86copy and qemuarm
> >> Hash for dependent task perl_5.20.0.bb.do_populate_sysroot changed
> >> from a5827c8deafb0ace555794c62c44e19f to 1a07f7ac7ad2a2750b58dfa601361=
14b
> >>
> >
> > 1. I can not reproduce it, where are my steps be wrong?
> >
> > $ ../scripts/sstate-diff-machines.sh --tmpdir=3Dtmp/ --machines=3D"qemu=
arm
> > qemux86copy qemux86-64" --targets=3Dlibxml-sax
> > -writer-perl
> > ...
> > NOTE: Preparing runqueue
> > NOTE: Reparsing files to collect dependency data
> > NOTE: Tasks Summary: Attempted 0 tasks of which 0 didn't need to be
> > rerun and all succeeded.
> > INFO: Output written in:
> > /buildarea1/lirq/new/5/poky/build-next/tmp/sstate-diff/1406264562
> >
> > $cd /buildarea1/lirq/new/5/poky/build-next/tmp/sstate-diff/1406264562
> > $
> >
> > builder@pek-yocto-build1:/buildarea1/lirq/new/5/poky/build-next/tmp/sst=
ate-diff/1406264562$
> > find . |grep writer-perl|grep sysroot
> > ./qemux86copy/all-poky-linux/libxml-sax-writer-perl/0.54-r0.do_populate=
_sysroot.sigdata.323a1635a2b08060e64815de8e009281
> >
> > ./qemuarm/all-poky-linux/libxml-sax-writer-perl/0.54-r0.do_populate_sys=
root.sigdata.323a1635a2b08060e64815de8e009281
> >
> > ./qemux86-64/all-poky-linux/libxml-sax-writer-perl/0.54-r0.do_populate_=
sysroot.sigdata.323a1635a2b08060e64815de8e009281
> >
> > builder@pek-yocto-build1:/buildarea1/lirq/new/5/poky/build-next/tmp/sst=
ate-diff/1406264562$
> >
> >
> >
> >
> > 2. the cause maybe the below:
> > perl module will depend on perl, but perl is not allarch, so make your
> > error.
> >
> > meta/classes/cpan-base.bbclass
> >    7 DEPENDS  +=3D "${@["perl",
> > "perl-native"][(bb.data.inherits_class('native', d))]}"
> >    8 RDEPENDS_${PN} +=3D "${@["perl",
> > ""][(bb.data.inherits_class('native', d))]}"
> >
> >
> >
> >
> > 3. no perl modules inherit allarch in oe-core;
> > oe-core$ find ./ -name "*perl*bb" -exec grep allarch {} \;
> > oe-core$
> >
> >
> > but I think some module should be allarch, like: libxml-simple-perl
> > https://packages.debian.org/search?keywords=3Dlibxml-simple-perl&search=
on=3Dnames&suite=3Dstable&section=3Dall
> >
> >
> >
> Martin Jansa:
>=20
> What should I do?  make this recipes not to inherit allarch?
> or remove the adding dependency on perl from cpan-base.bbclass
> or other

I'm fine with dropped allarch.

Building the module once per TUNE_PKGARCH is better than rebuilding it
as allarch every single time you switch between MACHINEs with different
TUNE_PKGARCH.

> >>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >>> ---
> >>>   .../libxml/libxml-sax-writer-perl_0.54.bb          |   25
> >>> ++++++++++++++++++++
> >>>   1 file changed, 25 insertions(+)
> >>>   create mode 100644
> >>> meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb
> >>>
> >>> diff --git
> >>> a/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb
> >>> b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb
> >>> new file mode 100644
> >>> index 0000000..52458e4
> >>> --- /dev/null
> >>> +++ b/meta-perl/recipes-perl/libxml/libxml-sax-writer-perl_0.54.bb
> >>> @@ -0,0 +1,25 @@
> >>> +SUMMARY =3D "XML::SAX::Writer - SAX2 Writer"
> >>> +DESCRIPTION =3D "\
> >>> +XML::SAX::Writer helps to serialize SAX2 representations of XML
> >>> documents to \
> >>> +strings, files, and other flat representations. It handles charset
> >>> encodings, \
> >>> +XML escaping conventions, and so forth. It is still considered alpha=
, \
> >>> +although it has been put to limited use in settings such as
> >>> XML::LibXML and \
> >>> +the AxKit XML Application Server. \
> >>> +"
> >>> +SECTION =3D "libs"
> >>> +LICENSE =3D "Artistic-1.0 | GPLv1+"
> >>> +HOMEPAGE =3D "http://search.cpan.org/dist/XML-SAX-Writer/"
> >>> +DEPENDS +=3D "libxml-filter-buffertext-perl-native"
> >>> +RDEPENDS_${PN} +=3D "libxml-filter-buffertext-perl"
> >>> +
> >>> +SRC_URI =3D
> >>> "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-SAX-Writer-=
${PV}.tar.gz"
> >>>
> >>> +SRC_URI[md5sum] =3D "383139d76418a82b9800dc4f8b568891"
> >>> +SRC_URI[sha256sum] =3D
> >>> "a1b4d959aed8f8337523c4cef4b431e56e619c795dc6f99a868548952101cf3d"
> >>> +
> >>> +LIC_FILES_CHKSUM =3D
> >>> "file://README;beginline=3D45;endline=3D46;md5=3Dd41d8cd98f00b204e980=
0998ecf8427e"
> >>>
> >>> +
> >>> +S =3D "${WORKDIR}/XML-SAX-Writer-${PV}"
> >>> +
> >>> +inherit cpan allarch
> >>> +
> >>> +BBCLASSEXTEND =3D "native"
> >>> --
> >>> 1.7.10.4
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>
> >>
> >
>=20
> --=20
> Best Reagrds,
> Roy | RongQing Li
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yH1ZJFh+qWm+VodA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPXWd4ACgkQN1Ujt2V2gBy+CgCgrvlYTKq2bn+Ct1hudfXTQIHf
uqAAoJkXkn+KofubL6RZMYcjVz/Xpyo6
=hM63
-----END PGP SIGNATURE-----

--yH1ZJFh+qWm+VodA--
