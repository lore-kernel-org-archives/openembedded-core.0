Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4AAB97DEA1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 12:02:19 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id m4so22488569edd.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 05:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=fMGh5SEQm8dlL+bZkZMY3tzhf0YAnp1PdLaqbQSlZwE=;
	b=Uxn6QS7Ol9gFRKnSARzQfIqLA6uPT5PzNsadvxb2SmfjAm84ne7PkZSVhFeSeV6KfQ
	6CcjfIvLO0wBlbjc7ZJkmHL4F0QFEoBt3hUYsxwKEvI+jFRWCR6ijvT9jOMvul6pd1Nf
	+PnnVUyCxvJ8fUUX7RlxwU+NM3FiK5Vlb2dXKxBOe0fxZcc396lPfayc/7G2MINkeePY
	lAuU/KvX1uDoMlAvXcNDYhNz1p+PgCAd2D/rfQe3+Obefqd4tWALXObsHp9lSvbtUkSq
	RtQXrKFMvh19uOJyfg3YvMmV6h9gdRURiAd+bBc30Gvjbdd5H+lvPt8nIE5TtHngwJqx
	ZeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=fMGh5SEQm8dlL+bZkZMY3tzhf0YAnp1PdLaqbQSlZwE=;
	b=ih5dUbV266Xye+9kxbovYX+0yFd4FtKlL0poqT4ieAPBzuHJ2ld0UDtjM7bKOUC6DA
	lkER+ECHAz3hVwfT7wEq2oBghJt0qm83Y4gbwRgtZf32XoBR18PqZq1yLRa3Vq0jNNqP
	ksvWmjDJaPDLnsQEgh90b1BCf3cSiJ3afgC04iee9I0DAEa12SlPl+YOL8P70qmSj3lA
	Eh3Q1pF53PCHV88/0GXF5arOsP+YAI8Vl57Q1D/NKipD04xwLbkyvEKimzj+zvL30SQv
	r1zwaCNVhx8bnr7whd/uuzPyybWBDAY+rNGbgEPTLjaSu9LDw7xyN9kGTLVsjJZAcvYA
	xF3A==
X-Gm-Message-State: APjAAAUoXTXc4P3RzjXQDHRXkrREs502B3KG2Wy1RDJOMK3ncQiy1tje
	S/67YiDWsa7oVBbXJhE6dUmbDIaqYANx1alHKLIkag==
X-Google-Smtp-Source: APXvYqwUbhOAL7JX0kjrwx6vLvpD6QbtflQ92HYEFDKTjxTzpZM4m3yrz85TU1Q61GfZ68Y9K1kThkKzEE92X1NSA5U=
X-Received: by 2002:a50:95d6:: with SMTP id x22mr34854122eda.89.1557835338602; 
	Tue, 14 May 2019 05:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190510215500.18914-1-Martin.Jansa@gmail.com>
In-Reply-To: <20190510215500.18914-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 May 2019 14:02:10 +0200
Message-ID: <CA+chaQc=0udH-S+KDne=EEy73aUt1boJX7+2Ah3Q9v048aomMA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-networking: add PACKAGECONFIG for openssl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2019 12:02:19 -0000
Content-Type: multipart/alternative; boundary="000000000000f9f8bd0588d7cdb5"

--000000000000f9f8bd0588d7cdb5
Content-Type: text/plain; charset="UTF-8"

Thanks all, I think the discussion made it clear that we shouldn't change
the default yet.

Makes it easier for me as I'll need this PACKAGECONFIG backported to
warrior as well (and we shouldn't change the default there for sure).

RP: please take this for some next master-next.

On Fri, May 10, 2019 at 11:54 PM Martin Jansa <martin.jansa@gmail.com>
wrote:

> * gnutls from meta-gplv2 isn't new enough for this version of
> glib-networking:
>   meson.build:74:0: ERROR:  Invalid version of dependency, need 'gnutls'
> ['>= 3.4.6'] found '3.3.30'
>
> * disabling gnutls PACKAGECONFIG isn't an option either:
>   meson.build:131:2: ERROR:  Problem encountered: No TLS backends enabled.
> Please enable at least one TLS backend
>
> * add an option to replace gnutls with openssl
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/glib-networking/glib-networking_2.60.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
> b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
> index 09af229d69..e2b4cffb2b 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.60.1.bb
> @@ -15,6 +15,7 @@ SRC_URI[archive.sha256sum] =
> "d71c6b2faa5ac29100314f08a1be020a2afd0291f025614c0a
>  PACKAGECONFIG ??= "gnutls"
>
>  PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
> +PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
>  PACKAGECONFIG[libproxy] =
> "-Dlibproxy=enabled,-Dlibproxy=disabled,libproxy"
>
>  EXTRA_OEMESON = "-Dgnome_proxy=disabled"
> --
> 2.17.1
>
>

--000000000000f9f8bd0588d7cdb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks all, I think the discussion made it clear that we s=
houldn&#39;t change the default yet.<div><br></div><div>Makes it easier for=
 me as I&#39;ll need this PACKAGECONFIG backported to warrior as well (and =
we shouldn&#39;t change the default there for sure).</div><div><br></div><d=
iv>RP: please take this for some next master-next.</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 10, 201=
9 at 11:54 PM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">ma=
rtin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">* gnutls from meta-gplv2 isn&#39;t new enough for this =
version of glib-networking:<br>
=C2=A0 meson.build:74:0: ERROR:=C2=A0 Invalid version of dependency, need &=
#39;gnutls&#39; [&#39;&gt;=3D 3.4.6&#39;] found &#39;3.3.30&#39;<br>
<br>
* disabling gnutls PACKAGECONFIG isn&#39;t an option either:<br>
=C2=A0 meson.build:131:2: ERROR:=C2=A0 Problem encountered: No TLS backends=
 enabled. Please enable at least one TLS backend<br>
<br>
* add an option to replace gnutls with openssl<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glib-networking/<a href=3D"http://glib-networking_2=
.60.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.60.1.bb</a=
> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-core/glib-networking/<a href=3D"http://glib-netwo=
rking_2.60.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.60.=
1.bb</a> b/meta/recipes-core/glib-networking/<a href=3D"http://glib-network=
ing_2.60.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.60.1.=
bb</a><br>
index 09af229d69..e2b4cffb2b 100644<br>
--- a/meta/recipes-core/glib-networking/<a href=3D"http://glib-networking_2=
.60.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.60.1.bb</a=
><br>
+++ b/meta/recipes-core/glib-networking/<a href=3D"http://glib-networking_2=
.60.1.bb" rel=3D"noreferrer" target=3D"_blank">glib-networking_2.60.1.bb</a=
><br>
@@ -15,6 +15,7 @@ SRC_URI[archive.sha256sum] =3D &quot;d71c6b2faa5ac2910031=
4f08a1be020a2afd0291f025614c0a<br>
=C2=A0PACKAGECONFIG ??=3D &quot;gnutls&quot;<br>
<br>
=C2=A0PACKAGECONFIG[gnutls] =3D &quot;-Dgnutls=3Denabled,-Dgnutls=3Ddisable=
d,gnutls&quot;<br>
+PACKAGECONFIG[openssl] =3D &quot;-Dopenssl=3Denabled,-Dopenssl=3Ddisabled,=
openssl&quot;<br>
=C2=A0PACKAGECONFIG[libproxy] =3D &quot;-Dlibproxy=3Denabled,-Dlibproxy=3Dd=
isabled,libproxy&quot;<br>
<br>
=C2=A0EXTRA_OEMESON =3D &quot;-Dgnome_proxy=3Ddisabled&quot;<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--000000000000f9f8bd0588d7cdb5--
