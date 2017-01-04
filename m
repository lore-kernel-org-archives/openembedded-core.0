Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CCC636010B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 00:51:22 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c85so50839755wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2017 16:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HmyBjv+S3ogiO91uAkyCvmUJH4C2ptbIpRZHsp4EMV0=;
	b=vfVoGxXDl1A1mSA0VvmXhs01ppyFgWfzXciHwGbqNhmGqEkau3cyksndZL28rcAwz3
	PmwO2z+CiqsS67P3IuoFrnZQQjxxjZUVkUHnvoXDQYF6LrB68U6vVkha1tdRmJSneLBv
	6aJgcNb7nSEQm2nXa2ojF60wHenj6rsJO8FFcH9sldzN/iZD5nsZzpmXHYV6jitO0BRo
	oiYGIQBSpUy/lj7nIZt8P10VUDplNRdao39yTL5waJWvWiqiP31uzUCJQk2fYBL35NuC
	YnJvN/TSL3bOdAbBOgfrFb7vjOfBaM4Lcxo7ZViKqBO+MwjEefdDcVg7PrEpDjHcakpm
	eCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HmyBjv+S3ogiO91uAkyCvmUJH4C2ptbIpRZHsp4EMV0=;
	b=NOgOpLdhGhq4ce0/Jn5GW+kzPpwpX+f91rUaOhhsPzHB7kQ/18Z9Mut/RRji1bFO49
	Dzbnggg6cBewiG0MxTKoB98uREV9d0oKczD6q3uTYcIVk8Kb1DbLtng3T9hu3syySB4i
	mjXNKEdood675tBb/JoFBLOV/l0qdUwQZyd0fjP/KaG3XiYm6kd8hlFgS8BgEMSFTy+c
	zky4Xanl4AO/YMHcHhxkY+0u2SSf3BPHti8PxI+a589rO2gQZW/SYZcC+qb2ox6pWrsQ
	Eh9MKhAwgqVT5ZYxKqjpqTOrnvYn2lGcSlw60u54Jer1dBXka6DpHA3OYaaXRJmeva7M
	UstQ==
X-Gm-Message-State: AIkVDXJspjdoU+F49lB89NECrzeFw/8q5ARtycelOHeH4oTk7vVdmcjyKWLT2rBvvs7nJ0JnNBLY8LmAL1Oihw==
X-Received: by 10.28.109.29 with SMTP id i29mr46171356wmc.124.1483491082439;
	Tue, 03 Jan 2017 16:51:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Tue, 3 Jan 2017 16:51:22 -0800 (PST)
In-Reply-To: <CAAtXAHeA6RzdBiRMnrHzD2VHnawA32=3KyXKEVkqQSG2Vo2z4g@mail.gmail.com>
References: <1483034519-11162-1-git-send-email-moritz.fischer@ettus.com>
	<CAAtXAHeA6RzdBiRMnrHzD2VHnawA32=3KyXKEVkqQSG2Vo2z4g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 4 Jan 2017 01:51:22 +0100
Message-ID: <CA+chaQecLpDcBP34PxXgCwSavTDJ_cMMBU3vgAxjSao22y7M0A@mail.gmail.com>
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Moritz Fischer <mdf@kernel.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] devtools: Add recipe for Chromium Embedded Controller utilities
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
X-List-Received-Date: Wed, 04 Jan 2017 00:51:23 -0000
Content-Type: multipart/alternative; boundary=001a11478866ff12e705453a2e67

--001a11478866ff12e705453a2e67
Content-Type: text/plain; charset=UTF-8

The PV still doesn't look right.

On Wed, Jan 4, 2017 at 1:28 AM, Moritz Fischer <moritz.fischer@ettus.com>
wrote:

> Hi all,
>
> I realized this might have gotten held up by me not being subscibed to the
> list,
> do you want me to resubmit?
>
> On Thu, Dec 29, 2016 at 10:01 AM, Moritz Fischer
> <moritz.fischer@ettus.com> wrote:
> > Add a recipe to build 'ectool' a utility to interact with the embedded
> > controller on Google's chromebooks (and other platforms using it).
> >
> > Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> > ---
> > Changes from v1:
> >
> > - Replaced DESCRIPTION with SUMMARY (Martin)
> > - Use EXTRA_OEMAKE (Martin)
> > - Removed FILESEXTRAPATHS (Martin)
> > - Changed PV (Martin / Khem)
> > - Removed FILES_PN (Khem)
> > ---
> >  .../chromium-utils/chromium-utils.bb               | 24
> ++++++++++++++++++++
> >  .../files/0001-build-Add-HOST_LDFLAGS.patch        | 26
> ++++++++++++++++++++++
> >  2 files changed, 50 insertions(+)
> >  create mode 100644 meta/recipes-devtools/chromium-utils/chromium-utils.
> bb
> >  create mode 100644 meta/recipes-devtools/chromium-utils/files/0001-
> build-Add-HOST_LDFLAGS.patch
> >
> > diff --git a/meta/recipes-devtools/chromium-utils/chromium-utils.bb
> b/meta/recipes-devtools/chromium-utils/chromium-utils.bb
> > new file mode 100644
> > index 0000000..87d866a
> > --- /dev/null
> > +++ b/meta/recipes-devtools/chromium-utils/chromium-utils.bb
> > @@ -0,0 +1,24 @@
> > +SUMMARY = "Chromium EC utilities"
> > +DEPENDS = "libftdi"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=562c740877935f40b262db8af30bca
> 36"
> > +
> > +SRCREV = "b19bb1f22a3fd0102030485d324c0321a18827e8"
> > +SRC_URI = "git://chromium.googlesource.com/chromiumos/platform/ec;
> protocol=https \
> > +           file://0001-build-Add-HOST_LDFLAGS.patch \
> > +          "
> > +
> > +PV="1.1.9999+${SRCPV}"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +EXTRA_OEMAKE = "'HOSTCC=${CC}' 'HOSTCFLAGS=${CFLAGS}'
> 'HOST_LDFLAGS=${LDFLAGS}'"
> > +
> > +do_compile() {
> > +    oe_runmake utils
> > +}
> > +
> > +do_install() {
> > +    install -m 0755 -d ${D}${bindir}
> > +    install -m 0755 ${S}/build/bds/util/ectool ${D}${bindir}/ectool
> > +}
> > diff --git a/meta/recipes-devtools/chromium-utils/files/0001-build-Add-HOST_LDFLAGS.patch
> b/meta/recipes-devtools/chromium-utils/files/0001-
> build-Add-HOST_LDFLAGS.patch
> > new file mode 100644
> > index 0000000..46e8cad
> > --- /dev/null
> > +++ b/meta/recipes-devtools/chromium-utils/files/0001-
> build-Add-HOST_LDFLAGS.patch
> > @@ -0,0 +1,26 @@
> > +From 56ffeeffea735a6a8f69fc111278ebabe3c7e2d8 Mon Sep 17 00:00:00 2001
> > +From: Moritz Fischer <moritz.fischer@ettus.com>
> > +Date: Tue, 27 Dec 2016 22:24:07 -0800
> > +Subject: [PATCH] build Add HOST_LDFLAGS
> > +
> > +Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> > +---
> > + Makefile.rules | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/Makefile.rules b/Makefile.rules
> > +index 404454d..0057ba9 100644
> > +--- a/Makefile.rules
> > ++++ b/Makefile.rules
> > +@@ -60,7 +60,7 @@ cmd_c_to_build = $(BUILDCC) $(BUILD_CFLAGS) \
> > +                $(sort $(foreach c,$($(*F)-objs),util/$(c:%.o=%.c))
> $*.c) \
> > +                $(BUILD_LDFLAGS) \
> > +                -MMD -MF $@.d -o $@
> > +-cmd_c_to_host = $(HOSTCC) $(HOST_CFLAGS) -MMD -MF $@.d  -o $@ \
> > ++cmd_c_to_host = $(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) -MMD -MF
> $@.d  -o $@ \
> > +                $(sort $(foreach c,$($(*F)-objs),util/$(c:%.o=%.c))
> $*.c)
> > + cmd_cxx_to_host = $(HOSTCXX) -std=c++0x $(COMMON_WARN)
> $(HOST_CXXFLAGS)\
> > +       -I ./$($(notdir $@)_ROOT) -o $@ $(filter %.cc,$^) $($(notdir
> $@)_LIBS)
> > +--
> > +2.4.11
> > +
> > --
> > 2.7.4
> >
>
> Thanks,
>
> Moritz
>

--001a11478866ff12e705453a2e67
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The PV still doesn&#39;t look right.</div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Wed, Jan 4, 2017 at 1:28 AM, M=
oritz Fischer <span dir=3D"ltr">&lt;<a href=3D"mailto:moritz.fischer@ettus.=
com" target=3D"_blank">moritz.fischer@ettus.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">Hi all,<br>
<br>
I realized this might have gotten held up by me not being subscibed to the =
list,<br>
do you want me to resubmit?<br>
<br>
On Thu, Dec 29, 2016 at 10:01 AM, Moritz Fischer<br>
&lt;<a href=3D"mailto:moritz.fischer@ettus.com">moritz.fischer@ettus.com</a=
>&gt; wrote:<br>
&gt; Add a recipe to build &#39;ectool&#39; a utility to interact with the =
embedded<br>
&gt; controller on Google&#39;s chromebooks (and other platforms using it).=
<br>
&gt;<br>
&gt; Signed-off-by: Moritz Fischer &lt;<a href=3D"mailto:moritz.fischer@ett=
us.com">moritz.fischer@ettus.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes from v1:<br>
&gt;<br>
&gt; - Replaced DESCRIPTION with SUMMARY (Martin)<br>
&gt; - Use EXTRA_OEMAKE (Martin)<br>
&gt; - Removed FILESEXTRAPATHS (Martin)<br>
&gt; - Changed PV (Martin / Khem)<br>
&gt; - Removed FILES_PN (Khem)<br>
&gt; ---<br>
&gt;=C2=A0 .../chromium-utils/<a href=3D"http://chromium-utils.bb" rel=3D"n=
oreferrer" target=3D"_blank">chromium-<wbr>utils.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 24 ++++++++++++++++++++<br>
&gt;=C2=A0 .../files/0001-build-Add-HOST_<wbr>LDFLAGS.patch=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 26 ++++++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 50 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/<wbr>chromium-utils/<a =
href=3D"http://chromium-utils.bb" rel=3D"noreferrer" target=3D"_blank">chro=
mium-utils.<wbr>bb</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/<wbr>chromium-utils/fil=
es/0001-<wbr>build-Add-HOST_LDFLAGS.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/<wbr>chromium-utils/<a href=3D"http=
://chromium-utils.bb" rel=3D"noreferrer" target=3D"_blank">chromium-utils.<=
wbr>bb</a> b/meta/recipes-devtools/<wbr>chromium-utils/<a href=3D"http://ch=
romium-utils.bb" rel=3D"noreferrer" target=3D"_blank">chromium-utils.<wbr>b=
b</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..87d866a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/<wbr>chromium-utils/<a href=3D"http://chro=
mium-utils.bb" rel=3D"noreferrer" target=3D"_blank">chromium-utils.<wbr>bb<=
/a><br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +SUMMARY =3D &quot;Chromium EC utilities&quot;<br>
&gt; +DEPENDS =3D &quot;libftdi&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>562c740877935f40=
b262db8af30bca<wbr>36&quot;<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;<wbr>b19bb1f22a3fd0102030485d324c03<wbr>21a18827e8&q=
uot;<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://chromium.googlesource.com/c=
hromiumos/platform/ec;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank=
">chromium.googlesource.<wbr>com/chromiumos/platform/ec;<wbr>protocol=3Dhtt=
ps</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-build-Add-HOST_<=
wbr>LDFLAGS.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +<br>
&gt; +PV=3D&quot;1.1.9999+${SRCPV}&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +EXTRA_OEMAKE =3D &quot;&#39;HOSTCC=3D${CC}&#39; &#39;HOSTCFLAGS=3D${C=
FLAGS}&#39; &#39;HOST_LDFLAGS=3D${LDFLAGS}&#39;&quot;<br>
&gt; +<br>
&gt; +do_compile() {<br>
&gt; +=C2=A0 =C2=A0 oe_runmake utils<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 -d ${D}${bindir}<br>
&gt; +=C2=A0 =C2=A0 install -m 0755 ${S}/build/bds/util/ectool ${D}${bindir=
}/ectool<br>
&gt; +}<br>
&gt; diff --git a/meta/recipes-devtools/<wbr>chromium-utils/files/0001-<wbr=
>build-Add-HOST_LDFLAGS.patch b/meta/recipes-devtools/<wbr>chromium-utils/f=
iles/0001-<wbr>build-Add-HOST_LDFLAGS.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..46e8cad<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/<wbr>chromium-utils/files/0001-<wbr>build-=
Add-HOST_LDFLAGS.patch<br>
&gt; @@ -0,0 +1,26 @@<br>
&gt; +From 56ffeeffea735a6a8f69fc111278eb<wbr>abe3c7e2d8 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From: Moritz Fischer &lt;<a href=3D"mailto:moritz.fischer@ettus.com">=
moritz.fischer@ettus.com</a>&gt;<br>
&gt; +Date: Tue, 27 Dec 2016 22:24:07 -0800<br>
&gt; +Subject: [PATCH] build Add HOST_LDFLAGS<br>
&gt; +<br>
&gt; +Signed-off-by: Moritz Fischer &lt;<a href=3D"mailto:moritz.fischer@et=
tus.com">moritz.fischer@ettus.com</a>&gt;<br>
&gt; +---<br>
&gt; + Makefile.rules | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/Makefile.rules b/Makefile.rules<br>
&gt; +index 404454d..0057ba9 100644<br>
&gt; +--- a/Makefile.rules<br>
&gt; ++++ b/Makefile.rules<br>
&gt; +@@ -60,7 +60,7 @@ cmd_c_to_build =3D $(BUILDCC) $(BUILD_CFLAGS) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(sort $(fore=
ach c,$($(*F)-objs),util/$(c:%.o=3D%<wbr>.c)) $*.c) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(BUILD_LDFLA=
GS) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -MMD -MF $@.d=
 -o $@<br>
&gt; +-cmd_c_to_host =3D $(HOSTCC) $(HOST_CFLAGS) -MMD -MF $@.d=C2=A0 -o $@=
 \<br>
&gt; ++cmd_c_to_host =3D $(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) -MMD -MF =
$@.d=C2=A0 -o $@ \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(sort $(fore=
ach c,$($(*F)-objs),util/$(c:%.o=3D%<wbr>.c)) $*.c)<br>
&gt; + cmd_cxx_to_host =3D $(HOSTCXX) -std=3Dc++0x $(COMMON_WARN) $(HOST_CX=
XFLAGS)\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0-I ./$($(notdir $@)_ROOT) -o $@ $(filter %=
.cc,$^) $($(notdir $@)_LIBS)<br>
&gt; +--<br>
&gt; +2.4.11<br>
&gt; +<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
<br>
Thanks,<br>
<br>
Moritz<br>
</blockquote></div><br></div>

--001a11478866ff12e705453a2e67--
