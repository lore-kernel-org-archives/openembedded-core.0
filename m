Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F62C4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 06:12:31 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.2587.1668147148520137482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 22:12:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QUFusOOk;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id b9so3450654ljr.5
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 22:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvX/bwolyl92LqIoMEaO1q0/GmlrZMv6s/p8xRKXlI8=;
        b=QUFusOOkNstDDz0+mkDH9I7PZ9xJ+JmELI05JdSD+Xt3RkwPPEW8wmkNCMC+kZ+UvX
         3slXgr31deBtPT3qVnu+ZE0p1Nr4UEwEicz2arfWJl7qqXPwTqmeS2hIXSjOli3J0tQ4
         p9Bx4ukJE5cQ/da/dYDb93WN7t/6ToS2wwIzwIj11iA5zre45LzWRT3VQNgJRReuN4YR
         0F+OaKLcPyscyZtuqDrwjdUWkEfFNUILlGzJGho26b4l4SGglWx4hZSqm3eA0TgOIuyz
         yBqba5mS6WAJoN26PxSIjwKC5s8/Og4a23Y0iRHn3q1OMJzE40ipcOXSYZ+veCPVFWFc
         H/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvX/bwolyl92LqIoMEaO1q0/GmlrZMv6s/p8xRKXlI8=;
        b=3uIJjvQZhnIwKaPPSJTZLD00nxPljfz2g1zIsy21jobeGuVhDxXWAg/z3OVZOBIAoO
         CYZuef83SGkqtY3yF5HdFL3iZx6fgeDmMjMeen38Ee6CEzt156J4rmjDc5dy/+picoSE
         ZhrQX7JFFAoS8zuI+/doLeuoZ1BMjL6hEBzLV0EHHjGL77vmr+wi7b9JYPjlheHyzvoG
         ZWkni9Ep5c1+Vj4te3BdFaewlSw/T3Scp6A+WejKMR+M2dgtlLMapZqVk+kWhxfH4NLM
         wGr7jC7uZX0dL9jh7P9bSxO3iSYXG6aKqllcx8Un27WyhM8ybHR6peCmyoS1XhkdQON/
         nU4Q==
X-Gm-Message-State: ANoB5plrBrb/kgeCEitrMp6serPS8gq+Afmd7xGuN64nlHo3uYNsd++v
	2rLM00/THlReG1fNXTffEmUMCtYNeHwd7iqmRRw=
X-Google-Smtp-Source: AA0mqf62SJl00x8IUBPbtvdk8Gbve2iSh9X+2qvZ92A3DeGwaVMCIt7z4lhSb3kxXFXew42/CY9MarrkCZ4Q3w5cqBg=
X-Received: by 2002:a2e:6d11:0:b0:26f:c081:9aed with SMTP id
 i17-20020a2e6d11000000b0026fc0819aedmr164430ljc.222.1668147146080; Thu, 10
 Nov 2022 22:12:26 -0800 (PST)
MIME-Version: 1.0
References: <20221111031203.106507-1-Qi.Chen@windriver.com>
In-Reply-To: <20221111031203.106507-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Nov 2022 07:12:15 +0100
Message-ID: <CANNYZj9pVWygYiGOB9ouoRZ0xeAG=b1k-rnHJFroSBbYexPuvA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] pango: fix install-vs-shipped QA error
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001346ee05ed2bc678"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 06:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173115

--0000000000001346ee05ed2bc678
Content-Type: text/plain; charset="UTF-8"

This should not be necessary with my latest patch.

Alex

On Fri 11. Nov 2022 at 4.12, Chen Qi <Qi.Chen@windriver.com> wrote:

> In do_install, files are installed in ${libexecdir}, but this
> directory is not listed in FILES:${PN}. This will cause package QA
> error.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-graphics/pango/pango_1.50.11.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/pango/pango_1.50.11.bb
> b/meta/recipes-graphics/pango/pango_1.50.11.bb
> index f545689811..f3714a4750 100644
> --- a/meta/recipes-graphics/pango/pango_1.50.11.bb
> +++ b/meta/recipes-graphics/pango/pango_1.50.11.bb
> @@ -49,7 +49,7 @@ do_install:append() {
>
>  LEAD_SONAME = "libpango-1.0*"
>
> -FILES:${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS}"
> +FILES:${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS} ${libexecdir}"
>
>  RDEPENDS:${PN}-ptest += "cantarell-fonts"
>  RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us"
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173113):
> https://lists.openembedded.org/g/openembedded-core/message/173113
> Mute This Topic: https://lists.openembedded.org/mt/94951807/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000001346ee05ed2bc678
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This should not be necessary with my latest patch.=C2=A0<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 11. Nov =
2022 at 4.12, Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@=
windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;padding-left:1ex;border-left-color:rgb(204,204,204)">In do_install, files=
 are installed in ${libexecdir}, but this<br>
directory is not listed in FILES:${PN}. This will cause package QA<br>
error.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/pango/<a href=3D"http://pango_1.50.11.bb" rel=
=3D"noreferrer" target=3D"_blank">pango_1.50.11.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/pango/<a href=3D"http://pango_1.50.11.bb=
" rel=3D"noreferrer" target=3D"_blank">pango_1.50.11.bb</a> b/meta/recipes-=
graphics/pango/<a href=3D"http://pango_1.50.11.bb" rel=3D"noreferrer" targe=
t=3D"_blank">pango_1.50.11.bb</a><br>
index f545689811..f3714a4750 100644<br>
--- a/meta/recipes-graphics/pango/<a href=3D"http://pango_1.50.11.bb" rel=
=3D"noreferrer" target=3D"_blank">pango_1.50.11.bb</a><br>
+++ b/meta/recipes-graphics/pango/<a href=3D"http://pango_1.50.11.bb" rel=
=3D"noreferrer" target=3D"_blank">pango_1.50.11.bb</a><br>
@@ -49,7 +49,7 @@ do_install:append() {<br>
<br>
=C2=A0LEAD_SONAME =3D &quot;libpango-1.0*&quot;<br>
<br>
-FILES:${PN} =3D &quot;${bindir}/* ${libdir}/libpango*${SOLIBS}&quot;<br>
+FILES:${PN} =3D &quot;${bindir}/* ${libdir}/libpango*${SOLIBS} ${libexecdi=
r}&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot;cantarell-fonts&quot;<br>
=C2=A0RDEPENDS:${PN}-ptest:append:libc-glibc =3D &quot; locale-base-en-us&q=
uot;<br>
-- <br>
2.37.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#173113): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/173113" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/173113</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94951807/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94951807/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000001346ee05ed2bc678--

