Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>)
	id 1Tfpid-0001fC-ST; Tue, 04 Dec 2012 11:27:16 +0100
Received: from mail80-va3-R.bigfish.com (10.7.14.240) by
	VA3EHSOBE007.bigfish.com (10.7.40.11) with Microsoft SMTP Server id
	14.1.225.23; Tue, 4 Dec 2012 09:27:41 +0000
Received: from mail80-va3 (localhost [127.0.0.1])	by mail80-va3-R.bigfish.com
	(Postfix) with ESMTP id 70333E0164;
	Tue,  4 Dec 2012 09:27:41 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zz98dI9371I542I1432I1447Izz1de0h1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631hbe9i1155h)
Received: from mail80-va3 (localhost.localdomain [127.0.0.1]) by mail80-va3
	(MessageSwitch) id 1354613258904042_15324;
	Tue,  4 Dec 2012 09:27:38 +0000 (UTC)
Received: from VA3EHSMHS033.bigfish.com (unknown [10.7.14.250])	by
	mail80-va3.bigfish.com (Postfix) with ESMTP id D7D32602C4;
	Tue,  4 Dec 2012 09:27:38 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS033.bigfish.com
	(10.7.99.43) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 4 Dec 2012 09:27:36 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.190]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0318.003; Tue, 4 Dec 2012 09:27:36 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe-commits] Zhenhua Luo : libxml2: add --with-fexceptions in
	configure flags to support exception handling in C++ programs
Thread-Index: AQHN0gFWqOEPGu0NbkuXeqElopYfhZgIXvbQ
Date: Tue, 4 Dec 2012 09:27:35 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A01375E4C@039-SN2MPN1-021.039d.mgd.msft.net>
References: <20121203144922.E2C7010361@opal>
	<20121204092530.GA14870@jama.jama.net>
In-Reply-To: <20121204092530.GA14870@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Zhenhua Luo : libxml2: add --with-fexceptions in configure flags to support exception handling in C++ programs
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
X-List-Received-Date: Tue, 04 Dec 2012 10:27:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for the comment, I will submit a patch to fix it.=20


Best Regards,

Zhenhua


> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Tuesday, December 04, 2012 5:26 PM
> To: Luo Zhenhua-B19537
> Cc: openembedded-commits@lists.openembedded.org; openembedded-
> core@lists.openembedded.org
> Subject: Re: [oe-commits] Zhenhua Luo : libxml2: add --with-fexceptions
> in configure flags to support exception handling in C++ programs
>=20
> On Mon, Dec 03, 2012 at 02:49:22PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: ff5552a8432298c32aec2ace72656b0d7059dad3
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-
> core.git&a=3Dcommit;h=3Dff5552a8432298c32aec2ace72656b0d7059dad3
> >
> > Author: Zhenhua Luo <b19537@freescale.com>
> > Date:   Fri Nov 30 08:31:57 2012 +0000
> >
> > libxml2: add --with-fexceptions in configure flags to support
> > exception handling in C++ programs
> >
> > Without this flag, the library has a problem with C++ programs using
> exception handling.
> >
> > Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > ---
> >
> >  meta/recipes-core/libxml/libxml2.inc |    4 +++-
> >  1 files changed, 3 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-core/libxml/libxml2.inc
> > b/meta/recipes-core/libxml/libxml2.inc
> > index 9ec507b..615c89e 100644
> > --- a/meta/recipes-core/libxml/libxml2.inc
> > +++ b/meta/recipes-core/libxml/libxml2.inc
> > @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D
> "file://Copyright;md5=3Dbb90c48926316d9af6e2d70ca7013ade \
> >
> file://list.c;beginline=3D4;endline=3D13;md5=3Dcdbfa3dee51c099edb04e39f76=
2ee907
> \
> >
> file://trio.c;beginline=3D5;endline=3D14;md5=3D6c025753c86d958722ec76e94c=
ae932e
> "
> >
> > +INC_PR =3D "r1"
> > +
>=20
> This does not help at all.
>=20
> opembedded-core/meta/recipes-core/libxml $ grep -R PR.=3D .
> ./libxml2.inc:INC_PR =3D "r1"
> ./libxml2_2.9.0.bb:PR =3D "r0"
>=20
> Change PR in ./libxml2_2.9.0.bb to PR =3D "${INC_PR}.0" if you want to us=
e
> INC_PR.
>=20
> Cheers,
>=20
> >  DEPENDS_class-native =3D "python-native"
> >  DEPENDS =3D+ "zlib"
> >
> > @@ -24,7 +26,7 @@ do_configure_prepend () {
> >  	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.in  }
> >
> > -EXTRA_OECONF =3D "--without-python --without-debug --without-legacy --
> without-catalog --without-docbook --with-c14n --without-lzma"
> > +EXTRA_OECONF =3D "--without-python --without-debug --without-legacy --
> without-catalog --without-docbook --with-c14n --without-lzma --with-
> fexceptions"
> >  EXTRA_OECONF_class-native =3D "--with-python=3D${STAGING_BINDIR}/pytho=
n --
> without-legacy --with-catalog --without-docbook --with-c14n --without-
> lzma"
> >  EXTRA_OECONF_class-nativesdk =3D "--with-python=3D${STAGING_BINDIR}/py=
thon
> --without-legacy --with-catalog --without-docbook --with-c14n --without-
> lzma"
> >  EXTRA_OECONF_linuxstdbase =3D "--without-python --with-debug --with-
> legacy --with-catalog --with-docbook --with-c14n --without-lzma"
> >
> >
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commi
> > ts
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



