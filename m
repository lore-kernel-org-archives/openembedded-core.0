Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5094C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 15:27:33 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.14822.1672846044650342270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 07:27:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GbtWRA6C;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id g13so50850611lfv.7
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 07:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I/ND10pisLUyMtAajvI3KdOo0a6Zgo+f0afZZUm1afc=;
        b=GbtWRA6CVhwjoVpPFBwoTpcQ8vHsfAYRfLohAys8NYjCP3/Y3Tjl97i1tyiVlnQU5A
         5b+KrVFHj/CXdjWkQNrU9Ds1iGbjriYD/DC4N0U6xZJ7HFROMtmnC/D9duxQQEvaWPDl
         2JMjftAVoLUEjFr5YtRLAIRZ9npYDHGT1Ep9b2C7An983u9hqmJQz7few1VFB7r2Kjs1
         UAq0pdN8DRLgqBGK9Q558Cd6OgTAFis4V6Cf+EHFdmIq/kltRYKLh9OPLrOvfAtUZcAO
         oNut+oMbxmhhxS1L9NOBihyIiXIxtZjQqE2O3YMt4kILaeaKzuYZqoL4MqKJ/gyNw9Dp
         8cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/ND10pisLUyMtAajvI3KdOo0a6Zgo+f0afZZUm1afc=;
        b=FrmAA6uOEFxqwYw2xjZCVt+3VDitHls13M1U802l5f9Y3taIhJNVpFiFvjZDBN7XJD
         QtlEAz3fKrLR0aFoJ5xN48PZu2KlwTwnCN+0YvaU56yq2qX1Fi2z5LEaz56oDO6piHia
         Bg4YAHolF2eW2uHGyyKIPGb5NvioXmkY65Fz7Vc+ymU289T7wvOuC5IKbq5ivbt/UkIb
         NnXO0HG3jrjvqTeWONnn7azPhjrwI5nlfcE5NC7GNa/URmiBrruaFCMXfMJyggxizWUP
         o5sGUGQdh19wSi0W/1l0ojQ1DZiNmalF18JgW0232q/mFh2t0UyvsVxndF241zeJtTNU
         5yMw==
X-Gm-Message-State: AFqh2kp6WgxPzgFMYvwctVURozFZ7Eo28okz0ebdtBd0022MJU7Lx4ru
	wUyv+7nYM0HGDLiXCv6YRGcnt42E9Eb0YLOHSv3576zsHR4=
X-Google-Smtp-Source: AMrXdXvkO0elZdpPQCPwwh6YzwzmWPfZr/MN/zXNh2wml5yacPLpsEN9fURnC1EJM15Gzk6kU7j0jijn+KfyV85vm+g=
X-Received: by 2002:a19:5516:0:b0:4ca:fb88:23c4 with SMTP id
 n22-20020a195516000000b004cafb8823c4mr3077331lfe.327.1672846042435; Wed, 04
 Jan 2023 07:27:22 -0800 (PST)
MIME-Version: 1.0
References: <20230102070327.55373-1-rybczynska@gmail.com>
In-Reply-To: <20230102070327.55373-1-rybczynska@gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 4 Jan 2023 16:27:10 +0100
Message-ID: <CAApg2=SGX+9QQ1sqEuuNz+MLzk=m8S2LQwW5xBwtoveh0XPAgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] cve-update-db-native: move download cleanup to a function
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000001f94d305f171d2c8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 15:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175485

--0000000000001f94d305f171d2c8
Content-Type: text/plain; charset="UTF-8"

This patch is replaced by
https://lists.openembedded.org/g/openembedded-core/message/175355 (with a
minor patch title change)

On Mon, Jan 2, 2023 at 8:03 AM Marta Rybczynska <rybczynska@gmail.com>
wrote:

> Move cleanup of the database after a failed download to a separate
> function. This will be useful when we have more actions to do in
> that situation.
>
> Signed-off-by: Marta Rybczynska <marta.rybczynska@linaro.org>
> ---
>  meta/recipes-core/meta/cve-update-db-native.bb | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-core/meta/cve-update-db-native.bb
> b/meta/recipes-core/meta/cve-update-db-native.bb
> index 9b9dbbd75f..642fda5395 100644
> --- a/meta/recipes-core/meta/cve-update-db-native.bb
> +++ b/meta/recipes-core/meta/cve-update-db-native.bb
> @@ -44,13 +44,7 @@ python do_fetch() {
>
>      cve_socket_timeout = int(d.getVar("CVE_SOCKET_TIMEOUT"))
>
> -    if os.path.exists("{0}-journal".format(db_file)):
> -        # If a journal is present the last update might have been
> interrupted. In that case,
> -        # just wipe any leftovers and force the DB to be recreated.
> -        os.remove("{0}-journal".format(db_file))
> -
> -        if os.path.exists(db_file):
> -            os.remove(db_file)
> +    cleanup_db_download(db_file)
>
>      # The NVD database changes once a day, so no need to update more
> frequently
>      # Allow the user to force-update
> @@ -134,6 +128,15 @@ do_fetch[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
>  do_fetch[file-checksums] = ""
>  do_fetch[vardeps] = ""
>
> +def cleanup_db_download(db_file):
> +    if os.path.exists("{0}-journal".format(db_file)):
> +        # If a journal is present the last update might have been
> interrupted. In that case,
> +        # just wipe any leftovers and force the DB to be recreated.
> +        os.remove("{0}-journal".format(db_file))
> +
> +        if os.path.exists(db_file):
> +            os.remove(db_file)
> +
>  def initialize_db(conn):
>      with conn:
>          c = conn.cursor()
> --
> 2.35.1
>
>

--0000000000001f94d305f171d2c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch is replaced by <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/175355">https://lists.openembedded.or=
g/g/openembedded-core/message/175355</a> (with a minor patch title change)<=
br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Jan 2, 2023 at 8:03 AM Marta Rybczynska &lt;<a href=3D"mailto:ry=
bczynska@gmail.com">rybczynska@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Move cleanup of the database after =
a failed download to a separate<br>
function. This will be useful when we have more actions to do in<br>
that situation.<br>
<br>
Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska@lina=
ro.org" target=3D"_blank">marta.rybczynska@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=
=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a> | 17 ++++++++=
++-------<br>
=C2=A01 file changed, 10 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://cve-update-db-native.=
bb" rel=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a> b/meta=
/recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=3D"norefe=
rrer" target=3D"_blank">cve-update-db-native.bb</a><br>
index 9b9dbbd75f..642fda5395 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=
=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://cve-update-db-native.bb" rel=
=3D"noreferrer" target=3D"_blank">cve-update-db-native.bb</a><br>
@@ -44,13 +44,7 @@ python do_fetch() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0cve_socket_timeout =3D int(d.getVar(&quot;CVE_SOCKET_TI=
MEOUT&quot;))<br>
<br>
-=C2=A0 =C2=A0 if os.path.exists(&quot;{0}-journal&quot;.format(db_file)):<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If a journal is present the last update migh=
t have been interrupted. In that case,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # just wipe any leftovers and force the DB to =
be recreated.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(&quot;{0}-journal&quot;.format(db_fi=
le))<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(db_file):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(db_file)<br>
+=C2=A0 =C2=A0 cleanup_db_download(db_file)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# The NVD database changes once a day, so no need to up=
date more frequently<br>
=C2=A0 =C2=A0 =C2=A0# Allow the user to force-update<br>
@@ -134,6 +128,15 @@ do_fetch[lockfiles] +=3D &quot;${CVE_CHECK_DB_FILE_LOC=
K}&quot;<br>
=C2=A0do_fetch[file-checksums] =3D &quot;&quot;<br>
=C2=A0do_fetch[vardeps] =3D &quot;&quot;<br>
<br>
+def cleanup_db_download(db_file):<br>
+=C2=A0 =C2=A0 if os.path.exists(&quot;{0}-journal&quot;.format(db_file)):<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If a journal is present the last update migh=
t have been interrupted. In that case,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # just wipe any leftovers and force the DB to =
be recreated.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(&quot;{0}-journal&quot;.format(db_fi=
le))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.exists(db_file):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(db_file)<br>
+<br>
=C2=A0def initialize_db(conn):<br>
=C2=A0 =C2=A0 =C2=A0with conn:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c =3D conn.cursor()<br>
-- <br>
2.35.1<br>
<br>
</blockquote></div>

--0000000000001f94d305f171d2c8--

