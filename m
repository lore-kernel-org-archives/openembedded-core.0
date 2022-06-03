Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBE3C43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 20:31:15 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.3152.1654288270882780612
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 13:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OSh3A0pV;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id x7so6511463qta.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 13:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QTd1PVppgBdCPsGsjlKxiQd259Xwdfpvs0YV61pZXxE=;
        b=OSh3A0pVUVjz2mJtfZ8TYSmP4LRAyRfJKkXkJdYn9clNVc8WWUltGMImGYruGToVGE
         1cmkZBLblNcmiObMnqJ2k55ug8J224XCcBIznJU5+QZUX89jJjKT96Ssn6P/M4UOaZbQ
         4J/CQ4p/aK4PVKOgyyFBcAe5qYNKoZYGqBdDjJuhYapGZ5J32eFTIOOOJj04BkiTe5m6
         KqUEo7dMDM14ni8EuAmePGnznU5FfXcUupl1LdCy52ioygHJqJ1YyFaF5GA9XKyMEhbw
         V/toFPSHYzRjMrl2hLhqlf/0sN62cvjfMiz4yJtKnZs9wVgPBAnAaIs8cdMNnPKcddWn
         Y44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QTd1PVppgBdCPsGsjlKxiQd259Xwdfpvs0YV61pZXxE=;
        b=WwWhrH8sPp4/RamnKseQ4KzX3YW8EBd1oKd/KCUiYWE7ZkeeDz9cxBK79a75Zh6Irw
         23RK/q7XiUAcvVKa3TCgCafgOaEUdpRLncN+RbrjtzDTGYVyLk4W7cKN76QYSeeioDYn
         mU/ya362ZFZ4nc5WBe8A389yeKc/ryVPHB9vx5G5N38nsWaNpEMgpNqishxmszKVu4ku
         mDDcCIwPZkfNr0eUkXSuCLgQbKxe88Tgn3T8uvy5Ix8Z3abIuXma1JYGLAhUx3KAtW2V
         u/cxWiFds4necYt7TcO+5Fjeav3aNny66UFUCj+bCxVwMcqcaFZ+kAkBZ6GaW1nDXcaF
         ZXVw==
X-Gm-Message-State: AOAM533AePxjzvLv1VIzu0Egl0ykyv2JMLU1NbdGbXH4j+WIdbyJZ6Zl
	ld6/TQMkp3tmW8g5potANGASVf5kJFT984bcQa8=
X-Google-Smtp-Source: 
 ABdhPJzEy9WOMQ5Z87MYQncquLFM+T7xXvBda8f0Q+9HO8HUEHUZHCgLVjwuk+y/3h1bjInZyRW8ZyR9BOvO8ykRvnM=
X-Received: by 2002:ac8:7f08:0:b0:304:b3cb:8f5d with SMTP id
 f8-20020ac87f08000000b00304b3cb8f5dmr8870952qtk.532.1654288269902; Fri, 03
 Jun 2022 13:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220603200317.385216-1-alex.stewart@ni.com>
In-Reply-To: <20220603200317.385216-1-alex.stewart@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Jun 2022 13:30:58 -0700
Message-ID: 
 <CAMKF1srVLKrQ4m2u_yfDRi2vuXcHKVfjt3cvj9mbiu82_8J8JQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] opkg: upgrade to version 0.6.0
To: Alex Stewart <alex.stewart@ni.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000af064b05e0910033"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 20:31:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166524

--000000000000af064b05e0910033
Content-Type: text/plain; charset="UTF-8"

What major changes does this change bring

On Fri, Jun 3, 2022 at 1:04 PM Alex Stewart <alex.stewart@ni.com> wrote:

> Signed-off-by: Alex Stewart <alex.stewart@ni.com>
> ---
>  meta/recipes-devtools/opkg/{opkg_0.5.0.bb => opkg_0.6.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/opkg/{opkg_0.5.0.bb => opkg_0.6.0.bb} (96%)
>
> diff --git a/meta/recipes-devtools/opkg/opkg_0.5.0.bb
> b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> similarity index 96%
> rename from meta/recipes-devtools/opkg/opkg_0.5.0.bb
> rename to meta/recipes-devtools/opkg/opkg_0.6.0.bb
> index
> e91d7250bc9f7fde73395335f008108578515b77..7b351e81231df48b2c493542a00d95911606248f
> 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.5.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.6.0.bb
> @@ -18,7 +18,7 @@ SRC_URI = "
> http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
>             file://run-ptest \
>  "
>
> -SRC_URI[sha256sum] =
> "559c3e1b893abaa1dd473ce3a9a5f7dd3f60ceb6cd14caaef76ddf0f7721ad1c"
> +SRC_URI[sha256sum] =
> "56844722eff237daf14aa6e681436f3245213c5590ed0cda37a79df637ff3a4c"
>
>  # This needs to be before ptest inherit, otherwise all ptest files end
> packaged
>  # in libopkg package if OPKGLIBDIR == libdir, because default
> --
> 2.36.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166522):
> https://lists.openembedded.org/g/openembedded-core/message/166522
> Mute This Topic: https://lists.openembedded.org/mt/91528903/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000af064b05e0910033
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">What major changes does this change bring=C2=A0</div><div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fr=
i, Jun 3, 2022 at 1:04 PM Alex Stewart &lt;<a href=3D"mailto:alex.stewart@n=
i.com">alex.stewart@ni.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Signed-off-by: Alex Stewart &lt;<a href=3D"mailto:alex.stewart@ni.co=
m" target=3D"_blank">alex.stewart@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/opkg/{<a href=3D"http://opkg_0.5.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">opkg_0.5.0.bb</a> =3D&gt; <a href=3D"http://op=
kg_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.6.0.bb</a>} | 2 +-=
<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/opkg/{<a href=3D"http://opkg_0.5.0.bb" r=
el=3D"noreferrer" target=3D"_blank">opkg_0.5.0.bb</a> =3D&gt; <a href=3D"ht=
tp://opkg_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.6.0.bb</a>}=
 (96%)<br>
<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.5.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.5.0.bb</a> b/meta/recipes-devtool=
s/opkg/<a href=3D"http://opkg_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank=
">opkg_0.6.0.bb</a><br>
similarity index 96%<br>
rename from meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.5.0.bb</a><br>
rename to meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.6.0.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.6.0.bb</a><br>
index e91d7250bc9f7fde73395335f008108578515b77..7b351e81231df48b2c493542a00=
d95911606248f 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.5.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.5.0.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.6.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.6.0.bb</a><br>
@@ -18,7 +18,7 @@ SRC_URI =3D &quot;<a href=3D"http://downloads.yoctoprojec=
t.org/releases/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" t=
arget=3D"_blank">http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-$=
{PV}.tar.gz</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;559c3e1b893abaa1dd473ce3a9a5f7dd3f60ceb6cd14c=
aaef76ddf0f7721ad1c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;56844722eff237daf14aa6e681436f3245213c5590ed0=
cda37a79df637ff3a4c&quot;<br>
<br>
=C2=A0# This needs to be before ptest inherit, otherwise all ptest files en=
d packaged<br>
=C2=A0# in libopkg package if OPKGLIBDIR =3D=3D libdir, because default<br>
-- <br>
2.36.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#166522): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/166522" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/166522</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91528903/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91528903/1997914</a><br>
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

--000000000000af064b05e0910033--

