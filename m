Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.8785.1618377333037953835
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Apr 2021 22:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=sIa6D7mG;
 spf=pass (domain: google.com, ip: 209.85.166.49, mailfrom: krellan@google.com)
Received: by mail-io1-f49.google.com with SMTP id d5so10026057iof.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Apr 2021 22:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LdMwgLCAsi+nrsQzHczLuaYstSrNWidXEiQ9KCs4d/Y=;
        b=sIa6D7mGb4WJjlYuQpxsL1i5eZR2mdeQyFZmUc/+EWozvlWBWOwm6RY8jtqZ/aCs4L
         TqseJy0GVXnQD9fL1cTpJnF/S94MZNUcUbQV5HNS7ZZSL70eU0E190E4Mejdkq94HkA+
         5OnIw5uh7NICukvJ+8TmPZxd1cR6hgxORibozAPDtnGGPEAU8rJqXp2ppPBD6GStFk5O
         CUCOgOpLlAvSxAe5ghoMGScbQZtFR7KFxLSg0k4IvjrckzLnQoy4iQiBiA/X6vslTx4U
         QHSADXo6uX9iVq+MTi+RXZ7n4g00L/cVSawK1zFiks/pGC7NiuqS6+KLWD+6PJgBFkDe
         Ut5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LdMwgLCAsi+nrsQzHczLuaYstSrNWidXEiQ9KCs4d/Y=;
        b=RQYZZ1GIuaagkHjwitnESiyvdzm37VS+yVQOQOxyX/Wfvp4NEPvwfXqjn+vtNdBXGM
         OwLLU5DhcZsO4yz6lU9kZG4/O9MorlsUD09s7lmDdlrs1AsD+/c9tL/xXpgbSP4399q5
         VpXZaRI0uqcN4n7YVg/6LLGt/lhxDtQklZxHALTADso2j0Erk+SRRtSXwDVPLiWMO+6h
         IDGIagsISRaU2MuS8l59IvT8vpBMrC6O02rdLII+8VVo2OPY/XIv8wTapEVy906FgdaL
         seIQRdW1ObfGgYf4ahynJjJVLCKZA4/rGZFfJXEgHiRsmv+zii6gXBQj1Jc3LtR4BxZa
         TwUg==
X-Gm-Message-State: AOAM533+Mdmew3IBO/odU/KX2dZnCYFcPqpU7IewbiNCumS2m0YmVJwn
	vCH8Pl9uKRWpcijIgw5k4Ldp5eevCO6tgzXDj+YPdg==
X-Google-Smtp-Source: ABdhPJxKmsT0Addd/ks3bDxqZDWuV2HjGzIuljmFHiwOSBzCC5OC0TLnemDip2Jk781YcGnq8d51W8IwFnYbpRGmXb4=
X-Received: by 2002:a02:ca56:: with SMTP id i22mr14652493jal.50.1618377331347;
 Tue, 13 Apr 2021 22:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210413092432.3688149-1-krellan@google.com> <a15e36dd1ef45bba25c2f7ca78ce17110d767723.camel@linuxfoundation.org>
 <CANPkJS9XmUp1FqKLJDXT8gdJBWPM13k-Rx0vn+bf4B9ijw--Yg@mail.gmail.com>
 <CANNYZj9heipn=vQ0W1ca6ggSij8xU_Wvf4yKzFqAmYh=SSoUEQ@mail.gmail.com> <CANNYZj9AjWNbAcXuKShuHe1iKfamM2p80M38Pt2hBVTXV-khMQ@mail.gmail.com>
In-Reply-To: <CANNYZj9AjWNbAcXuKShuHe1iKfamM2p80M38Pt2hBVTXV-khMQ@mail.gmail.com>
From: "Josh Lehan" <krellan@google.com>
Date: Tue, 13 Apr 2021 22:15:04 -0700
Message-ID: <CANPkJS_KLvz2Ym9wDObKyGzOuajLxdNri_9WSGKo7POys-5OTA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxcb: Add inherit python3native
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, Ross Burton <ross@burtonini.com>
Content-Type: multipart/alternative; boundary="000000000000f30d3905bfe7d50b"

--000000000000f30d3905bfe7d50b
Content-Type: text/plain; charset="UTF-8"

Thanks. It's true, my local build is a little bit outdated. I'm running
OpenBMC and it's slightly behind the latest upstream master. For now, it is
still compiling with Python 3.8.

However, there is the same underlying problem, even if I upgraded. It looks
like the version of Python on the build machine is wrongly leaking into the
build, and it's being used instead of the oe-core preferred version of
Python. Ideally, the locally-installed Python wouldn't influence the
outcome of the build, as oe-core has its own Python that it should prefer
to use instead, as it does for other packages. This is what "inherit
python3native" enables, right? Otherwise, the problem will happen again in
the future, whenever somebody wants to try out a new Python version on
their machine. The idea is to obtain some separation, for safety, and to
help ensure a clean reproducible build. It's a good practice, I think, to
minimize the opportunities for local variance to creep into the build.

As for "from fractions import gcd" becoming an error in 3.9, there was this
change: https://bugs.python.org/issue39350

It appears fractions.gcd was deprecated for a while. It was moved to
math.gcd a while ago, and deprecated, but not deleted entirely until Python
3.9. So, that's why it works in 3.8 (what my old oe-core build is running),
but not in 3.9 (what my local distribution is running).

Josh

Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941



On Tue, Apr 13, 2021 at 1:08 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Also note: oe-core master already has 3.9, so you need to find out why
> '3.8' shows up in install paths as well. Something doesn't compute here.
>
> Alex
>
> On Tue, 13 Apr 2021 at 22:07, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> I think you need to dig a little deeper. Why 'from fractions import gcd'
>> is a problem with host python3.9 but not a problem with native python 3.9?
>>
>> Alex
>>
>> On Tue, 13 Apr 2021 at 20:58, Josh Lehan via lists.openembedded.org
>> <krellan=google.com@lists.openembedded.org> wrote:
>>
>>> Hi there, thanks. I'm not entirely sure what "python3native" does
>>> exactly, but this is my observation. The problem we are seeing is that,
>>> without "inherit python3native", the build machine's local Python version
>>> (whatever it happens to be) takes precedence over the Yocto-included Python
>>> version. In our case, the build machine is running Python 3.9, and
>>> evidently something changed between Python 3.8 and Python 3.9 to be
>>> incompatible with libxcb. Here's the error message:
>>>
>>> Failed to load the xcbgen Python package!
>>> Make sure that xcb/proto installed it on your Python path.
>>> If not, you will need to create a .pth file or define $PYTHONPATH
>>> to extend the path.
>>> Refer to the README file in xcb/proto for more info.
>>>
>>> Traceback (most recent call last):
>>>   File
>>> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/build/src/../../libxcb-1.14/src/c_client.py",
>>> line 3338, in <module>
>>>     from xcbgen.state import Module
>>>   File
>>> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/state.py",
>>> line 7, in <module>
>>>     from xcbgen import matcher
>>>   File
>>> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/matcher.py",
>>> line 12, in <module>
>>>     from xcbgen.xtypes import *
>>>   File
>>> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/xtypes.py",
>>> line 5, in <module>
>>>     from xcbgen.align import Alignment, AlignmentLog
>>>   File
>>> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/align.py",
>>> line 5, in <module>
>>>     from fractions import gcd
>>> ImportError: cannot import name 'gcd' from 'fractions'
>>> (/usr/lib/python3.9/fractions.py)
>>>
>>> The above error text repeats for many of the files it tries to compile
>>> within libxcb.
>>>
>>> In general, it seems the safest approach is to standardize on a Python
>>> version that's known to work, without depending on whatever version of
>>> Python the developer has installed locally on their build machine (which
>>> can vary due to distribution, developer's preference, and so on).
>>>
>>> Josh
>>>
>>> Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941
>>> <(650)%20733-8941>
>>>
>>>
>>>
>>> On Tue, Apr 13, 2021 at 2:45 AM Richard Purdie <
>>> richard.purdie@linuxfoundation.org> wrote:
>>>
>>>> On Tue, 2021-04-13 at 02:24 -0700, Josh Lehan via
>>>> lists.openembedded.org wrote:
>>>> > During compilation, the local Python environment leaks into
>>>> > the Bitbake build. Adding "inherit python3native" fixes this.
>>>> >
>>>> > Signed-off-by: Josh Lehan <krellan@google.com>
>>>> > ---
>>>> >  meta/recipes-graphics/xorg-lib/libxcb_1.14.bb | 1 +
>>>> >  1 file changed, 1 insertion(+)
>>>> >
>>>> > diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
>>>> b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
>>>> > index f0a223a19c..40c7b1cc3c 100644
>>>> > --- a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
>>>> > +++ b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
>>>> > @@ -24,6 +24,7 @@ PACKAGES_DYNAMIC = "^${PN}-.*"
>>>> >  FILES_${PN} = "${libdir}/libxcb.so.*"
>>>> >
>>>> >  inherit autotools pkgconfig features_check
>>>> > +inherit python3native
>>>> >
>>>>
>>>>
>>>> Could you provide a little more information about how this is breaking
>>>> things?
>>>>
>>>> Whilst python is used by the libxcb build, I believe it shouldn't
>>>> change the
>>>> output, it doesn't in our reproducibity tests.
>>>>
>>>> Adding a python-native dependency does slow the build down a bit so if
>>>> we
>>>> don't need it, it would be good to avoid it.
>>>>
>>>> Cheers,
>>>>
>>>> Richard
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>> 
>>>
>>>

--000000000000f30d3905bfe7d50b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks. It&#39;s true, my local build is a little bit outd=
ated. I&#39;m running OpenBMC and it&#39;s slightly behind the latest upstr=
eam master. For now, it is still compiling with Python 3.8.<div><br></div><=
div>However, there is the same underlying problem, even if I upgraded. It l=
ooks like the version of Python on the build machine is wrongly leaking int=
o the build, and it&#39;s being used instead of the oe-core preferred versi=
on of Python. Ideally, the locally-installed Python wouldn&#39;t influence =
the outcome of the build, as oe-core has its own Python that it should pref=
er to use instead, as it does for other packages. This is what &quot;inheri=
t python3native&quot; enables, right? Otherwise, the problem will happen ag=
ain in the future, whenever somebody wants to try out a new Python version =
on their machine. The idea is to obtain some separation, for safety, and to=
 help ensure a clean reproducible build. It&#39;s a good practice, I think,=
 to minimize the opportunities for local variance to creep into the build.<=
/div><div><br></div><div>As for &quot;from fractions import gcd&quot; becom=
ing an error in 3.9, there was this change:=C2=A0<a href=3D"https://bugs.py=
thon.org/issue39350">https://bugs.python.org/issue39350</a><br></div><div><=
br></div><div>It appears fractions.gcd was deprecated for a while.=C2=A0It =
was moved to math.gcd a while ago, and deprecated, but not deleted entirely=
 until Python 3.9. So, that&#39;s why it works in 3.8 (what my old oe-core =
build is running), but not in 3.9 (what my local distribution is running).<=
/div><div><div><br></div><div>Josh</div><div><br clear=3D"all"><div><div di=
r=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div style=3D"line-height:1.5em;padding-=
top:10px;margin-top:10px;color:rgb(85,85,85);font-family:sans-serif"><span =
style=3D"border-width:2px 0px 0px;border-style:solid;border-color:rgb(213,1=
5,37);padding-top:2px;margin-top:2px">Josh Lehan=C2=A0|</span><span style=
=3D"border-width:2px 0px 0px;border-style:solid;border-color:rgb(51,105,23=
2);padding-top:2px;margin-top:2px">=C2=A0Software Engineer=C2=A0|</span><sp=
an style=3D"border-width:2px 0px 0px;border-style:solid;border-color:rgb(0,=
153,57);padding-top:2px;margin-top:2px">=C2=A0<a href=3D"mailto:krellan@goo=
gle.com" target=3D"_blank">krellan@google.com</a>=C2=A0|</span><span style=
=3D"border-width:2px 0px 0px;border-style:solid;border-color:rgb(238,178,1=
7);padding-top:2px;margin-top:2px">=C2=A0+1 650-733-8941</span></div><br></=
div></div></div></div></div><br></div></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 13, 2021 at 1:08 PM=
 Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanav=
in@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div>Also note: oe-core master already has 3.9=
, so you need to find out why &#39;3.8&#39; shows up in install paths as we=
ll. Something doesn&#39;t compute here.</div><div><br></div><div>Alex<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Tue, 13 Apr 2021 at 22:07, Alexander Kanavin &lt;<a href=3D"mailto:a=
lex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div>I think you need to dig a little deeper. Why &#39;from fractions =
import gcd&#39; is a problem with host python3.9 but not a problem with nat=
ive python 3.9?</div><div><br></div><div>Alex<br></div></div><br><div class=
=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 13 Apr 2021=
 at 20:58, Josh Lehan via <a href=3D"http://lists.openembedded.org" target=
=3D"_blank">lists.openembedded.org</a> &lt;krellan=3D<a href=3D"mailto:goo=
gle.com@lists.openembedded.org" target=3D"_blank">google.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr">Hi there, thanks. I&#39;m not entirely sure what &=
quot;python3native&quot; does exactly, but this is my observation. The prob=
lem we are seeing is that, without &quot;inherit python3native&quot;, the b=
uild machine&#39;s local Python version (whatever it happens to be) takes p=
recedence over the Yocto-included Python version. In our case, the build ma=
chine is running Python 3.9, and evidently something changed between Python=
 3.8 and Python 3.9 to be incompatible with libxcb. Here&#39;s the error me=
ssage:<div><br></div><div>Failed to load the xcbgen Python package!<br>Make=
 sure that xcb/proto installed it on your Python path.<br>If not, you will =
need to create a .pth file or define $PYTHONPATH<br>to extend the path.<br>=
Refer to the README file in xcb/proto for more info.<br><br>Traceback (most=
 recent call last):<br>=C2=A0 File &quot;/OpenBMC/build/tmp/work/x86_64-lin=
ux/libxcb-native/1.14-r0/build/src/../../libxcb-1.14/src/c_client.py&quot;,=
 line 3338, in &lt;module&gt;<br>=C2=A0 =C2=A0 from xcbgen.state import Mod=
ule<br>=C2=A0 File &quot;/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native=
/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8=
/site-packages/xcbgen/state.py&quot;, line 7, in &lt;module&gt;<br>=C2=A0 =
=C2=A0 from xcbgen import matcher<br>=C2=A0 File &quot;/OpenBMC/build/tmp/=
work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgco=
nfig/../../../usr/lib/python3.8/site-packages/xcbgen/matcher.py&quot;, line=
 12, in &lt;module&gt;<br>=C2=A0 =C2=A0 from xcbgen.xtypes import *<br>=C2=
=A0 File &quot;/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/=
recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-pac=
kages/xcbgen/xtypes.py&quot;, line 5, in &lt;module&gt;<br>=C2=A0 =C2=A0 fr=
om xcbgen.align import Alignment, AlignmentLog<br>=C2=A0 File &quot;/OpenBM=
C/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/u=
sr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/align.py&q=
uot;, line 5, in &lt;module&gt;<br>=C2=A0 =C2=A0 from fractions import gcd<=
br>ImportError: cannot import name &#39;gcd&#39; from &#39;fractions&#39; (=
/usr/lib/python3.9/fractions.py)<br></div><div><br></div><div>The above err=
or text repeats for many of the files it tries to compile within libxcb.</d=
iv><div><br></div><div>In general, it seems the safest approach is to stand=
ardize on a Python version that&#39;s known to work, without depending on w=
hatever version of Python the developer has installed locally on their buil=
d machine (which can vary due to distribution, developer&#39;s preference, =
and so on).</div><div><div><br></div><div>Josh</div><div><br clear=3D"all">=
<div><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div style=3D"=
line-height:1.5em;padding-top:10px;margin-top:10px;color:rgb(85,85,85);font=
-family:sans-serif"><span style=3D"border-width:2px 0px 0px;border-style:so=
lid;border-color:rgb(213,15,37);padding-top:2px;margin-top:2px">Josh Lehan=
=C2=A0|</span><span style=3D"border-width:2px 0px 0px;border-style:solid;b=
order-color:rgb(51,105,232);padding-top:2px;margin-top:2px">=C2=A0Software =
Engineer=C2=A0|</span><span style=3D"border-width:2px 0px 0px;border-style:=
solid;border-color:rgb(0,153,57);padding-top:2px;margin-top:2px">=C2=A0<a h=
ref=3D"mailto:krellan@google.com" target=3D"_blank">krellan@google.com</a>=
=C2=A0|</span><span style=3D"border-width:2px 0px 0px;border-style:solid;b=
order-color:rgb(238,178,17);padding-top:2px;margin-top:2px">=C2=A0<a href=
=3D"tel:(650)%20733-8941" value=3D"+16507338941" target=3D"_blank">+1 650-=
733-8941</a></span></div><br></div></div></div></div></div><br></div></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Apr 13, 2021 at 2:45 AM Richard Purdie &lt;<a href=3D"mailto:richar=
d.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundat=
ion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Tue, 2021-04-13 at 02:24 -0700, Josh Lehan via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembe=
dded.org</a> wrote:<br>
&gt; During compilation, the local Python environment leaks into<br>
&gt; the Bitbake build. Adding &quot;inherit python3native&quot; fixes thi=
s.<br>
&gt; <br>
&gt; Signed-off-by: Josh Lehan &lt;<a href=3D"mailto:krellan@google.com" t=
arget=3D"_blank">krellan@google.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-graphics/xorg-lib/<a href=3D"http://libxcb_1.14.bb=
" rel=3D"noreferrer" target=3D"_blank">libxcb_1.14.bb</a> | 1 +<br>
&gt; =C2=A01 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxcb_=
1.14.bb" rel=3D"noreferrer" target=3D"_blank">libxcb_1.14.bb</a> b/meta/rec=
ipes-graphics/xorg-lib/<a href=3D"http://libxcb_1.14.bb" rel=3D"noreferrer"=
 target=3D"_blank">libxcb_1.14.bb</a><br>
&gt; index f0a223a19c..40c7b1cc3c 100644<br>
&gt; --- a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxcb_1.14.bb=
" rel=3D"noreferrer" target=3D"_blank">libxcb_1.14.bb</a><br>
&gt; +++ b/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxcb_1.14.bb=
" rel=3D"noreferrer" target=3D"_blank">libxcb_1.14.bb</a><br>
&gt; @@ -24,6 +24,7 @@ PACKAGES_DYNAMIC =3D &quot;^${PN}-.*&quot;<br>
&gt; =C2=A0FILES_${PN} =3D &quot;${libdir}/libxcb.so.*&quot;<br>
&gt; <br>
&gt; =C2=A0inherit autotools pkgconfig features_check<br>
&gt; +inherit python3native<br>
&gt; =C2=A0<br>
<br>
<br>
Could you provide a little more information about how this is breaking thi=
ngs?<br>
<br>
Whilst python is used by the libxcb build, I believe it shouldn&#39;t chan=
ge the=C2=A0<br>
output, it doesn&#39;t in our reproducibity tests.<br>
<br>
Adding a python-native dependency does slow the build down a bit so if we=
=C2=A0<br>
don&#39;t need it, it would be good to avoid it.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--000000000000f30d3905bfe7d50b--
