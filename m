Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EACC43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 02:59:32 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.1779.1658372369736486411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 19:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kJ7xFLMs;
 spf=pass (domain: gmail.com, ip: 209.85.222.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id b25so402810qka.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 19:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hq8axFLCnOrrvuiFyILYnpVQNcguRR9712pEFwdfCSI=;
        b=kJ7xFLMs7/t8vNxh8CDtMcOzgH7/T1piR0s0jh7hCpoyaB/FdeuNecK+kq+3GCJJo5
         ScZyn9TQcg7CvV4fZyjrOv9a5tDda2MpoQUZckX9eXqEn8pBqgiBY9x92KBlm+7eC0wL
         KGEz9UQ/X3kjE/4OoEVg5GKgCTj4DsdF4+u0U897jhdae/k9460j08eGTdHmWpkHrE/r
         E3zuCDnbWq0VUZzFRDAEm1ZnEC/4qevVfHMSIPDOylJa36mSFTukQCqal4qNvoKVs4gH
         SOYfqZiE4GR2fv9jVje6xMZZfclJr/Zleb8H3mvFP7+tkEv4gUBsIu9AT52kRtEkFqz0
         ZNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hq8axFLCnOrrvuiFyILYnpVQNcguRR9712pEFwdfCSI=;
        b=fysYGGkWvOGThl7NJAGjDBkUMyClHOdLJBy91qvD8QkgtSxrHnBjSE+H798QCWsBnI
         34s3jih8b7XWhssrrUH79McIXWC7D6w4F6HfKWS0v4kyv2HBYGPWBFyRHC2HVp67VgZy
         +Do3OSdYUNejgKj66J0NrOyAZCus7QmMfo0M1hnwJCzEtTK9robEz/UETHhCZ3QohOgn
         do4hiFqV3J1rj3zDX4nQTLRoJEpZg7vRdTF4QmAbwjg9lUa84zOnBq4IabhoZWb0npws
         2ZePahJyAPluIHKrOBTVL6pjE/Wv+s0UCLlZx0aK1cSFIti5TEF+ITqN2eEYAD7rcPKt
         M+xg==
X-Gm-Message-State: AJIora+TEeO8OOsrQrz7hGXieUnLDC/5rBk9DyQQ8X8tCnQOPXOKxMfB
	4l1zxtW6E6zyDSOpkrxlEKKFA6zceK8dvmVlFjTsr/fxzD8=
X-Google-Smtp-Source: 
 AGRyM1tisTPwML6dxwgR1ciMrHccNiOIg6E6Gfc02BG6Nc7Tb1DH0ldTj+USBHXNXU77Fj0S4hGPaXLbLBlU7pgjk9E=
X-Received: by 2002:a05:620a:4007:b0:6b5:d88b:6d42 with SMTP id
 h7-20020a05620a400700b006b5d88b6d42mr16857611qko.180.1658372368658; Wed, 20
 Jul 2022 19:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220721025231.1690-1-Qi.Chen@windriver.com>
In-Reply-To: <20220721025231.1690-1-Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Jul 2022 22:59:18 -0400
Message-ID: 
 <CAMKF1sqY6QX54E6NWF01w5NZzvyvEnLkL58=F5weFtCxUSZ+LA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] glibc: make glibc-dev depend on kernel headers
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f0757a05e447e7c7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Jul 2022 02:59:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168377

--000000000000f0757a05e447e7c7
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 20, 2022 at 10:52 PM Chen Qi <Qi.Chen@windriver.com> wrote:

> The linux kernel headers are necessary for glibc-dev, so
> we need to use RDEPENDS instead of DEV_PKG_DEPENDENCY which
> specifies RRECOMMENDS.
>
> Currently, in case of NO_RECOMMENDATIONS set to "1", linux
> kernel headers are not pulled in by glibc-dev, causing error
> like below when compiling.
>
>   fatal error: linux/errno.h: No such file or directory
>
> The problem could be reproduced by setting NO_RECOMMENDATIONS
> to "1" and then running:
>
>   bitbake core-image-minimal -c populate_sdk
>   bitbake core-image-minimal -c testsdk
>

Are there any build time implications of changing it from a recommendation
to runtime dependency ?


> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc
> b/meta/recipes-core/glibc/glibc-package.inc
> index 278e1b7cc1..7f9e7503a1 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -40,7 +40,7 @@ FILES:${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map
> ${libdir}/libc_pic/*.o"
>  FILES:libsotruss = "${libdir}/audit/sotruss-lib.so"
>  FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
>  FILES:${PN}-dev += "${libdir}/libpthread.a ${libdir}/libdl.a
> ${libdir}/libutil.a ${libdir}/libanl.a ${libdir}/*_nonshared.a
> ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
> -DEV_PKG_DEPENDENCY = "linux-libc-headers-dev"
> +RDEPENDS:${PN}-dev = "linux-libc-headers-dev"
>  FILES:${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
>  FILES:nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd
> ${systemd_system_unitdir}/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
>                ${sysconfdir}/nscd.conf
> ${sysconfdir}/default/volatiles/98_nscd ${localstatedir}/db/nscd"
> --
> 2.37.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168376):
> https://lists.openembedded.org/g/openembedded-core/message/168376
> Mute This Topic: https://lists.openembedded.org/mt/92519738/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f0757a05e447e7c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Jul 20, 2022 at 10:52 PM Chen Qi &lt;<a href=3D"mai=
lto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)">The linux kernel headers are necessary for glibc-dev, so<br>
we need to use RDEPENDS instead of DEV_PKG_DEPENDENCY which<br>
specifies RRECOMMENDS.<br>
<br>
Currently, in case of NO_RECOMMENDATIONS set to &quot;1&quot;, linux<br>
kernel headers are not pulled in by glibc-dev, causing error<br>
like below when compiling.<br>
<br>
=C2=A0 fatal error: linux/errno.h: No such file or directory<br>
<br>
The problem could be reproduced by setting NO_RECOMMENDATIONS<br>
to &quot;1&quot; and then running:<br>
<br>
=C2=A0 bitbake core-image-minimal -c populate_sdk<br>
=C2=A0 bitbake core-image-minimal -c testsdk<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Are there any bu=
ild time implications of changing it from a recommendation to runtime depen=
dency ?=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-s=
tyle:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc-package.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/=
glibc/glibc-package.inc<br>
index 278e1b7cc1..7f9e7503a1 100644<br>
--- a/meta/recipes-core/glibc/glibc-package.inc<br>
+++ b/meta/recipes-core/glibc/glibc-package.inc<br>
@@ -40,7 +40,7 @@ FILES:${PN}-pic =3D &quot;${libdir}/*_pic.a ${libdir}/*_p=
ic.map ${libdir}/libc_pic/*.o&quot;<br>
=C2=A0FILES:libsotruss =3D &quot;${libdir}/audit/sotruss-lib.so&quot;<br>
=C2=A0FILES_SOLIBSDEV =3D &quot;${libdir}/lib*${SOLIBSDEV}&quot;<br>
=C2=A0FILES:${PN}-dev +=3D &quot;${libdir}/libpthread.a ${libdir}/libdl.a $=
{libdir}/libutil.a ${libdir}/libanl.a ${libdir}/*_nonshared.a ${base_libdir=
}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal&quot;<br>
-DEV_PKG_DEPENDENCY =3D &quot;linux-libc-headers-dev&quot;<br>
+RDEPENDS:${PN}-dev =3D &quot;linux-libc-headers-dev&quot;<br>
=C2=A0FILES:${PN}-staticdev +=3D &quot;${libdir}/*.a ${base_libdir}/*.a&quo=
t;<br>
=C2=A0FILES:nscd =3D &quot;${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${sys=
temd_system_unitdir}/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}/nscd.c=
onf ${sysconfdir}/default/volatiles/98_nscd ${localstatedir}/db/nscd&quot;<=
br>
-- <br>
2.37.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#168376): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/168376" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/168376</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92519738/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92519738/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f0757a05e447e7c7--

