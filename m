Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8959C6607F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 02:33:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7I2X3em016979
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 17 Aug 2014 19:33:03 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.155]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0174.001;
	Sun, 17 Aug 2014 19:30:03 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] ghostscript: add missing dependencies on
	libgcrypt and libgpg-error
Thread-Index: AQHPuKnfxtOx1eZ2bEqM9Vl3Czik0JvVpd4w
Date: Mon, 18 Aug 2014 02:30:03 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABCAE25AA@ALA-MBA.corp.ad.wrs.com>
References: <1406706883-15375-1-git-send-email-jackie.huang@windriver.com>
	<53EE3BA1.6050001@linux.intel.com>
In-Reply-To: <53EE3BA1.6050001@linux.intel.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ghostscript: add missing dependencies on libgcrypt and libgpg-error
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
X-List-Received-Date: Mon, 18 Aug 2014 02:33:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Saturday, August 16, 2014 12:56 AM
> To: Huang, Jie (Jackie); openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] ghostscript: add missing dependencies on l=
ibgcrypt and libgpg-error
>=20
> On 07/30/2014 12:54 AM, jackie.huang@windriver.com wrote:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > Fix error:
> > tmp/sysroots/x86_64-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs-l=
inux/4.9.0/ld: cannot find
> -lgcrypt
> > tmp/sysroots/x86_64-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs-l=
inux/4.9.0/ld: cannot find
> -lgpg-error
> >
> Are these true dependencies or are there optional configurations that
> should be covered with PACKAGECONFIG?

I didn't find optional configurations for them.

>  There is a patch to disable gcrypt.

You mean cups-no-gcrypt.patch, right? It looks reasonable, I will port it f=
or ghostscript. Thanks!

Thanks,
Jackie

>=20
> Is this meant to be a daisy patch?
>=20
> Sau!
>=20
>=20
>=20
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >   .../ghostscript/ghostscript_9.14.bb                |    2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb b/me=
ta/recipes-
> extended/ghostscript/ghostscript_9.14.bb
> > index e14e656..fbec6ce 100644
> > --- a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
> > +++ b/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
> > @@ -15,7 +15,7 @@ SECTION =3D "console/utils"
> >   LICENSE =3D "GPLv3"
> >   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daad21ea85123608e6a0a58d54e=
e23567"
> >
> > -DEPENDS =3D "ghostscript-native tiff jpeg fontconfig cups"
> > +DEPENDS =3D "ghostscript-native tiff jpeg fontconfig cups libgcrypt li=
bgpg-error"
> >   DEPENDS_class-native =3D ""
> >
> >   SRC_URI_BASE =3D "http://downloads.ghostscript.com/public/ghostscript=
-${PV}.tar.gz"
> >

