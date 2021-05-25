Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web10.8644.1621944025592203558
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 05:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sV1zzNnC;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id o192so15876683vsd.7
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 05:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hic34wW2mRZfEU7bdGDJ9versJ1YhQWqrvR4oQt4r7w=;
        b=sV1zzNnCkMRGQrx6licdff+6i7kBuB5k2I6c1MuFUZJ1COsoRJxEdf9ClqmvBRRxCx
         deXPkDiqSZtX68cNVGhd2hFFS3VKp16Qdw622kcqc2ispN5dt2FfuaGi6l6ebC1vkG5Z
         wpXDRJ6Sq/7TQRZvIdqfQzMBg/RAIB7/BUcFc7Snjr83W9QfiMST5PVIkH98cMUff5Zn
         3TNQc43Hi5jJoBEBqJM4LBPUWzHXLOG7/SQQzW4IZfO93CsaHZaTL8dV39q4hPcXXQsq
         LQpvC1VrdGlOsGqY0v9rxQEqnosdZ+l/7GO8VbOfbE5WvYTa23I35X4BGvix3bm+fhAk
         Jvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hic34wW2mRZfEU7bdGDJ9versJ1YhQWqrvR4oQt4r7w=;
        b=BN4OcnAz3FZfZUEk58LEACprtisIeRNOnXlGpEHNiLX4GmMZduJzmQksKIG9pFpS6a
         rTk1qWEb0Ws4p2PC+34lllm6pW+3/KKu4TH4FOLpYY4YX6cdA3VQZ2zgL9VEE+OFmuKH
         bRlI2ej6dBA2ZQvsJlYwkECMwmdlkVixHq6aqsER1CitWicA8BTFEO+xnIgPzH07BayS
         69c6GL4SwTqKBVTB+RybT+pk1fhXp70HzzfNKo/zxp5a8VIeGfmr496L20TmA6QD/8vQ
         FyHZOb1MBNCy2b2Z1djG2RAvP33isiuXBXkoUnI98cQ7YvSJLKZ3RY0tKkljji76dO06
         mZPg==
X-Gm-Message-State: AOAM532wKNv/7Oj7K3pEDTVp6gzxarzc/iw8u8FYWTctsHYZtvsHrCGi
	dmunIdS4mkqDhU1w47ijKfyZfapJAqW0N/DXldI=
X-Google-Smtp-Source: ABdhPJyveer9O+IGgp1uCNYueC0uFoXkh5t1pBC/halU6j+6U0eVsvabILcUvuPMTHYEttOXgMqCinp9fKCYz7iLfDk=
X-Received: by 2002:a67:d715:: with SMTP id p21mr24490540vsj.31.1621944024278;
 Tue, 25 May 2021 05:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210525100447.3918978-1-samuli.piippo@qt.io> <CANNYZj-=JMz_=HtogubX3E7FDGbtRk6BxTVShFgNNoRKrCMK9g@mail.gmail.com>
 <CABXoSoVTKLZr6uh=FQ+hV_uAh0vor1YrB3V1X6kwRVHOhO8oYQ@mail.gmail.com>
In-Reply-To: <CABXoSoVTKLZr6uh=FQ+hV_uAh0vor1YrB3V1X6kwRVHOhO8oYQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 25 May 2021 14:00:12 +0200
Message-ID: <CANNYZj-c0TUqR0zuAkTHg3C_RHCWx=_y8BXx_VY5DJqNn1NwWA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake-native: enabled zstd support
To: Samuli Piippo <samuli.piippo@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000069ab7605c32645fb"

--00000000000069ab7605c32645fb
Content-Type: text/plain; charset="UTF-8"

Thanks, it would be beneficial to record this information in the commit
message.

Alex

On Tue, 25 May 2021 at 13:27, Samuli Piippo <samuli.piippo@gmail.com> wrote:

> Issue came up while building Qt6, which uses cmake packaging API:
> https://gitlab.kitware.com/cmake/cmake/-/issues/21552
> Things break when zstd support is not available and CMake doesn't provide
> simple why to ask if the support is available.
>
> Quote from cmake dev:
> As far as CMake's design is concerned, we have no optional formats. All
> should be supported.
> That's why we bundle sufficiently new versions of libarchive and libzstd.
> If a distro builds with an older libarchive that doesn't have zstd
> support, then that is not a proper packaging of CMake.
>
> For target/nativesdk CMake depends on libarchive for this support, which
> is covered in the second patch.
>
> -samuli
>
> On Tue, 25 May 2021 at 13:07, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> You need to explain the benefit in doing so, I think? :)
>>
>> Alex
>>
>> On Tue, 25 May 2021 at 12:05, Samuli Piippo <samuli.piippo@gmail.com>
>> wrote:
>>
>>> Now that zstd is in oe-core, enable support for it in native CMake.
>>>
>>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>>> ---
>>>  meta/recipes-devtools/cmake/cmake-native_3.20.1.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
>>> b/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
>>> index d91e42ef9a..335097d387 100644
>>> --- a/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
>>> +++ b/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
>>> @@ -1,7 +1,7 @@
>>>  require cmake.inc
>>>  inherit native
>>>
>>> -DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native
>>> ncurses-native"
>>> +DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native
>>> ncurses-native zstd-native"
>>>
>>>  SRC_URI += "file://OEToolchainConfig.cmake \
>>>              file://environment.d-cmake.sh \
>>> --
>>> 2.25.1
>>>
>>>
>>> 
>>>
>>>

--00000000000069ab7605c32645fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, it would be beneficial to record this informa=
tion in the commit message.</div><div><br></div><div>Alex<br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, =
25 May 2021 at 13:27, Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@gma=
il.com">samuli.piippo@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div>Issue came up =
while building Qt6, which uses cmake packaging API: <a href=3D"https://gitl=
ab.kitware.com/cmake/cmake/-/issues/21552" target=3D"_blank">https://gitlab=
.kitware.com/cmake/cmake/-/issues/21552</a></div><div>Things break when zst=
d support is not available and CMake doesn&#39;t provide simple why to ask =
if the support is available.<br></div><div><br></div><div>Quote from cmake =
dev: <br></div><div>As far as CMake&#39;s design is concerned, we have no o=
ptional formats.  All should be supported. <br></div><div>That&#39;s why we=
 bundle sufficiently new versions of libarchive and libzstd. <br></div><div=
> If a distro builds with an older libarchive that doesn&#39;t have zstd su=
pport, then that is not a proper packaging of CMake.</div></div><div><br></=
div><div>For target/nativesdk CMake depends on libarchive for this support,=
 which is covered in the second patch.<br></div><div><br></div><div>-samuli=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, 25 May 2021 at 13:07, Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div>You need to explain the benefit in doing so, I think? :)</d=
iv><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Tue, 25 May 2021 at 12:05, Samuli P=
iippo &lt;<a href=3D"mailto:samuli.piippo@gmail.com" target=3D"_blank">samu=
li.piippo@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Now that zstd is in oe-core, enable support for it in na=
tive CMake.<br>
<br>
Signed-off-by: Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@qt.io" ta=
rget=3D"_blank">samuli.piippo@qt.io</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.20.1.bb=
" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.20.1.bb</a> | 2 +-<br=
>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.=
20.1.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.20.1.bb</a> b/=
meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.20.1.bb" rel=
=3D"noreferrer" target=3D"_blank">cmake-native_3.20.1.bb</a><br>
index d91e42ef9a..335097d387 100644<br>
--- a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.20.1.bb=
" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.20.1.bb</a><br>
+++ b/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.20.1.bb=
" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.20.1.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0require cmake.inc<br>
=C2=A0inherit native<br>
<br>
-DEPENDS +=3D &quot;bzip2-replacement-native xz-native zlib-native curl-na=
tive ncurses-native&quot;<br>
+DEPENDS +=3D &quot;bzip2-replacement-native xz-native zlib-native curl-na=
tive ncurses-native zstd-native&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://OEToolchainConfig.cmake \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://<a href=3D"http://e=
nvironment.d-cmake.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-c=
make.sh</a> \<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--00000000000069ab7605c32645fb--
