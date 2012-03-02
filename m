Received: from smtp23.4emm.com ([69.18.222.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1S3Ixv-0002a6-M7
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 04:15:31 +0100
Received: from MBX21.4emm.local ([fe80::a0d4:cb04:3e3c:8690]) by
	HUB23.4emm.local ([::1]) with mapi id 14.01.0289.001; Thu, 1 Mar 2012
	22:07:02 -0500
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] gdk-pixbuf: Pick up ${NM} from the environment.
Thread-Index: AQHM95L+gbITVbvqLEGLvGmgsn/sN5ZWU2kQ
Date: Fri, 2 Mar 2012 03:07:01 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF33800103@MBX21.4emm.local>
References: <1330414619-21016-1-git-send-email-james@digitalmatter.com.au>
	<4F4F4A20.9060406@gmail.com>
In-Reply-To: <4F4F4A20.9060406@gmail.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: [PATCH] gdk-pixbuf: Pick up ${NM} from the	environment.
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
X-List-Received-Date: Fri, 02 Mar 2012 03:15:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Khem Raj
> Sent: Thursday, 1 March 2012 6:06 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] gdk-pixbuf: Pick up ${NM} from the
> environment.
>=20
> On 02/27/2012 11:36 PM, James Limbouris wrote:
> > Signed-off-by: James Limbouris <james@digitalmatter.com.au>
> > ---
> >  .../gdk-pixbuf-2.24.0/configure_nm.patch           |   19
> +++++++++++++++++++
> >  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    3 ++-
> >  2 files changed, 21 insertions(+), 1 deletions(-)
> >  create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-
> 2.24.0/configure_nm.patch
> >
> > diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-
> 2.24.0/configure_nm.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-
> 2.24.0/configure_nm.patch
> > new file mode 100644
> > index 0000000..1697967
> > --- /dev/null
> > +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-
> 2.24.0/configure_nm.patch
> > @@ -0,0 +1,19 @@
> > +At this stage of configure, ${NM} has already been correctly set.
> > +This AC_PATH_PROG overwrites the correct path with a host path.
> > +
> > +Upstream-Status: Inappropriate [configuration]
> > +Signed-off-by: James Limbouris <james@digitalmatter.com.au>
> > +
> > +Index: gdk-pixbuf-2.24.0/configure.ac
> >
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +diff -uNr gdk-pixbuf-2.24.0/configure.ac gdk-pixbuf-
> 2.24.0.mod/configure.ac
> > +--- gdk-pixbuf-2.24.0/configure.ac	2011-08-27 11:27:52.000000000 +0800
> > ++++ gdk-pixbuf-2.24.0.mod/configure.ac	2012-02-28
> 14:48:36.481126410 +0800
> > +@@ -147,7 +147,6 @@
> > + AC_SYS_LARGEFILE
> > +
> > + AM_PROG_AS
> > +-AC_PATH_PROG(NM, nm, nm)
>=20
> you could use AC_CHECK_TOOLS(NM, [$NM nm], nm)
> here instead of deleting it

On my system at least, nm has already been found and examined by the config=
 script at this stage.
The AC_PATH_PROG looks for it a second time, and overwrites the already cor=
rect entry.
So, do we need an AC_CHECK_TOOLS?



