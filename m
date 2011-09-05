Received: from smtp1.4emm.com ([69.18.222.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1R0Tlz-00066x-4y
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 09:39:15 +0200
Received: from HUB20.4emm.local (192.168.160.61) by HUB01.4emm.local
	(192.168.160.132) with Microsoft SMTP Server (TLS) id 8.2.254.0;
	Mon, 5 Sep 2011 03:33:09 -0400
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB20.4emm.local ([fe80::bd35:8b72:5ce1:12f%14]) with mapi id
	14.01.0289.001; Mon, 5 Sep 2011 03:33:09 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RESEND] bitbake.conf: fix ubi images creation
Thread-Index: AQHMaYwpqS2tXqa6wE2mRmoPahd7C5U+pFAA///FZoA=
Date: Mon, 5 Sep 2011 07:33:08 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF18DEC7@MBX20.4emm.local>
References: <1314970267-20365-2-git-send-email-denis@eukrea.com>
	<1314979795-13537-1-git-send-email-denis@eukrea.com>
	<20110905070522.GA8690@chargestorm.se>
In-Reply-To: <20110905070522.GA8690@chargestorm.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: [RESEND] bitbake.conf: fix ubi images creation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Sep 2011 07:39:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Anders Darander
> Sent: Monday, 5 September 2011 3:05 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [RESEND] bitbake.conf: fix ubi images creation
>=20
> * Denis Carikli <denis@eukrea.com> [110902 18:19]:
> > Without that commit ubinize.cfg lack a volume name value,
> >   and the related ubinize.cfg line looks like that:
> >     vol_name=3D
> >   which result in a broken ubi image,which after beeing flashed produce
> >   the following error:
> >     UBI error: vtbl_check: volume table check failed: record 0, error 1=
1
> >   wich result in a kernel panic because the rootfs can't be mounted.
>=20
> I've recently spent some time debugging this very same issue, when
> converting an on-going project from oe-dev to oe-core.
>=20

Me too!

> > Signed-off-by: Denis Carikli <denis@eukrea.com>
>=20
> Acked-by: Anders Darander <anders@chargestorm.se>
>=20
> > ---
> >  meta/conf/bitbake.conf |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index a68be07..14ee90c 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -382,6 +382,8 @@ IMAGE_BASENAME =3D "${PN}"
> >  IMAGE_NAME =3D "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
> >  IMAGE_LINK_NAME =3D "${IMAGE_BASENAME}-${MACHINE}"
> >
> > +UBI_VOLNAME ?=3D "${MACHINE}-rootfs"
> > +
> >  # This option allows for a percentage overage of the actual image size=
 rather
> than a
> >  # fixed extra space, this is space needed for initial startup and basi=
c
> operations.
> >  IMAGE_OVERHEAD_FACTOR ?=3D 1.3
> --
> Anders Darander
> ChargeStorm AB
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


