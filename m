Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOwR2-0004jF-3W
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 21:39:00 +0200
Received: by lbbgo4 with SMTP id go4so2070588lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 12:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=POgYGu/q1VsV8RhTp0/bv2NNrfRe7G4RV1XynnXOmec=;
	b=MyrgL+17C+4/bZRFt8UyVU4aV0hXKAXMnsH3QZ6p+HVSq+oQY1+8IYnBwgq36G7aSt
	Fr6WuVy8p+f9WdJoynckTvHCKO8kTWyTVPzQTCKRQrpXEcJ/RnzbMi9vJdENq8iZ2/lX
	LgCc/hGVpNBb2nBu4hiEH9dNnHBU5+1++zQ0rv55crg1Ex2Fh8RoMKBMBc+LKYCm4Ztt
	3ksdHTJ0N5oJpPoTCHA57Vxd0wOLeoCH05GOsb2CVt4dxp6KMGIAXVRTGyVyoi/Xjy/Q
	zJ5iD+hdWTQC+08sQ903djl4KpxbKQgL7Ls2YaKNiGRKsoCqANymxIVy7GNXyk4jcdBI
	yIBw==
MIME-Version: 1.0
Received: by 10.112.103.8 with SMTP id fs8mr10834523lbb.29.1335814157825; Mon,
	30 Apr 2012 12:29:17 -0700 (PDT)
Received: by 10.152.129.134 with HTTP; Mon, 30 Apr 2012 12:29:17 -0700 (PDT)
In-Reply-To: <20120430185947.GG3664@jama.jama.net>
References: <cover.1335734193.git.Martin.Jansa@gmail.com>
	<aaa5eab3838d2b85d4e1316afdd91d354527ae20.1335734193.git.Martin.Jansa@gmail.com>
	<4F9EBCFB.3030103@linux.intel.com>
	<20120430185947.GG3664@jama.jama.net>
Date: Mon, 30 Apr 2012 12:29:17 -0700
Message-ID: <CAMKF1spuvow-U+zuBkL3j0y0hMM75iN-Ch8YxEH+Z9+JgDcv4Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] glib-2.0: upgrade to 2.32.1
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
X-List-Received-Date: Mon, 30 Apr 2012 19:39:00 -0000
Content-Type: multipart/alternative; boundary=f46d0401fa8d5cf8a804beea7890

--f46d0401fa8d5cf8a804beea7890
Content-Type: text/plain; charset=UTF-8

On Monday, April 30, 2012, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Apr 30, 2012 at 09:25:31AM -0700, Saul Wold wrote:
>> On 04/29/2012 02:27 PM, Martin Jansa wrote:
>> > * g_once_init_enter.patch shouldn't be needed after upstream commit
>> >    794c1a30bc27b4c8d77537813acb1213d5ac80f2
>> >
>> > * LIC_FILES_CHKSUM change is only because PCRE was upgraded and now
>> >    pcre.h says "Copyright (c) 1997-2012 University of Cambridge"
instead
>> >    of 2010 and COPYING file
>> >    "Please see the file LICENCE in the PCRE distribution for licensing
>> >    details."  but LICENSE file is not part of glib distribution (but
still
>> >    BSD in standalone PCRE)
>> >
>> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>> > ---
>> >   .../glib-2.0/glib-2.0/configure-libtool.patch      |   54
++++++++++++++------
>> >   .../glib-2.0/glib-2.0/g_once_init_enter.patch      |   24 ---------
>> >   .../{glib-2.0_2.30.3.bb =>  glib-2.0_2.32.1.bb}     |    6 +--
>> >   meta/recipes-core/glib-2.0/glib.inc                |    2 +-
>> >   4 files changed, 41 insertions(+), 45 deletions(-)
>> >   delete mode 100644
meta/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
>> >   rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.3.bb =>
glib-2.0_2.32.1.bb} (91%)
>> >
>> Martin:
>>
>> Did you see any issue similar to what was reported in
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2369?
>>
>> There is a new alignment check at configure time requiring updating the
>> site file?
>
> not while building, but in runtime I've seen some
> Floating point exceptions where I'm not sure if they are caused by new
> gcc or glib or something completely different if that's what reporter
meant by
> "div0 crashes in glib"
>

That patch is good it should be applied along with this upgrade
And its got formatted so no need for it to resend to ml
> so probably worth trying
>
>>
>> Sau!
>>
>> > diff --git
a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
>> > index c21e378..1d69a3f 100644
>> > --- a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
>> > +++ b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
>> > @@ -1,15 +1,31 @@
>> > -# Poky renames libtool to $host_alias-libtool.
>> > -# ./$host_alias-libtool isn't created until after configure runs with
libtool>= 2.2.2
>> > -# so we can't call # it at this point. We can safely assume a version
is available
>> > -# from PATH though
>> > -# Rebased to glib-2.27.3 by Dongxiao Xu<dongxiao.xu@intel.com>
>> > +From 1c5718648d49e795efee91c220a2bf9386c184f2 Mon Sep 17 00:00:00 2001
>> > +From: Martin Jansa<Martin.Jansa@gmail.com>
>> > +Date: Sat, 28 Apr 2012 18:24:50 +0200
>> > +Subject: [PATCH] configure: use $host_alias-libtool instead of libtool
>> > + directly
>> > +
>> > +Poky renames libtool to $host_alias-libtool.
>> > +./$host_alias-libtool isn't created until after configure runs with
>> > +libtool>= 2.2.2
>> > +so we can't call # it at this point. We can safely assume a version is
>> > +available
>> > +from PATH though
>> > +
>> > +Rebased to glib-2.27.3 by Dongxiao Xu<dongxiao.xu@intel.com>
>> > +Rebased to glib-2.32.1 by Martin Jansa<Martin.Jansa@gmail.com>
>> >
>> >   Upstream-Status: Inappropriate [configuration]
>> >
>> > -diff -ruN glib-2.27.3-orig/configure.ac glib-2.27.3/configure.ac
>> > ---- glib-2.27.3-orig/configure.ac  2010-11-03 11:02:05.000000000 +0800
>> > -+++ glib-2.27.3/configure.ac       2010-11-16 12:38:12.610485990 +0800
>> > -@@ -1385,7 +1385,7 @@
>> > +Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>> > +---
>> > + configure.ac |    8 ++++----
>> > + 1 files changed, 4 insertions(+), 4 deletions(-)
>> > +
>> > +diff --git a/configure.ac b/configure.ac
>> > +index a6478c6..9a93d60 100644
>> > +--- a/configure.ac
>> > ++++ b/configure.ac
>> > +@@ -1470,7 +1470,7 @@ if test x"$glib_native_win32" = xyes; then
>> >      G_MODULE_LDFLAGS=
>> >    else
>> >      export SED
>> > @@ -18,16 +34,19 @@ diff -ruN glib-2.27.3-orig/configure.acglib-2.27.3/
configure.ac
>> >    fi
>> >    dnl G_MODULE_IMPL= don't reset, so cmd-line can override
>> >    G_MODULE_NEED_USCORE=0
>> > -@@ -1450,7 +1450,7 @@
>> > +@@ -1535,9 +1535,9 @@ if test "$G_MODULE_IMPL" = "G_MODULE_IMPL_DL";
then
>> >     LDFLAGS="$LDFLAGS $G_MODULE_LDFLAGS"
>> >    dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
>> >     echo "void glib_plugin_test(void) { }">  plugin.c
>> > --  ${SHELL} ./libtool --mode=compile ${CC} -shared \
>> > -+  ${SHELL} ./$host_alias-libtool --mode=compile ${CC} -shared \
>> > -           -export-dynamic -o plugin.o plugin.c 2>&1>/dev/null
>> > -   AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],
>> > -           glib_cv_rtldglobal_broken,[
>> > -@@ -1524,7 +1524,7 @@
>> > +-  ${SHELL} ./libtool --mode=compile --tag=CC ${CC} ${CFLAGS} \
>> > ++  ${SHELL} ./$host_alias-libtool --mode=compile --tag=CC ${CC}
${CFLAGS} \
>> > +   --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--f46d0401fa8d5cf8a804beea7890
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, April 30, 2012, Martin Jansa &lt;<a href=3D"mailto:marti=
n.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>&gt; On Mon, Ap=
r 30, 2012 at 09:25:31AM -0700, Saul Wold wrote:<br>&gt;&gt; On 04/29/2012 =
02:27 PM, Martin Jansa wrote:<br>
&gt;&gt; &gt; * g_once_init_enter.patch shouldn&#39;t be needed after upstr=
eam commit<br>&gt;&gt; &gt; =C2=A0 =C2=A0794c1a30bc27b4c8d77537813acb1213d5=
ac80f2<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; * LIC_FILES_CHKSUM change is only =
because PCRE was upgraded and now<br>
&gt;&gt; &gt; =C2=A0 =C2=A0pcre.h says &quot;Copyright (c) 1997-2012 Univer=
sity of Cambridge&quot; instead<br>&gt;&gt; &gt; =C2=A0 =C2=A0of 2010 and C=
OPYING file<br>&gt;&gt; &gt; =C2=A0 =C2=A0&quot;Please see the file LICENCE=
 in the PCRE distribution for licensing<br>
&gt;&gt; &gt; =C2=A0 =C2=A0details.&quot; =C2=A0but LICENSE file is not par=
t of glib distribution (but still<br>&gt;&gt; &gt; =C2=A0 =C2=A0BSD in stan=
dalone PCRE)<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; Signed-off-by: Martin Jansa&=
lt;<a href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;=
<br>
&gt;&gt; &gt; ---<br>&gt;&gt; &gt; =C2=A0 .../glib-2.0/glib-2.0/configure-l=
ibtool.patch =C2=A0 =C2=A0 =C2=A0| =C2=A0 54 ++++++++++++++------<br>&gt;&g=
t; &gt; =C2=A0 .../glib-2.0/glib-2.0/g_once_init_enter.patch =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 24 ---------<br>&gt;&gt; &gt; =C2=A0 .../{<a href=3D"http://=
glib-2.0_2.30.3.bb">glib-2.0_2.30.3.bb</a> =3D&gt; =C2=A0<a href=3D"http://=
glib-2.0_2.32.1.bb">glib-2.0_2.32.1.bb</a>} =C2=A0 =C2=A0 | =C2=A0 =C2=A06 =
+--<br>
&gt;&gt; &gt; =C2=A0 meta/recipes-core/glib-2.0/glib.inc =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-<br>&gt;&gt; &gt; =
=C2=A0 4 files changed, 41 insertions(+), 45 deletions(-)<br>&gt;&gt; &gt; =
=C2=A0 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/g_once_init_e=
nter.patch<br>
&gt;&gt; &gt; =C2=A0 rename meta/recipes-core/glib-2.0/{<a href=3D"http://g=
lib-2.0_2.30.3.bb">glib-2.0_2.30.3.bb</a> =3D&gt; =C2=A0<a href=3D"http://g=
lib-2.0_2.32.1.bb">glib-2.0_2.32.1.bb</a>} (91%)<br>&gt;&gt; &gt;<br>&gt;&g=
t; Martin:<br>
&gt;&gt;<br>&gt;&gt; Did you see any issue similar to what was reported in<=
br>&gt;&gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D=
2369">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2369</a>?<br>&gt;=
&gt;<br>
&gt;&gt; There is a new alignment check at configure time requiring updatin=
g the<br>&gt;&gt; site file?<br>&gt;<br>&gt; not while building, but in run=
time I&#39;ve seen some<br>&gt; Floating point exceptions where I&#39;m not=
 sure if they are caused by new<br>
&gt; gcc or glib or something completely different if that&#39;s what repor=
ter meant by<br>&gt; &quot;div0 crashes in glib&quot;<br>&gt;<br><br>That p=
atch is good it should be applied along with this upgrade<br>And its got fo=
rmatted so no need for it to resend to ml<br>
&gt; so probably worth trying<br>&gt;<br>&gt;&gt;<br>&gt;&gt; Sau!<br>&gt;&=
gt;<br>&gt;&gt; &gt; diff --git a/meta/recipes-core/glib-2.0/glib-2.0/confi=
gure-libtool.patch b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.=
patch<br>
&gt;&gt; &gt; index c21e378..1d69a3f 100644<br>&gt;&gt; &gt; --- a/meta/rec=
ipes-core/glib-2.0/glib-2.0/configure-libtool.patch<br>&gt;&gt; &gt; +++ b/=
meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch<br>&gt;&gt; &gt=
; @@ -1,15 +1,31 @@<br>
&gt;&gt; &gt; -# Poky renames libtool to $host_alias-libtool.<br>&gt;&gt; &=
gt; -# ./$host_alias-libtool isn&#39;t created until after configure runs w=
ith libtool&gt;=3D 2.2.2<br>&gt;&gt; &gt; -# so we can&#39;t call # it at t=
his point. We can safely assume a version is available<br>
&gt;&gt; &gt; -# from PATH though<br>&gt;&gt; &gt; -# Rebased to glib-2.27.=
3 by Dongxiao Xu&lt;<a href=3D"mailto:dongxiao.xu@intel.com">dongxiao.xu@in=
tel.com</a>&gt;<br>&gt;&gt; &gt; +From 1c5718648d49e795efee91c220a2bf9386c1=
84f2 Mon Sep 17 00:00:00 2001<br>
&gt;&gt; &gt; +From: Martin Jansa&lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om">Martin.Jansa@gmail.com</a>&gt;<br>&gt;&gt; &gt; +Date: Sat, 28 Apr 2012=
 18:24:50 +0200<br>&gt;&gt; &gt; +Subject: [PATCH] configure: use $host_ali=
as-libtool instead of libtool<br>
&gt;&gt; &gt; + directly<br>&gt;&gt; &gt; +<br>&gt;&gt; &gt; +Poky renames =
libtool to $host_alias-libtool.<br>&gt;&gt; &gt; +./$host_alias-libtool isn=
&#39;t created until after configure runs with<br>&gt;&gt; &gt; +libtool&gt=
;=3D 2.2.2<br>
&gt;&gt; &gt; +so we can&#39;t call # it at this point. We can safely assum=
e a version is<br>&gt;&gt; &gt; +available<br>&gt;&gt; &gt; +from PATH thou=
gh<br>&gt;&gt; &gt; +<br>&gt;&gt; &gt; +Rebased to glib-2.27.3 by Dongxiao =
Xu&lt;<a href=3D"mailto:dongxiao.xu@intel.com">dongxiao.xu@intel.com</a>&gt=
;<br>
&gt;&gt; &gt; +Rebased to glib-2.32.1 by Martin Jansa&lt;<a href=3D"mailto:=
Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;<br>&gt;&gt; &gt;<br>=
&gt;&gt; &gt; =C2=A0 Upstream-Status: Inappropriate [configuration]<br>&gt;=
&gt; &gt;<br>
&gt;&gt; &gt; -diff -ruN glib-2.27.3-orig/<a href=3D"http://configure.ac">c=
onfigure.ac</a> glib-2.27.3/<a href=3D"http://configure.ac">configure.ac</a=
><br>&gt;&gt; &gt; ---- glib-2.27.3-orig/<a href=3D"http://configure.ac">co=
nfigure.ac</a> =C2=A02010-11-03 11:02:05.000000000 +0800<br>
&gt;&gt; &gt; -+++ glib-2.27.3/<a href=3D"http://configure.ac">configure.ac=
</a> =C2=A0 =C2=A0 =C2=A0 2010-11-16 12:38:12.610485990 +0800<br>&gt;&gt; &=
gt; -@@ -1385,7 +1385,7 @@<br>&gt;&gt; &gt; +Signed-off-by: Martin Jansa&lt=
;<a href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;<b=
r>
&gt;&gt; &gt; +---<br>&gt;&gt; &gt; + <a href=3D"http://configure.ac">confi=
gure.ac</a> | =C2=A0 =C2=A08 ++++----<br>&gt;&gt; &gt; + 1 files changed, 4=
 insertions(+), 4 deletions(-)<br>&gt;&gt; &gt; +<br>&gt;&gt; &gt; +diff --=
git a/<a href=3D"http://configure.ac">configure.ac</a> b/<a href=3D"http://=
configure.ac">configure.ac</a><br>
&gt;&gt; &gt; +index a6478c6..9a93d60 100644<br>&gt;&gt; &gt; +--- a/<a hre=
f=3D"http://configure.ac">configure.ac</a><br>&gt;&gt; &gt; ++++ b/<a href=
=3D"http://configure.ac">configure.ac</a><br>&gt;&gt; &gt; +@@ -1470,7 +147=
0,7 @@ if test x&quot;$glib_native_win32&quot; =3D xyes; then<br>
&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0G_MODULE_LDFLAGS=3D<br>&gt;&gt; &gt; =C2=
=A0 =C2=A0else<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0export SED<br>&gt;&gt; =
&gt; @@ -18,16 +34,19 @@ diff -ruN glib-2.27.3-orig/<a href=3D"http://confi=
gure.ac">configure.ac</a> glib-2.27.3/<a href=3D"http://configure.ac">confi=
gure.ac</a><br>
&gt;&gt; &gt; =C2=A0 =C2=A0fi<br>&gt;&gt; &gt; =C2=A0 =C2=A0dnl G_MODULE_IM=
PL=3D don&#39;t reset, so cmd-line can override<br>&gt;&gt; &gt; =C2=A0 =C2=
=A0G_MODULE_NEED_USCORE=3D0<br>&gt;&gt; &gt; -@@ -1450,7 +1450,7 @@<br>&gt;=
&gt; &gt; +@@ -1535,9 +1535,9 @@ if test &quot;$G_MODULE_IMPL&quot; =3D &qu=
ot;G_MODULE_IMPL_DL&quot;; then<br>
&gt;&gt; &gt; =C2=A0 =C2=A0 LDFLAGS=3D&quot;$LDFLAGS $G_MODULE_LDFLAGS&quot=
;<br>&gt;&gt; &gt; =C2=A0 =C2=A0dnl *** check for OSF1/5.0 RTLD_GLOBAL brok=
enness<br>&gt;&gt; &gt; =C2=A0 =C2=A0 echo &quot;void glib_plugin_test(void=
) { }&quot;&gt; =C2=A0plugin.c<br>
&gt;&gt; &gt; -- =C2=A0${SHELL} ./libtool --mode=3Dcompile ${CC} -shared \<=
br>&gt;&gt; &gt; -+ =C2=A0${SHELL} ./$host_alias-libtool --mode=3Dcompile $=
{CC} -shared \<br>&gt;&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -expor=
t-dynamic -o plugin.o plugin.c 2&gt;&amp;1&gt;/dev/null<br>
&gt;&gt; &gt; - =C2=A0 AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],<br>&gt;=
&gt; &gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glib_cv_rtldglobal_broken,[<=
br>&gt;&gt; &gt; -@@ -1524,7 +1524,7 @@<br>&gt;&gt; &gt; +- =C2=A0${SHELL} =
./libtool --mode=3Dcompile --tag=3DCC ${CC} ${CFLAGS} \<br>
&gt;&gt; &gt; ++ =C2=A0${SHELL} ./$host_alias-libtool --mode=3Dcompile --ta=
g=3DCC ${CC} ${CFLAGS} \<br>&gt;&gt; &gt; + =C2=A0 --<br>&gt; Martin &#39;J=
aMa&#39; Jansa =C2=A0 =C2=A0 jabber: <a href=3D"mailto:Martin.Jansa@gmail.c=
om">Martin.Jansa@gmail.com</a><br>
&gt;

--f46d0401fa8d5cf8a804beea7890--
