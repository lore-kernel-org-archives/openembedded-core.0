Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53DEC433F5
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 15:22:12 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web08.13238.1637853731807214518
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 07:22:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HW0xMunl;
 spf=pass (domain: linaro.org, ip: 209.85.166.175,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-il1-f175.google.com with SMTP id e8so6151760ilu.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 07:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RCjPAjqQgiUqQuO0KFzBKWl5irA9UUTnzzrpNTabn/0=;
        b=HW0xMunl61WTYnGz5z6jH67SBEQ6sjuQbzlOSGwOm5FGY0bOJ1xccQH7mEEX5vPSlV
         3+Q2Fp2ul+KdjzyPtktKZFvRSxMvxy1DV51nPhIymkZ8ISnTGhucREKigX2EuEUGTM2X
         Z4mRU1B+fqEu2piegJfQa37UZCB1E45dGHsUK092SPwk8H+pkSFwFJnLj+yAUz6V8QsZ
         jh69jSntfmkhtPhzV2DSnfK8ZUPsppSdmj1FzCy60ZnN/jM1WlPMJN/ELtNogHavZgCB
         Vpq1jsvSPaa6KXBbvXLs5wTW7ataOihcVUsD1RzFfKL8LaIiWtAFoFKK8O73nbphbTpf
         HFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RCjPAjqQgiUqQuO0KFzBKWl5irA9UUTnzzrpNTabn/0=;
        b=Ez3JzhwsvOVtzslqNd1nzEqZbcCMxVBzCa0cQIb+htTxcS7bgdmu2l1bNsF5iVa0VM
         K1VaSlBcVbe6uXxmmz1136WeGLYCnPU8LeXGYSVKLZMzbvqj7KaEPxYyVxiL2grUQDD7
         Jcy2zY+T5rJ0HzLY6gzQVMffcK6Q1Pgny7ILHlSQwiGPjS1rrZZ25GmOA0a/fPXBDZsT
         efBfXgwThDle6G9xElfcnLdGWoe3ykmoNMZcTtfRPyht9nsXM037WNbDWtEO4cfiFRaT
         4G0JX9k9DERo6sciyafJGkJJrXMLFnnwVaIqYA7LDWcGENFdYb9LCg1PbCraKWUFBuvK
         Kjnw==
X-Gm-Message-State: AOAM530llG14xXsxVOldoaAeOUsrQVRaBrgm1FK0GpRA433GsIPaVHU1
	quHG9+NxPwZhHFTrieksP4nPOc75F0UINM7+0Y2wzQ==
X-Google-Smtp-Source: 
 ABdhPJyAo6tIfFpsfNjZFRJJTmC7pynFtYX27nm7h+oOoT3NCqUJV75mxzvD9kkZBDo0h8iiPaeZgMXxY/H0ERW67II=
X-Received: by 2002:a05:6e02:ee7:: with SMTP id
 j7mr24698757ilk.15.1637853731038;
 Thu, 25 Nov 2021 07:22:11 -0800 (PST)
MIME-Version: 1.0
References: <1617235191-37594-1-git-send-email-denis@denix.org>
In-Reply-To: <1617235191-37594-1-git-send-email-denis@denix.org>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 25 Nov 2021 16:21:59 +0100
Message-ID: 
 <CAP71WjwizBME7VsK+Mpy=mysN_=ViykHhpJ0owgAb_2wH=cnXA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: pass CROSS_COMPILE to
 configure and build
To: Denys Dmytriyenko <denis@denix.org>, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>, Nishanth Menon <nm@ti.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000d541c705d19e89fb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 15:22:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158780

--000000000000d541c705d19e89fb
Content-Type: text/plain; charset="UTF-8"

Bruce, Steve,


On Thu, Apr 1, 2021 at 2:00 AM Denys Dmytriyenko <denis@denix.org> wrote:

> Fixes:
> |   CALL
> /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/scripts/checksyscalls.sh
> |   CALL
> /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/scripts/atomic/check-atomics.sh
> |   LDS     arch/arm64/kernel/vdso/vdso.lds
> |   CC      arch/arm64/kernel/vdso/vgettimeofday.o
> |   AS      arch/arm64/kernel/vdso/note.o
> |   AS      arch/arm64/kernel/vdso/sigreturn.o
> |   LD      arch/arm64/kernel/vdso/vdso.so.dbg
> |   VDSOSYM include/generated/vdso-offsets.h
> |   OBJCOPY arch/arm64/kernel/vdso/vdso.so
> | objcopy: Unable to recognise the format of the input file
> `arch/arm64/kernel/vdso/vdso.so.dbg'
> |
> /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/arch/arm64/kernel/vdso/Makefile:61:
> recipe for target 'arch/arm64/kernel/vdso/vdso.so' failed
>

One of our meta-qcom users hit this issue with dunfell
https://github.com/ndechesne/meta-qcom/issues/394

Backporting this patch to dunfell seems the right thing to do. The patch
applies cleanly and it fixes the problem for me.

e.g.
ddad8183490c (make-mod-scripts: pass CROSS_COMPILE to configure and build)

Feel free to add
Reported-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>


> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> Cc: Nishanth Menon <nm@ti.com>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 92ffa47..b2b50b9 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -19,7 +19,7 @@ DEPENDS += "bc-native bison-native"
>  DEPENDS += "gmp-native"
>
>  EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> HOSTCPP="${BUILD_CPP}""
> -EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS}
> ${BUILD_LDFLAGS}""
> +EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS}
> ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
>
>  # Build some host tools under work-shared.  CC, LD, and AR are probably
>  # not used, but this is the historical way of invoking "make scripts".
> --
> 2.7.4
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#150130):
> https://lists.openembedded.org/g/openembedded-core/message/150130
> Mute This Topic: https://lists.openembedded.org/mt/81764668/1279857
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> nicolas.dechesne@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d541c705d19e89fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Bruce, Steve,=C2=A0<div><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Apr 1, 2021 at 2:00 AM Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix=
.org" target=3D"_blank">denis@denix.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Fixes:<br>
|=C2=A0 =C2=A0CALL=C2=A0 =C2=A0 /OE/poky-master/build/tmp/work-shared/qemua=
rm64/kernel-source/scripts/checksyscalls.sh<br>
|=C2=A0 =C2=A0CALL=C2=A0 =C2=A0 /OE/poky-master/build/tmp/work-shared/qemua=
rm64/kernel-source/scripts/atomic/check-atomics.sh<br>
|=C2=A0 =C2=A0LDS=C2=A0 =C2=A0 =C2=A0arch/arm64/kernel/vdso/vdso.lds<br>
|=C2=A0 =C2=A0CC=C2=A0 =C2=A0 =C2=A0 arch/arm64/kernel/vdso/vgettimeofday.o=
<br>
|=C2=A0 =C2=A0AS=C2=A0 =C2=A0 =C2=A0 arch/arm64/kernel/vdso/note.o<br>
|=C2=A0 =C2=A0AS=C2=A0 =C2=A0 =C2=A0 arch/arm64/kernel/vdso/sigreturn.o<br>
|=C2=A0 =C2=A0LD=C2=A0 =C2=A0 =C2=A0 arch/arm64/kernel/vdso/vdso.so.dbg<br>
|=C2=A0 =C2=A0VDSOSYM include/generated/vdso-offsets.h<br>
|=C2=A0 =C2=A0OBJCOPY arch/arm64/kernel/vdso/vdso.so<br>
| objcopy: Unable to recognise the format of the input file `arch/arm64/ker=
nel/vdso/vdso.so.dbg&#39;<br>
| /OE/poky-master/build/tmp/work-shared/qemuarm64/kernel-source/arch/arm64/=
kernel/vdso/Makefile:61: recipe for target &#39;arch/arm64/kernel/vdso/vdso=
.so&#39; failed<br></blockquote><div><br></div><div>One of our meta-qcom us=
ers hit this issue with dunfell=C2=A0</div><div><a href=3D"https://github.c=
om/ndechesne/meta-qcom/issues/394" target=3D"_blank">https://github.com/nde=
chesne/meta-qcom/issues/394</a></div><div><br></div><div>Backporting this p=
atch to dunfell seems the right thing to do. The patch applies cleanly and =
it fixes the problem for me.=C2=A0</div><div><br></div><div>e.g.</div><div>=
ddad8183490c (make-mod-scripts: pass CROSS_COMPILE to configure and build)<=
br></div><div><br></div><div>Feel free to add</div><div>Reported-by:=C2=A0D=
aniel Thompson &lt;<a href=3D"mailto:daniel.thompson@linaro.org">daniel.tho=
mpson@linaro.org</a>&gt;</div><div>Signed-off-by: Nicolas Dechesne &lt;<a h=
ref=3D"mailto:nicolas.dechesne@linaro.org">nicolas.dechesne@linaro.org</a>&=
gt;</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cc: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
Cc: Nishanth Menon &lt;<a href=3D"mailto:nm@ti.com" target=3D"_blank">nm@ti=
.com</a>&gt;<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" tar=
get=3D"_blank">denis@denix.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-scrip=
ts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.bb</a>=
 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mo=
d-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0=
.bb</a> b/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-s=
cripts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.bb=
</a><br>
index 92ffa47..b2b50b9 100644<br>
--- a/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-scrip=
ts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.bb</a>=
<br>
+++ b/meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-scrip=
ts_1.0.bb" rel=3D"noreferrer" target=3D"_blank">make-mod-scripts_1.0.bb</a>=
<br>
@@ -19,7 +19,7 @@ DEPENDS +=3D &quot;bc-native bison-native&quot;<br>
=C2=A0DEPENDS +=3D &quot;gmp-native&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE =3D &quot; HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${=
BUILD_LDFLAGS}&quot; HOSTCPP=3D&quot;${BUILD_CPP}&quot;&quot;<br>
-EXTRA_OEMAKE +=3D &quot; HOSTCXX=3D&quot;${BUILD_CXX} ${BUILD_CXXFLAGS} ${=
BUILD_LDFLAGS}&quot;&quot;<br>
+EXTRA_OEMAKE +=3D &quot; HOSTCXX=3D&quot;${BUILD_CXX} ${BUILD_CXXFLAGS} ${=
BUILD_LDFLAGS}&quot; CROSS_COMPILE=3D${TARGET_PREFIX}&quot;<br>
<br>
=C2=A0# Build some host tools under work-shared.=C2=A0 CC, LD, and AR are p=
robably<br>
=C2=A0# not used, but this is the historical way of invoking &quot;make scr=
ipts&quot;.<br>
-- <br>
2.7.4<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#150130): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/150130" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/150130</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/81764668/1279=
857" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/81764668/1279857</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:nicolas.dechesne@linaro.or=
g" target=3D"_blank">nicolas.dechesne@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d541c705d19e89fb--

