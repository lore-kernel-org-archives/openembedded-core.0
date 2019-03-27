Return-Path: <texier.pj2@gmail.com>
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail.openembedded.org (Postfix) with ESMTP id CEF3A7D15C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:57:52 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id s39so8985026edb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tK7+EshLBXeF2BdI4OP/ETuq9eTwIYL5QTjRJIB5GU0=;
	b=HH7j9ljubXgUsKkCBUpN19XIKxqHX6gQtynUCpriUzTdhxA24Xni3cXjGZ665iMXTx
	q7cbxSTac3IhsdED6ndL1wY+n39sBA90/i/xMvyuZxWH09m6sPOabe2kdmPL9srz8B7x
	uAkt311YlS+IlcCW4R/ChnDk//mcrkUtZrV1YNMOJfa5YP/iNuSTbuoryLDgxG+vu0T3
	176wyDu+6I7M5gFOrqMqaNsHPvjTfoSUWHSv9PkKrhRPaTBdE8r0L/0g2ieS5inK7KVI
	1+QZ7DJDPBlpvslEj2iY2oai6yI++3Mxrm/Tdy2Uf2LNu/wxFLbVKUo6XBOVIb5Pg7br
	UjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tK7+EshLBXeF2BdI4OP/ETuq9eTwIYL5QTjRJIB5GU0=;
	b=BKbioYE/bRxWEd5p1W40xUo9EFe5lOCCozvVX9jsUkAvwJE5ehdash24OHS0bKIFsa
	z+ucHz9cH1c5513YMw4zlnbqHWmbd1hXaX7OK67qZujvsD3dm8Ki04Wn2fS2TzzwslbT
	lcQIZG17h3ajg6jUxgMHqdt1jlktI+jEn3y6A4msG4qymNC8GLIf5IDrxVzdL1RxD6EM
	koUik8HW8GHmNOJtZpB1u1+NeCaGofW7xqipb2SCheRNQX/9I6ASjPpfhY888OWwYKd4
	Aw8O70zpmbxTzH+s+ZA3joVn0HmaIOyjBLQea2WqCN/anfVAsGarLlxiYosZi26oyOfj
	b4nQ==
X-Gm-Message-State: APjAAAUKRPqgngvdvzA/8b7d4lBHbtUlQ1LGYFTaBbBCFKE0p89PT1TK
	JHt09YdxNUPVZsWBym+aT82S4U+Nf9KSzRSJ1DQ=
X-Google-Smtp-Source: APXvYqw0gN+UkEgXZR2ekJ5ueFO65uixejnDtwQJAahLuW+BJZQiUPkZM76sY8c75Q3JmPF/dB4EDrEiTHo3FIhcDkA=
X-Received: by 2002:a50:86ad:: with SMTP id r42mr25337844eda.40.1553702273656; 
	Wed, 27 Mar 2019 08:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <1553701511-32475-1-git-send-email-vincent.prince.fr@gmail.com>
In-Reply-To: <1553701511-32475-1-git-send-email-vincent.prince.fr@gmail.com>
From: TEXIER Pierre-Jean <texier.pj2@gmail.com>
Date: Wed, 27 Mar 2019 16:57:42 +0100
Message-ID: <CALRtUqv6OrCibt4xYfvJNc_Gy+UqYAeziUQT8Krz7Zo0mR9qbA@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] Systemd: Add pattern matching support to PACKAGECONFIG
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
X-List-Received-Date: Wed, 27 Mar 2019 15:57:54 -0000
Content-Type: multipart/alternative; boundary="0000000000001bae3205851580e9"

--0000000000001bae3205851580e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vincent,

Le mer. 27 mars 2019 =C3=A0 16:45, Vincent Prince <vincent.prince.fr@gmail.=
com>
a =C3=A9crit :

> libpcre2 is needed to enable grep option to journalctl.
>
> Changes in v2:
> - Fix false case option
>
> Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> ---
>  meta/recipes-core/systemd/systemd_241.bb | 1 +
>  1 file changed, 1 insertion(+)
>

The changelog should be added below the "---" line in the patch,
this allows to not get included into the actual commit log.

Pierre-Jean


> diff --git a/meta/recipes-core/systemd/systemd_241.bb
> b/meta/recipes-core/systemd/systemd_241.bb
> index a12b9ab..bfbfc81 100644
> --- a/meta/recipes-core/systemd/systemd_241.bb
> +++ b/meta/recipes-core/systemd/systemd_241.bb
> @@ -151,6 +151,7 @@ PACKAGECONFIG[nss-mymachines] =3D
> "-Dnss-mymachines=3Dtrue,-Dnss-mymachines=3Dfalse"
>  PACKAGECONFIG[nss-resolve] =3D "-Dnss-resolve=3Dtrue,-Dnss-resolve=3Dfal=
se"
>  PACKAGECONFIG[openssl] =3D "-Dopenssl=3Dtrue,-Dopenssl=3Dfalse,openssl"
>  PACKAGECONFIG[pam] =3D "-Dpam=3Dtrue,-Dpam=3Dfalse,libpam,${PAM_PLUGINS}=
"
> +PACKAGECONFIG[pcre2] =3D "-Dpcre2=3Dtrue,-Dpcre2=3Dfalse,libpcre2"
>  PACKAGECONFIG[polkit] =3D "-Dpolkit=3Dtrue,-Dpolkit=3Dfalse"
>  PACKAGECONFIG[portabled] =3D "-Dportabled=3Dtrue,-Dportabled=3Dfalse"
>  PACKAGECONFIG[qrencode] =3D "-Dqrencode=3Dtrue,-Dqrencode=3Dfalse,qrenco=
de"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000001bae3205851580e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Vincent,</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. =
27 mars 2019 =C3=A0=C2=A016:45, Vincent Prince &lt;<a href=3D"mailto:vincen=
t.prince.fr@gmail.com">vincent.prince.fr@gmail.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">libpcre2 is=
 needed to enable grep option to journalctl.<br>
<br>
Changes in v2:<br>
- Fix false case option<br>
<br>
Signed-off-by: Vincent Prince &lt;<a href=3D"mailto:vincent.prince.fr@gmail=
.com" target=3D"_blank">vincent.prince.fr@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_241.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_241.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br></blockquote><div><br></div><div>Th=
e changelog should be added below the &quot;---&quot; line in the patch,=C2=
=A0</div><div>this allows to not get included into the actual commit log.=
=C2=A0</div><div><br></div><div>Pierre-Jean</div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_241.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_241.bb</a> b/meta/recipes-core/s=
ystemd/<a href=3D"http://systemd_241.bb" rel=3D"noreferrer" target=3D"_blan=
k">systemd_241.bb</a><br>
index a12b9ab..bfbfc81 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_241.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_241.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_241.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_241.bb</a><br>
@@ -151,6 +151,7 @@ PACKAGECONFIG[nss-mymachines] =3D &quot;-Dnss-mymachine=
s=3Dtrue,-Dnss-mymachines=3Dfalse&quot;<br>
=C2=A0PACKAGECONFIG[nss-resolve] =3D &quot;-Dnss-resolve=3Dtrue,-Dnss-resol=
ve=3Dfalse&quot;<br>
=C2=A0PACKAGECONFIG[openssl] =3D &quot;-Dopenssl=3Dtrue,-Dopenssl=3Dfalse,o=
penssl&quot;<br>
=C2=A0PACKAGECONFIG[pam] =3D &quot;-Dpam=3Dtrue,-Dpam=3Dfalse,libpam,${PAM_=
PLUGINS}&quot;<br>
+PACKAGECONFIG[pcre2] =3D &quot;-Dpcre2=3Dtrue,-Dpcre2=3Dfalse,libpcre2&quo=
t;<br>
=C2=A0PACKAGECONFIG[polkit] =3D &quot;-Dpolkit=3Dtrue,-Dpolkit=3Dfalse&quot=
;<br>
=C2=A0PACKAGECONFIG[portabled] =3D &quot;-Dportabled=3Dtrue,-Dportabled=3Df=
alse&quot;<br>
=C2=A0PACKAGECONFIG[qrencode] =3D &quot;-Dqrencode=3Dtrue,-Dqrencode=3Dfals=
e,qrencode&quot;<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--0000000000001bae3205851580e9--
