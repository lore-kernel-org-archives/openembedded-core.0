Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.9141.1621946505958792684
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 05:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J9WrNEG8;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: samuli.piippo@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id i5so22671893pgm.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 05:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oOV1OZU+km/rUPOsvMXJ39D0r2OmJpxdHC68b+MwPE4=;
        b=J9WrNEG86FBEYIiaMWlW1LQYWJLtROXx8vnRqkFjkjHivzjKc0/8UqO2x9STg/o3eR
         jO++8AriibMuYixzl+OvOVkXvSE+njG8uhDllY6FhlWA7L/sp7i0SSBiJ1okxwDae6Xs
         5whJMQf804hYP5plZzFFkiA/pbtrfVrjaY2DjhermUMlrQKzDlNvu4vAxzXrhDu6nIYd
         HM1HzgNIdSA/dMkNQtzJevSUMaL667InYNgrFPnKnOrObgrRH1AqYGdTGixBi7khIChx
         51QctFA1duoyJWq3QlzWAaxmgln7ts0OMSgH+t5TvpIus8PveRZfjDE0eygcSWYUvSa/
         /qMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oOV1OZU+km/rUPOsvMXJ39D0r2OmJpxdHC68b+MwPE4=;
        b=Q+OEVuhAaEGBiGY1QniDvDa9j3IT0sb3JXbQ9Mah+yAfghzIp6gBYn7W6NoiTPKq9V
         YUaLd5Flmx01JLxls5b/c2ZiAOkLkt5IhhBG2odgG5zCM4AND+yAyMlkHnVAlLwHI0Us
         YTn/l6pmUBiovBE1ZkiPuegiiLUnb9fpODCfXolFNsQudk5eW6Lb2oNtV7jg4TsTPXP4
         M175ATDcJeH92NV2WnsD02ZDa4aZ7nsHpR6KBJmNfnsFTXHhpzQQDOSRqdl+d7LFEJP/
         aZCbvr0PvxM+BwF50Eo0VrFR3KDa7frx4tMZ1ZSSY+OOjSou5UxRYaZntfihr8gplCrG
         z4FA==
X-Gm-Message-State: AOAM531U27QXi+o+jUk2YzT28YP/Zk7yCHa/c7f/8w852EDE7IXFjDGc
	Y6/NSPEtFzDNbnec8w7Hr8ztjciQxzk1NrX/Krw=
X-Google-Smtp-Source: ABdhPJxD2RKp25MpJGotY02HwHL6m5mEVK9GqNRm9xcedX35xhcC+oDNrMrZJdfZh8xw7KHfNwwAJpnf3UJUNHsA5zk=
X-Received: by 2002:a05:6a00:bc2:b029:2df:93cc:371a with SMTP id
 x2-20020a056a000bc2b02902df93cc371amr29742183pfu.12.1621946505509; Tue, 25
 May 2021 05:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210525100447.3918978-1-samuli.piippo@qt.io> <CANNYZj-=JMz_=HtogubX3E7FDGbtRk6BxTVShFgNNoRKrCMK9g@mail.gmail.com>
 <CABXoSoVTKLZr6uh=FQ+hV_uAh0vor1YrB3V1X6kwRVHOhO8oYQ@mail.gmail.com> <CANNYZj-c0TUqR0zuAkTHg3C_RHCWx=_y8BXx_VY5DJqNn1NwWA@mail.gmail.com>
In-Reply-To: <CANNYZj-c0TUqR0zuAkTHg3C_RHCWx=_y8BXx_VY5DJqNn1NwWA@mail.gmail.com>
From: "Samuli Piippo" <samuli.piippo@gmail.com>
Date: Tue, 25 May 2021 15:41:32 +0300
Message-ID: <CABXoSoUw-dve5ifhyOi6m8rh13Dxbn-3+M-=v8Bzu9j1ShK+Fw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake-native: enabled zstd support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004e3c2905c326d987"

--0000000000004e3c2905c326d987
Content-Type: text/plain; charset="UTF-8"

commit messages updated in v2 patches

-samuli

On Tue, 25 May 2021 at 15:00, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Thanks, it would be beneficial to record this information in the commit
> message.
>
> Alex
>
> On Tue, 25 May 2021 at 13:27, Samuli Piippo <samuli.piippo@gmail.com>
> wrote:
>
>> Issue came up while building Qt6, which uses cmake packaging API:
>> https://gitlab.kitware.com/cmake/cmake/-/issues/21552
>> Things break when zstd support is not available and CMake doesn't provide
>> simple why to ask if the support is available.
>>
>> Quote from cmake dev:
>> As far as CMake's design is concerned, we have no optional formats. All
>> should be supported.
>> That's why we bundle sufficiently new versions of libarchive and libzstd.
>> If a distro builds with an older libarchive that doesn't have zstd
>> support, then that is not a proper packaging of CMake.
>>
>> For target/nativesdk CMake depends on libarchive for this support, which
>> is covered in the second patch.
>>
>> -samuli
>>
>> On Tue, 25 May 2021 at 13:07, Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> You need to explain the benefit in doing so, I think? :)
>>>
>>> Alex
>>>
>>> On Tue, 25 May 2021 at 12:05, Samuli Piippo <samuli.piippo@gmail.com>
>>> wrote:
>>>
>>>> Now that zstd is in oe-core, enable support for it in native CMake.
>>>>
>>>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>>>> ---
>>>>  meta/recipes-devtools/cmake/cmake-native_3.20.1.bb | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
>>>> b/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
>>>> index d91e42ef9a..335097d387 100644
>>>> --- a/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
>>>> +++ b/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
>>>> @@ -1,7 +1,7 @@
>>>>  require cmake.inc
>>>>  inherit native
>>>>
>>>> -DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native
>>>> ncurses-native"
>>>> +DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native
>>>> ncurses-native zstd-native"
>>>>
>>>>  SRC_URI += "file://OEToolchainConfig.cmake \
>>>>              file://environment.d-cmake.sh \
>>>> --
>>>> 2.25.1
>>>>
>>>>
>>>> 
>>>>
>>>>

--0000000000004e3c2905c326d987
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>commit messages updated in v2 patches</div><div><br><=
/div><div>-samuli<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, 25 May 2021 at 15:00, Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div>Thanks, it would be beneficial to record this information in=
 the commit message.</div><div><br></div><div>Alex<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 25 May =
2021 at 13:27, Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@gmail.com"=
 target=3D"_blank">samuli.piippo@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div>Issue =
came up while building Qt6, which uses cmake packaging API: <a href=3D"http=
s://gitlab.kitware.com/cmake/cmake/-/issues/21552" target=3D"_blank">https:=
//gitlab.kitware.com/cmake/cmake/-/issues/21552</a></div><div>Things break =
when zstd support is not available and CMake doesn&#39;t provide simple why=
 to ask if the support is available.<br></div><div><br></div><div>Quote fro=
m cmake dev: <br></div><div>As far as CMake&#39;s design is concerned, we h=
ave no optional formats.  All should be supported. <br></div><div>That&#39;=
s why we bundle sufficiently new versions of libarchive and libzstd. <br></=
div><div> If a distro builds with an older libarchive that doesn&#39;t have=
 zstd support, then that is not a proper packaging of CMake.</div></div><di=
v><br></div><div>For target/nativesdk CMake depends on libarchive for this =
support, which is covered in the second patch.<br></div><div><br></div><div=
>-samuli<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, 25 May 2021 at 13:07, Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr"><div>You need to explain the benefit in doing so, I thin=
k? :)</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 25 May 2021 at 12:05, =
Samuli Piippo &lt;<a href=3D"mailto:samuli.piippo@gmail.com" target=3D"_bla=
nk">samuli.piippo@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Now that zstd is in oe-core, enable support for =
it in native CMake.<br>
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
</blockquote></div>

--0000000000004e3c2905c326d987--
