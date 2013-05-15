Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1Uchzl-0004fk-MG
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 22:08:21 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4FJo2pd011376
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 12:50:02 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.88]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.02.0342.003;
	Wed, 15 May 2013 12:50:02 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "Hatle, Mark" <mark.hatle@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] zlib: put shared libraries in base_libdir
Thread-Index: AQHOUW2KTs0OFuwDAk6jnMjBV1KVjJkGpy4w
Date: Wed, 15 May 2013 19:50:02 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF8436FC7C27@ALA-MBA.corp.ad.wrs.com>
References: <1368574528-28247-1-git-send-email-jslater@windriver.com>
	<1368574528-28247-2-git-send-email-jslater@windriver.com>
	<1368611695.6920.79.camel@phil-desktop.brightsign>
	<519388C2.5000706@windriver.com>
In-Reply-To: <519388C2.5000706@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.152.80]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] zlib: put shared libraries in base_libdir
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
X-List-Received-Date: Wed, 15 May 2013 20:08:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of Mark Hatle
> Sent: Wednesday, May 15, 2013 6:08 AM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/1] zlib: put shared libraries in base_lib=
dir
>=20
> On 5/15/13 4:54 AM, Phil Blundell wrote:
> > On Tue, 2013-05-14 at 16:35 -0700, Joe Slater wrote:
> >> We put the shared libraries in base_libdir because at least
> >> one library under base_libdir, pam_cracklib.so, needs them
> >> and will cause a qa warning when it is built.
> >
> > Which warning are you getting?  From the description it sounds like
> > unsafe-references-in-binaries but that one has been disabled since
> > 2fb58da56e8e7044de21fd10fe9164d204587236.
>=20
> We have that enabled in our builds.  We do so because we have customers w=
ho
> still want the root, /usr split.

Yes, this is it:

WARNING: QA Issue: libpam: /lib64/security/pam_cracklib.so, installed in th=
e base_prefix,
requires a shared library under exec_prefix
(/usr): libz.so.1 =3D> /usr/lib64/libz.so.1 (0x00000000dead5000)

Joe

>=20
> --Mark
>=20
> > p.
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


