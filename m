Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web11.2732.1618344442310297607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Apr 2021 13:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BDzcJ0PT;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id d25so2552478vsp.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Apr 2021 13:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mle1QQwFVxdPW0GRby7IvT7VCMULqcHl20Qrl4LscDQ=;
        b=BDzcJ0PTeqJscixks8cROhBnBgWF5zll7M26h3abpqLSziLwbf3UgW56MgsaXAHqZS
         82VzI8gx8atXPnCqcm88JK8Sn5Gu59WXiFRI51uhmF2mgso7sVWX1wBxseZGfbt96xf2
         +GDSJcS6L0C6fRUa/bfY6BD37rdXNKqpBcRhe4hfo2l5yd+fHHa4niOiABJR4g7b0JXB
         Ov7fN8uLFrDCvynD0HiplY/9vJaQySpiEKgbC/FMOuvG8yYNpOFTTfUaKSqrOxQ3sa0d
         ftAvYWIOBYMGIsWjCUL01LsKZk3ZL5F2HZ48riGFaErVvstjl6fnk6yhsYDINRjS7HWb
         RLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mle1QQwFVxdPW0GRby7IvT7VCMULqcHl20Qrl4LscDQ=;
        b=UiL87znaJI+sKx78QmOJVif5ge3H+L1stCzJMo6cIqgTWbvJCFinu3wu99SE7xGHxh
         Gug1WWYC2kieZCCuoq7/AY8Fq7pXaZpRsuudgox0+7yORTHU4PbciBsyU1B5YdhtKs5D
         plxVM56uCg8eR+0u2krwDLLJbXmMR7u3pRdaN1HXM2zX4JDOZMdzWH7rZ3/EMpVt9SC0
         48FkeN7Jkq8hCqhwnoJV78b8evtFudqzTsxH9qw2Ojn4vJEA3kK0yr7GVccM6bV/n59F
         Z3nyOcmxgHgyk71Qkq0aQMORv9Zh1urztkP1yUxiGPYRDqyvz4dYvoSnYm4H/oiDZ+yC
         Jzvw==
X-Gm-Message-State: AOAM5332um8x6aHw4PIBGTFrrJxtvCrmU+EuPRd6gJjkDnk5Xtq4l5zi
	oHv6gVYFki8KNJBA9PbJzm6U0mErXhRyMaIKnXg=
X-Google-Smtp-Source: ABdhPJwl9Q4zHMCzVM3QT4OCiEb8Dnh0K5PqLi0lIe9grkgSW5KRaCBp2muXzBuqTggu63DiQgG4RYty6+F5+J7QNEM=
X-Received: by 2002:a67:f813:: with SMTP id l19mr3365176vso.51.1618344441417;
 Tue, 13 Apr 2021 13:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210413092432.3688149-1-krellan@google.com> <a15e36dd1ef45bba25c2f7ca78ce17110d767723.camel@linuxfoundation.org>
 <CANPkJS9XmUp1FqKLJDXT8gdJBWPM13k-Rx0vn+bf4B9ijw--Yg@mail.gmail.com>
In-Reply-To: <CANPkJS9XmUp1FqKLJDXT8gdJBWPM13k-Rx0vn+bf4B9ijw--Yg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 13 Apr 2021 22:07:09 +0200
Message-ID: <CANNYZj9heipn=vQ0W1ca6ggSij8xU_Wvf4yKzFqAmYh=SSoUEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxcb: Add inherit python3native
To: Josh Lehan <krellan@google.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, Ross Burton <ross@burtonini.com>
Content-Type: multipart/alternative; boundary="0000000000008e12b105bfe02d67"

--0000000000008e12b105bfe02d67
Content-Type: text/plain; charset="UTF-8"

I think you need to dig a little deeper. Why 'from fractions import gcd' is
a problem with host python3.9 but not a problem with native python 3.9?

Alex

On Tue, 13 Apr 2021 at 20:58, Josh Lehan via lists.openembedded.org
<krellan=google.com@lists.openembedded.org> wrote:

> Hi there, thanks. I'm not entirely sure what "python3native" does exactly,
> but this is my observation. The problem we are seeing is that, without
> "inherit python3native", the build machine's local Python version (whatever
> it happens to be) takes precedence over the Yocto-included Python version.
> In our case, the build machine is running Python 3.9, and evidently
> something changed between Python 3.8 and Python 3.9 to be incompatible with
> libxcb. Here's the error message:
>
> Failed to load the xcbgen Python package!
> Make sure that xcb/proto installed it on your Python path.
> If not, you will need to create a .pth file or define $PYTHONPATH
> to extend the path.
> Refer to the README file in xcb/proto for more info.
>
> Traceback (most recent call last):
>   File
> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/build/src/../../libxcb-1.14/src/c_client.py",
> line 3338, in <module>
>     from xcbgen.state import Module
>   File
> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/state.py",
> line 7, in <module>
>     from xcbgen import matcher
>   File
> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/matcher.py",
> line 12, in <module>
>     from xcbgen.xtypes import *
>   File
> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/xtypes.py",
> line 5, in <module>
>     from xcbgen.align import Alignment, AlignmentLog
>   File
> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/align.py",
> line 5, in <module>
>     from fractions import gcd
> ImportError: cannot import name 'gcd' from 'fractions'
> (/usr/lib/python3.9/fractions.py)
>
> The above error text repeats for many of the files it tries to compile
> within libxcb.
>
> In general, it seems the safest approach is to standardize on a Python
> version that's known to work, without depending on whatever version of
> Python the developer has installed locally on their build machine (which
> can vary due to distribution, developer's preference, and so on).
>
> Josh
>
> Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941
> <(650)%20733-8941>
>
>
>
> On Tue, Apr 13, 2021 at 2:45 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Tue, 2021-04-13 at 02:24 -0700, Josh Lehan via lists.openembedded.org
>> wrote:
>> > During compilation, the local Python environment leaks into
>> > the Bitbake build. Adding "inherit python3native" fixes this.
>> >
>> > Signed-off-by: Josh Lehan <krellan@google.com>
>> > ---
>> >  meta/recipes-graphics/xorg-lib/libxcb_1.14.bb | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
>> b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
>> > index f0a223a19c..40c7b1cc3c 100644
>> > --- a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
>> > +++ b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
>> > @@ -24,6 +24,7 @@ PACKAGES_DYNAMIC = "^${PN}-.*"
>> >  FILES_${PN} = "${libdir}/libxcb.so.*"
>> >
>> >  inherit autotools pkgconfig features_check
>> > +inherit python3native
>> >
>>
>>
>> Could you provide a little more information about how this is breaking
>> things?
>>
>> Whilst python is used by the libxcb build, I believe it shouldn't change
>> the
>> output, it doesn't in our reproducibity tests.
>>
>> Adding a python-native dependency does slow the build down a bit so if we
>> don't need it, it would be good to avoid it.
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>>
>>
> 
>
>

--0000000000008e12b105bfe02d67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think you need to dig a little deeper. Why &#39;fro=
m fractions import gcd&#39; is a problem with host python3.9 but not a prob=
lem with native python 3.9?</div><div><br></div><div>Alex<br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, =
13 Apr 2021 at 20:58, Josh Lehan via <a href=3D"http://lists.openembedded.o=
rg">lists.openembedded.org</a> &lt;krellan=3D<a href=3D"mailto:google.com@l=
ists.openembedded.org">google.com@lists.openembedded.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi=
 there, thanks. I&#39;m not entirely sure what &quot;python3native&quot; do=
es exactly, but this is my observation. The problem we are seeing is that, =
without &quot;inherit python3native&quot;, the build machine&#39;s local Py=
thon version (whatever it happens to be) takes precedence over the Yocto-in=
cluded Python version. In our case, the build machine is running Python 3.9=
, and evidently something changed between Python 3.8 and Python 3.9 to be i=
ncompatible with libxcb. Here&#39;s the error message:<div><br></div><div>F=
ailed to load the xcbgen Python package!<br>Make sure that xcb/proto instal=
led it on your Python path.<br>If not, you will need to create a .pth file =
or define $PYTHONPATH<br>to extend the path.<br>Refer to the README file in=
 xcb/proto for more info.<br><br>Traceback (most recent call last):<br>=C2=
=A0 File &quot;/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/=
build/src/../../libxcb-1.14/src/c_client.py&quot;, line 3338, in &lt;module=
&gt;<br>=C2=A0 =C2=A0 from xcbgen.state import Module<br>=C2=A0 File &quot;=
/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-n=
ative/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/sta=
te.py&quot;, line 7, in &lt;module&gt;<br>=C2=A0 =C2=A0 from xcbgen import =
matcher<br>=C2=A0 File &quot;/OpenBMC/build/tmp/work/x86_64-linux/libxcb-na=
tive/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/pytho=
n3.8/site-packages/xcbgen/matcher.py&quot;, line 12, in &lt;module&gt;<br>=
=C2=A0 =C2=A0 from xcbgen.xtypes import *<br>=C2=A0 File &quot;/OpenBMC/bu=
ild/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/l=
ib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/xtypes.py&quot=
;, line 5, in &lt;module&gt;<br>=C2=A0 =C2=A0 from xcbgen.align import Alig=
nment, AlignmentLog<br>=C2=A0 File &quot;/OpenBMC/build/tmp/work/x86_64-lin=
ux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../u=
sr/lib/python3.8/site-packages/xcbgen/align.py&quot;, line 5, in &lt;module=
&gt;<br>=C2=A0 =C2=A0 from fractions import gcd<br>ImportError: cannot impo=
rt name &#39;gcd&#39; from &#39;fractions&#39; (/usr/lib/python3.9/fraction=
s.py)<br></div><div><br></div><div>The above error text repeats for many of=
 the files it tries to compile within libxcb.</div><div><br></div><div>In g=
eneral, it seems the safest approach is to standardize on a Python version =
that&#39;s known to work, without depending on whatever version of Python t=
he developer has installed locally on their build machine (which can vary d=
ue to distribution, developer&#39;s preference, and so on).</div><div><div>=
<br></div><div>Josh</div><div><br clear=3D"all"><div><div dir=3D"ltr"><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div style=3D"line-height:1.5em;padding-t=
op:10px;margin-top:10px;color:rgb(85,85,85);font-family:sans-serif"><span s=
tyle=3D"border-width:2px 0px 0px;border-style:solid;border-color:rgb(213,15=
,37);padding-top:2px;margin-top:2px">Josh Lehan=C2=A0|</span><span style=3D=
"border-width:2px 0px 0px;border-style:solid;border-color:rgb(51,105,232);p=
adding-top:2px;margin-top:2px">=C2=A0Software Engineer=C2=A0|</span><span s=
tyle=3D"border-width:2px 0px 0px;border-style:solid;border-color:rgb(0,153,=
57);padding-top:2px;margin-top:2px">=C2=A0<a href=3D"mailto:krellan@google.=
com" target=3D"_blank">krellan@google.com</a>=C2=A0|</span><span style=3D"b=
order-width:2px 0px 0px;border-style:solid;border-color:rgb(238,178,17);pad=
ding-top:2px;margin-top:2px">=C2=A0<a href=3D"tel:(650)%20733-8941" value=
=3D"+16507338941" target=3D"_blank">+1 650-733-8941</a></span></div><br></=
div></div></div></div></div><br></div></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 13, 2021 at 2:45 AM=
 Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" t=
arget=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2021-04-13 at 02=
:24 -0700, Josh Lehan via <a href=3D"http://lists.openembedded.org" rel=3D"=
noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
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

--0000000000008e12b105bfe02d67--
