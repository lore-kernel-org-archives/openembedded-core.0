Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FF4C19F2A
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 16:53:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.15570.1659891198026270379
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 09:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JDQnU7xc;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 az6-20020a05600c600600b003a530cebbe3so1444089wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 09:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=TkO5I3RA17Y5ekAqtIkPy9CJhe56OIRaxKnCz+PEobY=;
        b=JDQnU7xcW92kWKbGxarjEpMLgNQf4jvYMPeK2MfpjB+RR4g5+iwWEP4R+dX52KpDmc
         wNm5+0JOxl0O4IrH5femffD3D47Y/+wAiDK5zTs+uzMPyOZ548OJe+ydj7YI472CjZm5
         d2YGoeZMRu8f/ydaOkKVG2cShijLw6mtqI4bCeUA50fmuAFu2k29fYdtxecoobj4bSiQ
         RSjsACVlOwQMvOgHuFGs7C+b2+1Dy9PhoqLKeC0icX+Oeg6tb4LJROqqulsyrDLfLMsn
         3v5oVshYEx9c/ne0sYEYTdMv3feTDOhCQ8h69CJ7faJeS/GTuWe+JtRb7NzZgBxELA1O
         H4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=TkO5I3RA17Y5ekAqtIkPy9CJhe56OIRaxKnCz+PEobY=;
        b=jZSN5uHDuv09Prn5AqFoJ902UN/YNgpAY0OMomjYHHfkc5xOtdcsCVXTU9dx+lMt02
         EJMc/6aKWbfC9WIVsonAsUMd8L2p6DJPmomMmBunV5ZAQnEXt/Yhv76AQnI1CX1D0XbV
         foxMkRlunQu8lJ38WxHxuTXwsplO+1BpexlPpVZLSeOXlVM8tvaOfxfzdIlTEMfFT09D
         HhT63vGqqtxXAk7weuc7G18jvauDgnhDJs+5hg1YvNiQYoti0O78lxzOoNquJWWtni2N
         cBcWsJdaN/OybDhPI1Et+DNunQ1DWQBG3DcIgXn5mtQbuNKwGzPnpgn9jXU7mc+lO3Qj
         srKA==
X-Gm-Message-State: ACgBeo208ENaWrjFnm0yOZJYV3iM2nBVxfqnXuvCtMntQyjcjfYQJSmJ
	6Ctu/YU8OYBeDvCp9FIFWDmJq29xppbQpCp98W4=
X-Google-Smtp-Source: 
 AA6agR5dSUWgkTSLVhS0lt8sQLthg+27Q9IV48z3FpwzPeyZjFk7Wnj7YP7i9bjiTTbbRiGhvsezljzAAXtCcvodTDQ=
X-Received: by 2002:a7b:cc0d:0:b0:3a5:1eae:3948 with SMTP id
 f13-20020a7bcc0d000000b003a51eae3948mr7576933wmh.32.1659891196310; Sun, 07
 Aug 2022 09:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220807160629.2112131-1-raj.khem@gmail.com>
 <17091D9A9B07112A.8942@lists.openembedded.org>
In-Reply-To: <17091D9A9B07112A.8942@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 7 Aug 2022 18:52:31 +0200
Message-ID: 
 <CA+chaQc45mTQc9VNYOPjeYsGEdm5-3bki2AjRLG_Gp7qrC=kuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] binutils: Upgrade to 2.39 release
To: Martin.Jansa@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001f388f05e5a989d9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 16:53:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169000

--0000000000001f388f05e5a989d9
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 7, 2022 at 6:41 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

>
>
> On Sun, Aug 7, 2022 at 6:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>> Details of changes [1]
>>
>> [1] https://sourceware.org/pipermail/binutils/2022-August/122246.html
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> v2: Remove trailing .0 from PV
>>
>>  meta/conf/distro/include/tcmode-default.inc   |    2 +-
>>  .../{binutils-2.38.inc => binutils-2.39.inc}  |   26 +-
>>  ....38.bb => binutils-cross-canadian_2.39.bb} |    0
>>  ...38.bb => binutils-cross-testsuite_2.39.bb} |    0
>>  ...s-cross_2.38.bb => binutils-cross_2.39.bb} |    0
>>  ...ssdk_2.38.bb => binutils-crosssdk_2.39.bb} |    0
>>  ...s-crosssdk-Generate-relocatable-SDKs.patch |    2 +-
>>  ...o-not-generate-linker-script-directo.patch |    2 +-
>>  ...dk-Search-for-alternative-ld.so.conf.patch |   16 +-
>>  ...004-Point-scripts-location-to-libdir.patch |   10 +-
>>  ...tro-compiler-point-to-the-wrong-ins.patch} |    2 +-
>>  ...system-directories-when-cross-linki.patch} |   42 +-
>>  ...ct-assembling-for-ppc-wait-mnemonic.patch} |    8 +-
>>  ...l-2.4.patch => 0008-Use-libtool-2.4.patch} | 2131 ++++++++---------
>>  ...-in-libtool-when-sysroot-is-enabled.patch} |    2 +-
>>  ...> 0010-sync-with-OE-libtool-changes.patch} |    2 +-
>>  ...r-clang-before-checking-gcc-version.patch} |   10 +-
>>  ...RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} |   17 +-
>>  .../0013-Avoid-as-info-race-condition.patch   |   75 -
>>  .../binutils/0014-CVE-2019-1010204.patch      |   49 -
>>  .../{binutils_2.38.bb => binutils_2.39.bb}    |    0
>>  21 files changed, 1129 insertions(+), 1267 deletions(-)
>>  rename meta/recipes-devtools/binutils/{binutils-2.38.inc =>
>> binutils-2.39.inc} (60%)
>>  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.38.bb
>> => binutils-cross-canadian_2.39.bb} (100%)
>>  rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.38.bb
>> => binutils-cross-testsuite_2.39.bb} (100%)
>>  rename meta/recipes-devtools/binutils/{binutils-cross_2.38.bb =>
>> binutils-cross_2.39.bb} (100%)
>>  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.38.bb =>
>> binutils-crosssdk_2.39.bb} (100%)
>>  rename
>> meta/recipes-devtools/binutils/binutils/{0006-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
>> => 0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch} (94%)
>>  rename
>> meta/recipes-devtools/binutils/binutils/{0007-warn-for-uses-of-system-directories-when-cross-linki.patch
>> => 0006-warn-for-uses-of-system-directories-when-cross-linki.patch} (91%)
>>  rename
>> meta/recipes-devtools/binutils/binutils/{0008-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
>> => 0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch} (85%)
>>  rename
>> meta/recipes-devtools/binutils/binutils/{0009-Use-libtool-2.4.patch =>
>> 0008-Use-libtool-2.4.patch} (95%)
>>  rename
>> meta/recipes-devtools/binutils/binutils/{0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
>> => 0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch} (96%)
>>  rename
>> meta/recipes-devtools/binutils/binutils/{0011-sync-with-OE-libtool-changes.patch
>> => 0010-sync-with-OE-libtool-changes.patch} (97%)
>>  rename
>> meta/recipes-devtools/binutils/binutils/{0012-Check-for-clang-before-checking-gcc-version.patch
>> => 0011-Check-for-clang-before-checking-gcc-version.patch} (84%)
>>  rename
>> meta/recipes-devtools/binutils/binutils/{0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
>> => 0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} (70%)
>>  delete mode 100644
>> meta/recipes-devtools/binutils/binutils/0013-Avoid-as-info-race-condition.patch
>>  delete mode 100644
>> meta/recipes-devtools/binutils/binutils/0014-CVE-2019-1010204.patch
>>  rename meta/recipes-devtools/binutils/{binutils_2.38.bb =>
>> binutils_2.39.bb} (100%)
>>
>
> I'm seeing bunch of libtool erros with this applied, see:
> http://errors.yoctoproject.org/Errors/Details/664878/
>

 --disable-gprofng
in openembedded-core/meta/recipes-devtools/binutils/binutils-cross.inc
EXTRA_OECONF
fixed the build

I guess 0008-Use-libtool-2.4.patch should be extended to cover gprofng from
https://sourceware.org/pipermail/binutils/2021-August/117665.html /
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=bb368aad297fe3ad40cf397e6fc85aa471429a28

--0000000000001f388f05e5a989d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Aug 7, 2022 at 6:41 PM Martin Jan=
sa via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a>=
 &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gma=
il.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><d=
iv dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Sun, Aug 7, 2022 at 6:06 PM Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Details of ch=
anges [1]<br>
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
errors.yoctoproject.org/Errors/Details/664878/" target=3D"_blank">http://er=
rors.yoctoproject.org/Errors/Details/664878/</a></div></div></div></blockqu=
ote><div><br></div><div>=C2=A0--disable-gprofng in=C2=A0openembedded-core/m=
eta/recipes-devtools/binutils/binutils-cross.inc=C2=A0EXTRA_OECONF fixed th=
e build</div><div><br></div><div>I guess 0008-Use-libtool-2.4.patch should =
be extended to cover gprofng from=C2=A0<a href=3D"https://sourceware.org/pi=
permail/binutils/2021-August/117665.html">https://sourceware.org/pipermail/=
binutils/2021-August/117665.html</a> /=C2=A0<a href=3D"https://sourceware.o=
rg/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dbb368aad297fe3ad40cf397e6fc85aa=
471429a28">https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D=
bb368aad297fe3ad40cf397e6fc85aa471429a28</a></div></div></div>

--0000000000001f388f05e5a989d9--

