Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web08.9544.1618385092241368317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 00:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CgMnuqVu;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id l8so9868537vsj.13
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 00:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vJWtm9uTZ5xDOS6qi5/QMJZVoSvErG6MAzgmUIlTdyE=;
        b=CgMnuqVu2Hh4jGhcQkhrh3hRmaHf+Qo32xfzIZGrZENnlUCtmDfShEgVHsHLF1A9le
         +BSdLe4NKpBt50vcc2FXdVNPAooFkpAAFI4Yk3kl55keS/Hqk29xM7WChKZ5xS7rLERh
         U9inNqOWQxYQ5jp+wWrmkd6q4g7zAzevgGMhVMdFjNPK8M0zt2ycGvKgBDSee+3HQii1
         ud7IdOjFNa3stu4ship6KbaK+s1rO7EnuHu8MItjaWecnEpHdApeQkpkuUbi5sbIazTC
         gwYfEM81i9SI3AbvmHbqvlyK42h3W3l0z3BJ3Ihkl52AfJBTgHOqFOnTlqnoVFM874zb
         2fsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vJWtm9uTZ5xDOS6qi5/QMJZVoSvErG6MAzgmUIlTdyE=;
        b=bjWg1M9LmkQypB5xa/WHEviFDCO7zliATCAhPice2n227CpnuD6xwtRQHuHrN8UqJZ
         jEBswzV2gasBsDqbDStv9E4tDB/FsowCivqupOO/UzJQnNRUfCuFUoi63DfCTnKnNIyc
         kosVjEotrDwZSJW3zFbiJvSt7kuBPmZEu9iXee3x8ZeS9uTJoUuB5DrIIILDEv4qFlH8
         WA57viNuEn6tvTX/C6TxT87zb0NUwzCZgpY7waNqOKL0DFawPhK1NSSK4Yd887C3kM8Y
         Ah95d3eqcmr/FWQARIl1cfS8H+N8+yulFJHpDnqfkKNqtJCdMc52uRCqLdRWSDK7KaOM
         7Zkw==
X-Gm-Message-State: AOAM532Nku0bauJ/QOo6N1A44Go2q6JohqgI3kv8+GkFtKPfhWUXftIp
	pROJALoHmooXWfPM23UU5M+mBi6GORbqvzlgX2I=
X-Google-Smtp-Source: ABdhPJxAQY/rKoVzuaxhQJM5KaqBmmqVtIgZYTaUXCERuXMYXE9Q3oFd0LCGRlAQkytOsfU4OLxsAMIXIXM1E5JmGeE=
X-Received: by 2002:a67:f595:: with SMTP id i21mr13440176vso.41.1618385091301;
 Wed, 14 Apr 2021 00:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210413092432.3688149-1-krellan@google.com> <a15e36dd1ef45bba25c2f7ca78ce17110d767723.camel@linuxfoundation.org>
 <CANPkJS9XmUp1FqKLJDXT8gdJBWPM13k-Rx0vn+bf4B9ijw--Yg@mail.gmail.com>
 <CANNYZj9heipn=vQ0W1ca6ggSij8xU_Wvf4yKzFqAmYh=SSoUEQ@mail.gmail.com>
 <CANNYZj9AjWNbAcXuKShuHe1iKfamM2p80M38Pt2hBVTXV-khMQ@mail.gmail.com> <CANPkJS_KLvz2Ym9wDObKyGzOuajLxdNri_9WSGKo7POys-5OTA@mail.gmail.com>
In-Reply-To: <CANPkJS_KLvz2Ym9wDObKyGzOuajLxdNri_9WSGKo7POys-5OTA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 14 Apr 2021 09:24:40 +0200
Message-ID: <CANNYZj-cq4QDHTJwGi3NozsuNMa5UQwHWs-FnE9FczYPTPQO8Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxcb: Add inherit python3native
To: Josh Lehan <krellan@google.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, Ross Burton <ross@burtonini.com>
Content-Type: multipart/alternative; boundary="0000000000007a16ad05bfe9a478"

--0000000000007a16ad05bfe9a478
Content-Type: text/plain; charset="UTF-8"

As a matter of policy, yocto recipes default to using python from the host,
and are only switched to native python when there host python does not come
with needed 3rd party modules (which are then pulled in via -native
DEPENDS), or there is some other issue that cannot be resolved with host
python. Native python dependency lengthens the dependency chains, which is
especially critical for -native recipes.

In this case, the problem is that libxcb in your build is too old for the
latest python 3.9, so you need to either update libxcb or backport an
upstream fix to make it work with 3.9 again. Your patch would not resolve
the issue, as native python in latest oe-core  master is also 3.9, and the
failure would be the same.

Alex

On Wed, 14 Apr 2021 at 07:15, Josh Lehan <krellan@google.com> wrote:

> Thanks. It's true, my local build is a little bit outdated. I'm running
> OpenBMC and it's slightly behind the latest upstream master. For now, it is
> still compiling with Python 3.8.
>
> However, there is the same underlying problem, even if I upgraded. It
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
>
> As for "from fractions import gcd" becoming an error in 3.9, there was
> this change: https://bugs.python.org/issue39350
>
> It appears fractions.gcd was deprecated for a while. It was moved to
> math.gcd a while ago, and deprecated, but not deleted entirely until Python
> 3.9. So, that's why it works in 3.8 (what my old oe-core build is running),
> but not in 3.9 (what my local distribution is running).
>
> Josh
>
> Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941
>
>
>
> On Tue, Apr 13, 2021 at 1:08 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> Also note: oe-core master already has 3.9, so you need to find out why
>> '3.8' shows up in install paths as well. Something doesn't compute here.
>>
>> Alex
>>
>> On Tue, 13 Apr 2021 at 22:07, Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> I think you need to dig a little deeper. Why 'from fractions import gcd'
>>> is a problem with host python3.9 but not a problem with native python 3.9?
>>>
>>> Alex
>>>
>>> On Tue, 13 Apr 2021 at 20:58, Josh Lehan via lists.openembedded.org
>>> <krellan=google.com@lists.openembedded.org> wrote:
>>>
>>>> Hi there, thanks. I'm not entirely sure what "python3native" does
>>>> exactly, but this is my observation. The problem we are seeing is that,
>>>> without "inherit python3native", the build machine's local Python version
>>>> (whatever it happens to be) takes precedence over the Yocto-included Python
>>>> version. In our case, the build machine is running Python 3.9, and
>>>> evidently something changed between Python 3.8 and Python 3.9 to be
>>>> incompatible with libxcb. Here's the error message:
>>>>
>>>> Failed to load the xcbgen Python package!
>>>> Make sure that xcb/proto installed it on your Python path.
>>>> If not, you will need to create a .pth file or define $PYTHONPATH
>>>> to extend the path.
>>>> Refer to the README file in xcb/proto for more info.
>>>>
>>>> Traceback (most recent call last):
>>>>   File
>>>> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/build/src/../../libxcb-1.14/src/c_client.py",
>>>> line 3338, in <module>
>>>>     from xcbgen.state import Module
>>>>   File
>>>> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/state.py",
>>>> line 7, in <module>
>>>>     from xcbgen import matcher
>>>>   File
>>>> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/matcher.py",
>>>> line 12, in <module>
>>>>     from xcbgen.xtypes import *
>>>>   File
>>>> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/xtypes.py",
>>>> line 5, in <module>
>>>>     from xcbgen.align import Alignment, AlignmentLog
>>>>   File
>>>> "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbgen/align.py",
>>>> line 5, in <module>
>>>>     from fractions import gcd
>>>> ImportError: cannot import name 'gcd' from 'fractions'
>>>> (/usr/lib/python3.9/fractions.py)
>>>>
>>>> The above error text repeats for many of the files it tries to compile
>>>> within libxcb.
>>>>
>>>> In general, it seems the safest approach is to standardize on a Python
>>>> version that's known to work, without depending on whatever version of
>>>> Python the developer has installed locally on their build machine (which
>>>> can vary due to distribution, developer's preference, and so on).
>>>>
>>>> Josh
>>>>
>>>> Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941
>>>> <(650)%20733-8941>
>>>>
>>>>
>>>>
>>>> On Tue, Apr 13, 2021 at 2:45 AM Richard Purdie <
>>>> richard.purdie@linuxfoundation.org> wrote:
>>>>
>>>>> On Tue, 2021-04-13 at 02:24 -0700, Josh Lehan via
>>>>> lists.openembedded.org wrote:
>>>>> > During compilation, the local Python environment leaks into
>>>>> > the Bitbake build. Adding "inherit python3native" fixes this.
>>>>> >
>>>>> > Signed-off-by: Josh Lehan <krellan@google.com>
>>>>> > ---
>>>>> >  meta/recipes-graphics/xorg-lib/libxcb_1.14.bb | 1 +
>>>>> >  1 file changed, 1 insertion(+)
>>>>> >
>>>>> > diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
>>>>> b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
>>>>> > index f0a223a19c..40c7b1cc3c 100644
>>>>> > --- a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
>>>>> > +++ b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
>>>>> > @@ -24,6 +24,7 @@ PACKAGES_DYNAMIC = "^${PN}-.*"
>>>>> >  FILES_${PN} = "${libdir}/libxcb.so.*"
>>>>> >
>>>>> >  inherit autotools pkgconfig features_check
>>>>> > +inherit python3native
>>>>> >
>>>>>
>>>>>
>>>>> Could you provide a little more information about how this is breaking
>>>>> things?
>>>>>
>>>>> Whilst python is used by the libxcb build, I believe it shouldn't
>>>>> change the
>>>>> output, it doesn't in our reproducibity tests.
>>>>>
>>>>> Adding a python-native dependency does slow the build down a bit so if
>>>>> we
>>>>> don't need it, it would be good to avoid it.
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Richard
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>
>>>> 
>>>>
>>>>

--0000000000007a16ad05bfe9a478
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>As a matter of policy, yocto recipes default to using=
 python from the host, and are only switched to native python when there ho=
st python does not come with needed 3rd party modules (which are then pulle=
d in via -native DEPENDS), or there is some other issue that cannot be reso=
lved with host python. Native python dependency lengthens the dependency ch=
ains, which is especially critical for -native recipes.<br></div><div><br><=
/div><div>In this case, the problem is that libxcb in your build is too old=
 for the latest python 3.9, so you need to either update libxcb or backport=
 an upstream fix to make it work with 3.9 again. Your patch would not resol=
ve the issue, as native python in latest oe-core=C2=A0 master is also 3.9, =
and the failure would be the same.</div><div><br></div><div>Alex<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Wed, 14 Apr 2021 at 07:15, Josh Lehan &lt;<a href=3D"mailto:krellan@googl=
e.com">krellan@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><div dir=3D"ltr">Thanks. It&#39;s true, my local b=
uild is a little bit outdated. I&#39;m running OpenBMC and it&#39;s slightl=
y behind the latest upstream master. For now, it is still compiling with Py=
thon 3.8.<div><br></div><div>However, there is the same underlying problem,=
 even if I upgraded. It looks like the version of Python on the build machi=
ne is wrongly leaking into the build, and it&#39;s being used instead of th=
e oe-core preferred version of Python. Ideally, the locally-installed Pytho=
n wouldn&#39;t influence the outcome of the build, as oe-core has its own P=
ython that it should prefer to use instead, as it does for other packages. =
This is what &quot;inherit python3native&quot; enables, right? Otherwise, t=
he problem will happen again in the future, whenever somebody wants to try =
out a new Python version on their machine. The idea is to obtain some separ=
ation, for safety, and to help ensure a clean reproducible build. It&#39;s =
a good practice, I think, to minimize the opportunities for local variance =
to creep into the build.</div><div><br></div><div>As for &quot;from fractio=
ns import gcd&quot; becoming an error in 3.9, there was this change:=C2=A0<=
a href=3D"https://bugs.python.org/issue39350" target=3D"_blank">https://bug=
s.python.org/issue39350</a><br></div><div><br></div><div>It appears fractio=
ns.gcd was deprecated for a while.=C2=A0It was moved to math.gcd a while ag=
o, and deprecated, but not deleted entirely until Python 3.9. So, that&#39;=
s why it works in 3.8 (what my old oe-core build is running), but not in 3.=
9 (what my local distribution is running).</div><div><div><br></div><div>Jo=
sh</div><div><br clear=3D"all"><div><div dir=3D"ltr"><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div style=3D"line-height:1.5em;padding-top:10px;margin-to=
p:10px;color:rgb(85,85,85);font-family:sans-serif"><span style=3D"border-wi=
dth:2px 0px 0px;border-style:solid;border-color:rgb(213,15,37);padding-top:=
2px;margin-top:2px">Josh Lehan=C2=A0|</span><span style=3D"border-width:2px=
 0px 0px;border-style:solid;border-color:rgb(51,105,232);padding-top:2px;ma=
rgin-top:2px">=C2=A0Software Engineer=C2=A0|</span><span style=3D"border-wi=
dth:2px 0px 0px;border-style:solid;border-color:rgb(0,153,57);padding-top:2=
px;margin-top:2px">=C2=A0<a href=3D"mailto:krellan@google.com" target=3D"_b=
lank">krellan@google.com</a>=C2=A0|</span><span style=3D"border-width:2px 0=
px 0px;border-style:solid;border-color:rgb(238,178,17);padding-top:2px;marg=
in-top:2px">=C2=A0+1 650-733-8941</span></div><br></div></div></div></div><=
/div><br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Apr 13, 2021 at 1:08 PM Alexander Kanavin &lt;=
<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div>Also note: oe-core master already has 3.9, so =
you need to find out why &#39;3.8&#39; shows up in install paths as well. S=
omething doesn&#39;t compute here.</div><div><br></div><div>Alex<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Tue, 13 Apr 2021 at 22:07, Alexander Kanavin &lt;<a href=3D"mailto:alex.k=
anavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div>I think you need to dig a little deeper. Why &#39;from fractions impor=
t gcd&#39; is a problem with host python3.9 but not a problem with native p=
ython 3.9?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 13 Apr 2021 at 20=
:58, Josh Lehan via <a href=3D"http://lists.openembedded.org" target=3D"_bl=
ank">lists.openembedded.org</a> &lt;krellan=3D<a href=3D"mailto:google.com@=
lists.openembedded.org" target=3D"_blank">google.com@lists.openembedded.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr">Hi there, thanks. I&#39;m not entirely sure what &quot;pyt=
hon3native&quot; does exactly, but this is my observation. The problem we a=
re seeing is that, without &quot;inherit python3native&quot;, the build mac=
hine&#39;s local Python version (whatever it happens to be) takes precedenc=
e over the Yocto-included Python version. In our case, the build machine is=
 running Python 3.9, and evidently something changed between Python 3.8 and=
 Python 3.9 to be incompatible with libxcb. Here&#39;s the error message:<d=
iv><br></div><div>Failed to load the xcbgen Python package!<br>Make sure th=
at xcb/proto installed it on your Python path.<br>If not, you will need to =
create a .pth file or define $PYTHONPATH<br>to extend the path.<br>Refer to=
 the README file in xcb/proto for more info.<br><br>Traceback (most recent =
call last):<br>=C2=A0 File &quot;/OpenBMC/build/tmp/work/x86_64-linux/libxc=
b-native/1.14-r0/build/src/../../libxcb-1.14/src/c_client.py&quot;, line 33=
38, in &lt;module&gt;<br>=C2=A0 =C2=A0 from xcbgen.state import Module<br>=
=C2=A0 File &quot;/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-=
r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-=
packages/xcbgen/state.py&quot;, line 7, in &lt;module&gt;<br>=C2=A0 =C2=A0 =
from xcbgen import matcher<br>=C2=A0 File &quot;/OpenBMC/build/tmp/work/x86=
_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkgconfig/../=
../../usr/lib/python3.8/site-packages/xcbgen/matcher.py&quot;, line 12, in =
&lt;module&gt;<br>=C2=A0 =C2=A0 from xcbgen.xtypes import *<br>=C2=A0 File =
&quot;/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sys=
root-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-packages/xcbg=
en/xtypes.py&quot;, line 5, in &lt;module&gt;<br>=C2=A0 =C2=A0 from xcbgen.=
align import Alignment, AlignmentLog<br>=C2=A0 File &quot;/OpenBMC/build/tm=
p/work/x86_64-linux/libxcb-native/1.14-r0/recipe-sysroot-native/usr/lib/pkg=
config/../../../usr/lib/python3.8/site-packages/xcbgen/align.py&quot;, line=
 5, in &lt;module&gt;<br>=C2=A0 =C2=A0 from fractions import gcd<br>ImportE=
rror: cannot import name &#39;gcd&#39; from &#39;fractions&#39; (/usr/lib/p=
ython3.9/fractions.py)<br></div><div><br></div><div>The above error text re=
peats for many of the files it tries to compile within libxcb.</div><div><b=
r></div><div>In general, it seems the safest approach is to standardize on =
a Python version that&#39;s known to work, without depending on whatever ve=
rsion of Python the developer has installed locally on their build machine =
(which can vary due to distribution, developer&#39;s preference, and so on)=
.</div><div><div><br></div><div>Josh</div><div><br clear=3D"all"><div><div =
dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div style=3D"line-heigh=
t:1.5em;padding-top:10px;margin-top:10px;color:rgb(85,85,85);font-family:sa=
ns-serif"><span style=3D"border-width:2px 0px 0px;border-style:solid;border=
-color:rgb(213,15,37);padding-top:2px;margin-top:2px">Josh Lehan=C2=A0|</sp=
an><span style=3D"border-width:2px 0px 0px;border-style:solid;border-color:=
rgb(51,105,232);padding-top:2px;margin-top:2px">=C2=A0Software Engineer=C2=
=A0|</span><span style=3D"border-width:2px 0px 0px;border-style:solid;bord=
er-color:rgb(0,153,57);padding-top:2px;margin-top:2px">=C2=A0<a href=3D"mai=
lto:krellan@google.com" target=3D"_blank">krellan@google.com</a>=C2=A0|</sp=
an><span style=3D"border-width:2px 0px 0px;border-style:solid;border-color:=
rgb(238,178,17);padding-top:2px;margin-top:2px">=C2=A0<a href=3D"tel:(650)%=
20733-8941" value=3D"+16507338941" target=3D"_blank">+1 650-733-8941</a></s=
pan></div><br></div></div></div></div></div><br></div></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 13,=
 2021 at 2:45 AM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, =
2021-04-13 at 02:24 -0700, Josh Lehan via <a href=3D"http://lists.openembed=
ded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wr=
ote:<br>
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
</blockquote></div>

--0000000000007a16ad05bfe9a478--
