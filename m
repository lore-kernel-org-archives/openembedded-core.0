Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 81C4F77FA6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 01:38:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v561bv8D011572
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 Jun 2017 18:37:57 -0700 (PDT)
Received: from ALA-MBC.corp.ad.wrs.com ([fe80::fcbe:9b7:1141:89a1]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Mon, 5 Jun 2017 18:37:56 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [OE-core] [PATCH] kmscube: add opengl to REQUIRED_DISTRO_FEATURES
Thread-Index: AQHS3ju/1Nv07E7uzE+ZcgiiFWyxNaIXCP6g
Date: Tue, 6 Jun 2017 01:37:56 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B7D6B02@ALA-MBC.corp.ad.wrs.com>
References: <20170605070557.10106-1-jackie.huang@windriver.com>
	<20170605203842.GL28053@denix.org>
In-Reply-To: <20170605203842.GL28053@denix.org>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.230]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kmscube: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 06 Jun 2017 01:38:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Tuesday, June 06, 2017 04:39
> To: Huang, Jie (Jackie)
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] kmscube: add opengl to
> REQUIRED_DISTRO_FEATURES
>=20
> On Mon, Jun 05, 2017 at 03:05:57PM +0800, jackie.huang@windriver.com
> wrote:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > kmscube depends on virtual/libgles2, virtual/egl (provided
> > by mesa) and gstreamer1.0 which require opengl in DISTRO_FEATURES.
>=20
> libgles2 and egl are not only provided by mesa!

Yes, I aware of that, but I only found that they are provided by mesa in oe=
-core
and mesa is the PREFERRED_PROVIDER in oe-core, so I just mentioned mesa.

Do you think I should mention other providers from other layers or not ment=
ion
the provider at all?

Thanks,
Jackie

>=20
>=20
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  meta/recipes-graphics/kmscube/kmscube_git.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipe=
s-
> graphics/kmscube/kmscube_git.bb
> > index 0ec5b2a7fa..9050671ab1 100644
> > --- a/meta/recipes-graphics/kmscube/kmscube_git.bb
> > +++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
> > @@ -11,4 +11,6 @@ SRC_URI =3D
> "git://anongit.freedesktop.org/mesa/kmscube;branch=3Dmaster;protocol=3Dgi=
t
> >
> >  S =3D "${WORKDIR}/git"
> >
> > -inherit autotools pkgconfig
> > +inherit autotools pkgconfig distro_features_check
> > +
> > +REQUIRED_DISTRO_FEATURES =3D "opengl"
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

