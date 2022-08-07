Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119CEC19F2A
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 19:00:03 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.16914.1659898801330683800
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 12:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VBAdYaaL;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id j7so8681712wrh.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 12:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=XInbZQR8rIjolDyNm/9V/CKR1pOKmU0O6uVYoCIc0sU=;
        b=VBAdYaaLOLnXj9F+yK0iKtzs00O/6USjOJfknVIh94b7+31D52PemWq5qPPVNkjYqG
         xM91i6mGtZ6s/hAklTX046JNzQY+Ppa+8Tq6xaXwGKPhM3tmF7EPdimdm8hiDJEalEGl
         49ldGLaAltHlA+tdHvEl3LaYzHzhhkzsqwfQ1li/RXBmMcdP18QAvFQU4APyKmO4hml8
         99sfCRJZw0cN2FK+vson3Z6ObXZsY1eTbgco48T0FsGi2zYeEsq8fx/0VnkOHgi5j/J6
         WwnxuZeN5wjv+2l8kPrPhhDtZ2flkCTJh5w5YVRl2BiJiiVGVcYzwlW0yPTr6hULQsO8
         1Pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=XInbZQR8rIjolDyNm/9V/CKR1pOKmU0O6uVYoCIc0sU=;
        b=GHuebw5NHaYS3glbPkTTpFHQ+h9F11LTRFtvAC6xsxxkU4PAA0r1jpaDDHIfpk+eNf
         C8Odd3sRcJkcK/bTjLnKZnc8lcEDzprSZuD/twUXhFNq6DvCEgKEElf5NdtMsj0aNABI
         LM1s1ub0mQGoh2lrE0F/VZfUrVgjlT864zqZOzoaoFHZsPVzPg8cCu4W5M+iQADwAicr
         DBVA8I8dnaWBar4/uqXeBj2Xudqe3kgnnwgN8QFzpv5Apcr/bExm9sXoKOJPhPhxIqPm
         jn8hLhmeuuLXs6Te2sTCMj3mSdAQ+MzAn9VHarauMvNbKUW9bYvtCNBHsDZ7IG6rHhyt
         ULDQ==
X-Gm-Message-State: ACgBeo1UXFx+zM1r3mRvyclYTUGfdhTP+RLKJXVx1/MMCjBbaWN4wfaP
	PuGA1/9Ymgald5ejIpxoX/iqvbGPCcpGERPs3J8=
X-Google-Smtp-Source: 
 AA6agR46AZ+Ylsfmi9xTkis4rKUsLEWxrbct6gYZXd2rHxnfgTt8qrlWfITnvjcil4SoASyurbMFoutaY0KoK8chpwQ=
X-Received: by 2002:adf:fb03:0:b0:21d:70cb:d6b5 with SMTP id
 c3-20020adffb03000000b0021d70cbd6b5mr9258585wrr.548.1659898799618; Sun, 07
 Aug 2022 11:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220807160629.2112131-1-raj.khem@gmail.com>
 <CA+chaQcHJX84EmQgpRD3S+LS3ohPXSkET5u=drA1tU7RaPy6vw@mail.gmail.com>
 <CAMKF1spY8cyJSv1jDWF4taAn-dYGXKa==8jUML=z34qkqd+b9g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spY8cyJSv1jDWF4taAn-dYGXKa==8jUML=z34qkqd+b9g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 7 Aug 2022 20:59:14 +0200
Message-ID: 
 <CA+chaQe3DB+oQokk5TNpxiyBWg60zP6DAV7m4zRCM7M=E7Bj8Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] binutils: Upgrade to 2.39 release
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005080d905e5ab4ee7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 19:00:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169004

--0000000000005080d905e5ab4ee7
Content-Type: text/plain; charset="UTF-8"

Thanks Khem,

v3 builds fine with gprofng enabled again.

Tested-by: Martin Jansa <Martin.Jansa@gmail.com>

any idea why binutils-2.39 v3 version isn't visible on patchwork yet?
https://patchwork.yoctoproject.org/project/oe-core/list/?series=&submitter=&state=*&q=binutils&archive=&delegate=
it's almost 1,5 hour since you sent it to ML
https://lists.openembedded.org/g/openembedded-core/message/169001

Usually patchwork doesn't have such long delay (v2 was there shortly after
I've noticed it in my mbox).

On Sun, Aug 7, 2022 at 7:37 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Aug 7, 2022 at 9:41 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> >
> >
> > On Sun, Aug 7, 2022 at 6:06 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Details of changes [1]
> >>
> >> [1] https://sourceware.org/pipermail/binutils/2022-August/122246.html
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >> v2: Remove trailing .0 from PV
> >>
> >>  meta/conf/distro/include/tcmode-default.inc   |    2 +-
> >>  .../{binutils-2.38.inc => binutils-2.39.inc}  |   26 +-
> >>  ....38.bb => binutils-cross-canadian_2.39.bb} |    0
> >>  ...38.bb => binutils-cross-testsuite_2.39.bb} |    0
> >>  ...s-cross_2.38.bb => binutils-cross_2.39.bb} |    0
> >>  ...ssdk_2.38.bb => binutils-crosssdk_2.39.bb} |    0
> >>  ...s-crosssdk-Generate-relocatable-SDKs.patch |    2 +-
> >>  ...o-not-generate-linker-script-directo.patch |    2 +-
> >>  ...dk-Search-for-alternative-ld.so.conf.patch |   16 +-
> >>  ...004-Point-scripts-location-to-libdir.patch |   10 +-
> >>  ...tro-compiler-point-to-the-wrong-ins.patch} |    2 +-
> >>  ...system-directories-when-cross-linki.patch} |   42 +-
> >>  ...ct-assembling-for-ppc-wait-mnemonic.patch} |    8 +-
> >>  ...l-2.4.patch => 0008-Use-libtool-2.4.patch} | 2131 ++++++++---------
> >>  ...-in-libtool-when-sysroot-is-enabled.patch} |    2 +-
> >>  ...> 0010-sync-with-OE-libtool-changes.patch} |    2 +-
> >>  ...r-clang-before-checking-gcc-version.patch} |   10 +-
> >>  ...RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} |   17 +-
> >>  .../0013-Avoid-as-info-race-condition.patch   |   75 -
> >>  .../binutils/0014-CVE-2019-1010204.patch      |   49 -
> >>  .../{binutils_2.38.bb => binutils_2.39.bb}    |    0
> >>  21 files changed, 1129 insertions(+), 1267 deletions(-)
> >>  rename meta/recipes-devtools/binutils/{binutils-2.38.inc =>
> binutils-2.39.inc} (60%)
> >>  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.38.bb
> => binutils-cross-canadian_2.39.bb} (100%)
> >>  rename meta/recipes-devtools/binutils/{
> binutils-cross-testsuite_2.38.bb => binutils-cross-testsuite_2.39.bb}
> (100%)
> >>  rename meta/recipes-devtools/binutils/{binutils-cross_2.38.bb =>
> binutils-cross_2.39.bb} (100%)
> >>  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.38.bb =>
> binutils-crosssdk_2.39.bb} (100%)
> >>  rename
> meta/recipes-devtools/binutils/binutils/{0006-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
> => 0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch} (94%)
> >>  rename
> meta/recipes-devtools/binutils/binutils/{0007-warn-for-uses-of-system-directories-when-cross-linki.patch
> => 0006-warn-for-uses-of-system-directories-when-cross-linki.patch} (91%)
> >>  rename
> meta/recipes-devtools/binutils/binutils/{0008-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
> => 0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch} (85%)
> >>  rename
> meta/recipes-devtools/binutils/binutils/{0009-Use-libtool-2.4.patch =>
> 0008-Use-libtool-2.4.patch} (95%)
> >>  rename
> meta/recipes-devtools/binutils/binutils/{0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
> => 0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch} (96%)
> >>  rename
> meta/recipes-devtools/binutils/binutils/{0011-sync-with-OE-libtool-changes.patch
> => 0010-sync-with-OE-libtool-changes.patch} (97%)
> >>  rename
> meta/recipes-devtools/binutils/binutils/{0012-Check-for-clang-before-checking-gcc-version.patch
> => 0011-Check-for-clang-before-checking-gcc-version.patch} (84%)
> >>  rename
> meta/recipes-devtools/binutils/binutils/{0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
> => 0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} (70%)
> >>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/0013-Avoid-as-info-race-condition.patch
> >>  delete mode 100644
> meta/recipes-devtools/binutils/binutils/0014-CVE-2019-1010204.patch
> >>  rename meta/recipes-devtools/binutils/{binutils_2.38.bb =>
> binutils_2.39.bb} (100%)
> >
> >
> > I'm seeing bunch of libtool erros with this applied, see:
> > http://errors.yoctoproject.org/Errors/Details/664878/
>
> yes. gprofng is a new tool and I have forgotten to upgrade it to use
> libtool 2.4 since I have it disabed in my testing. I have done so now
> and sent a v3. Try it out.
>

--0000000000005080d905e5ab4ee7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Khem,<div><br></div><div>v3 builds fine with gprofn=
g enabled again.</div><div><br></div><div>Tested-by:=C2=A0Martin Jansa &lt;=
<a href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;</d=
iv><div><br></div><div>any idea why binutils-2.39 v3 version isn&#39;t visi=
ble on patchwork yet?</div><div><a href=3D"https://patchwork.yoctoproject.o=
rg/project/oe-core/list/?series=3D&amp;submitter=3D&amp;state=3D*&amp;q=3Db=
inutils&amp;archive=3D&amp;delegate=3D">https://patchwork.yoctoproject.org/=
project/oe-core/list/?series=3D&amp;submitter=3D&amp;state=3D*&amp;q=3Dbinu=
tils&amp;archive=3D&amp;delegate=3D</a></div><div>it&#39;s almost 1,5 hour =
since you sent it=C2=A0to ML <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/169001">https://lists.openembedded.org/g/openembedd=
ed-core/message/169001</a><br></div><div><br></div><div>Usually patchwork d=
oesn&#39;t have such long delay (v2 was there shortly after I&#39;ve notice=
d it in my mbox).</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Sun, Aug 7, 2022 at 7:37 PM Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Aug 7, 2022 at 9:4=
1 AM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_=
blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Sun, Aug 7, 2022 at 6:06 PM Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Details of changes [1]<br>
&gt;&gt;<br>
&gt;&gt; [1] <a href=3D"https://sourceware.org/pipermail/binutils/2022-Augu=
st/122246.html" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org=
/pipermail/binutils/2022-August/122246.html</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; v2: Remove trailing .0 from PV<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=A0|=C2=
=A0 =C2=A0 2 +-<br>
&gt;&gt;=C2=A0 .../{binutils-2.38.inc =3D&gt; binutils-2.39.inc}=C2=A0 |=C2=
=A0 =C2=A026 +-<br>
&gt;&gt;=C2=A0 ....<a href=3D"http://38.bb" rel=3D"noreferrer" target=3D"_b=
lank">38.bb</a> =3D&gt; <a href=3D"http://binutils-cross-canadian_2.39.bb" =
rel=3D"noreferrer" target=3D"_blank">binutils-cross-canadian_2.39.bb</a>} |=
=C2=A0 =C2=A0 0<br>
&gt;&gt;=C2=A0 ...<a href=3D"http://38.bb" rel=3D"noreferrer" target=3D"_bl=
ank">38.bb</a> =3D&gt; <a href=3D"http://binutils-cross-testsuite_2.39.bb" =
rel=3D"noreferrer" target=3D"_blank">binutils-cross-testsuite_2.39.bb</a>} =
|=C2=A0 =C2=A0 0<br>
&gt;&gt;=C2=A0 ...<a href=3D"http://s-cross_2.38.bb" rel=3D"noreferrer" tar=
get=3D"_blank">s-cross_2.38.bb</a> =3D&gt; <a href=3D"http://binutils-cross=
_2.39.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.39.bb</a>} =
|=C2=A0 =C2=A0 0<br>
&gt;&gt;=C2=A0 ...<a href=3D"http://ssdk_2.38.bb" rel=3D"noreferrer" target=
=3D"_blank">ssdk_2.38.bb</a> =3D&gt; <a href=3D"http://binutils-crosssdk_2.=
39.bb" rel=3D"noreferrer" target=3D"_blank">binutils-crosssdk_2.39.bb</a>} =
|=C2=A0 =C2=A0 0<br>
&gt;&gt;=C2=A0 ...s-crosssdk-Generate-relocatable-SDKs.patch |=C2=A0 =C2=A0=
 2 +-<br>
&gt;&gt;=C2=A0 ...o-not-generate-linker-script-directo.patch |=C2=A0 =C2=A0=
 2 +-<br>
&gt;&gt;=C2=A0 ...dk-Search-for-alternative-ld.so.conf.patch |=C2=A0 =C2=A0=
16 +-<br>
&gt;&gt;=C2=A0 ...004-Point-scripts-location-to-libdir.patch |=C2=A0 =C2=A0=
10 +-<br>
&gt;&gt;=C2=A0 ...tro-compiler-point-to-the-wrong-ins.patch} |=C2=A0 =C2=A0=
 2 +-<br>
&gt;&gt;=C2=A0 ...system-directories-when-cross-linki.patch} |=C2=A0 =C2=A0=
42 +-<br>
&gt;&gt;=C2=A0 ...ct-assembling-for-ppc-wait-mnemonic.patch} |=C2=A0 =C2=A0=
 8 +-<br>
&gt;&gt;=C2=A0 ...l-2.4.patch =3D&gt; 0008-Use-libtool-2.4.patch} | 2131 ++=
++++++---------<br>
&gt;&gt;=C2=A0 ...-in-libtool-when-sysroot-is-enabled.patch} |=C2=A0 =C2=A0=
 2 +-<br>
&gt;&gt;=C2=A0 ...&gt; 0010-sync-with-OE-libtool-changes.patch} |=C2=A0 =C2=
=A0 2 +-<br>
&gt;&gt;=C2=A0 ...r-clang-before-checking-gcc-version.patch} |=C2=A0 =C2=A0=
10 +-<br>
&gt;&gt;=C2=A0 ...RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} |=C2=A0 =C2=A0=
17 +-<br>
&gt;&gt;=C2=A0 .../0013-Avoid-as-info-race-condition.patch=C2=A0 =C2=A0|=C2=
=A0 =C2=A075 -<br>
&gt;&gt;=C2=A0 .../binutils/0014-CVE-2019-1010204.patch=C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A049 -<br>
&gt;&gt;=C2=A0 .../{<a href=3D"http://binutils_2.38.bb" rel=3D"noreferrer" =
target=3D"_blank">binutils_2.38.bb</a> =3D&gt; <a href=3D"http://binutils_2=
.39.bb" rel=3D"noreferrer" target=3D"_blank">binutils_2.39.bb</a>}=C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 0<br>
&gt;&gt;=C2=A0 21 files changed, 1129 insertions(+), 1267 deletions(-)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/binutils/{binutils-2.38.inc =3D=
&gt; binutils-2.39.inc} (60%)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/binutils/{<a href=3D"http://bin=
utils-cross-canadian_2.38.bb" rel=3D"noreferrer" target=3D"_blank">binutils=
-cross-canadian_2.38.bb</a> =3D&gt; <a href=3D"http://binutils-cross-canadi=
an_2.39.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross-canadian_2.=
39.bb</a>} (100%)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/binutils/{<a href=3D"http://bin=
utils-cross-testsuite_2.38.bb" rel=3D"noreferrer" target=3D"_blank">binutil=
s-cross-testsuite_2.38.bb</a> =3D&gt; <a href=3D"http://binutils-cross-test=
suite_2.39.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross-testsuit=
e_2.39.bb</a>} (100%)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/binutils/{<a href=3D"http://bin=
utils-cross_2.38.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross_2.=
38.bb</a> =3D&gt; <a href=3D"http://binutils-cross_2.39.bb" rel=3D"noreferr=
er" target=3D"_blank">binutils-cross_2.39.bb</a>} (100%)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/binutils/{<a href=3D"http://bin=
utils-crosssdk_2.38.bb" rel=3D"noreferrer" target=3D"_blank">binutils-cross=
sdk_2.38.bb</a> =3D&gt; <a href=3D"http://binutils-crosssdk_2.39.bb" rel=3D=
"noreferrer" target=3D"_blank">binutils-crosssdk_2.39.bb</a>} (100%)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/binutils/binutils/{0006-don-t-l=
et-the-distro-compiler-point-to-the-wrong-ins.patch =3D&gt; 0005-don-t-let-=
the-distro-compiler-point-to-the-wrong-ins.patch} (94%)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/binutils/binutils/{0007-warn-fo=
r-uses-of-system-directories-when-cross-linki.patch =3D&gt; 0006-warn-for-u=
ses-of-system-directories-when-cross-linki.patch} (91%)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/binutils/binutils/{0008-fix-the=
-incorrect-assembling-for-ppc-wait-mnemonic.patch =3D&gt; 0007-fix-the-inco=
rrect-assembling-for-ppc-wait-mnemonic.patch} (85%)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/binutils/binutils/{0009-Use-lib=
tool-2.4.patch =3D&gt; 0008-Use-libtool-2.4.patch} (95%)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/binutils/binutils/{0010-Fix-rpa=
th-in-libtool-when-sysroot-is-enabled.patch =3D&gt; 0009-Fix-rpath-in-libto=
ol-when-sysroot-is-enabled.patch} (96%)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/binutils/binutils/{0011-sync-wi=
th-OE-libtool-changes.patch =3D&gt; 0010-sync-with-OE-libtool-changes.patch=
} (97%)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/binutils/binutils/{0012-Check-f=
or-clang-before-checking-gcc-version.patch =3D&gt; 0011-Check-for-clang-bef=
ore-checking-gcc-version.patch} (84%)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/binutils/binutils/{0005-Only-ge=
nerate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch =3D&gt; 0012-Only-gener=
ate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} (70%)<br>
&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/binutils/binutils/0=
013-Avoid-as-info-race-condition.patch<br>
&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/binutils/binutils/0=
014-CVE-2019-1010204.patch<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/binutils/{<a href=3D"http://bin=
utils_2.38.bb" rel=3D"noreferrer" target=3D"_blank">binutils_2.38.bb</a> =
=3D&gt; <a href=3D"http://binutils_2.39.bb" rel=3D"noreferrer" target=3D"_b=
lank">binutils_2.39.bb</a>} (100%)<br>
&gt;<br>
&gt;<br>
&gt; I&#39;m seeing bunch of libtool erros with this applied, see:<br>
&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/664878/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Det=
ails/664878/</a><br>
<br>
yes. gprofng is a new tool and I have forgotten to upgrade it to use<br>
libtool 2.4 since I have it disabed in my testing. I have done so now<br>
and sent a v3. Try it out.<br>
</blockquote></div>

--0000000000005080d905e5ab4ee7--

