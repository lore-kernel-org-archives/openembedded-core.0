Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1S9WKb-0006Of-40
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 07:44:38 +0100
Received: from WX-EXCHMB2.insigma.com.cn (10.0.1.203) by
	WX-Edge.insigma.com.cn (10.0.1.205) with Microsoft SMTP Server (TLS) id
	8.1.436.0; Mon, 19 Mar 2012 14:35:41 +0800
Received: from [192.168.0.98] (122.224.76.38) by Wx-ExchMB2.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.436.0; Mon, 19 Mar 2012
	14:35:36 +0800
Message-ID: <1332138791.1041.83.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Mar 2012 14:33:11 +0800
In-Reply-To: <1332121654.1041.78.camel@localhost.localdomain>
References: <1331799506.1041.55.camel@localhost.localdomain>
	<4F621801.4000308@windriver.com>
	<1331875115.1041.67.camel@localhost.localdomain>
	<4F635E14.7000707@windriver.com>
	<1332121654.1041.78.camel@localhost.localdomain>
Organization: Insigma
X-Mailer: Evolution 3.2.3 
MIME-Version: 1.0
Subject: Re: LSB support?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 19 Mar 2012 06:44:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is anybody there? Is the info enough?

On Mon, 2012-03-19 at 09:47 +0800, =E5=80=AA=E5=BA=86=E4=BA=AE wrote:
> I have encountered a similar problem when do a clean building in another
> VM (running archlinux).
>=20
> after remove /usr//lib/libXrandr.so.2:
> mv /usr/lib/../lib/libXrandr.so.2 /usr/lib/../lib/libXrandr.so.2.bak
>=20
> I got a new error:
> /usr/lib/../lib/libXext.so.6: undefined reference to `memcpy@GLIBC_2.14'
>=20
> so IMO, it used the wrong lib path. following is the output section of
> 'do_compile', the key is '/usr/lib/../lib', maybe it should be
> '<xxxdir>/usr/lib/../lib'.
>=20
> output section:
> Making all in gconf
> make[2]: Entering directory
> `/media/pangu/lsbt/tmp/work/x86_64-poky-linux/gconf-3.2.3-r8/GConf-3.2.3/=
gconf'
> make  all-am
> make[3]: Entering directory
> `/media/pangu/lsbt/tmp/work/x86_64-poky-linux/gconf-3.2.3-r8/GConf-3.2.3/=
gconf'
> ../x86_64-poky-linux-libtool  --tag=3DCC   --mode=3Dlink
> x86_64-poky-linux-gcc    -m64
> --sysroot=3D/media/pangu/lsbt/tmp/sysroots/qemux86-64  -O2 -pipe -g
> -feliminate-unused-debug-types -Wall -DGCONF_ENABLE_DEBUG=3D1  -Wl,-O1
> -Wl,--hash-style=3Dgnu -Wl,--as-needed -o gconf-sanity-check-2
> gconf-sanity-check.o libgconf-2.la   -pthread -Wl,--export-dynamic
> -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0
> -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfreetype
> -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0
> -lxml2
> x86_64-poky-linux-libtool: link: x86_64-poky-linux-gcc -m64
> --sysroot=3D/media/pangu/lsbt/tmp/sysroots/qemux86-64 -O2 -pipe -g
> -feliminate-unused-debug-types -Wall -DGCONF_ENABLE_DEBUG=3D1 -Wl,-O1
> -Wl,--hash-style=3Dgnu -Wl,--as-needed -o .libs/gconf-sanity-check-2
> gconf-sanity-check.o -pthread
> -Wl,--export-dynamic  ./.libs/libgconf-2.so /media/pangu/lsbt/tmp/sysroot=
s/qemux86-64/usr/lib/libdbus-glib-1.so /media/pangu/lsbt/tmp/sysroots/qemux=
86-64/usr/lib/libdbus-1.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/li=
b/libgtk-x11-2.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgd=
k-x11-2.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libatk-1.0.s=
o /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libpangocairo-1.0.so -L=
=3D/usr/lib /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libpangoft2-1=
.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/../lib/libstdc++.so=
 /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgdk_pixbuf-2.0.so /me=
dia/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgio-2.0.so -lresolv /medi=
a/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libcairo.so /media/pangu/lsbt/=
tmp/sysroots/qemux86-64/usr/lib/libpixman-1.so /media/pangu/lsbt/tmp/sysroo=
ts/qemux86-64/usr/lib/libpng12.so /media/pangu/lsbt/tmp/sysroots/qemux86-64=
/usr/lib/libXrender.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/li=
bX11.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libxcb.so /media/=
pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libXau.so /media/pangu/lsbt/tmp/=
sysroots/qemux86-64/usr/lib/libXdmcp.so /media/pangu/lsbt/tmp/sysroots/qemu=
x86-64/usr/lib/libpango-1.0.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/us=
r/lib/libfontconfig.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/li=
bfreetype.so /media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libexpat.so =
/media/pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libgobject-2.0.so /media/=
pangu/lsbt/tmp/sysroots/qemux86-64/usr/lib/libffi.so /media/pangu/lsbt/tmp/=
sysroots/qemux86-64/usr/lib/libgmodule-2.0.so /media/pangu/lsbt/tmp/sysroot=
s/qemux86-64/usr/lib/libgthread-2.0.so -lpthread /media/pangu/lsbt/tmp/sysr=
oots/qemux86-64/usr/lib/libglib-2.0.so -lrt /media/pangu/lsbt/tmp/sysroots/=
qemux86-64/usr/lib/libxml2.so -ldl -lz -lm -pthread -Wl,-rpath -Wl,/usr/lib=
/../lib
> /usr/lib/../lib/libXext.so.6: undefined reference to `memcpy@GLIBC_2.14'
> collect2: ld returned 1 exit status
> make[3]: *** [gconf-sanity-check-2] Error 1
>=20
> On Fri, 2012-03-16 at 23:36 +0800, Mark Hatle wrote:
> > On 3/16/12 12:18 AM, Ni Qingliang wrote:
> > > when building qemux86-64 arch core-image-lsb (distro is poky-lsb), I =
got
> > > /usr/lib/../lib/libXrandr.so.2: undefined reference to
> > > `memcpy@GLIBC_2.14' when 'do_compile' gconf 3.2.3.
> > >
> > > the default eglibc is 2.13, why it needs 2.14?
> >
> > Without anything further, the only guess I can make is that either you =
aren't
> > using the version of glibc you think you are, it's gotten some host
> > contamination, an explicit reference was added to libXrandr (doubtful),=
 or you
> > are using something that was built/cached from a previous build.  (i.e.=
 did you
> > build w/ eglibc 2.14/2.15 -- and then switch back to eglibc 2.13 for so=
me reason?)
> >
> > On 3/15/12 9:38 PM, Ni Qingliang wrote:
> >  > first, thanks your reply.
> >  >
> >  > Because I can't use task-core-lsb on my device (flash space is not
> >  > enough), I have to make a custom lsb-base image (without
> >  > perl/python/graphics).
> >  >
> >  > I have checked the "linuxstdbase", and it will change the configure
> >  > option of some packages.
> >  >
> >  > Indeed, I think the daemon/failure/warning fuctions should be consid=
ered
> >  > in package lsb's RDEPENDS.
> >  >
> >  > what I want to know is the rdepends or where is the
> >  > daemon/failure/warning.
> >
> > It certainly looks like a component is missing somewhere in the shell s=
crips
> > that are provided by the LSB functions.  I would assume that the
> > depends/provides is setup properly to point to whatever should be provi=
ding the
> > missing daemon, failure, warning commands.  If it's not (or if by defau=
lt -- non
> > lsb mode) they're not being built, it's a definite bug.  You shouldn't =
be able
> > to build a non-functional systems.
> >
> > Please file a defect on bugzilla.yoctoproject.org.  I will attempt to
> > investigate it (or someone else can).  Hopefully it's just as a simple =
as a
> > missing dependency.
> >
> > --Mark
> >
> > > On Fri, 2012-03-16 at 00:25 +0800, Mark Hatle wrote:
> > >> On 3/15/12 3:18 AM, Ni Qingliang wrote:
> > >>> Hello, I'm working on custom lsb-base image using oe-core.
> > >>>
> > >>> and when using the lsb script, found error:
> > >>>
> > >>> lsb_start_daemon line 44: daemon command not found.
> > >>>
> > >>> similar thing happend on lsb_log_message: failure and warning comma=
nd
> > >>> not found.
> > >>>
> > >>> maybe these function should be defined in /etc/init.d/functions?
> > >>>
> > >>> but there are not these function in this file (belongs to initscrip=
ts).
> > >>
> > >> Did you enable the LSB distribution settings?  Without this, various=
 components
> > >> may not be available.
> > >>
> > >> In Poky, there is a "poky-lsb" distribution type:
> > >>
> > >> DISTRO =3D "poky-lsb"
> > >> DISTROOVERRIDES =3D "poky:linuxstdbase"
> > >>
> > >> DISTRO_FEATURES_append =3D " pam largefile opengl"
> > >> PREFERRED_PROVIDER_virtual/libx11 =3D "libx11"
> > >>
> > >> (as well as using the core-image-lsb and/or task-core-lsb components=
.)
> > >>
> > >> If you've tried this and those items are still broken, let me know a=
nd I can
> > >> help investigate further.  (One final note, only LSB 1.4 is currentl=
y supported.)
> > >>
> > >> --Mark
> > >>
> > >>> Any idea?
> > >>>
> > >>> thanks!
> > >>>
> > >>>
> > >>
> > >>
> > >> _______________________________________________
> > >> Openembedded-core mailing list
> > >> Openembedded-core@lists.openembedded.org
> > >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-cor=
e
> > >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --
> Yi Qingliang
> niqingliang@insigma.com.cn
> https://niqingliang2003.wordpress.com
>=20

--=20
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



