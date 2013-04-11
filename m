Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UQI4A-0007pm-Nl
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 16:01:33 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3BDi6PG020377;
	Thu, 11 Apr 2013 08:44:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3BDi692027759;
	Thu, 11 Apr 2013 08:44:06 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 11 Apr 2013 08:44:06 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 11 Apr 2013 08:44:06 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [OE-core] [PATCH][for-danny] kernel bbclass: return to
	original directory in do_deploy
Thread-Index: AQHONj9zTM/tkxIz0E+0T10m73f8mJjQ98EwgABcVYD//7OgkIAAANWA
Date: Thu, 11 Apr 2013 13:44:05 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594DE395@DLEE11.ent.ti.com>
References: <1363628359-18023-1-git-send-email-Chase.Maupin@ti.com>
	<20130410230157.GB28466@denix.org>
	<7D46E86EC0A8354091174257B2FED101594DD843@DLEE11.ent.ti.com>
	<20130411131339.GC28466@denix.org>
	<7D46E86EC0A8354091174257B2FED101594DE2F5@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101594DE2F5@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][for-danny] kernel bbclass: return to original directory in do_deploy
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
X-List-Received-Date: Thu, 11 Apr 2013 14:01:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf Of Maupin, Chase
> Sent: Thursday, April 11, 2013 8:41 AM
> To: Denys Dmytriyenko
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH][for-danny] kernel bbclass: return
> to original directory in do_deploy
>=20
> > -----Original Message-----
> > From: Denys Dmytriyenko [mailto:denis@denix.org]
> > Sent: Thursday, April 11, 2013 8:14 AM
> > To: Maupin, Chase
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH][for-danny] kernel bbclass:
> return
> > to original directory in do_deploy
> >
> > On Thu, Apr 11, 2013 at 12:43:30PM +0000, Maupin, Chase wrote:
> > > > -----Original Message-----
> > > > From: Denys Dmytriyenko [mailto:denis@denix.org]
> > > > Sent: Wednesday, April 10, 2013 6:02 PM
> > > > To: Maupin, Chase
> > > > Cc: openembedded-core@lists.openembedded.org
> > > > Subject: Re: [OE-core] [PATCH][for-danny] kernel bbclass:
> > return
> > > > to original directory in do_deploy
> > > >
> > > > Ping.
> > > >
> > > > Ross, is it in your queue for your next danny merge?
> > >
> > > I see that one as already being commited to danny
> >
> > Hmm, where? I don't see it here:
> >
> > http://cgit.openembedded.org/openembedded-core/log/?h=3Ddanny
>=20
> http://cgit.openembedded.org/meta-
> openembedded/commit/?id=3D0738c3c8089480dec9e26d7de08c35ba8106b15a

Nevermind.  I remember now that this was in 3 places.

Oe-core master
Oe-core danny
Meta-openembedded danny

So you are right that the oe-core danny commit seems to be missing.

>=20
> >
> >
> > > > On Mon, Mar 18, 2013 at 12:39:19PM -0500, Chase Maupin
> wrote:
> > > > > * During the base kernel_do_deploy function the directory
> > is
> > > > >   changed to DEPLOYDIR in order to do some cleanup and
> > > > symlinking.
> > > > >   However, the directory is not changed back to the
> > original
> > > > >   starting directory ${S} at the end.  For append
> functions
> > > > this
> > > > >   means that the starting directory is not ${S} as
> expected
> > but
> > > > >   instead ${DEPLOYDIR}.
> > > > >
> > > > >   For functions like the do_deploy_append in
> > > > >   recipes-kernel/linux/linux-dtb.inc there is an
> assumption
> > > > that
> > > > >   you are still in the source directory and not the
> > DEPLOYDIR.
> > > > >   Without this change the .dtb files are not copied
> because
> > the
> > > > >   check for the existence of ${DTS_FILE} which is a
> > relative
> > > > >   path from the ${S} directory fails.  This means that
> the
> > .dtb
> > > > >   files are not copied into the deploy directory and
> > > > subsequently
> > > > >   the deploy/images directory.
> > > > >
> > > > >   In the log.do_deploy file you will see lines like:
> > > > >
> > > > >     Warning: arch/arm/boot/dts/xxxxx.dts is not
> available!
> > > > >
> > > > > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > > > > ---
> > > > >  meta/classes/kernel.bbclass |    1 +
> > > > >  1 files changed, 1 insertions(+), 0 deletions(-)
> > > > >
> > > > > diff --git a/meta/classes/kernel.bbclass
> > > > b/meta/classes/kernel.bbclass
> > > > > index 88ce561..9691c25 100644
> > > > > --- a/meta/classes/kernel.bbclass
> > > > > +++ b/meta/classes/kernel.bbclass
> > > > > @@ -529,6 +529,7 @@ kernel_do_deploy() {
> > > > >  	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin
> > ${KERNEL_IMAGETYPE}
> > > > >
> > > > >  	cp ${COREBASE}/meta/files/deploydir_readme.txt
> > > > ${DEPLOYDIR}/README_-
> > _DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> > > > > +	cd -
> > > > >  }
> > > > >  do_deploy[dirs] =3D "${DEPLOYDIR} ${B}"
> > > > >
> > > > > --
> > > > > 1.7.0.4
> > > > >
> > > > >
> > > > > _______________________________________________
> > > > > Openembedded-core mailing list
> > > > > Openembedded-core@lists.openembedded.org
> > > > > http://lists.linuxtogo.org/cgi-
> > > > bin/mailman/listinfo/openembedded-core
> > >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> core


