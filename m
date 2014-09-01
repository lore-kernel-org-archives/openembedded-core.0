Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA4A86A9D4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Sep 2014 08:15:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s818FUxk019379
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Sep 2014 01:15:30 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.165]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Mon, 1 Sep 2014 01:15:29 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Thread-Topic: [OE-core] [PATCH] ghostscript: add missing dependencies on
	libgcrypt and libgpg-error
Thread-Index: AQHPq8uj2/zrFfqpB06952vb66/tNpvRhSvggACHIwCAGhSv8A==
Date: Mon, 1 Sep 2014 08:15:28 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABCB03086@ALA-MBA.corp.ad.wrs.com>
References: <1406706883-15375-1-git-send-email-jackie.huang@windriver.com>
	<1B858668EC6A94408DCA5225FDFA85AABCAE0A8A@ALA-MBA.corp.ad.wrs.com>
	<53EDE6E0.1050108@pabigot.com>
In-Reply-To: <53EDE6E0.1050108@pabigot.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ghostscript: add missing dependencies on	libgcrypt and libgpg-error
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
X-List-Received-Date: Mon, 01 Sep 2014 08:15:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of Peter A. Bigot
> Sent: Friday, August 15, 2014 6:54 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] ghostscript: add missing dependencies on l=
ibgcrypt and libgpg-error
>=20
> On 08/15/2014 04:52 AM, Huang, Jie (Jackie) wrote:
> > Ping, could someone help merge this? thanks!
>=20
> That should have been fixed when cups was updated to not introduce false =
dependencies on libgcrypt.
> Have you tried with current master?

Yes, but ghostscript use the cups inside its source code, so the issue is s=
till there, I will port the fix from
Cups for ghostscript, thanks!

Thanks,
Jackie

>=20
> Peter
>=20
> >
> > Thanks,
> > Jackie
> >
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core- bounces@lists.openembedded.org] On Behalf
> >> Of jackie.huang@windriver.com
> >> Sent: Wednesday, July 30, 2014 3:55 PM
> >> To: openembedded-core@lists.openembedded.org
> >> Subject: [OE-core] [PATCH] ghostscript: add missing dependencies on
> >> libgcrypt and libgpg-error
> >>
> >> From: Jackie Huang <jackie.huang@windriver.com>
> >>
> >> Fix error:
> >> tmp/sysroots/x86_64-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs
> >> -linux/4.9.0/ld: cannot find - lgcrypt
> >> tmp/sysroots/x86_64-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs
> >> -linux/4.9.0/ld: cannot find - lgpg-error
> >>
> >> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> >> ---
> >>   .../ghostscript/ghostscript_9.14.bb                |    2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
> >> b/meta/recipes- extended/ghostscript/ghostscript_9.14.bb
> >> index e14e656..fbec6ce 100644
> >> --- a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
> >> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
> >> @@ -15,7 +15,7 @@ SECTION =3D "console/utils"
> >>   LICENSE =3D "GPLv3"
> >>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Daad21ea85123608e6a0a58d54=
ee23567"
> >>
> >> -DEPENDS =3D "ghostscript-native tiff jpeg fontconfig cups"
> >> +DEPENDS =3D "ghostscript-native tiff jpeg fontconfig cups libgcrypt l=
ibgpg-error"
> >>   DEPENDS_class-native =3D ""
> >>
> >>   SRC_URI_BASE =3D "http://downloads.ghostscript.com/public/ghostscrip=
t-${PV}.tar.gz"
> >> --
> >> 1.7.9.5
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

