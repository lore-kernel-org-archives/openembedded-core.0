Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48702EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 10:10:46 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.4933.1689588641040307983
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 03:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VRh+KjdT;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-579e212668fso61174457b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689588640; x=1692180640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5gerHLJrxHtQhsn5UsAPLH5pKg7o4RZLyKMpi4xHDlQ=;
        b=VRh+KjdTsXTECVBkWYaIkHRshx/1UulOw4Q0pe6M8Ql0VwN5AEWUB+9g8MCsArp1JL
         RQDgcaPcB99Jy+jpV1QXm0WzUQkMcJLUvIgSOgPibuTWIfsf5h0/btElunstP+heyvUR
         kcrjzZSK1L9eAzV2KBNtDP288XQ1gWssyM+BZfq6kWmx67a0zlHM17j7OHyMBThQShi2
         CKSXin5lIGjlcTsVbumZ/12tj/qRLRaSdCkJlcM6UECDmebmxdVTUns2cyEERTz18lIh
         O1lEx/VDnl9T5VgIhZIaPo0mwyoLAqWXHsMVpB5NQe7VhRlGqxz36tN1bukrv2sEd6MI
         +smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689588640; x=1692180640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gerHLJrxHtQhsn5UsAPLH5pKg7o4RZLyKMpi4xHDlQ=;
        b=bCBU9mkAg00ViW8DkYyvWEjgxBRtLKDIBDa5V/yEXzKiQlJUgLvq56h1vmUkcBtgE2
         9VqQIFGx+V/l3QeRGWwh0tbmvC5O0qzn+/Iwb4RQ9H752cN/NlUuKf8W4oyBP8CmLYIa
         5xciGNgl0zaAPJVtp93zuYKMA/ZowYYkTxVQkbX5XMgcVU2TsDNYW15LbFkXGgAeu72a
         f4QRZ9xI6+ncaPXGc9RC59ZwKLBrdKKs35hLz/2jvo4O+ObPRJiKWrfXZTTmFD+2eOIp
         n1xV6UR+ijY3LntKXRSkbGFkAaFN6fMH5n1QncUcnVNv7G6dOreeUkAHBiE7bu4wSmdG
         +v4g==
X-Gm-Message-State: ABy/qLaQaXTgMRkeS2EpdCzBiT/CceNocupd5cyQ/Lfs9xhbrUDzyO06
	MHwP1ZYlcuRXqWdpVtUqwEQ9liiuQOkkGIQByjlUNRguP4j8ky24r4I=
X-Google-Smtp-Source: APBJJlHtjAqx6tgjenOuWuaxrbOuUSvc2eHBasYUT1pcAXUm/vJe5TILpD9pBisWT6vT+MXv9uCmV5PJ58fFmwJfAEw=
X-Received: by 2002:a0d:db07:0:b0:576:884e:6d52 with SMTP id
 d7-20020a0ddb07000000b00576884e6d52mr10640130ywe.12.1689588640013; Mon, 17
 Jul 2023 03:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com> <1689585025-23731-15-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1689585025-23731-15-git-send-email-wangmy@fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 17 Jul 2023 12:10:28 +0200
Message-ID: <CANx9H-Cd8T=H=jV0QcT9n+UOdUUrA1kN+Ga48BDGF5geSb5vxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-importlib-metadata: upgrade 6.7.0 -> 6.8.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b462b00600ac026e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 10:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184460

--000000000000b462b00600ac026e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I already sent a patch for this:
https://patchwork.yoctoproject.org/project/oe-core/patch/20230708092636.967=
29-1-tim.orling@konsulko.com/

On Mon, Jul 17, 2023 at 11:10=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Features
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     Require Python 3.8 or later.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...ib-metadata_6.7.0.bb =3D> python3-importlib-metadata_6.8.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-importlib-metadata_6.7.0.bb
> =3D> python3-importlib-metadata_6.8.0.bb} (88%)
>
> diff --git a/meta/recipes-devtools/python/
> python3-importlib-metadata_6.7.0.bb b/meta/recipes-devtools/python/
> python3-importlib-metadata_6.8.0.bb
> similarity index 88%
> rename from meta/recipes-devtools/python/
> python3-importlib-metadata_6.7.0.bb
> rename to meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.b=
b
> index 5ad7ae81ad..b8dd4bb701 100644
> --- a/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb
> +++ b/meta/recipes-devtools/python/python3-importlib-metadata_6.8.0.bb
> @@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
>  PYPI_PACKAGE =3D "importlib_metadata"
>  UPSTREAM_CHECK_REGEX =3D "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
>
> -SRC_URI[sha256sum] =3D
> "1aaf550d4f73e5d6783e7acb77aec43d49da8017410afae93822cc9cca98c4d4"
> +SRC_URI[sha256sum] =3D
> "dbace7892d8c0c4ac1ad096662232f831d4e64f4c4545bd53016a3e9d4654743"
>
>  S =3D "${WORKDIR}/importlib_metadata-${PV}"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184451):
> https://lists.openembedded.org/g/openembedded-core/message/184451
> Mute This Topic: https://lists.openembedded.org/mt/100191314/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b462b00600ac026e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I already sent a patch for this:<br><div><a href=3D"https:=
//patchwork.yoctoproject.org/project/oe-core/patch/20230708092636.96729-1-t=
im.orling@konsulko.com/">https://patchwork.yoctoproject.org/project/oe-core=
/patch/20230708092636.96729-1-tim.orling@konsulko.com/</a><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Jul 17, 2023 at 11:10=E2=80=AFAM wangmy &lt;<a href=3D"mailto:wangmy@fujit=
su.com">wangmy@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fu=
jitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
<br>
Features<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0 =C2=A0 Require Python 3.8 or later.<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://ib-metadata_6.7.0.bb" rel=3D"noreferrer" target=
=3D"_blank">ib-metadata_6.7.0.bb</a> =3D&gt; <a href=3D"http://python3-impo=
rtlib-metadata_6.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-impor=
tlib-metadata_6.8.0.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-import=
lib-metadata_6.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-importl=
ib-metadata_6.7.0.bb</a> =3D&gt; <a href=3D"http://python3-importlib-metada=
ta_6.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-importlib-metadat=
a_6.8.0.bb</a>} (88%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-importl=
ib-metadata_6.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-importli=
b-metadata_6.7.0.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://py=
thon3-importlib-metadata_6.8.0.bb" rel=3D"noreferrer" target=3D"_blank">pyt=
hon3-importlib-metadata_6.8.0.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-importli=
b-metadata_6.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-importlib=
-metadata_6.7.0.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-importlib-=
metadata_6.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-importlib-m=
etadata_6.8.0.bb</a><br>
index 5ad7ae81ad..b8dd4bb701 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-importlib-meta=
data_6.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-importlib-metad=
ata_6.7.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-importlib-meta=
data_6.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-importlib-metad=
ata_6.8.0.bb</a><br>
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta<br>
=C2=A0PYPI_PACKAGE =3D &quot;importlib_metadata&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;/importlib-metadata/(?P&lt;pver&gt;(\d=
+[\.\-_]*)+)/&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;1aaf550d4f73e5d6783e7acb77aec43d49da8017410af=
ae93822cc9cca98c4d4&quot;<br>
+SRC_URI[sha256sum] =3D &quot;dbace7892d8c0c4ac1ad096662232f831d4e64f4c4545=
bd53016a3e9d4654743&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/importlib_metadata-${PV}&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184451): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184451" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184451</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100191314/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/100191314/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b462b00600ac026e--

