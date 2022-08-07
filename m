Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D748C19F2A
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 16:41:32 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.15451.1659890486963601694
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 09:41:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oojEWx9R;
 spf=pass (domain: gmail.com, ip: 209.85.128.53,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id
 186-20020a1c02c3000000b003a34ac64bdfso4017978wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 09:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=j5eKJyzmuCIz6SDmM3coPDZNZMPqSPm1CLExy2tNEqg=;
        b=oojEWx9R7Q+ZtL1Ir6j9YZbP3j/7KR/xLoOSipOVqm/9tETu3RENMwSrcdSf5PFL0L
         eI+nZy00EvmP7X2BZlaNdbsj1qscaxpSiRFunHCVsU3svR58y2As6Wbj0xJ0MI33rZFk
         VF58oHVgrBWYBEO8/nH91mfXEoLsi1KTF9zMpMDRp9jLG6UVowOygLxRimK835sZ+ZoL
         dA1940q+VTK6iCCchK8rtzt/ELVdGCZyO50a2KP0JMGFnJovoPlAdNNgCQPfFRPktAmk
         7w4WYgUCtYPDfCO5lv/mHZRKDZH5ENXNMB4kSWqx2wRSJwCTrTSS4F95G2Imtgco1EPK
         JFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=j5eKJyzmuCIz6SDmM3coPDZNZMPqSPm1CLExy2tNEqg=;
        b=vdQHFY29EvWd50K+G0iaJRyIo4fJcOOePkRHE4Xr2xZ7EKQe8Jspq2FNmiDaCgC3nv
         J7O6FssJE0fnNJaS36iNY5knqum/yNu5nGqqMcv1sVsaWyDt/qYJCO1hhUzeWaZ/h9Yk
         KlNQ21wvu5d8lUQt6uhh/fjCZUDpftzVWbpXoa6/NwmAvh+3udX0A7pSnejnUTUZSLty
         l9zeoXs9Bsnr6cPbVnsRLRf/PyFX+rYCNfyWYprnZcY4mpP3kYnXE5YkoCW8698r5Mis
         Yg6aw1e7alzflCtcdqBgxKFW1vDR31REpkOlT4f7VVq3fHrU/aMUql2LrlgaDMKkZ3VF
         GFjA==
X-Gm-Message-State: ACgBeo1CjFhTUvVkP0Wu05OpYRpu628kd7ZiC5EoalkXw9t5Xi1Q/z8A
	WuXS0vmy+ULj3b7eWI5g/3ElIB6P5LLVKOsVei8=
X-Google-Smtp-Source: 
 AA6agR5QMpXZZe1Q8iyd771iMYnGGsPOH68Fd0ez/ZjTkUdIkFkmDHUDeKgt3pNWAHc/h5+k8xlzZ9CkzXPFGRCU4wo=
X-Received: by 2002:a05:600c:1e83:b0:3a3:3ecb:52a0 with SMTP id
 be3-20020a05600c1e8300b003a33ecb52a0mr15447331wmb.44.1659890485279; Sun, 07
 Aug 2022 09:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220807160629.2112131-1-raj.khem@gmail.com>
In-Reply-To: <20220807160629.2112131-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 7 Aug 2022 18:40:40 +0200
Message-ID: 
 <CA+chaQcHJX84EmQgpRD3S+LS3ohPXSkET5u=drA1tU7RaPy6vw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] binutils: Upgrade to 2.39 release
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bdc14e05e5a95ef2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 16:41:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168999

--000000000000bdc14e05e5a95ef2
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 7, 2022 at 6:06 PM Khem Raj <raj.khem@gmail.com> wrote:

> Details of changes [1]
>
> [1] https://sourceware.org/pipermail/binutils/2022-August/122246.html
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Remove trailing .0 from PV
>
>  meta/conf/distro/include/tcmode-default.inc   |    2 +-
>  .../{binutils-2.38.inc => binutils-2.39.inc}  |   26 +-
>  ....38.bb => binutils-cross-canadian_2.39.bb} |    0
>  ...38.bb => binutils-cross-testsuite_2.39.bb} |    0
>  ...s-cross_2.38.bb => binutils-cross_2.39.bb} |    0
>  ...ssdk_2.38.bb => binutils-crosssdk_2.39.bb} |    0
>  ...s-crosssdk-Generate-relocatable-SDKs.patch |    2 +-
>  ...o-not-generate-linker-script-directo.patch |    2 +-
>  ...dk-Search-for-alternative-ld.so.conf.patch |   16 +-
>  ...004-Point-scripts-location-to-libdir.patch |   10 +-
>  ...tro-compiler-point-to-the-wrong-ins.patch} |    2 +-
>  ...system-directories-when-cross-linki.patch} |   42 +-
>  ...ct-assembling-for-ppc-wait-mnemonic.patch} |    8 +-
>  ...l-2.4.patch => 0008-Use-libtool-2.4.patch} | 2131 ++++++++---------
>  ...-in-libtool-when-sysroot-is-enabled.patch} |    2 +-
>  ...> 0010-sync-with-OE-libtool-changes.patch} |    2 +-
>  ...r-clang-before-checking-gcc-version.patch} |   10 +-
>  ...RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} |   17 +-
>  .../0013-Avoid-as-info-race-condition.patch   |   75 -
>  .../binutils/0014-CVE-2019-1010204.patch      |   49 -
>  .../{binutils_2.38.bb => binutils_2.39.bb}    |    0
>  21 files changed, 1129 insertions(+), 1267 deletions(-)
>  rename meta/recipes-devtools/binutils/{binutils-2.38.inc =>
> binutils-2.39.inc} (60%)
>  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.38.bb
> => binutils-cross-canadian_2.39.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.38.bb
> => binutils-cross-testsuite_2.39.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-cross_2.38.bb =>
> binutils-cross_2.39.bb} (100%)
>  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.38.bb =>
> binutils-crosssdk_2.39.bb} (100%)
>  rename
> meta/recipes-devtools/binutils/binutils/{0006-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> => 0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch} (94%)
>  rename
> meta/recipes-devtools/binutils/binutils/{0007-warn-for-uses-of-system-directories-when-cross-linki.patch
> => 0006-warn-for-uses-of-system-directories-when-cross-linki.patch} (91%)
>  rename
> meta/recipes-devtools/binutils/binutils/{0008-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> => 0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch} (85%)
>  rename
> meta/recipes-devtools/binutils/binutils/{0009-Use-libtool-2.4.patch =>
> 0008-Use-libtool-2.4.patch} (95%)
>  rename
> meta/recipes-devtools/binutils/binutils/{0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> => 0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch} (96%)
>  rename
> meta/recipes-devtools/binutils/binutils/{0011-sync-with-OE-libtool-changes.patch
> => 0010-sync-with-OE-libtool-changes.patch} (97%)
>  rename
> meta/recipes-devtools/binutils/binutils/{0012-Check-for-clang-before-checking-gcc-version.patch
> => 0011-Check-for-clang-before-checking-gcc-version.patch} (84%)
>  rename
> meta/recipes-devtools/binutils/binutils/{0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> => 0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} (70%)
>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/0013-Avoid-as-info-race-condition.patch
>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/0014-CVE-2019-1010204.patch
>  rename meta/recipes-devtools/binutils/{binutils_2.38.bb =>
> binutils_2.39.bb} (100%)
>

I'm seeing bunch of libtool erros with this applied, see:
http://errors.yoctoproject.org/Errors/Details/664878/

--000000000000bdc14e05e5a95ef2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 7, 2022 at 6:06 PM Khem R=
aj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Details of c=
hanges [1]<br>
<br>
[1] <a href=3D"https://sourceware.org/pipermail/binutils/2022-August/122246=
.html" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/pipermai=
l/binutils/2022-August/122246.html</a><br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
v2: Remove trailing .0 from PV<br>
<br>
=C2=A0meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 2 +-<br>
=C2=A0.../{binutils-2.38.inc =3D&gt; binutils-2.39.inc}=C2=A0 |=C2=A0 =C2=
=A026 +-<br>
=C2=A0....<a href=3D"http://38.bb" rel=3D"noreferrer" target=3D"_blank">38.=
bb</a> =3D&gt; <a href=3D"http://binutils-cross-canadian_2.39.bb" rel=3D"no=
referrer" target=3D"_blank">binutils-cross-canadian_2.39.bb</a>} |=C2=A0 =
=C2=A0 0<br>
=C2=A0...<a href=3D"http://38.bb" rel=3D"noreferrer" target=3D"_blank">38.b=
b</a> =3D&gt; <a href=3D"http://binutils-cross-testsuite_2.39.bb" rel=3D"no=
referrer" target=3D"_blank">binutils-cross-testsuite_2.39.bb</a>} |=C2=A0 =
=C2=A0 0<br>
=C2=A0...<a href=3D"http://s-cross_2.38.bb" rel=3D"noreferrer" target=3D"_b=
lank">s-cross_2.38.bb</a> =3D&gt; <a href=3D"http://binutils-cross_2.39.bb"=
 rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.39.bb</a>} |=C2=A0 =
=C2=A0 0<br>
=C2=A0...<a href=3D"http://ssdk_2.38.bb" rel=3D"noreferrer" target=3D"_blan=
k">ssdk_2.38.bb</a> =3D&gt; <a href=3D"http://binutils-crosssdk_2.39.bb" re=
l=3D"noreferrer" target=3D"_blank">binutils-crosssdk_2.39.bb</a>} |=C2=A0 =
=C2=A0 0<br>
=C2=A0...s-crosssdk-Generate-relocatable-SDKs.patch |=C2=A0 =C2=A0 2 +-<br>
=C2=A0...o-not-generate-linker-script-directo.patch |=C2=A0 =C2=A0 2 +-<br>
=C2=A0...dk-Search-for-alternative-ld.so.conf.patch |=C2=A0 =C2=A016 +-<br>
=C2=A0...004-Point-scripts-location-to-libdir.patch |=C2=A0 =C2=A010 +-<br>
=C2=A0...tro-compiler-point-to-the-wrong-ins.patch} |=C2=A0 =C2=A0 2 +-<br>
=C2=A0...system-directories-when-cross-linki.patch} |=C2=A0 =C2=A042 +-<br>
=C2=A0...ct-assembling-for-ppc-wait-mnemonic.patch} |=C2=A0 =C2=A0 8 +-<br>
=C2=A0...l-2.4.patch =3D&gt; 0008-Use-libtool-2.4.patch} | 2131 ++++++++---=
------<br>
=C2=A0...-in-libtool-when-sysroot-is-enabled.patch} |=C2=A0 =C2=A0 2 +-<br>
=C2=A0...&gt; 0010-sync-with-OE-libtool-changes.patch} |=C2=A0 =C2=A0 2 +-<=
br>
=C2=A0...r-clang-before-checking-gcc-version.patch} |=C2=A0 =C2=A010 +-<br>
=C2=A0...RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} |=C2=A0 =C2=A017 +-<br>
=C2=A0.../0013-Avoid-as-info-race-condition.patch=C2=A0 =C2=A0|=C2=A0 =C2=
=A075 -<br>
=C2=A0.../binutils/0014-CVE-2019-1010204.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A049 -<br>
=C2=A0.../{<a href=3D"http://binutils_2.38.bb" rel=3D"noreferrer" target=3D=
"_blank">binutils_2.38.bb</a> =3D&gt; <a href=3D"http://binutils_2.39.bb" r=
el=3D"noreferrer" target=3D"_blank">binutils_2.39.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 0<br>
=C2=A021 files changed, 1129 insertions(+), 1267 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/binutils/{binutils-2.38.inc =3D&gt; binu=
tils-2.39.inc} (60%)<br>
=C2=A0rename meta/recipes-devtools/binutils/{<a href=3D"http://binutils-cro=
ss-canadian_2.38.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross-ca=
nadian_2.38.bb</a> =3D&gt; <a href=3D"http://binutils-cross-canadian_2.39.b=
b" rel=3D"noreferrer" target=3D"_blank">binutils-cross-canadian_2.39.bb</a>=
} (100%)<br>
=C2=A0rename meta/recipes-devtools/binutils/{<a href=3D"http://binutils-cro=
ss-testsuite_2.38.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross-t=
estsuite_2.38.bb</a> =3D&gt; <a href=3D"http://binutils-cross-testsuite_2.3=
9.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross-testsuite_2.39.bb=
</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/binutils/{<a href=3D"http://binutils-cro=
ss_2.38.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.38.bb</a>=
 =3D&gt; <a href=3D"http://binutils-cross_2.39.bb" rel=3D"noreferrer" targe=
t=3D"_blank">binutils-cross_2.39.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/binutils/{<a href=3D"http://binutils-cro=
sssdk_2.38.bb" rel=3D"noreferrer" target=3D"_blank">binutils-crosssdk_2.38.=
bb</a> =3D&gt; <a href=3D"http://binutils-crosssdk_2.39.bb" rel=3D"noreferr=
er" target=3D"_blank">binutils-crosssdk_2.39.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/binutils/binutils/{0006-don-t-let-the-di=
stro-compiler-point-to-the-wrong-ins.patch =3D&gt; 0005-don-t-let-the-distr=
o-compiler-point-to-the-wrong-ins.patch} (94%)<br>
=C2=A0rename meta/recipes-devtools/binutils/binutils/{0007-warn-for-uses-of=
-system-directories-when-cross-linki.patch =3D&gt; 0006-warn-for-uses-of-sy=
stem-directories-when-cross-linki.patch} (91%)<br>
=C2=A0rename meta/recipes-devtools/binutils/binutils/{0008-fix-the-incorrec=
t-assembling-for-ppc-wait-mnemonic.patch =3D&gt; 0007-fix-the-incorrect-ass=
embling-for-ppc-wait-mnemonic.patch} (85%)<br>
=C2=A0rename meta/recipes-devtools/binutils/binutils/{0009-Use-libtool-2.4.=
patch =3D&gt; 0008-Use-libtool-2.4.patch} (95%)<br>
=C2=A0rename meta/recipes-devtools/binutils/binutils/{0010-Fix-rpath-in-lib=
tool-when-sysroot-is-enabled.patch =3D&gt; 0009-Fix-rpath-in-libtool-when-s=
ysroot-is-enabled.patch} (96%)<br>
=C2=A0rename meta/recipes-devtools/binutils/binutils/{0011-sync-with-OE-lib=
tool-changes.patch =3D&gt; 0010-sync-with-OE-libtool-changes.patch} (97%)<b=
r>
=C2=A0rename meta/recipes-devtools/binutils/binutils/{0012-Check-for-clang-=
before-checking-gcc-version.patch =3D&gt; 0011-Check-for-clang-before-check=
ing-gcc-version.patch} (84%)<br>
=C2=A0rename meta/recipes-devtools/binutils/binutils/{0005-Only-generate-an=
-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch =3D&gt; 0012-Only-generate-an-RP=
ATH-entry-if-LD_RUN_PATH-is-not-e.patch} (70%)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils/0013-Avoid=
-as-info-race-condition.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/binutils/binutils/0014-CVE-2=
019-1010204.patch<br>
=C2=A0rename meta/recipes-devtools/binutils/{<a href=3D"http://binutils_2.3=
8.bb" rel=3D"noreferrer" target=3D"_blank">binutils_2.38.bb</a> =3D&gt; <a =
href=3D"http://binutils_2.39.bb" rel=3D"noreferrer" target=3D"_blank">binut=
ils_2.39.bb</a>} (100%)<br></blockquote><div><br></div><div>I&#39;m seeing =
bunch of libtool erros with this applied, see:</div><div><a href=3D"http://=
errors.yoctoproject.org/Errors/Details/664878/">http://errors.yoctoproject.=
org/Errors/Details/664878/</a></div></div></div>

--000000000000bdc14e05e5a95ef2--

