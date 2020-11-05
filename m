Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.65.1604599123721548952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 09:58:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KrznPZ85;
 spf=pass (domain: linaro.org, ip: 209.85.221.54, mailfrom: anibal.limon@linaro.org)
Received: by mail-wr1-f54.google.com with SMTP id x7so2822482wrl.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 09:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4E3dYXjL/d0PkC8ehKchf9AXP+3DVLvcp1sfivygUo8=;
        b=KrznPZ85QPhnC5M7zgIwaPz1e9KaEfTQ24PE9RzBt6KC7PsEbP3pwKjiooOMbnoD3v
         0mN65mXLoltm+U52w697p/WnYqpA0IZEL8C6/sES5QkPuCtLmYRo9CqXwQLpG9kBT6WI
         XTCR+4xs4mZbkQDsAxt7CKxYEiBqV93Z9DH9vjWoazF6bV0EcbKh0CLnV9mEXYfWlCvb
         uMUEIVDX+itsIpvgUCfOgPWEy/Acl8oSQXxk+swjBoOrBPjTm0Sbv3EliF7ktBL9Ph3U
         /R8cRnVR0tlR2OiFirpXUpAqWiEYD0OLMZbt0iYMqJ6IaANWtg24AWy6EYHT6fsuKL9x
         idaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4E3dYXjL/d0PkC8ehKchf9AXP+3DVLvcp1sfivygUo8=;
        b=mWXDE0QK2DdSTzELo6p/lXiy9KROZ8W+PhDt6iJ3B78QVfeI2xz8GViYdW6hp0+gAJ
         yBw476JFdn3bfxziqcGO5gxOwRF0KZQueGTN7f4W3WMe76/MqazxAq36x7uqA55SiyIY
         gz/J/kO6bFJfhOSJFYmMUWxIf8HN69bQR+R0qV+KOZ8M54uBVI2bCqif3BsYXMvQ23e0
         AYRHpALqzA257YJ2xy0MjRKJCKRUQicfsyCymRivPgtXGEdy9WVXb9DpLQPxcIgHQv1A
         HddUST4ATf499kC1MmdWh5eqxIsE93zn/othG6zq3+qeGD1qusC/t7vWHx0S1hiK2SFO
         XgmA==
X-Gm-Message-State: AOAM533cULhQ/awl5eIAWCEmwCea2G6e6rqSU7I5dBhxZDMKAjDT2O/i
	7xgsWyx4Mz+c0vpxdtlvdf8/auTAk040mofl5Yx24w==
X-Google-Smtp-Source: ABdhPJz8JO9iGi8F8rQol6frSUxQRvpuC4ayaz1eGLepwzuX1oMuLShTh9uGKOpzzSBAt7cgqgt0nmd8HSHMSgO3vM4=
X-Received: by 2002:adf:e447:: with SMTP id t7mr4325466wrm.384.1604599122202;
 Thu, 05 Nov 2020 09:58:42 -0800 (PST)
MIME-Version: 1.0
References: <164419F41027C9D2.7719@lists.openembedded.org> <20201103215244.857384-1-Martin.Jansa@gmail.com>
 <CA+_Aqiuge4Tpf0XsHbWLLRpjXS8sUu7-uAgqRZ+vMuc8V9Qc+w@mail.gmail.com>
In-Reply-To: <CA+_Aqiuge4Tpf0XsHbWLLRpjXS8sUu7-uAgqRZ+vMuc8V9Qc+w@mail.gmail.com>
From: "Anibal Limon" <anibal.limon@linaro.org>
Date: Thu, 5 Nov 2020 11:58:31 -0600
Message-ID: <CA+_AqitT4Okk2NJx1LMFFhVttahR8RxHD_1YSCy072p14cMwpQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxkbcommon: add missing dependency on libxml2
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000afa6b505b35fd800"

--000000000000afa6b505b35fd800
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2020 at 11:57, Anibal Limon <anibal.limon@linaro.org> wrote:

> I have the same issue, looking at libxkbcommon [1], it suggest to package
> the libxkbregistry separately and since the libxml2 adds a lot
> of dependencies may be is better to disable by default via
> -Denable-xkbregistry=false and add another recipe to build it if needed.
>

Forget the link,

[1] https://github.com/xkbcommon/libxkbcommon/blob/master/PACKAGING#L74


>
> Regards,
> Anibal
>
> On Tue, 3 Nov 2020 at 15:52, Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
>> * it was introduced with xkbregistry support in:
>>
>> https://github.com/xkbcommon/libxkbcommon/commit/afb26e7df9090a0b765eb294b6efff448f763b6f
>>   and as xkbregistry is enabled by default libxkbcommon
>>   is failing since the upgrade to 1.0.1 in builds where
>>   libxml2 wasn't included in RSS (e.g. when wayland
>>   isn't in DISTRO_FEATURES -> in PACKAGECONFIG)
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
>> b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
>> index 4ef20b0721..353856e1c4 100644
>> --- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
>> +++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
>> @@ -5,7 +5,7 @@ HOMEPAGE = "http://www.xkbcommon.org"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=e525ed9809e1f8a07cf4bce8b09e8b87"
>>  LICENSE = "MIT & MIT-style"
>>
>> -DEPENDS = "util-macros flex-native bison-native"
>> +DEPENDS = "util-macros flex-native bison-native libxml2"
>>
>>  SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
>>
>> --
>> 2.27.0
>>
>>
>> 
>>
>>

--000000000000afa6b505b35fd800
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 5 Nov 2020 at 11:57, Anibal L=
imon &lt;<a href=3D"mailto:anibal.limon@linaro.org">anibal.limon@linaro.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"></div>I have the same is=
sue, looking at libxkbcommon [1], it suggest to package the libxkbregistry =
separately and since the libxml2 adds a lot<div>of dependencies may be is b=
etter to disable by default via -Denable-xkbregistry=3Dfalse and add anothe=
r recipe to build it if needed.</div></div></div></blockquote><div><br></di=
v><div>Forget the link,</div><div><br></div><div>[1]=C2=A0<a href=3D"https:=
//github.com/xkbcommon/libxkbcommon/blob/master/PACKAGING#L74">https://gith=
ub.com/xkbcommon/libxkbcommon/blob/master/PACKAGING#L74</a></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
"><div dir=3D"ltr"><div><br></div><div>Regards,</div><div>Anibal<br><div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, =
3 Nov 2020 at 15:52, Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">* it was introduced with xkbre=
gistry support in:<br>
=C2=A0 <a href=3D"https://github.com/xkbcommon/libxkbcommon/commit/afb26e7=
df9090a0b765eb294b6efff448f763b6f" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/xkbcommon/libxkbcommon/commit/afb26e7df9090a0b765eb294b6eff=
f448f763b6f</a><br>
=C2=A0 and as xkbregistry is enabled by default libxkbcommon<br>
=C2=A0 is failing since the upgrade to 1.0.1 in builds where<br>
=C2=A0 libxml2 wasn&#39;t included in RSS (e.g. when wayland<br>
=C2=A0 isn&#39;t in DISTRO_FEATURES -&gt; in PACKAGECONFIG)<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon_1.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libxkbcommon_1.0.1.bb</a> | 2 +-<b=
r>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon=
_1.0.1.bb" rel=3D"noreferrer" target=3D"_blank">libxkbcommon_1.0.1.bb</a> b=
/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon_1.0.1.bb" re=
l=3D"noreferrer" target=3D"_blank">libxkbcommon_1.0.1.bb</a><br>
index 4ef20b0721..353856e1c4 100644<br>
--- a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon_1.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libxkbcommon_1.0.1.bb</a><br>
+++ b/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon_1.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libxkbcommon_1.0.1.bb</a><br>
@@ -5,7 +5,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.xkbcommon.org" re=
l=3D"noreferrer" target=3D"_blank">http://www.xkbcommon.org</a>&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De525ed9809e1f8a07cf4=
bce8b09e8b87&quot;<br>
=C2=A0LICENSE =3D &quot;MIT &amp; MIT-style&quot;<br>
<br>
-DEPENDS =3D &quot;util-macros flex-native bison-native&quot;<br>
+DEPENDS =3D &quot;util-macros flex-native bison-native libxml2&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://xkbcommon.org/download/$%7BBPN%7=
D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://xkbcommon.o=
rg/download/${BPN}-${PV}.tar.xz</a>&quot;<br>
<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div></div></div>
</blockquote></div></div>

--000000000000afa6b505b35fd800--
