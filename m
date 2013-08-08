Return-Path: <nitin.a.kamble@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B46C66B53B
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 22:00:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Aug 2013 15:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,842,1367996400"; d="scan'208";a="383506193"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2013 15:00:09 -0700
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
	ORSMSX103.amr.corp.intel.com (10.22.225.130) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 8 Aug 2013 15:00:08 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.129]) by
	ORSMSX155.amr.corp.intel.com ([169.254.7.247]) with mapi id
	14.03.0123.003; Thu, 8 Aug 2013 15:00:08 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Thread-Topic: [OE-core] [PATCH 3/3] gst-meta-base: bring in the v4l2 related
	gst plugin
Thread-Index: AQHOlH7w0OBz34hW30e1aQlNBqsKWJmMUNEA//+LIWA=
Date: Thu, 8 Aug 2013 22:00:07 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C7044C486@ORSMSX103.amr.corp.intel.com>
References: <cover.1375996888.git.nitin.a.kamble@intel.com>
	<13a5bf7b035552bb397edea9c91dc528cfa9b70d.1375996888.git.nitin.a.kamble@intel.com>
	<ebd74052582cd3def1b5a4c3d609cfc6b2613933.1375996888.git.nitin.a.kamble@intel.com>
	<CAP9ODKqozB=XwJfoKyx99uEcqcdri_VYd3Uqm3R6yZ3eeLkQ3A@mail.gmail.com>
In-Reply-To: <CAP9ODKqozB=XwJfoKyx99uEcqcdri_VYd3Uqm3R6yZ3eeLkQ3A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] gst-meta-base: bring in the v4l2 related gst plugin
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
X-List-Received-Date: Thu, 08 Aug 2013 22:00:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: otavio.salvador@gmail.com [mailto:otavio.salvador@gmail.com] On
> Behalf Of Otavio Salvador
> Sent: Thursday, August 08, 2013 2:57 PM
> To: Kamble, Nitin A
> Cc: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 3/3] gst-meta-base: bring in the v4l2 relat=
ed
> gst plugin
>=20
> On Thu, Aug 8, 2013 at 6:34 PM,  <nitin.a.kamble@intel.com> wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > If the v4l2 machine feature is enabled, then the v4l2 gstreamer plugin
> > is also pulled in the gst-meta-base packages.
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> >  meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> > b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> > index 210da37..c1139f4 100644
> > --- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> > +++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
> > @@ -35,7 +35,9 @@ RDEPENDS_gst-meta-base =3D "\
> >      gst-plugins-base-videoscale \
> >      gst-plugins-base-ffmpegcolorspace \
> >      gst-plugins-good-autodetect \
> > -    gst-plugins-good-souphttpsrc"
> > +    gst-plugins-good-souphttpsrc \
> > +    gst-plugins-base-videotestsrc \
>=20
> videotestsrc is not related to this change.
>=20


Thanks for the feedback Otavio. I need it for the encoding support. So I wi=
ll move it in a separate commit instead.

Nitin

> > +    ${@base_contains('MACHINE_FEATURES', 'v4l2', 'gst-plugins-good-
> video4linux2', '', d)}"
> >
> >  RRECOMMENDS_gst-meta-x11-base =3D "\
> >      gst-plugins-base-ximagesink \
> > --
> > 1.8.1.4
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
>=20
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

