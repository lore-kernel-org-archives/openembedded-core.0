Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RnrqH-0003df-G2 for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 14:15:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JD8Ao1001942
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 13:08:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01601-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 13:08:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JD83gE001935
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 13:08:04 GMT
Message-ID: <1326978483.2511.68.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jan 2012 13:08:03 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Buildhistory in action
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
X-List-Received-Date: Thu, 19 Jan 2012 13:15:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We've recently added the buildhistory class and I wanted to illustrate
how it can help us improve the quality of what we're doing. I appreciate
elements of this have been around for a while as part of testlab but I
do want to raise the profile of these tools. I added:

INHERIT +=3D "buildhistory"
BUILDHISTORY_COMMIT =3D "1"

to my local.conf, then ran "bitbake gst-openmax liba52 js". I then
applied the staticdev patches from Saul, which should only move the .a
files to the -staticdev package. I then ran the bitbake command again.

If I change into tmp/buildhistory and show the last commit the result is
included below. Since the version changed, the diff isn't as readable as
would be ideal, however reading through it clearly shows the .a files
moving to the staticdev packages with no unintended changes as far as I
could tell.

One of my big worries with the staticdev changes is any unintended
packaging changes. This lets me view the changes more precisely which
can only lead to higher quality regression spotting for the project. I'd
like to suggest more people start enabling this and using it to check
the changes they're making.

I know Paul is working on tools to better display these changes too and
those will help make these diffs easier to read.

Cheers,

Richard


diff --git a/packages/i586-poky-linux/gst-openmax/gst-openmax-dbg/latest b/=
packages/i586-poky-linux/gst-openmax/gst-openmax-dbg/latest
index e13e947..9650edb 100644
--- a/packages/i586-poky-linux/gst-openmax/gst-openmax-dbg/latest
+++ b/packages/i586-poky-linux/gst-openmax/gst-openmax-dbg/latest
@@ -1,7 +1,7 @@
 PV =3D 0.10.1
-PR =3D r2
+PR =3D r3
 RDEPENDS =3D=20
-RRECOMMENDS =3D zlib-dbg gst-openmax-dbg gstreamer-dbg libffi-dbg eglibc-d=
bg glib-2.0-dbg libomxil-dbg gst-openmax (=3D 0.10.1-r2) libxml2-dbg
+RRECOMMENDS =3D zlib-dbg gst-openmax-dbg gstreamer-dbg libffi-dbg eglibc-d=
bg glib-2.0-dbg libomxil-dbg gst-openmax (=3D 0.10.1-r3) libxml2-dbg
 PKGSIZE =3D 916082
 FILES =3D /usr/bin/.debug /usr/sbin/.debug /usr/libexec/.debug /usr/lib/.d=
ebug /bin/.debug /sbin/.debug /lib/.debug /usr/lib/gst-openmax/.debug /usr/=
lib/matchbox-panel/.debug /usr/src/debug /usr/lib/gstreamer-0.10/.debug/
-FILELIST =3D /usr/lib/gstreamer-0.10/.debug/libgstomx.so /usr/src/debug/gs=
t-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx_h264dec.c /usr/src/debug/=
gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx_base_videoenc.h /usr/sr=
c/debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx_audiosink.c /us=
r/src/debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx.h /usr/src/=
debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx_volume.c /usr/src=
/debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx_base_sink.h /usr=
/src/debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx_conf.c /usr/=
src/debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx_h264enc.c /us=
r/src/debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx_h263dec.c /=
usr/src/debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx_mpeg4enc.=
c /usr/src/debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx_base_a=
udiodec.c /usr/src/debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstom=
x_base_videoenc.c /usr/src/debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/o=
mx/gstomx_base_videodec.h /usr/src/debug/gst-openmax-0.10.1-r2/gst-openmax-=
0.10.1/omx/gstomx_h263enc.c /usr/src/debug/gst-openmax-0.10.1-r2/gst-openma=
x-0.10.1/omx/gstomx_wmvdec.c /usr/src/debug/gst-openmax-0.10.1-r2/gst-openm=
ax-0.10.1/omx/gstomx_base_filter.h /usr/src/debug/gst-openmax-0.10.1-r2/gst=
-openmax-0.10.1/omx/gstomx_dummy.c /usr/src/debug/gst-openmax-0.10.1-r2/gst=
-openmax-0.10.1/omx/gstomx_mp3dec.c /usr/src/debug/gst-openmax-0.10.1-r2/gs=
t-openmax-0.10.1/omx/gstomx_base_videodec.c /usr/src/debug/gst-openmax-0.10=
.1-r2/gst-openmax-0.10.1/omx/gstomx_base_filter.c /usr/src/debug/gst-openma=
x-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx_interface.c /usr/src/debug/gst-op=
enmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx_util.c /usr/src/debug/gst-ope=
nmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx.c /usr/src/debug/gst-openmax-0=
.10.1-r2/gst-openmax-0.10.1/omx/gstomx_base_audiodec.h /usr/src/debug/gst-o=
penmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx_vorbisdec.c /usr/src/debug/g=
st-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx_mpeg4dec.c /usr/src/debu=
g/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx_base_sink.c /usr/src/=
debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/gstomx_util.h /usr/src/d=
ebug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/headers/OMX_Index.h /usr/=
src/debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/headers/OMX_Image.h =
/usr/src/debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/headers/OMX_Typ=
es.h /usr/src/debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/headers/OM=
X_Video.h /usr/src/debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/heade=
rs/OMX_Audio.h /usr/src/debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/omx/=
headers/OMX_Core.h /usr/src/debug/gst-openmax-0.10.1-r2/gst-openmax-0.10.1/=
omx/headers/OMX_IVCommon.h /usr/src/debug/gst-openmax-0.10.1-r2/gst-openmax=
-0.10.1/omx/headers/OMX_Component.h /usr/src/debug/gst-openmax-0.10.1-r2/gs=
t-openmax-0.10.1/omx/headers/OMX_Other.h /usr/src/debug/gst-openmax-0.10.1-=
r2/gst-openmax-0.10.1/util/sem.h /usr/src/debug/gst-openmax-0.10.1-r2/gst-o=
penmax-0.10.1/util/async_queue.c /usr/src/debug/gst-openmax-0.10.1-r2/gst-o=
penmax-0.10.1/util/sem.c /usr/src/debug/gst-openmax-0.10.1-r2/gst-openmax-0=
.10.1/util/async_queue.h
+FILELIST =3D /usr/lib/gstreamer-0.10/.debug/libgstomx.so /usr/src/debug/gs=
t-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx_h264dec.c /usr/src/debug/=
gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx_base_videoenc.h /usr/sr=
c/debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx_audiosink.c /us=
r/src/debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx.h /usr/src/=
debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx_volume.c /usr/src=
/debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx_base_sink.h /usr=
/src/debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx_conf.c /usr/=
src/debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx_h264enc.c /us=
r/src/debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx_h263dec.c /=
usr/src/debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx_mpeg4enc.=
c /usr/src/debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx_base_a=
udiodec.c /usr/src/debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstom=
x_base_videoenc.c /usr/src/debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/o=
mx/gstomx_base_videodec.h /usr/src/debug/gst-openmax-0.10.1-r3/gst-openmax-=
0.10.1/omx/gstomx_h263enc.c /usr/src/debug/gst-openmax-0.10.1-r3/gst-openma=
x-0.10.1/omx/gstomx_wmvdec.c /usr/src/debug/gst-openmax-0.10.1-r3/gst-openm=
ax-0.10.1/omx/gstomx_base_filter.h /usr/src/debug/gst-openmax-0.10.1-r3/gst=
-openmax-0.10.1/omx/gstomx_dummy.c /usr/src/debug/gst-openmax-0.10.1-r3/gst=
-openmax-0.10.1/omx/gstomx_mp3dec.c /usr/src/debug/gst-openmax-0.10.1-r3/gs=
t-openmax-0.10.1/omx/gstomx_base_videodec.c /usr/src/debug/gst-openmax-0.10=
.1-r3/gst-openmax-0.10.1/omx/gstomx_base_filter.c /usr/src/debug/gst-openma=
x-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx_interface.c /usr/src/debug/gst-op=
enmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx_util.c /usr/src/debug/gst-ope=
nmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx.c /usr/src/debug/gst-openmax-0=
.10.1-r3/gst-openmax-0.10.1/omx/gstomx_base_audiodec.h /usr/src/debug/gst-o=
penmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx_vorbisdec.c /usr/src/debug/g=
st-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx_mpeg4dec.c /usr/src/debu=
g/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx_base_sink.c /usr/src/=
debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/gstomx_util.h /usr/src/d=
ebug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/headers/OMX_Index.h /usr/=
src/debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/headers/OMX_Image.h =
/usr/src/debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/headers/OMX_Typ=
es.h /usr/src/debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/headers/OM=
X_Video.h /usr/src/debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/heade=
rs/OMX_Audio.h /usr/src/debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/omx/=
headers/OMX_Core.h /usr/src/debug/gst-openmax-0.10.1-r3/gst-openmax-0.10.1/=
omx/headers/OMX_IVCommon.h /usr/src/debug/gst-openmax-0.10.1-r3/gst-openmax=
-0.10.1/omx/headers/OMX_Component.h /usr/src/debug/gst-openmax-0.10.1-r3/gs=
t-openmax-0.10.1/omx/headers/OMX_Other.h /usr/src/debug/gst-openmax-0.10.1-=
r3/gst-openmax-0.10.1/util/sem.h /usr/src/debug/gst-openmax-0.10.1-r3/gst-o=
penmax-0.10.1/util/async_queue.c /usr/src/debug/gst-openmax-0.10.1-r3/gst-o=
penmax-0.10.1/util/sem.c /usr/src/debug/gst-openmax-0.10.1-r3/gst-openmax-0=
.10.1/util/async_queue.h
diff --git a/packages/i586-poky-linux/gst-openmax/gst-openmax-dev/latest b/=
packages/i586-poky-linux/gst-openmax/gst-openmax-dev/latest
index c72d08e..39bf654 100644
--- a/packages/i586-poky-linux/gst-openmax/gst-openmax-dev/latest
+++ b/packages/i586-poky-linux/gst-openmax/gst-openmax-dev/latest
@@ -1,7 +1,7 @@
 PV =3D 0.10.1
-PR =3D r2
-RDEPENDS =3D gst-openmax (=3D 0.10.1-r2)
+PR =3D r3
+RDEPENDS =3D gst-openmax (=3D 0.10.1-r3)
 RRECOMMENDS =3D gstreamer-dev gst-openmax-dev libomxil-dev libffi-dev glib=
-2.0-dev libxml2-dev eglibc-dev zlib-dev
-PKGSIZE =3D 1084517
-FILES =3D /usr/include /usr/lib/lib*.so /usr/lib/*.la /usr/lib/*.o /usr/li=
b/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /lib/*.o /usr/lib/gstre=
amer-0.10/libgstomx.*a
-FILELIST =3D /usr/lib/gstreamer-0.10/libgstomx.a /usr/lib/gstreamer-0.10/l=
ibgstomx.la
+PKGSIZE =3D 1391
+FILES =3D /usr/include /usr/lib/lib*.so /usr/lib/*.la /usr/lib/*.o /usr/li=
b/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /lib/*.o /usr/lib/gstre=
amer-0.10/libgstomx.la
+FILELIST =3D /usr/lib/gstreamer-0.10/libgstomx.la
diff --git a/packages/i586-poky-linux/gst-openmax/gst-openmax-doc/latest b/=
packages/i586-poky-linux/gst-openmax/gst-openmax-doc/latest
index 2b26ff6..ebfb844 100644
--- a/packages/i586-poky-linux/gst-openmax/gst-openmax-doc/latest
+++ b/packages/i586-poky-linux/gst-openmax/gst-openmax-doc/latest
@@ -1,5 +1,5 @@
 PV =3D 0.10.1
-PR =3D r2
+PR =3D r3
 RDEPENDS =3D=20
 RRECOMMENDS =3D=20
 PKGSIZE =3D 0
diff --git a/packages/i586-poky-linux/gst-openmax/gst-openmax-locale/latest=
 b/packages/i586-poky-linux/gst-openmax/gst-openmax-locale/latest
index f7d8a66..36942ae 100644
--- a/packages/i586-poky-linux/gst-openmax/gst-openmax-locale/latest
+++ b/packages/i586-poky-linux/gst-openmax/gst-openmax-locale/latest
@@ -1,5 +1,5 @@
 PV =3D 0.10.1
-PR =3D r2
+PR =3D r3
 RDEPENDS =3D=20
 RRECOMMENDS =3D=20
 PKGSIZE =3D 0
diff --git a/packages/i586-poky-linux/gst-openmax/gst-openmax-staticdev/lat=
est b/packages/i586-poky-linux/gst-openmax/gst-openmax-staticdev/latest
index ba1a927..a126687 100644
--- a/packages/i586-poky-linux/gst-openmax/gst-openmax-staticdev/latest
+++ b/packages/i586-poky-linux/gst-openmax/gst-openmax-staticdev/latest
@@ -1,7 +1,7 @@
 PV =3D 0.10.1
-PR =3D r2
-RDEPENDS =3D gst-openmax-dev (=3D 0.10.1-r2)
+PR =3D r3
+RDEPENDS =3D gst-openmax-dev (=3D 0.10.1-r3)
 RRECOMMENDS =3D=20
-PKGSIZE =3D 0
-FILES =3D /usr/lib/*.a /lib/*.a
-FILELIST =3D=20
+PKGSIZE =3D 1083126
+FILES =3D /usr/lib/*.a /lib/*.a /usr/lib/gstreamer-0.10/libgstomx.a
+FILELIST =3D /usr/lib/gstreamer-0.10/libgstomx.a
diff --git a/packages/i586-poky-linux/gst-openmax/gst-openmax/latest b/pack=
ages/i586-poky-linux/gst-openmax/gst-openmax/latest
index a773575..ca1733a 100644
--- a/packages/i586-poky-linux/gst-openmax/gst-openmax/latest
+++ b/packages/i586-poky-linux/gst-openmax/gst-openmax/latest
@@ -1,5 +1,5 @@
 PV =3D 0.10.1
-PR =3D r2
+PR =3D r3
 RDEPENDS =3D zlib (>=3D 1.2.5) libffi (>=3D 3.0.10) eglibc (>=3D 2.13) gli=
b-2.0 (>=3D 2.30.2) libomxil libxml2 (>=3D 2.7.8) gstreamer (>=3D 0.10.35)
 RRECOMMENDS =3D=20
 PKGSIZE =3D 80228
diff --git a/packages/i586-poky-linux/gst-openmax/latest b/packages/i586-po=
ky-linux/gst-openmax/latest
index 93fac1a..53de9be 100644
--- a/packages/i586-poky-linux/gst-openmax/latest
+++ b/packages/i586-poky-linux/gst-openmax/latest
@@ -1,4 +1,4 @@
 PV =3D 0.10.1
-PR =3D r2
+PR =3D r3
 DEPENDS =3D autoconf-native automake-native libtool-native libtool-cross g=
nu-config-native virtual/i586-poky-linux-gcc virtual/i586-poky-linux-compil=
erlibs virtual/libc gstreamer
 PACKAGES =3D gst-openmax-dbg gst-openmax gst-openmax-doc gst-openmax-dev g=
st-openmax-staticdev gst-openmax-locale
diff --git a/packages/i586-poky-linux/js/js-dbg/latest b/packages/i586-poky=
-linux/js/js-dbg/latest
index f30133a..9644320 100644
--- a/packages/i586-poky-linux/js/js-dbg/latest
+++ b/packages/i586-poky-linux/js/js-dbg/latest
@@ -1,7 +1,7 @@
 PV =3D 1.7.0+1.8.0rc1
-PR =3D r2
+PR =3D r3
 RDEPENDS =3D=20
-RRECOMMENDS =3D eglibc-dbg js-dbg js (=3D 1.7.0+1.8.0rc1-r2)
+RRECOMMENDS =3D eglibc-dbg js-dbg js (=3D 1.7.0+1.8.0rc1-r3)
 PKGSIZE =3D 5396086
 FILES =3D /usr/bin/.debug /usr/sbin/.debug /usr/libexec/.debug /usr/lib/.d=
ebug /bin/.debug /sbin/.debug /lib/.debug /usr/lib/js/.debug /usr/lib/match=
box-panel/.debug /usr/src/debug
-FILELIST =3D /usr/lib/.debug/libjs.so /usr/src/debug/js-1.7.0+1.8.0rc1-r2/=
js/src/jsprf.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsatom.h /usr/src=
/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsdbgapi.c /usr/src/debug/js-1.7.0+1.8.0=
rc1-r2/js/src/jsbool.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsmath.h =
/usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsprf.c /usr/src/debug/js-1.7.0+=
1.8.0rc1-r2/js/src/jsopcode.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/js=
xml.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jspubtd.h /usr/src/debug/j=
s-1.7.0+1.8.0rc1-r2/js/src/jsscope.c /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js=
/src/jsregexp.c /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/prmjtime.c /usr/=
src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsproto.tbl /usr/src/debug/js-1.7.0+1=
.8.0rc1-r2/js/src/jstypes.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsat=
om.c /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsscan.c /usr/src/debug/js-=
1.7.0+1.8.0rc1-r2/js/src/jsxdrapi.c /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/=
src/jsarena.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsemit.c /usr/src/=
debug/js-1.7.0+1.8.0rc1-r2/js/src/jsdtoa.c /usr/src/debug/js-1.7.0+1.8.0rc1=
-r2/js/src/jshash.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsdhash.h /u=
sr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsclist.h /usr/src/debug/js-1.7.0+=
1.8.0rc1-r2/js/src/jsstr.c /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsobj=
.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsgc.c /usr/src/debug/js-1.7.=
0+1.8.0rc1-r2/js/src/jscompat.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/=
jsstr.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsdbgapi.h /usr/src/debu=
g/js-1.7.0+1.8.0rc1-r2/js/src/jsparse.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2=
/js/src/prmjtime.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsobj.c /usr/=
src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsopcode.c /usr/src/debug/js-1.7.0+1.=
8.0rc1-r2/js/src/jsdate.c /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsdtoa=
.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsapi.c /usr/src/debug/js-1.7=
.0+1.8.0rc1-r2/js/src/jsutil.c /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/j=
sbit.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsparse.c /usr/src/debug/=
js-1.7.0+1.8.0rc1-r2/js/src/jsbool.c /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js=
/src/jsfun.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsscript.c /usr/src=
/debug/js-1.7.0+1.8.0rc1-r2/js/src/jslog2.c /usr/src/debug/js-1.7.0+1.8.0rc=
1-r2/js/src/jskeyword.tbl /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsarra=
y.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsdate.h /usr/src/debug/js-1=
.7.0+1.8.0rc1-r2/js/src/jscntxt.c /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/sr=
c/jsnum.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsarena.c /usr/src/deb=
ug/js-1.7.0+1.8.0rc1-r2/js/src/jsxdrapi.h /usr/src/debug/js-1.7.0+1.8.0rc1-=
r2/js/src/jsinterp.c /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jshash.c /u=
sr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsscan.h /usr/src/debug/js-1.7.0+1=
.8.0rc1-r2/js/src/jsapi.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsnum.=
c /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsregexp.h /usr/src/debug/js-1=
.7.0+1.8.0rc1-r2/js/src/jsotypes.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/s=
rc/jsfun.c /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsiter.c /usr/src/deb=
ug/js-1.7.0+1.8.0rc1-r2/js/src/jsxml.c /usr/src/debug/js-1.7.0+1.8.0rc1-r2/=
js/src/jsarray.c /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jscntxt.h /usr/=
src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsexn.h /usr/src/debug/js-1.7.0+1.8.0=
rc1-r2/js/src/jsinterp.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsscope=
.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsmath.c /usr/src/debug/js-1.=
7.0+1.8.0rc1-r2/js/src/jsiter.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/=
jsemit.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsscript.h /usr/src/deb=
ug/js-1.7.0+1.8.0rc1-r2/js/src/jsgc.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/j=
s/src/jsprvtd.h /usr/src/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsdhash.c /usr/s=
rc/debug/js-1.7.0+1.8.0rc1-r2/js/src/jsexn.c /usr/src/debug/js-1.7.0+1.8.0r=
c1-r2/js/src/Linux_All_OPT.OBJ/jsautokw.h
+FILELIST =3D /usr/lib/.debug/libjs.so /usr/src/debug/js-1.7.0+1.8.0rc1-r3/=
js/src/jsprf.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsatom.h /usr/src=
/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsdbgapi.c /usr/src/debug/js-1.7.0+1.8.0=
rc1-r3/js/src/jsbool.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsmath.h =
/usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsprf.c /usr/src/debug/js-1.7.0+=
1.8.0rc1-r3/js/src/jsopcode.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/js=
xml.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jspubtd.h /usr/src/debug/j=
s-1.7.0+1.8.0rc1-r3/js/src/jsscope.c /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js=
/src/jsregexp.c /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/prmjtime.c /usr/=
src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsproto.tbl /usr/src/debug/js-1.7.0+1=
.8.0rc1-r3/js/src/jstypes.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsat=
om.c /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsscan.c /usr/src/debug/js-=
1.7.0+1.8.0rc1-r3/js/src/jsxdrapi.c /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/=
src/jsarena.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsemit.c /usr/src/=
debug/js-1.7.0+1.8.0rc1-r3/js/src/jsdtoa.c /usr/src/debug/js-1.7.0+1.8.0rc1=
-r3/js/src/jshash.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsdhash.h /u=
sr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsclist.h /usr/src/debug/js-1.7.0+=
1.8.0rc1-r3/js/src/jsstr.c /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsobj=
.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsgc.c /usr/src/debug/js-1.7.=
0+1.8.0rc1-r3/js/src/jscompat.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/=
jsstr.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsdbgapi.h /usr/src/debu=
g/js-1.7.0+1.8.0rc1-r3/js/src/jsparse.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3=
/js/src/prmjtime.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsobj.c /usr/=
src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsopcode.c /usr/src/debug/js-1.7.0+1.=
8.0rc1-r3/js/src/jsdate.c /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsdtoa=
.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsapi.c /usr/src/debug/js-1.7=
.0+1.8.0rc1-r3/js/src/jsutil.c /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/j=
sbit.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsparse.c /usr/src/debug/=
js-1.7.0+1.8.0rc1-r3/js/src/jsbool.c /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js=
/src/jsfun.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsscript.c /usr/src=
/debug/js-1.7.0+1.8.0rc1-r3/js/src/jslog2.c /usr/src/debug/js-1.7.0+1.8.0rc=
1-r3/js/src/jskeyword.tbl /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsarra=
y.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsdate.h /usr/src/debug/js-1=
.7.0+1.8.0rc1-r3/js/src/jscntxt.c /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/sr=
c/jsnum.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsarena.c /usr/src/deb=
ug/js-1.7.0+1.8.0rc1-r3/js/src/jsxdrapi.h /usr/src/debug/js-1.7.0+1.8.0rc1-=
r3/js/src/jsinterp.c /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jshash.c /u=
sr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsscan.h /usr/src/debug/js-1.7.0+1=
.8.0rc1-r3/js/src/jsapi.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsnum.=
c /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsregexp.h /usr/src/debug/js-1=
.7.0+1.8.0rc1-r3/js/src/jsotypes.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/s=
rc/jsfun.c /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsiter.c /usr/src/deb=
ug/js-1.7.0+1.8.0rc1-r3/js/src/jsxml.c /usr/src/debug/js-1.7.0+1.8.0rc1-r3/=
js/src/jsarray.c /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jscntxt.h /usr/=
src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsexn.h /usr/src/debug/js-1.7.0+1.8.0=
rc1-r3/js/src/jsinterp.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsscope=
.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsmath.c /usr/src/debug/js-1.=
7.0+1.8.0rc1-r3/js/src/jsiter.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/=
jsemit.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsscript.h /usr/src/deb=
ug/js-1.7.0+1.8.0rc1-r3/js/src/jsgc.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/j=
s/src/jsprvtd.h /usr/src/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsdhash.c /usr/s=
rc/debug/js-1.7.0+1.8.0rc1-r3/js/src/jsexn.c /usr/src/debug/js-1.7.0+1.8.0r=
c1-r3/js/src/Linux_All_OPT.OBJ/jsautokw.h
diff --git a/packages/i586-poky-linux/js/js-dev/latest b/packages/i586-poky=
-linux/js/js-dev/latest
index 2f6625e..1b1a69d 100644
--- a/packages/i586-poky-linux/js/js-dev/latest
+++ b/packages/i586-poky-linux/js/js-dev/latest
@@ -1,7 +1,7 @@
 PV =3D 1.7.0+1.8.0rc1
-PR =3D r2
-RDEPENDS =3D js (=3D 1.7.0+1.8.0rc1-r2)
+PR =3D r3
+RDEPENDS =3D js (=3D 1.7.0+1.8.0rc1-r3)
 RRECOMMENDS =3D js-dev eglibc-dev
-PKGSIZE =3D 4761147
-FILES =3D /usr/include /usr/lib/lib*.a
-FILELIST =3D /usr/include/js/jsprf.h /usr/include/js/jsatom.h /usr/include=
/js/resource.h /usr/include/js/jsbool.h /usr/include/js/jsmath.h /usr/inclu=
de/js/jsopcode.h /usr/include/js/jsxml.h /usr/include/js/jspubtd.h /usr/inc=
lude/js/jsproto.tbl /usr/include/js/jstypes.h /usr/include/js/jsdtracef.h /=
usr/include/js/jsarena.h /usr/include/js/jshash.h /usr/include/js/jsdhash.h=
 /usr/include/js/jsutil.h /usr/include/js/jsclist.h /usr/include/js/jsobj.h=
 /usr/include/js/jscompat.h /usr/include/js/jsstr.h /usr/include/js/jsfile.=
h /usr/include/js/jsdbgapi.h /usr/include/js/jsparse.h /usr/include/js/prmj=
time.h /usr/include/js/jsdtoa.h /usr/include/js/jsbit.h /usr/include/js/jsf=
un.h /usr/include/js/jslong.h /usr/include/js/jsarray.h /usr/include/js/jsd=
ate.h /usr/include/js/jsnum.h /usr/include/js/conf.h /usr/include/js/jsconf=
ig.h /usr/include/js/jsxdrapi.h /usr/include/js/jsscan.h /usr/include/js/js=
api.h /usr/include/js/jsautocfg.h /usr/include/js/jslock.h /usr/include/js/=
jsregexp.h /usr/include/js/jsotypes.h /usr/include/js/jscntxt.h /usr/includ=
e/js/jsexn.h /usr/include/js/jslibmath.h /usr/include/js/jsinterp.h /usr/in=
clude/js/jsstddef.h /usr/include/js/jsscope.h /usr/include/js/jsiter.h /usr=
/include/js/jsemit.h /usr/include/js/jscpucfg.h /usr/include/js/jsscript.h =
/usr/include/js/jsgc.h /usr/include/js/jsprvtd.h /usr/lib/libjs.a
+PKGSIZE =3D 681827
+FILES =3D /usr/include /usr/lib/lib*.so /usr/lib/*.la /usr/lib/*.o /usr/li=
b/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /lib/*.o
+FILELIST =3D /usr/include/js/jsprf.h /usr/include/js/jsatom.h /usr/include=
/js/resource.h /usr/include/js/jsbool.h /usr/include/js/jsmath.h /usr/inclu=
de/js/jsopcode.h /usr/include/js/jsxml.h /usr/include/js/jspubtd.h /usr/inc=
lude/js/jsproto.tbl /usr/include/js/jstypes.h /usr/include/js/jsdtracef.h /=
usr/include/js/jsarena.h /usr/include/js/jshash.h /usr/include/js/jsdhash.h=
 /usr/include/js/jsutil.h /usr/include/js/jsclist.h /usr/include/js/jsobj.h=
 /usr/include/js/jscompat.h /usr/include/js/jsstr.h /usr/include/js/jsfile.=
h /usr/include/js/jsdbgapi.h /usr/include/js/jsparse.h /usr/include/js/prmj=
time.h /usr/include/js/jsdtoa.h /usr/include/js/jsbit.h /usr/include/js/jsf=
un.h /usr/include/js/jslong.h /usr/include/js/jsarray.h /usr/include/js/jsd=
ate.h /usr/include/js/jsnum.h /usr/include/js/conf.h /usr/include/js/jsconf=
ig.h /usr/include/js/jsxdrapi.h /usr/include/js/jsscan.h /usr/include/js/js=
api.h /usr/include/js/jsautocfg.h /usr/include/js/jslock.h /usr/include/js/=
jsregexp.h /usr/include/js/jsotypes.h /usr/include/js/jscntxt.h /usr/includ=
e/js/jsexn.h /usr/include/js/jslibmath.h /usr/include/js/jsinterp.h /usr/in=
clude/js/jsstddef.h /usr/include/js/jsscope.h /usr/include/js/jsiter.h /usr=
/include/js/jsemit.h /usr/include/js/jscpucfg.h /usr/include/js/jsscript.h =
/usr/include/js/jsgc.h /usr/include/js/jsprvtd.h
diff --git a/packages/i586-poky-linux/js/js-doc/latest b/packages/i586-poky=
-linux/js/js-doc/latest
index 5deee0e..ee87528 100644
--- a/packages/i586-poky-linux/js/js-doc/latest
+++ b/packages/i586-poky-linux/js/js-doc/latest
@@ -1,5 +1,5 @@
 PV =3D 1.7.0+1.8.0rc1
-PR =3D r2
+PR =3D r3
 RDEPENDS =3D=20
 RRECOMMENDS =3D=20
 PKGSIZE =3D 0
diff --git a/packages/i586-poky-linux/js/js-locale/latest b/packages/i586-p=
oky-linux/js/js-locale/latest
index 7ccd4af..808650e 100644
--- a/packages/i586-poky-linux/js/js-locale/latest
+++ b/packages/i586-poky-linux/js/js-locale/latest
@@ -1,5 +1,5 @@
 PV =3D 1.7.0+1.8.0rc1
-PR =3D r2
+PR =3D r3
 RDEPENDS =3D=20
 RRECOMMENDS =3D=20
 PKGSIZE =3D 0
diff --git a/packages/i586-poky-linux/js/js-staticdev/latest b/packages/i58=
6-poky-linux/js/js-staticdev/latest
index 0d67175..331f415 100644
--- a/packages/i586-poky-linux/js/js-staticdev/latest
+++ b/packages/i586-poky-linux/js/js-staticdev/latest
@@ -1,7 +1,7 @@
 PV =3D 1.7.0+1.8.0rc1
-PR =3D r2
-RDEPENDS =3D js-dev (=3D 1.7.0+1.8.0rc1-r2)
+PR =3D r3
+RDEPENDS =3D js-dev (=3D 1.7.0+1.8.0rc1-r3)
 RRECOMMENDS =3D=20
-PKGSIZE =3D 0
+PKGSIZE =3D 4079320
 FILES =3D /usr/lib/*.a /lib/*.a
-FILELIST =3D=20
+FILELIST =3D /usr/lib/libjs.a
diff --git a/packages/i586-poky-linux/js/js/latest b/packages/i586-poky-lin=
ux/js/js/latest
index 0d77964..aad3bc8 100644
--- a/packages/i586-poky-linux/js/js/latest
+++ b/packages/i586-poky-linux/js/js/latest
@@ -1,5 +1,5 @@
 PV =3D 1.7.0+1.8.0rc1
-PR =3D r2
+PR =3D r3
 RDEPENDS =3D eglibc (>=3D 2.13)
 RRECOMMENDS =3D=20
 PKGSIZE =3D 873240
diff --git a/packages/i586-poky-linux/js/latest b/packages/i586-poky-linux/=
js/latest
index 565c861..c99a333 100644
--- a/packages/i586-poky-linux/js/latest
+++ b/packages/i586-poky-linux/js/latest
@@ -1,4 +1,4 @@
 PV =3D 1.7.0+1.8.0rc1
-PR =3D r2
+PR =3D r3
 DEPENDS =3D autoconf-native automake-native libtool-native libtool-cross g=
nu-config-native virtual/i586-poky-linux-gcc virtual/i586-poky-linux-compil=
erlibs virtual/libc=20
 PACKAGES =3D js-dbg js js-doc js-dev js-staticdev js-locale
diff --git a/packages/i586-poky-linux/liba52/a52dec-doc/latest b/packages/i=
586-poky-linux/liba52/a52dec-doc/latest
index 839504d..0743300 100644
--- a/packages/i586-poky-linux/liba52/a52dec-doc/latest
+++ b/packages/i586-poky-linux/liba52/a52dec-doc/latest
@@ -1,5 +1,5 @@
 PV =3D 0.7.4
-PR =3D r3
+PR =3D r4
 RDEPENDS =3D=20
 RRECOMMENDS =3D=20
 PKGSIZE =3D 2151
diff --git a/packages/i586-poky-linux/liba52/a52dec/latest b/packages/i586-=
poky-linux/liba52/a52dec/latest
index 0fe64ce..e40d6cc 100644
--- a/packages/i586-poky-linux/liba52/a52dec/latest
+++ b/packages/i586-poky-linux/liba52/a52dec/latest
@@ -1,5 +1,5 @@
 PV =3D 0.7.4
-PR =3D r3
+PR =3D r4
 RDEPENDS =3D liba52 (>=3D 0.7.4) eglibc (>=3D 2.13)
 RRECOMMENDS =3D=20
 PKGSIZE =3D 25496
diff --git a/packages/i586-poky-linux/liba52/latest b/packages/i586-poky-li=
nux/liba52/latest
index 2c85d1e..41a5b25 100644
--- a/packages/i586-poky-linux/liba52/latest
+++ b/packages/i586-poky-linux/liba52/latest
@@ -1,4 +1,4 @@
 PV =3D 0.7.4
-PR =3D r3
+PR =3D r4
 DEPENDS =3D autoconf-native automake-native libtool-native libtool-cross g=
nu-config-native virtual/i586-poky-linux-gcc virtual/i586-poky-linux-compil=
erlibs virtual/libc=20
 PACKAGES =3D a52dec a52dec-doc liba52-dbg liba52 liba52-doc liba52-dev lib=
a52-staticdev liba52-locale
diff --git a/packages/i586-poky-linux/liba52/liba52-dbg/latest b/packages/i=
586-poky-linux/liba52/liba52-dbg/latest
index fe6f2f7..e8f9e75 100644
--- a/packages/i586-poky-linux/liba52/liba52-dbg/latest
+++ b/packages/i586-poky-linux/liba52/liba52-dbg/latest
@@ -1,7 +1,7 @@
 PV =3D 0.7.4
-PR =3D r3
+PR =3D r4
 RDEPENDS =3D=20
-RRECOMMENDS =3D eglibc-dbg liba52 (=3D 0.7.4-r3) liba52-dbg
+RRECOMMENDS =3D eglibc-dbg liba52 (=3D 0.7.4-r4) liba52-dbg
 PKGSIZE =3D 266136
 FILES =3D /usr/bin/.debug /usr/sbin/.debug /usr/libexec/.debug /usr/lib/.d=
ebug /bin/.debug /sbin/.debug /lib/.debug /usr/lib/liba52/.debug /usr/lib/m=
atchbox-panel/.debug /usr/src/debug
-FILELIST =3D /usr/bin/.debug/extract_a52 /usr/bin/.debug/a52dec /usr/lib/.=
debug/liba52.so.0 /usr/lib/.debug/liba52.so.0.0.0 /usr/lib/.debug/liba52.so=
 /usr/src/debug/liba52-0.7.4-r3/a52dec-0.7.4/libao/audio_out_null.c /usr/sr=
c/debug/liba52-0.7.4-r3/a52dec-0.7.4/libao/audio_out_oss.c /usr/src/debug/l=
iba52-0.7.4-r3/a52dec-0.7.4/libao/float2s16.c /usr/src/debug/liba52-0.7.4-r=
3/a52dec-0.7.4/libao/audio_out_aif.c /usr/src/debug/liba52-0.7.4-r3/a52dec-=
0.7.4/libao/audio_out.c /usr/src/debug/liba52-0.7.4-r3/a52dec-0.7.4/libao/a=
udio_out_wav.c /usr/src/debug/liba52-0.7.4-r3/a52dec-0.7.4/libao/audio_out_=
peak.c /usr/src/debug/liba52-0.7.4-r3/a52dec-0.7.4/libao/audio_out_float.c =
/usr/src/debug/liba52-0.7.4-r3/a52dec-0.7.4/liba52/bitstream.h /usr/src/deb=
ug/liba52-0.7.4-r3/a52dec-0.7.4/liba52/imdct.c /usr/src/debug/liba52-0.7.4-=
r3/a52dec-0.7.4/liba52/bitstream.c /usr/src/debug/liba52-0.7.4-r3/a52dec-0.=
7.4/liba52/tables.h /usr/src/debug/liba52-0.7.4-r3/a52dec-0.7.4/liba52/pars=
e.c /usr/src/debug/liba52-0.7.4-r3/a52dec-0.7.4/liba52/a52_internal.h /usr/=
src/debug/liba52-0.7.4-r3/a52dec-0.7.4/liba52/bit_allocate.c /usr/src/debug=
/liba52-0.7.4-r3/a52dec-0.7.4/liba52/downmix.c /usr/src/debug/liba52-0.7.4-=
r3/a52dec-0.7.4/include/a52.h /usr/src/debug/liba52-0.7.4-r3/a52dec-0.7.4/i=
nclude/audio_out.h /usr/src/debug/liba52-0.7.4-r3/a52dec-0.7.4/src/getopt.h=
 /usr/src/debug/liba52-0.7.4-r3/a52dec-0.7.4/src/extract_a52.c /usr/src/deb=
ug/liba52-0.7.4-r3/a52dec-0.7.4/src/a52dec.c
+FILELIST =3D /usr/bin/.debug/extract_a52 /usr/bin/.debug/a52dec /usr/lib/.=
debug/liba52.so.0 /usr/lib/.debug/liba52.so.0.0.0 /usr/lib/.debug/liba52.so=
 /usr/src/debug/liba52-0.7.4-r4/a52dec-0.7.4/libao/audio_out_null.c /usr/sr=
c/debug/liba52-0.7.4-r4/a52dec-0.7.4/libao/audio_out_oss.c /usr/src/debug/l=
iba52-0.7.4-r4/a52dec-0.7.4/libao/float2s16.c /usr/src/debug/liba52-0.7.4-r=
4/a52dec-0.7.4/libao/audio_out_aif.c /usr/src/debug/liba52-0.7.4-r4/a52dec-=
0.7.4/libao/audio_out.c /usr/src/debug/liba52-0.7.4-r4/a52dec-0.7.4/libao/a=
udio_out_wav.c /usr/src/debug/liba52-0.7.4-r4/a52dec-0.7.4/libao/audio_out_=
peak.c /usr/src/debug/liba52-0.7.4-r4/a52dec-0.7.4/libao/audio_out_float.c =
/usr/src/debug/liba52-0.7.4-r4/a52dec-0.7.4/liba52/bitstream.h /usr/src/deb=
ug/liba52-0.7.4-r4/a52dec-0.7.4/liba52/imdct.c /usr/src/debug/liba52-0.7.4-=
r4/a52dec-0.7.4/liba52/bitstream.c /usr/src/debug/liba52-0.7.4-r4/a52dec-0.=
7.4/liba52/tables.h /usr/src/debug/liba52-0.7.4-r4/a52dec-0.7.4/liba52/pars=
e.c /usr/src/debug/liba52-0.7.4-r4/a52dec-0.7.4/liba52/a52_internal.h /usr/=
src/debug/liba52-0.7.4-r4/a52dec-0.7.4/liba52/bit_allocate.c /usr/src/debug=
/liba52-0.7.4-r4/a52dec-0.7.4/liba52/downmix.c /usr/src/debug/liba52-0.7.4-=
r4/a52dec-0.7.4/include/a52.h /usr/src/debug/liba52-0.7.4-r4/a52dec-0.7.4/i=
nclude/audio_out.h /usr/src/debug/liba52-0.7.4-r4/a52dec-0.7.4/src/getopt.h=
 /usr/src/debug/liba52-0.7.4-r4/a52dec-0.7.4/src/extract_a52.c /usr/src/deb=
ug/liba52-0.7.4-r4/a52dec-0.7.4/src/a52dec.c
diff --git a/packages/i586-poky-linux/liba52/liba52-dev/latest b/packages/i=
586-poky-linux/liba52/liba52-dev/latest
index a832a3b..61fdfb9 100644
--- a/packages/i586-poky-linux/liba52/liba52-dev/latest
+++ b/packages/i586-poky-linux/liba52/liba52-dev/latest
@@ -1,7 +1,7 @@
 PV =3D 0.7.4
-PR =3D r3
-RDEPENDS =3D liba52 (=3D 0.7.4-r3)
+PR =3D r4
+RDEPENDS =3D liba52 (=3D 0.7.4-r4)
 RRECOMMENDS =3D eglibc-dev liba52-dev
-PKGSIZE =3D 133650
-FILES =3D  /usr/include/a52dec/*.h /usr/lib/liba52.so /usr/lib/liba52.la /=
usr/lib/liba52.a=20
-FILELIST =3D /usr/include/a52dec/mm_accel.h /usr/include/a52dec/a52.h /usr=
/include/a52dec/attributes.h /usr/include/a52dec/audio_out.h /usr/lib/liba5=
2.a /usr/lib/liba52.la /usr/lib/liba52.so
+PKGSIZE =3D 7360
+FILES =3D /usr/include /usr/lib/lib*.so /usr/lib/*.la /usr/lib/*.o /usr/li=
b/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /lib/*.o
+FILELIST =3D /usr/include/a52dec/mm_accel.h /usr/include/a52dec/a52.h /usr=
/include/a52dec/attributes.h /usr/include/a52dec/audio_out.h /usr/lib/liba5=
2.la /usr/lib/liba52.so
diff --git a/packages/i586-poky-linux/liba52/liba52-doc/latest b/packages/i=
586-poky-linux/liba52/liba52-doc/latest
index 5b4a24f..1ccca7c 100644
--- a/packages/i586-poky-linux/liba52/liba52-doc/latest
+++ b/packages/i586-poky-linux/liba52/liba52-doc/latest
@@ -1,5 +1,5 @@
 PV =3D 0.7.4
-PR =3D r3
+PR =3D r4
 RDEPENDS =3D=20
 RRECOMMENDS =3D=20
 PKGSIZE =3D 0
diff --git a/packages/i586-poky-linux/liba52/liba52-locale/latest b/package=
s/i586-poky-linux/liba52/liba52-locale/latest
index b6d95b4..a6f6301 100644
--- a/packages/i586-poky-linux/liba52/liba52-locale/latest
+++ b/packages/i586-poky-linux/liba52/liba52-locale/latest
@@ -1,5 +1,5 @@
 PV =3D 0.7.4
-PR =3D r3
+PR =3D r4
 RDEPENDS =3D=20
 RRECOMMENDS =3D=20
 PKGSIZE =3D 0
diff --git a/packages/i586-poky-linux/liba52/liba52-staticdev/latest b/pack=
ages/i586-poky-linux/liba52/liba52-staticdev/latest
index 6177875..db586ae 100644
--- a/packages/i586-poky-linux/liba52/liba52-staticdev/latest
+++ b/packages/i586-poky-linux/liba52/liba52-staticdev/latest
@@ -1,7 +1,7 @@
 PV =3D 0.7.4
-PR =3D r3
-RDEPENDS =3D liba52-dev (=3D 0.7.4-r3)
+PR =3D r4
+RDEPENDS =3D liba52-dev (=3D 0.7.4-r4)
 RRECOMMENDS =3D=20
-PKGSIZE =3D 0
+PKGSIZE =3D 126290
 FILES =3D /usr/lib/*.a /lib/*.a
-FILELIST =3D=20
+FILELIST =3D /usr/lib/liba52.a
diff --git a/packages/i586-poky-linux/liba52/liba52/latest b/packages/i586-=
poky-linux/liba52/liba52/latest
index 6c12fc7..6429720 100644
--- a/packages/i586-poky-linux/liba52/liba52/latest
+++ b/packages/i586-poky-linux/liba52/liba52/latest
@@ -1,7 +1,7 @@
 PV =3D 0.7.4
-PR =3D r3
+PR =3D r4
 RDEPENDS =3D eglibc (>=3D 2.13)
 RRECOMMENDS =3D=20
 PKGSIZE =3D 37067
-FILES =3D  /usr/lib/liba52.so.0 /usr/lib/liba52.so.0.0.0=20
+FILES =3D /usr/bin/* /usr/sbin/* /usr/libexec/* /usr/lib/lib*.so.* /etc /c=
om /var /bin/* /sbin/* /lib/*.so.* /usr/share/liba52 /usr/lib/liba52/* /usr=
/share/pixmaps /usr/share/applications /usr/share/idl /usr/share/omf /usr/s=
hare/sounds /usr/lib/bonobo/servers
 FILELIST =3D /usr/lib/liba52.so.0 /usr/lib/liba52.so.0.0.0



