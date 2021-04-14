Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.11187.1618398252167681914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 04:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=svErd1dE;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id 2so10127524vsh.4
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 04:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=00qOKCXf1ozN/MernW65Ngws4Rf8IWoe73bszMyox6Q=;
        b=svErd1dEceJJ2GTAGH/v4rfZFZrJxNN7KedKkSJLBaFhb5UVeaAOC2CCriHeSUGNJM
         1LnsdTgB0Vu3UX7Xufcwcj6HXYR6z43t07Ahf+HgjlroChamASdp22gdgpJN9tHD7ajZ
         Bf+psmg0UrHgI1nBI6kosVwgW8nnhgWbodt05j65Owm+He+hBzKCnLj3GP2Rr8B3C+U6
         pBGmrGs1vRA0j4IHpqWRxBKK4jJxVklPHG99zFBGX8myd/MlJJdyTRK4OswAdPxsNlLU
         ZjpZzqRWbIbjQhrInlJhXEDApjFTWUxVFhl9gCDitlmYMF0HpHVcNgqAABf8uCEQdE9l
         25ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=00qOKCXf1ozN/MernW65Ngws4Rf8IWoe73bszMyox6Q=;
        b=FK2apmGeBnz5VBNQknAUXySKCMPlgDQPTssJbrkUGKnVad+PS3zB0w3yh0Ln61LmbF
         RiWC50MGUMQWIvGDGdBErZSU3mSBFw60IxO3hBl5wTvPTN1MYvZKBlAWhesE0wd4GZUa
         bbP+MBbkj9y4YdqJ/AwHEP3xxaeK3qpnYvpALZRibnZrsX1KaSJHCISo95TnM3LW89KA
         z4RYRoNUHQWa1QYoqg2lZ74bbaKIxx1ZIVUTWSkTzC2d38KzgIvKT519PUq78dc8M9RO
         BKDkPv5NqXZFN4QpUp9UPKpn8wMtoGmLyMUwAe0MTrS4Vozx6OJna0uDD8GmfPFoVhFv
         jGGg==
X-Gm-Message-State: AOAM531BdZaR+l9/Vs2EiJ78IJlS2MwiyF7vmKxc5yAy8HXzr0zcINq7
	Pgk2HlWvFmG1WAn0FVUlOwkqFeJbBeWE9+x+HbI=
X-Google-Smtp-Source: ABdhPJznQHnHmXnIbUKbgXvrA/VjIfwDcu2Ue0r7sk+lCe3MBD+jbYKDmKiSIsGpu+gPrdggKgrCLYCRxJlofRUHM7A=
X-Received: by 2002:a67:8c1:: with SMTP id 184mr27443939vsi.31.1618398251177;
 Wed, 14 Apr 2021 04:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210413092432.3688149-1-krellan@google.com> <a15e36dd1ef45bba25c2f7ca78ce17110d767723.camel@linuxfoundation.org>
 <CANPkJS9XmUp1FqKLJDXT8gdJBWPM13k-Rx0vn+bf4B9ijw--Yg@mail.gmail.com>
 <CANNYZj9heipn=vQ0W1ca6ggSij8xU_Wvf4yKzFqAmYh=SSoUEQ@mail.gmail.com>
 <CANNYZj9AjWNbAcXuKShuHe1iKfamM2p80M38Pt2hBVTXV-khMQ@mail.gmail.com>
 <CANPkJS_KLvz2Ym9wDObKyGzOuajLxdNri_9WSGKo7POys-5OTA@mail.gmail.com>
 <CANNYZj-cq4QDHTJwGi3NozsuNMa5UQwHWs-FnE9FczYPTPQO8Q@mail.gmail.com> <CAPnigKkpgAqXG02an=hJhZnywpUQ8AdSXrNUEzb1gYrj4OAgcA@mail.gmail.com>
In-Reply-To: <CAPnigKkpgAqXG02an=hJhZnywpUQ8AdSXrNUEzb1gYrj4OAgcA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 14 Apr 2021 13:03:59 +0200
Message-ID: <CANNYZj82RTrHuXxLe+tfF5bn_wijpKDEh17nrZkqpA9EpCpysA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxcb: Add inherit python3native
To: William Kennington <wak@google.com>
Cc: Josh Lehan <krellan@google.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, Ross Burton <ross@burtonini.com>
Content-Type: multipart/alternative; boundary="000000000000dddb6505bfecb44d"

--000000000000dddb6505bfecb44d
Content-Type: text/plain; charset="UTF-8"

That seems correct, but if we force the native python 3.9 to be used, is
the current libxcb/xcbgen in master compatible with it (e.g. not anymore
using the removed feautre)?

Alex

On Wed, 14 Apr 2021 at 11:55, William Kennington <wak@google.com> wrote:

> It's correct because the package it depends on (xcb-proto-native) is
> already `inherit python3native`. This package's xcbgen invocation is
> broken because it is using a combination of files generated for native
> python but executed through host python (look at the site-packages
> version). It can't bloat our dependency tree any more as it already
> implicitly depends on python3-native.
>
> On Wed, Apr 14, 2021 at 12:25 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > As a matter of policy, yocto recipes default to using python from the
> host, and are only switched to native python when there host python does
> not come with needed 3rd party modules (which are then pulled in via
> -native DEPENDS), or there is some other issue that cannot be resolved with
> host python. Native python dependency lengthens the dependency chains,
> which is especially critical for -native recipes.
> >
> > In this case, the problem is that libxcb in your build is too old for
> the latest python 3.9, so you need to either update libxcb or backport an
> upstream fix to make it work with 3.9 again. Your patch would not resolve
> the issue, as native python in latest oe-core  master is also 3.9, and the
> failure would be the same.
> >
> > Alex
> >
> > On Wed, 14 Apr 2021 at 07:15, Josh Lehan <krellan@google.com> wrote:
> >>
> >> Thanks. It's true, my local build is a little bit outdated. I'm running
> OpenBMC and it's slightly behind the latest upstream master. For now, it is
> still compiling with Python 3.8.
> >>
> >> However, there is the same underlying problem, even if I upgraded. It
> looks like the version of Python on the build machine is wrongly leaking
> into the build, and it's being used instead of the oe-core preferred
> version of Python. Ideally, the locally-installed Python wouldn't influence
> the outcome of the build, as oe-core has its own Python that it should
> prefer to use instead, as it does for other packages. This is what "inherit
> python3native" enables, right? Otherwise, the problem will happen again in
> the future, whenever somebody wants to try out a new Python version on
> their machine. The idea is to obtain some separation, for safety, and to
> help ensure a clean reproducible build. It's a good practice, I think, to
> minimize the opportunities for local variance to creep into the build.
> >>
> >> As for "from fractions import gcd" becoming an error in 3.9, there was
> this change: https://bugs.python.org/issue39350
> >>
> >> It appears fractions.gcd was deprecated for a while. It was moved to
> math.gcd a while ago, and deprecated, but not deleted entirely until Python
> 3.9. So, that's why it works in 3.8 (what my old oe-core build is running),
> but not in 3.9 (what my local distribution is running).
> >>
> >> Josh
> >>
> >> Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941
> >>
> >>
> >>
> >> On Tue, Apr 13, 2021 at 1:08 PM Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> >>>
> >>> Also note: oe-core master already has 3.9, so you need to find out why
> '3.8' shows up in install paths as well. Something doesn't compute here.
> >>>
> >>> Alex
> >>>
> >>> On Tue, 13 Apr 2021 at 22:07, Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> >>>>
> >>>> I think you need to dig a little deeper. Why 'from fractions import
> gcd' is a problem with host python3.9 but not a problem with native python
> 3.9?
> >>>>
> >>>> Alex
> >>>>
> >>>> On Tue, 13 Apr 2021 at 20:58, Josh Lehan via lists.openembedded.org
> <krellan=google.com@lists.openembedded.org> wrote:
> >>>>>
> >>>>> Hi there, thanks. I'm not entirely sure what "python3native" does
> exactly, but this is my observation. The problem we are seeing is that,
> without "inherit python3native", the build machine's local Python version
> (whatever it happens to be) takes precedence over the Yocto-included Python
> version. In our case, the build machine is running Python 3.9, and
> evidently something changed between Python 3.8 and Python 3.9 to be
> incompatible with libxcb. Here's the error message:
> >>>>>
> >>>>> Failed to load the xcbgen Python package!
> >>>>> Make sure that xcb/proto installed it on your Python path.
> >>>>> If not, you will need to create a .pth file or define $PYTHONPATH
> >>>>> to extend the path.
> >>>>> Refer to the README file in xcb/proto for more info.
> >>>>>
> >>>>> Traceback (most recent call last):
> >>>>>   File
> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/build/src/../../libxcb-1.14/src/c_client.py",
> line 3338, in <module>
> >>>>>     from xcbgen.state import Module
> >>>>>   File
> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/state.py",
> line 7, in <module>
> >>>>>     from xcbgen import matcher
> >>>>>   File
> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/matcher.py",
> line 12, in <module>
> >>>>>     from xcbgen.xtypes import *
> >>>>>   File
> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/xtypes.py",
> line 5, in <module>
> >>>>>     from xcbgen.align import Alignment, AlignmentLog
> >>>>>   File
> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/align.py",
> line 5, in <module>
> >>>>>     from fractions import gcd
> >>>>> ImportError: cannot import name 'gcd' from 'fractions'
> (/usr/lib/python3.9/fractions.py)
> >>>>>
> >>>>> The above error text repeats for many of the files it tries to
> compile within libxcb.
> >>>>>
> >>>>> In general, it seems the safest approach is to standardize on a
> Python version that's known to work, without depending on whatever version
> of Python the developer has installed locally on their build machine (which
> can vary due to distribution, developer's preference, and so on).
> >>>>>
> >>>>> Josh
> >>>>>
> >>>>> Josh Lehan | Software Engineer | krellan@google.com | +1
> 650-733-8941
> >>>>>
> >>>>>
> >>>>>
> >>>>> On Tue, Apr 13, 2021 at 2:45 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> >>>>>>
> >>>>>> On Tue, 2021-04-13 at 02:24 -0700, Josh Lehan via
> lists.openembedded.org wrote:
> >>>>>> > During compilation, the local Python environment leaks into
> >>>>>> > the Bitbake build. Adding "inherit python3native" fixes this.
> >>>>>> >
> >>>>>> > Signed-off-by: Josh Lehan <krellan@google.com>
> >>>>>> > ---
> >>>>>> >  meta/recipes-graphics/xorg-lib/libxcb_1.14.bb | 1 +
> >>>>>> >  1 file changed, 1 insertion(+)
> >>>>>> >
> >>>>>> > diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> >>>>>> > index f0a223a19c..40c7b1cc3c 100644
> >>>>>> > --- a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> >>>>>> > +++ b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
> >>>>>> > @@ -24,6 +24,7 @@ PACKAGES_DYNAMIC = "^${PN}-.*"
> >>>>>> >  FILES_${PN} = "${libdir}/libxcb.so.*"
> >>>>>> >
> >>>>>> >  inherit autotools pkgconfig features_check
> >>>>>> > +inherit python3native
> >>>>>> >
> >>>>>>
> >>>>>>
> >>>>>> Could you provide a little more information about how this is
> breaking things?
> >>>>>>
> >>>>>> Whilst python is used by the libxcb build, I believe it shouldn't
> change the
> >>>>>> output, it doesn't in our reproducibity tests.
> >>>>>>
> >>>>>> Adding a python-native dependency does slow the build down a bit so
> if we
> >>>>>> don't need it, it would be good to avoid it.
> >>>>>>
> >>>>>> Cheers,
> >>>>>>
> >>>>>> Richard
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>
> >>>>>
> >>>>>
> >
> > 
> >
>

--000000000000dddb6505bfecb44d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>That seems correct, but if we force the native python=
 3.9 to be used, is the current libxcb/xcbgen in master compatible with it =
(e.g. not anymore using the removed feautre)?</div><div><br></div><div>Alex=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Wed, 14 Apr 2021 at 11:55, William Kennington &lt;<a href=3D"m=
ailto:wak@google.com">wak@google.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">It&#39;s correct because the package it=
 depends on (xcb-proto-native) is<br>
already `inherit python3native`. This package&#39;s xcbgen invocation is<b=
r>
broken because it is using a combination of files generated for native<br>
python but executed through host python (look at the site-packages<br>
version). It can&#39;t bloat our dependency tree any more as it already<br=
>
implicitly depends on python3-native.<br>
<br>
On Wed, Apr 14, 2021 at 12:25 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; As a matter of policy, yocto recipes default to using python from the=
 host, and are only switched to native python when there host python does n=
ot come with needed 3rd party modules (which are then pulled in via -native=
 DEPENDS), or there is some other issue that cannot be resolved with host p=
ython. Native python dependency lengthens the dependency chains, which is e=
specially critical for -native recipes.<br>
&gt;<br>
&gt; In this case, the problem is that libxcb in your build is too old for=
 the latest python 3.9, so you need to either update libxcb or backport an =
upstream fix to make it work with 3.9 again. Your patch would not resolve t=
he issue, as native python in latest oe-core=C2=A0 master is also 3.9, and =
the failure would be the same.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Wed, 14 Apr 2021 at 07:15, Josh Lehan &lt;<a href=3D"mailto:krella=
n@google.com" target=3D"_blank">krellan@google.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Thanks. It&#39;s true, my local build is a little bit outdated. I=
&#39;m running OpenBMC and it&#39;s slightly behind the latest upstream mas=
ter. For now, it is still compiling with Python 3.8.<br>
&gt;&gt;<br>
&gt;&gt; However, there is the same underlying problem, even if I upgraded=
. It looks like the version of Python on the build machine is wrongly leaki=
ng into the build, and it&#39;s being used instead of the oe-core preferred=
 version of Python. Ideally, the locally-installed Python wouldn&#39;t infl=
uence the outcome of the build, as oe-core has its own Python that it shoul=
d prefer to use instead, as it does for other packages. This is what &quot;=
inherit python3native&quot; enables, right? Otherwise, the problem will hap=
pen again in the future, whenever somebody wants to try out a new Python ve=
rsion on their machine. The idea is to obtain some separation, for safety, =
and to help ensure a clean reproducible build. It&#39;s a good practice, I =
think, to minimize the opportunities for local variance to creep into the b=
uild.<br>
&gt;&gt;<br>
&gt;&gt; As for &quot;from fractions import gcd&quot; becoming an error in=
 3.9, there was this change: <a href=3D"https://bugs.python.org/issue39350"=
 rel=3D"noreferrer" target=3D"_blank">https://bugs.python.org/issue39350</a=
><br>
&gt;&gt;<br>
&gt;&gt; It appears fractions.gcd was deprecated for a while. It was moved=
 to math.gcd a while ago, and deprecated, but not deleted entirely until Py=
thon 3.9. So, that&#39;s why it works in 3.8 (what my old oe-core build is =
running), but not in 3.9 (what my local distribution is running).<br>
&gt;&gt;<br>
&gt;&gt; Josh<br>
&gt;&gt;<br>
&gt;&gt; Josh Lehan | Software Engineer | <a href=3D"mailto:krellan@google=
.com" target=3D"_blank">krellan@google.com</a> | +1 650-733-8941<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Apr 13, 2021 at 1:08 PM Alexander Kanavin &lt;<a href=3D"=
mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>=
&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Also note: oe-core master already has 3.9, so you need to fin=
d out why &#39;3.8&#39; shows up in install paths as well. Something doesn&=
#39;t compute here.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Alex<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Tue, 13 Apr 2021 at 22:07, Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.co=
m</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I think you need to dig a little deeper. Why &#39;from fr=
actions import gcd&#39; is a problem with host python3.9 but not a problem =
with native python 3.9?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Alex<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Tue, 13 Apr 2021 at 20:58, Josh Lehan via <a href=3D"h=
ttp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.op=
enembedded.org</a> &lt;krellan=3D<a href=3D"mailto:google.com@lists.openemb=
edded.org" target=3D"_blank">google.com@lists.openembedded.org</a>&gt; wrot=
e:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Hi there, thanks. I&#39;m not entirely sure what &quo=
t;python3native&quot; does exactly, but this is my observation. The problem=
 we are seeing is that, without &quot;inherit python3native&quot;, the buil=
d machine&#39;s local Python version (whatever it happens to be) takes prec=
edence over the Yocto-included Python version. In our case, the build machi=
ne is running Python 3.9, and evidently something changed between Python 3.=
8 and Python 3.9 to be incompatible with libxcb. Here&#39;s the error messa=
ge:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Failed to load the xcbgen Python package!<br>
&gt;&gt;&gt;&gt;&gt; Make sure that xcb/proto installed it on your Python =
path.<br>
&gt;&gt;&gt;&gt;&gt; If not, you will need to create a .pth file or define=
 $PYTHONPATH<br>
&gt;&gt;&gt;&gt;&gt; to extend the path.<br>
&gt;&gt;&gt;&gt;&gt; Refer to the README file in xcb/proto for more info.<=
br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Traceback (most recent call last):<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0File &quot;/OpenBMC/build/tmp/work/x86_64=
-linux/libxcb-native/1.14-r0/build/src/../../libxcb-1.14/src/c_client.py&qu=
ot;, line 3338, in &lt;module&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0from xcbgen.state import Module<br=
>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0File &quot;/OpenBMC/build/tmp/work/x86_64=
-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../=
../usr/lib/python3.8/site-packages/xcbgen/state.py&quot;, line 7, in &lt;mo=
dule&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0from xcbgen import matcher<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0File &quot;/OpenBMC/build/tmp/work/x86_64=
-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../=
../usr/lib/python3.8/site-packages/xcbgen/matcher.py&quot;, line 12, in &lt=
;module&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0from xcbgen.xtypes import *<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0File &quot;/OpenBMC/build/tmp/work/x86_64=
-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../=
../usr/lib/python3.8/site-packages/xcbgen/xtypes.py&quot;, line 5, in &lt;m=
odule&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0from xcbgen.align import Alignment=
, AlignmentLog<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0File &quot;/OpenBMC/build/tmp/work/x86_64=
-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../=
../usr/lib/python3.8/site-packages/xcbgen/align.py&quot;, line 5, in &lt;mo=
dule&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0from fractions import gcd<br>
&gt;&gt;&gt;&gt;&gt; ImportError: cannot import name &#39;gcd&#39; from &#=
39;fractions&#39; (/usr/lib/python3.9/fractions.py)<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; The above error text repeats for many of the files it=
 tries to compile within libxcb.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; In general, it seems the safest approach is to standa=
rdize on a Python version that&#39;s known to work, without depending on wh=
atever version of Python the developer has installed locally on their build=
 machine (which can vary due to distribution, developer&#39;s preference, a=
nd so on).<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Josh<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Josh Lehan | Software Engineer | <a href=3D"mailto:kr=
ellan@google.com" target=3D"_blank">krellan@google.com</a> | +1 650-733-894=
1<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On Tue, Apr 13, 2021 at 2:45 AM Richard Purdie &lt;<a=
 href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richa=
rd.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On Tue, 2021-04-13 at 02:24 -0700, Josh Lehan via=
 <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bl=
ank">lists.openembedded.org</a> wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; During compilation, the local Python environ=
ment leaks into<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; the Bitbake build. Adding &quot;inherit pyth=
on3native&quot; fixes this.<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; Signed-off-by: Josh Lehan &lt;<a href=3D"mai=
lto:krellan@google.com" target=3D"_blank">krellan@google.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 meta/recipes-graphics/xorg-lib/<a href=
=
=3D"http://libxcb_1.14.bb" rel=3D"noreferrer" target=3D"_blank">libxcb_1.1=
4.bb</a> | 1 +<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; diff --git a/meta/recipes-graphics/xorg-lib/=
<a href=3D"http://libxcb_1.14.bb" rel=3D"noreferrer" target=3D"_blank">libx=
cb_1.14.bb</a> b/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxcb_1.=
14.bb" rel=3D"noreferrer" target=3D"_blank">libxcb_1.14.bb</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; index f0a223a19c..40c7b1cc3c 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; --- a/meta/recipes-graphics/xorg-lib/<a href=
=
=3D"http://libxcb_1.14.bb" rel=3D"noreferrer" target=3D"_blank">libxcb_1.1=
4.bb</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; +++ b/meta/recipes-graphics/xorg-lib/<a href=
=
=3D"http://libxcb_1.14.bb" rel=3D"noreferrer" target=3D"_blank">libxcb_1.1=
4.bb</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; @@ -24,6 +24,7 @@ PACKAGES_DYNAMIC =3D &quot=
;^${PN}-.*&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 FILES_${PN} =3D &quot;${libdir}/libxcb=
.so.*&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;=C2=A0 inherit autotools pkgconfig features_c=
heck<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt; +inherit python3native<br>
&gt;&gt;&gt;&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Could you provide a little more information about=
 how this is breaking things?<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Whilst python is used by the libxcb build, I beli=
eve it shouldn&#39;t change the<br>
&gt;&gt;&gt;&gt;&gt;&gt; output, it doesn&#39;t in our reproducibity tests=
.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Adding a python-native dependency does slow the b=
uild down a bit so if we<br>
&gt;&gt;&gt;&gt;&gt;&gt; don&#39;t need it, it would be good to avoid it.<=
br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Cheers,<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Richard<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--000000000000dddb6505bfecb44d--
