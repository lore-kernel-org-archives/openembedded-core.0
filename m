Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web12.5470.1591082217674111397
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 00:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pTvSU+Pj;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id g129so1463518vsc.4
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 00:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rPc7Rri6u4DVqBPVOYINZIwwcyj0Ir6cnP2Ouqyb+rs=;
        b=pTvSU+PjFmNxoKCo42Gpm/WsNCtBHkwhR8rlC7ijvlb5KZAaKRxUa6jMnUnEzWFKfa
         Q4Y+XJVlYbyoS7tZKf+TsxOpjA1Kp61yjEA33+Df3zlp/UplF3RTWGKTudO4kIjwAR0Y
         ijm7HRXPq0AVV1SYEUrCmRTio9jm/QshWubwmOkNzhlg4JvppjbKMfG8olIG7vY+TsIN
         WPrStsaQGrfduaoi+sxw5yj0HzJdLrcyVAufzib1leKPx5eeyjMAPJVj5ytN1ytRW+Tr
         cCrATY5DTmRAePEsCgwZDzjs312cSjRYTHXuiYySDqlv313dC87cABV5KncMNBqY0ro5
         4LgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rPc7Rri6u4DVqBPVOYINZIwwcyj0Ir6cnP2Ouqyb+rs=;
        b=FbTBOfQquWlP/5q5LlDbjeDMuiWlhA6w/LmM90o162GH4yM2lktFko1as+f5l8tVkr
         dPMhYqyEem62JBKdOyWpNRHPosf8VU4y6lUwXNrX+sp4wmEHT0ZYXzhEaN6LXabiGofT
         1Vwu1b5TY2rb+JQT5peTJBC9DKzspeYER7BASWV36WCAIAd5Ni/7eUKRVgpELLzrduxn
         /Pwkw9EKQrj/8UkBKa/kF82mXlIH6xpSnID4TcC2LhAt2I0Mp07ZxouoxaQMb4jpNiMo
         kTSIpO/zvhiIxoK3cKrdRBx6m+NDQyUTfmpctY+2IHdnivyiRWFUlfaqXjnbi9i49j3n
         4DLQ==
X-Gm-Message-State: AOAM532KygedD2yzRHMTP+ZABt9g1D/zzGU7hy9Q2zSncUPs0Sut4YLM
	wIi9bZ6GDx4E2xwOCcAZI9Dq1B/SyzNSYkmTDf0=
X-Google-Smtp-Source: ABdhPJxnZmx5ebSEqE5C6zfZDfRAmArtFMBBSzEgU4ZyD4XTOsav74WUrX9MgiXY+s1OCW4jYjQyfy2b57zog2VZsbc=
X-Received: by 2002:a67:c806:: with SMTP id u6mr11010599vsk.94.1591082216835;
 Tue, 02 Jun 2020 00:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-34-alex.kanavin@gmail.com> <CAMKF1spOVgSmKCzDoj8WCVZmHcAjP5w=ut=7AwX4ZDcgXw29sA@mail.gmail.com>
In-Reply-To: <CAMKF1spOVgSmKCzDoj8WCVZmHcAjP5w=ut=7AwX4ZDcgXw29sA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 2 Jun 2020 09:16:44 +0200
Message-ID: <CANNYZj8VPzDDNoNynaaNcys1uKLACoCXHECvUDFaON6-uSABfw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 34/70] pixman: upgrade 0.38.4 -> 0.40.0
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000057cd4d05a714b274"

--00000000000057cd4d05a714b274
Content-Type: text/plain; charset="UTF-8"

The patch has been merged upstream - easy to establish by clicking on the
link inside it.

Alex

On Tue, 2 Jun 2020 at 05:41, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Sun, May 31, 2020 at 8:54 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>>  ...-for-FE_INVALID-definition-before-us.patch | 33 -------------------
>>  .../{pixman_0.38.4.bb => pixman_0.40.0.bb}    |  5 ++-
>>  2 files changed, 2 insertions(+), 36 deletions(-)
>>  delete mode 100644
>> meta/recipes-graphics/xorg-lib/pixman/0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch
>
>
> Why is this patch being removed ?
>
>
>>  rename meta/recipes-graphics/xorg-lib/{pixman_0.38.4.bb =>
>> pixman_0.40.0.bb} (85%)
>>
>> diff --git
>> a/meta/recipes-graphics/xorg-lib/pixman/0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch
>> b/meta/recipes-graphics/xorg-lib/pixman/0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch
>> deleted file mode 100644
>> index 23cbf53a41..0000000000
>> ---
>> a/meta/recipes-graphics/xorg-lib/pixman/0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -From 0ccd906b904d21536d5ab41c6196760e3e5d72cb Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Tue, 17 May 2016 17:30:00 -0700
>> -Subject: [PATCH] test/utils: Check for FE_INVALID definition before use
>> -
>> -Some architectures e.g. nios2 do not support all exceptions
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> -Upstream-Status: Submitted [
>> https://gitlab.freedesktop.org/pixman/pixman/merge_requests/24]
>> -
>> - test/utils.c | 2 ++
>> - 1 file changed, 2 insertions(+)
>> -
>> -diff --git a/test/utils.c b/test/utils.c
>> -index f8e42a5..fe32b1e 100644
>> ---- a/test/utils.c
>> -+++ b/test/utils.c
>> -@@ -978,9 +978,11 @@ enable_invalid_exceptions (void)
>> - {
>> - #ifdef HAVE_FENV_H
>> - #ifdef HAVE_FEENABLEEXCEPT
>> -+#ifdef FE_INVALID
>> -     feenableexcept (FE_INVALID);
>> - #endif
>> - #endif
>> -+#endif
>> - }
>> -
>> - void *
>> ---
>> -2.8.2
>> -
>> diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb
>> b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
>> similarity index 85%
>> rename from meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb
>> rename to meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
>> index 22e19ba069..5a3bb22ec3 100644
>> --- a/meta/recipes-graphics/xorg-lib/pixman_0.38.4.bb
>> +++ b/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb
>> @@ -9,10 +9,9 @@ DEPENDS = "zlib"
>>
>>  SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz \
>>
>> file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
>> -
>>  file://0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch \
>>             "
>> -SRC_URI[md5sum] = "267a7af290f93f643a1bc74490d9fdd1"
>> -SRC_URI[sha256sum] =
>> "da66d6fd6e40aee70f7bd02e4f8f76fc3f006ec879d346bae6a723025cfbdde7"
>> +SRC_URI[md5sum] = "73858c0862dd9896fb5f62ae267084a4"
>> +SRC_URI[sha256sum] =
>> "6d200dec3740d9ec4ec8d1180e25779c00bc749f94278c8b9021f5534db223fc"
>>
>>  # see http://cairographics.org/releases/ - only even minor versions are
>> stable
>>  UPSTREAM_CHECK_REGEX = "pixman-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
>> --
>> 2.26.2
>>
>> 
>>
>

--00000000000057cd4d05a714b274
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The patch has been merged upstream - easy to establis=
h by clicking on the link inside it.</div><div><br></div><div>Alex<br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Tue, 2 Jun 2020 at 05:41, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div><br></div><div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, May 31, 202=
0 at 8:54 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com=
" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt;<br>
---<br>
=C2=A0...-for-FE_INVALID-definition-before-us.patch | 33 -----------------=
--<br>
=C2=A0.../{<a href=3D"http://pixman_0.38.4.bb" rel=3D"noreferrer" target=
=3D"_blank">pixman_0.38.4.bb</a> =3D&gt; <a href=3D"http://pixman_0.40.0.b=
b" rel=3D"noreferrer" target=3D"_blank">pixman_0.40.0.bb</a>}=C2=A0 =C2=A0 =
|=C2=A0 5 ++-<br>
=C2=A02 files changed, 2 insertions(+), 36 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-test-u=
tils-Check-for-FE_INVALID-definition-before-us.patch</blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">Why is this patch being removed ?</d=
iv><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
=C2=A0rename meta/recipes-graphics/xorg-lib/{<a href=3D"http://pixman_0.38=
.4.bb" rel=3D"noreferrer" target=3D"_blank">pixman_0.38.4.bb</a> =3D&gt; <a=
 href=3D"http://pixman_0.40.0.bb" rel=3D"noreferrer" target=3D"_blank">pixm=
an_0.40.0.bb</a>} (85%)<br>
<br>
diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-test-utils-Check-f=
or-FE_INVALID-definition-before-us.patch b/meta/recipes-graphics/xorg-lib/p=
ixman/0001-test-utils-Check-for-FE_INVALID-definition-before-us.patch<br>
deleted file mode 100644<br>
index 23cbf53a41..0000000000<br>
--- a/meta/recipes-graphics/xorg-lib/pixman/0001-test-utils-Check-for-FE_I=
NVALID-definition-before-us.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-From 0ccd906b904d21536d5ab41c6196760e3e5d72cb Mon Sep 17 00:00:00 2001<br=
>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt;<br>
-Date: Tue, 17 May 2016 17:30:00 -0700<br>
-Subject: [PATCH] test/utils: Check for FE_INVALID definition before use<b=
r>
-<br>
-Some architectures e.g. nios2 do not support all exceptions<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Submitted [<a href=3D"https://gitlab.freedesktop.org/pix=
man/pixman/merge_requests/24" rel=3D"noreferrer" target=3D"_blank">https://=
gitlab.freedesktop.org/pixman/pixman/merge_requests/24</a>]<br>
-<br>
- test/utils.c | 2 ++<br>
- 1 file changed, 2 insertions(+)<br>
-<br>
-diff --git a/test/utils.c b/test/utils.c<br>
-index f8e42a5..fe32b1e 100644<br>
---- a/test/utils.c<br>
-+++ b/test/utils.c<br>
-@@ -978,9 +978,11 @@ enable_invalid_exceptions (void)<br>
- {<br>
- #ifdef HAVE_FENV_H<br>
- #ifdef HAVE_FEENABLEEXCEPT<br>
-+#ifdef FE_INVALID<br>
-=C2=A0 =C2=A0 =C2=A0feenableexcept (FE_INVALID);<br>
- #endif<br>
- #endif<br>
-+#endif<br>
- }<br>
- <br>
- void *<br>
--- <br>
-2.8.2<br>
-<br>
diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://pixman_0.38.=
4.bb" rel=3D"noreferrer" target=3D"_blank">pixman_0.38.4.bb</a> b/meta/reci=
pes-graphics/xorg-lib/<a href=3D"http://pixman_0.40.0.bb" rel=3D"noreferrer=
" target=3D"_blank">pixman_0.40.0.bb</a><br>
similarity index 85%<br>
rename from meta/recipes-graphics/xorg-lib/<a href=3D"http://pixman_0.38.4=
.bb" rel=3D"noreferrer" target=3D"_blank">pixman_0.38.4.bb</a><br>
rename to meta/recipes-graphics/xorg-lib/<a href=3D"http://pixman_0.40.0.b=
b" rel=3D"noreferrer" target=3D"_blank">pixman_0.40.0.bb</a><br>
index 22e19ba069..5a3bb22ec3 100644<br>
--- a/meta/recipes-graphics/xorg-lib/<a href=3D"http://pixman_0.38.4.bb" r=
el=3D"noreferrer" target=3D"_blank">pixman_0.38.4.bb</a><br>
+++ b/meta/recipes-graphics/xorg-lib/<a href=3D"http://pixman_0.40.0.bb" r=
el=3D"noreferrer" target=3D"_blank">pixman_0.40.0.bb</a><br>
@@ -9,10 +9,9 @@ DEPENDS =3D &quot;zlib&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://www.cairographics.org/releases/=
$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://www.cairogra=
phics.org/releases/${BP}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ARM-qemu-related-wor=
karounds-in-cpu-features-detecti.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-test-utils-Check-for=
-FE_INVALID-definition-before-us.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[md5sum] =3D &quot;267a7af290f93f643a1bc74490d9fdd1&quot;<br>
-SRC_URI[sha256sum] =3D &quot;da66d6fd6e40aee70f7bd02e4f8f76fc3f006ec879d3=
46bae6a723025cfbdde7&quot;<br>
+SRC_URI[md5sum] =3D &quot;73858c0862dd9896fb5f62ae267084a4&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6d200dec3740d9ec4ec8d1180e25779c00bc749f9427=
8c8b9021f5534db223fc&quot;<br>
<br>
=C2=A0# see <a href=3D"http://cairographics.org/releases/" rel=3D"noreferr=
er" target=3D"_blank">http://cairographics.org/releases/</a> - only even mi=
nor versions are stable<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;pixman-(?P&lt;pver&gt;\d+\.(\d*[02468=
])+(\.\d+)+)&quot;<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div></div>
</blockquote></div>

--00000000000057cd4d05a714b274--
