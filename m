Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web09.10655.1618394119926225430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 02:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=VxYRntGi;
 spf=pass (domain: google.com, ip: 209.85.167.51, mailfrom: wak@google.com)
Received: by mail-lf1-f51.google.com with SMTP id j18so32240698lfg.5
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 02:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CJ6nhcLu8LFaJk2+T6HfeHxsnTticUNQ2rh1eCDMPuY=;
        b=VxYRntGisANd06KqdrYRctr8fq9WO+C7fgIe5o+IY0rit3OEyW3t8K9JzXuFObFBpf
         OgtuQxSxxcxHsLteMqFotjzxjca2mNqFceZHHXbaa1zxLFS9chQKpQq4bobPK4UeYDxX
         St/Oo9JWg6y8pb4WqhlxruigyjcztWQToyswm/MTtsGAujJ/EgiC/sHIh42rpIQTI83Y
         hlnZ8589Wx7RouBK5B4Eu0kpjRcqtaJDHT4UZqVImuUjxYajyS+ZXv0YyIJgGgiUJQfC
         5c5o5uLFIrFJsXyoNBFsUkqt0frHhmhpTNcsE5XQd5MD+hMmIMSfQiPE8zeHkpbSz/ri
         LZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CJ6nhcLu8LFaJk2+T6HfeHxsnTticUNQ2rh1eCDMPuY=;
        b=HAplipJvOoAiWjb9/xtu3GuWrd+MsorcBBDXVDlRKJSxyFdeB0mHesoVyF+iF1CYt3
         VCM82evgGXJbvEIN+gs5RZ7vLtu+IIuQVG+MdgClgb/1mP3aD6S0iUkRGkghgpuW36oQ
         mUUcZer2VXtVT+EveP3FiQ38pFBvgymtLCEW2IuqWNkBG3Vxa5mEAdxbZ6i0DZLn6CSV
         8D4XiC4mXqAdFnAm1fbstxcPfSSr+5bXEu8pgYiXxhdEymlbIHhRfF7gTGLlDJcFgoSh
         VN1hGqiFzi+LeDOyt1Hm/Ut5mZNucsY5XQ/ABQImToRpsbZHixR83hVdL0wAaRUDtIC4
         YaGg==
X-Gm-Message-State: AOAM533kAzRn62+8QeWVwNNSMQLf0WBCwruUJEfBcdg9i6Xz8My4klE1
	XUU5YMjmkFBVsWWXaWeZAdKieqWzw+Vi9b+9l/lGQA==
X-Google-Smtp-Source: ABdhPJz/pt1w/6Xtr33SfIKjlXeRYj9ZEdx1IRFe05AG7EcA0VR1ZPuyGqJfQ3XH9PluB+lZ553iglIG5meJj/1yJGA=
X-Received: by 2002:ac2:53b9:: with SMTP id j25mr1391493lfh.18.1618394117497;
 Wed, 14 Apr 2021 02:55:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210413092432.3688149-1-krellan@google.com> <a15e36dd1ef45bba25c2f7ca78ce17110d767723.camel@linuxfoundation.org>
 <CANPkJS9XmUp1FqKLJDXT8gdJBWPM13k-Rx0vn+bf4B9ijw--Yg@mail.gmail.com>
 <CANNYZj9heipn=vQ0W1ca6ggSij8xU_Wvf4yKzFqAmYh=SSoUEQ@mail.gmail.com>
 <CANNYZj9AjWNbAcXuKShuHe1iKfamM2p80M38Pt2hBVTXV-khMQ@mail.gmail.com>
 <CANPkJS_KLvz2Ym9wDObKyGzOuajLxdNri_9WSGKo7POys-5OTA@mail.gmail.com> <CANNYZj-cq4QDHTJwGi3NozsuNMa5UQwHWs-FnE9FczYPTPQO8Q@mail.gmail.com>
In-Reply-To: <CANNYZj-cq4QDHTJwGi3NozsuNMa5UQwHWs-FnE9FczYPTPQO8Q@mail.gmail.com>
From: "William A. Kennington III" <wak@google.com>
Date: Wed, 14 Apr 2021 02:55:06 -0700
Message-ID: <CAPnigKkpgAqXG02an=hJhZnywpUQ8AdSXrNUEzb1gYrj4OAgcA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxcb: Add inherit python3native
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Josh Lehan <krellan@google.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, Ross Burton <ross@burtonini.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's correct because the package it depends on (xcb-proto-native) is
already `inherit python3native`. This package's xcbgen invocation is
broken because it is using a combination of files generated for native
python but executed through host python (look at the site-packages
version). It can't bloat our dependency tree any more as it already
implicitly depends on python3-native.

On Wed, Apr 14, 2021 at 12:25 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> As a matter of policy, yocto recipes default to using python from the ho=
st, and are only switched to native python when there host python does not =
come with needed 3rd party modules (which are then pulled in via -native DE=
PENDS), or there is some other issue that cannot be resolved with host pyth=
on. Native python dependency lengthens the dependency chains, which is espe=
cially critical for -native recipes.
>
> In this case, the problem is that libxcb in your build is too old for th=
e latest python 3.9, so you need to either update libxcb or backport an ups=
tream fix to make it work with 3.9 again. Your patch would not resolve the =
issue, as native python in latest oe-core  master is also 3.9, and the fail=
ure would be the same.
>
> Alex
>
> On Wed, 14 Apr 2021 at 07:15, Josh Lehan <krellan@google.com> wrote:
>>
>> Thanks. It's true, my local build is a little bit outdated. I'm running=
 OpenBMC and it's slightly behind the latest upstream master. For now, it i=
s still compiling with Python 3.8.
>>
>> However, there is the same underlying problem, even if I upgraded. It l=
ooks like the version of Python on the build machine is wrongly leaking int=
o the build, and it's being used instead of the oe-core preferred version o=
f Python. Ideally, the locally-installed Python wouldn't influence the outc=
ome of the build, as oe-core has its own Python that it should prefer to us=
e instead, as it does for other packages. This is what "inherit python3nati=
ve" enables, right? Otherwise, the problem will happen again in the future,=
 whenever somebody wants to try out a new Python version on their machine. =
The idea is to obtain some separation, for safety, and to help ensure a cle=
an reproducible build. It's a good practice, I think, to minimize the oppor=
tunities for local variance to creep into the build.
>>
>> As for "from fractions import gcd" becoming an error in 3.9, there was =
this change: https://bugs.python.org/issue39350
>>
>> It appears fractions.gcd was deprecated for a while. It was moved to ma=
th.gcd a while ago, and deprecated, but not deleted entirely until Python 3=
.9. So, that's why it works in 3.8 (what my old oe-core build is running), =
but not in 3.9 (what my local distribution is running).
>>
>> Josh
>>
>> Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941
>>
>>
>>
>> On Tue, Apr 13, 2021 at 1:08 PM Alexander Kanavin <alex.kanavin@gmail.c=
om> wrote:
>>>
>>> Also note: oe-core master already has 3.9, so you need to find out why=
 '3.8' shows up in install paths as well. Something doesn't compute here.
>>>
>>> Alex
>>>
>>> On Tue, 13 Apr 2021 at 22:07, Alexander Kanavin <alex.kanavin@gmail.co=
m> wrote:
>>>>
>>>> I think you need to dig a little deeper. Why 'from fractions import g=
cd' is a problem with host python3.9 but not a problem with native python 3=
.9?
>>>>
>>>> Alex
>>>>
>>>> On Tue, 13 Apr 2021 at 20:58, Josh Lehan via lists.openembedded.org <=
krellan=3Dgoogle.com@lists.openembedded.org> wrote:
>>>>>
>>>>> Hi there, thanks. I'm not entirely sure what "python3native" does ex=
actly, but this is my observation. The problem we are seeing is that, witho=
ut "inherit python3native", the build machine's local Python version (whate=
ver it happens to be) takes precedence over the Yocto-included Python versi=
on. In our case, the build machine is running Python 3.9, and evidently som=
ething changed between Python 3.8 and Python 3.9 to be incompatible with li=
bxcb. Here's the error message:
>>>>>
>>>>> Failed to load the xcbgen Python package!
>>>>> Make sure that xcb/proto installed it on your Python path.
>>>>> If not, you will need to create a .pth file or define $PYTHONPATH
>>>>> to extend the path.
>>>>> Refer to the README file in xcb/proto for more info.
>>>>>
>>>>> Traceback (most recent call last):
>>>>>   File "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/b=
uild/src/../../libxcb-1.14/src/c_client.py", line 3338, in <module>
>>>>>     from xcbgen.state import Module
>>>>>   File "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/r=
ecipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-pack=
ages/xcbgen/state.py", line 7, in <module>
>>>>>     from xcbgen import matcher
>>>>>   File "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/r=
ecipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-pack=
ages/xcbgen/matcher.py", line 12, in <module>
>>>>>     from xcbgen.xtypes import *
>>>>>   File "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/r=
ecipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-pack=
ages/xcbgen/xtypes.py", line 5, in <module>
>>>>>     from xcbgen.align import Alignment, AlignmentLog
>>>>>   File "/OpenBMC/build/tmp/work/x86_64-linux/libxcb-native/1.14-r0/r=
ecipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib/python3.8/site-pack=
ages/xcbgen/align.py", line 5, in <module>
>>>>>     from fractions import gcd
>>>>> ImportError: cannot import name 'gcd' from 'fractions' (/usr/lib/pyt=
hon3.9/fractions.py)
>>>>>
>>>>> The above error text repeats for many of the files it tries to compi=
le within libxcb.
>>>>>
>>>>> In general, it seems the safest approach is to standardize on a Pyth=
on version that's known to work, without depending on whatever version of P=
ython the developer has installed locally on their build machine (which can=
 vary due to distribution, developer's preference, and so on).
>>>>>
>>>>> Josh
>>>>>
>>>>> Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-894=
1
>>>>>
>>>>>
>>>>>
>>>>> On Tue, Apr 13, 2021 at 2:45 AM Richard Purdie <richard.purdie@linux=
foundation.org> wrote:
>>>>>>
>>>>>> On Tue, 2021-04-13 at 02:24 -0700, Josh Lehan via lists.openembedde=
d.org wrote:
>>>>>> > During compilation, the local Python environment leaks into
>>>>>> > the Bitbake build. Adding "inherit python3native" fixes this.
>>>>>> >
>>>>>> > Signed-off-by: Josh Lehan <krellan@google.com>
>>>>>> > ---
>>>>>> >  meta/recipes-graphics/xorg-lib/libxcb_1.14.bb | 1 +
>>>>>> >  1 file changed, 1 insertion(+)
>>>>>> >
>>>>>> > diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb b/meta=
/recipes-graphics/xorg-lib/libxcb_1.14.bb
>>>>>> > index f0a223a19c..40c7b1cc3c 100644
>>>>>> > --- a/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
>>>>>> > +++ b/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb
>>>>>> > @@ -24,6 +24,7 @@ PACKAGES_DYNAMIC =3D "^${PN}-.*"
>>>>>> >  FILES_${PN} =3D "${libdir}/libxcb.so.*"
>>>>>> >
>>>>>> >  inherit autotools pkgconfig features_check
>>>>>> > +inherit python3native
>>>>>> >
>>>>>>
>>>>>>
>>>>>> Could you provide a little more information about how this is break=
ing things?
>>>>>>
>>>>>> Whilst python is used by the libxcb build, I believe it shouldn't c=
hange the
>>>>>> output, it doesn't in our reproducibity tests.
>>>>>>
>>>>>> Adding a python-native dependency does slow the build down a bit so=
 if we
>>>>>> don't need it, it would be good to avoid it.
>>>>>>
>>>>>> Cheers,
>>>>>>
>>>>>> Richard
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>>
>
>=20
>
