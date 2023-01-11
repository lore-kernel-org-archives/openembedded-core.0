Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60929C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 15:49:11 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.web10.27203.1673452146847743311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 07:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cEVwxaZK;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: kergoth@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id d66so3700383vsd.9
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 07:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MJEpw+WFMQhrb7B26OVdBvAPJyWeKlsiROip4ACcosA=;
        b=cEVwxaZK5lYZCrMlD1fhkAL3J0jdJawgGey5oxZ8gv6AlTBpnWtQPf5/QRqkknE0tE
         O2k09ccOlFfd5WC/5qh1zqcG74FdOJizNPro50C1rx/l0S/UaRVzxTWnkaycy+f7Jy17
         +tS0NtNm2oLGCy/Qv0/k153WsFnql9lBR7oriILnX4X571PdhqHMTVQB/sx92yU0LDa3
         mSalqRlTNZ/1B2Kp4QJD08j+yv5hdMdR2qW5jJ6izUyz7dAxSVNHVLE5L3mPxM8kgnKw
         PSynWh9k9tBXnI9cVvgmTZ0keOyfenaZKWwubUsKCbgqDy5qCv4UflobOI1iQqpH99jv
         A4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJEpw+WFMQhrb7B26OVdBvAPJyWeKlsiROip4ACcosA=;
        b=PWfCp2jW5c6se7L6SqmiuM03GcqLzjQPN9kzJ2OraUPKqflHDF4kFPhmB5Hi6BjAyR
         ZaHldbR/KcStgfPThtTGMeFmk4I+pr2JIvhCv1iFZmj1b/sGgKS+hFTDq4uSJQrxOAnx
         T03k644e//4DnElleTNSjJaXYc1DMwxn6bB+uukfs7sOyUDRWi0LoBIN/NBMISa+GGQN
         RaHXPemQo9Eba9OPZksi8ERVYtNIpuTrXF9rxn8LZBEX5vYguILrGzRZt/WDNsrTN8zb
         4IW09mqMyljl8yRZ38SjTrm25j60S+g6zIRCupKzuuhq6uUYEVQ7Tc/NIcoyn3rsNEo+
         WwDw==
X-Gm-Message-State: AFqh2kpJK/AGMynhRWl6RupsA7IaxHH/Qfg23zeDA+eIdDl5uOQIsLlQ
	F1b0QXohjCHuzoMBXUyq9jXW3vsQhLuPxAVUahsVIzTajT0=
X-Google-Smtp-Source: AMrXdXtW3iKoe9DybUVAm5G8/wZ1rx7ocXdwGg8jCioxX0TlyWhqe6pkXwgGtccFVD1P2LTIHDr7m/FgaTuyoGWMkO8=
X-Received: by 2002:a05:6102:517:b0:3d0:cb39:7487 with SMTP id
 l23-20020a056102051700b003d0cb397487mr1038409vsa.81.1673452145761; Wed, 11
 Jan 2023 07:49:05 -0800 (PST)
MIME-Version: 1.0
References: <20230111152841.2307746-1-saul.wold@windriver.com>
In-Reply-To: <20230111152841.2307746-1-saul.wold@windriver.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 11 Jan 2023 08:48:54 -0700
Message-ID: <CABcZANm3SeB74ror1_MKQDACkdp9aungymvKCKQy7=Quc-qEUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] at: Change where files are modified
To: Saul Wold <Saul.Wold@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b2622105f1fef04e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 15:49:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175754

--000000000000b2622105f1fef04e
Content-Type: text/plain; charset="UTF-8"

I feel like assuming do_patch is python, even if it is, is less clean than
just using postfuncs.

On Wed, Jan 11, 2023 at 8:29 AM Saul Wold <Saul.Wold@windriver.com> wrote:

> The create_spdx code relies on patched code, if files are changed
> or added during the do_configure phase they will be missed by the
> create_spdx process. So we need to ensure files modifications/additions
> happen in the do_patch phase.
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/recipes-extended/at/at_3.2.5.bb | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/at/at_3.2.5.bb
> b/meta/recipes-extended/at/at_3.2.5.bb
> index 87a436173f1..45700366e0f 100644
> --- a/meta/recipes-extended/at/at_3.2.5.bb
> +++ b/meta/recipes-extended/at/at_3.2.5.bb
> @@ -52,8 +52,12 @@ INITSCRIPT_PARAMS = "defaults"
>
>  SYSTEMD_SERVICE:${PN} = "atd.service"
>
> -do_configure:prepend() {
> -       cp -f ${WORKDIR}/posixtm.[ch] ${S}
> +do_patch:append() {
> +    bb.build.exec_func('copy_posix_files', d)
> +}
> +
> +copy_posix_files() {
> +    cp -f ${WORKDIR}/posixtm.[ch] ${S}
>  }
>
>  do_install () {
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175753):
> https://lists.openembedded.org/g/openembedded-core/message/175753
> Mute This Topic: https://lists.openembedded.org/mt/96201863/3617123
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kergoth@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
Christopher Larson
chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
Principal Software Engineer, Embedded Linux Solutions, Siemens Digital
Industries Software

--000000000000b2622105f1fef04e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I feel like assuming do_patch is python, even if it is, is=
 less clean than just using postfuncs.</div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 11, 2023 at 8:29 AM Saul =
Wold &lt;<a href=3D"mailto:Saul.Wold@windriver.com">Saul.Wold@windriver.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
The create_spdx code relies on patched code, if files are changed<br>
or added during the do_configure phase they will be missed by the<br>
create_spdx process. So we need to ensure files modifications/additions<br>
happen in the do_patch phase.<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:saul.wold@windriver.com" tar=
get=3D"_blank">saul.wold@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/at/<a href=3D"http://at_3.2.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">at_3.2.5.bb</a> | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/at/<a href=3D"http://at_3.2.5.bb" rel=3D=
"noreferrer" target=3D"_blank">at_3.2.5.bb</a> b/meta/recipes-extended/at/<=
a href=3D"http://at_3.2.5.bb" rel=3D"noreferrer" target=3D"_blank">at_3.2.5=
.bb</a><br>
index 87a436173f1..45700366e0f 100644<br>
--- a/meta/recipes-extended/at/<a href=3D"http://at_3.2.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">at_3.2.5.bb</a><br>
+++ b/meta/recipes-extended/at/<a href=3D"http://at_3.2.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">at_3.2.5.bb</a><br>
@@ -52,8 +52,12 @@ INITSCRIPT_PARAMS =3D &quot;defaults&quot;<br>
<br>
=C2=A0SYSTEMD_SERVICE:${PN} =3D &quot;atd.service&quot;<br>
<br>
-do_configure:prepend() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -f ${WORKDIR}/posixtm.[ch] ${S}<br>
+do_patch:append() {<br>
+=C2=A0 =C2=A0 bb.build.exec_func(&#39;copy_posix_files&#39;, d)<br>
+}<br>
+<br>
+copy_posix_files() {<br>
+=C2=A0 =C2=A0 cp -f ${WORKDIR}/posixtm.[ch] ${S}<br>
=C2=A0}<br>
<br>
=C2=A0do_install () {<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175753): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175753" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/175753</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96201863/3617=
123" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96201863/3617123</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:kergoth@gmail.com" target=
=3D"_blank">kergoth@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><font color=3D=
"#333333">Christopher Larson<br><a>chris_larson@mentor.com</a>,=C2=A0<a>chr=
is.larson@siemens.com</a>,=C2=A0<a>kergoth@gmail.com</a><br>Principal Softw=
are Engineer,=C2=A0Embedded Linux Solutions,=C2=A0Siemens Digital Industrie=
s Software</font><br></div></div></div>

--000000000000b2622105f1fef04e--

