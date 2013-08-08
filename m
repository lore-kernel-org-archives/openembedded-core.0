Return-Path: <nitin.a.kamble@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 588C26B0D0
	for <Openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 23:10:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Aug 2013 16:10:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,842,1367996400"; d="scan'208";a="359925532"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
	by orsmga001.jf.intel.com with ESMTP; 08 Aug 2013 16:10:09 -0700
Received: from orsmsx151.amr.corp.intel.com (10.22.226.38) by
	ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 8 Aug 2013 16:10:09 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.129]) by
	ORSMSX151.amr.corp.intel.com ([169.254.7.169]) with mapi id
	14.03.0123.003; Thu, 8 Aug 2013 16:10:08 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH 3/3] gst-meta-base: bring in the v4l2 related
	gst plugin
Thread-Index: AQHOlH7w0OBz34hW30e1aQlNBqsKWJmMW/qA//+OURA=
Date: Thu, 8 Aug 2013 23:10:08 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C7044C4BB@ORSMSX103.amr.corp.intel.com>
References: <cover.1375996888.git.nitin.a.kamble@intel.com>
	<ebd74052582cd3def1b5a4c3d609cfc6b2613933.1375996888.git.nitin.a.kamble@intel.com>
	<20130808223707.GA17945@jama>
In-Reply-To: <20130808223707.GA17945@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Cc: "Openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Thu, 08 Aug 2013 23:10:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Thursday, August 08, 2013 3:37 PM
> To: Kamble, Nitin A
> Cc: Openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 3/3] gst-meta-base: bring in the v4l2 relat=
ed
> gst plugin
>=20
> On Thu, Aug 08, 2013 at 09:34:29PM +0000, nitin.a.kamble@intel.com wrote:
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
> > +    ${@base_contains('MACHINE_FEATURES', 'v4l2', 'gst-plugins-good-
> video4linux2', '', d)}"
>=20
> I was expecting to see PACKAGECONFIG somewhere, is v4l2 autodetected?

There are PACKAGECONFIG definitions for v4l in meta/recipes-multimedia/gstr=
eamer/gstreamer1.0-plugins-good.inc & meta/recipes-multimedia/gstreamer/gst=
-plugins-good_0.10.31.bb in oecore, which controls building of the v4l2 plu=
gin. And I see it is built even when v4l is not listed in PACKAGECONFIG var=
, so looks like it is autodetected.

But the above change is to make sure that the v4l2 plugins gets pulled in t=
he image.
>=20
> Why not keep v4l2-utils in meta-multimedia?
Because of the general availability of accelerated encoding in processors, =
many BSPs can include the accelerated encoding support. Also because the gs=
treamers plugin for v4l2 is in oecore, so oecore will be ideal location for=
 v4l-utils.

Thanks,
Nitin


>=20
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
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

