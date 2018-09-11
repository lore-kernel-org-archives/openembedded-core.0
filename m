Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 11FC07962E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 17:32:54 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b19-v6so1869968wme.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 10:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8CM9yW8eTyS3ECYJMUqNXWILJDJqR4aVIAp3wHsTTR4=;
	b=Viy7esZRVEkgoPD3fp/kDQpPwOb6NeP6dv/dAEwGljeUJQjM7/p3vdb+7HtgfnpnrM
	pNcs0wbSEaWqfqALksJw3BKBnQT1lkGVYqLaEy83wl/dhTpHAwdv3URYHCzqzNUb8EMD
	BnspEOf5zYT8pfXJ8YWuUzVebuy8FKgewL8kLkNqfhcgpq6irnJNV6kzagECiLnNlsm9
	QEQ8M4NaJdPBZUb3ZVCCqWp7Ml1pJ0fnx8Ej74qDUQYe/KkSx0qpv7ZTU2js8TyqXqS0
	bX3Wkc1NN64fOsmmEziVX36zMauWcq1yXqmeH6nMv4hZiiMOEpUDrJdmTvt+f/LNyuXK
	KPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8CM9yW8eTyS3ECYJMUqNXWILJDJqR4aVIAp3wHsTTR4=;
	b=douqInYXhjTEUg6FLThhFdMAbe7AWV1XBqZPYYRnpdr8fEQo3uHFWiGUt6OY3iy8Aq
	3nAQ7wXZeaP3WIHG7cVaCGPSAp/aJCbJtTplvEcDLQkhL1UjYpj52iijLiwYV3om4GO2
	ovOxk9m9dxlQw9hE9VtXDtNZdU2r136Sk4J8MimT6qp6w/AABIlklSMcrW5w4wS2rjG5
	ZVYTKtGQjjOytzcHW9NZhw7JiAra15zP3b+5/fK8zu3A/uch/3FX7MDHmlas/jfpnCu6
	D00GY6hbo/vPZPhtkfjkIvr7+56WkZr2GMrx3HVgRJN1g1iTqXib+J6i65JLyK6EIVgK
	Xrfg==
X-Gm-Message-State: APzg51D0jwKBIp2CQ6XdEmibAsT270hdcHGjEWwok4ouCMDIP1wqIdwp
	X3TDdciW/T34V3jnbGkIytV/+zQgxa4XDHUa3QM=
X-Google-Smtp-Source: ANB0VdaoU8K3FhkRg/rFFB/tNYH9pw6JDspR6vR844S0PK5fCp785UuNCWZHmfwele/Jufc37TUUiTRud03d5L5iyHM=
X-Received: by 2002:a1c:1eca:: with SMTP id
	e193-v6mr1880516wme.99.1536687175523; 
	Tue, 11 Sep 2018 10:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20180911164530.28493-1-sno@netbsd.org>
In-Reply-To: <20180911164530.28493-1-sno@netbsd.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Sep 2018 19:32:43 +0200
Message-ID: <CA+chaQeFZq4OZ-9XeG-HNWDuQeRMYcy7z731foVQXvZbgbsLcQ@mail.gmail.com>
To: sno@netbsd.org
Cc: igork@miltenyibiotec.de, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] coreutils: add alternative target for nice
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
X-List-Received-Date: Tue, 11 Sep 2018 17:32:55 -0000
Content-Type: multipart/alternative; boundary="0000000000003a606805759bdd6e"

--0000000000003a606805759bdd6e
Content-Type: text/plain; charset="UTF-8"

ALTERNATIVE_LINK_NAME[df.1] = "${mandir}/man1/nice.1"

isn't correct

On Tue, Sep 11, 2018 at 6:45 PM Jens Rehsack <sno@netbsd.org> wrote:

> Avoid coreutils conflicts with nice from other recipes, like
> busybox - even if that's not enabled by default.
> In situations, where coreutils is a dependency for -dev images
> and small busybox nice is available always, it avoids extra
> effort for coreutils for those users.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/recipes-core/coreutils/coreutils_8.30.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_8.30.bb
> b/meta/recipes-core/coreutils/coreutils_8.30.bb
> index 053891f6ea..83bc20f298 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.30.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.30.bb
> @@ -77,7 +77,7 @@ do_install_class-native() {
>  }
>
>  do_install_append() {
> -       for i in df mktemp base64; do mv ${D}${bindir}/$i
> ${D}${bindir}/$i.${BPN}; done
> +       for i in df mktemp nice base64; do mv ${D}${bindir}/$i
> ${D}${bindir}/$i.${BPN}; done
>
>         install -d ${D}${base_bindir}
>         [ "${base_bindir}" != "${bindir}" ] && for i in
> ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i.${BPN};
> done
> @@ -113,6 +113,10 @@ ALTERNATIVE_LINK_NAME[df] = "${base_bindir}/df"
>  ALTERNATIVE_TARGET[df] = "${bindir}/df.${BPN}"
>  ALTERNATIVE_LINK_NAME[df.1] = "${mandir}/man1/df.1"
>
> +ALTERNATIVE_LINK_NAME[nice] = "${base_bindir}/nice"
> +ALTERNATIVE_TARGET[nice] = "${bindir}/nice.${BPN}"
> +ALTERNATIVE_LINK_NAME[df.1] = "${mandir}/man1/nice.1"
> +
>  ALTERNATIVE_LINK_NAME[lbracket] = "${bindir}/["
>  ALTERNATIVE_TARGET[lbracket] = "${bindir}/lbracket.${BPN}"
>
> --
> 2.17.1
>
>

--0000000000003a606805759bdd6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ALTERNATIVE_LINK_NAME[df.1] =3D &quot;${mandir}/man1/nice.=
1&quot;<br><div><br></div><div>isn&#39;t correct</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Tue, Sep 11, 2018 at 6:45 PM Jens Rehs=
ack &lt;<a href=3D"mailto:sno@netbsd.org">sno@netbsd.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Avoid coreutils conflicts with nice fr=
om other recipes, like<br>
busybox - even if that&#39;s not enabled by default.<br>
In situations, where coreutils is a dependency for -dev images<br>
and small busybox nice is available always, it avoids extra<br>
effort for coreutils for those users.<br>
<br>
Signed-off-by: Jens Rehsack &lt;<a href=3D"mailto:sno@netbsd.org" target=3D=
"_blank">sno@netbsd.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.30.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_8.30.bb</a> | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.30.b=
b" rel=3D"noreferrer" target=3D"_blank">coreutils_8.30.bb</a> b/meta/recipe=
s-core/coreutils/<a href=3D"http://coreutils_8.30.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">coreutils_8.30.bb</a><br>
index 053891f6ea..83bc20f298 100644<br>
--- a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.30.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_8.30.bb</a><br>
+++ b/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.30.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_8.30.bb</a><br>
@@ -77,7 +77,7 @@ do_install_class-native() {<br>
=C2=A0}<br>
<br>
=C2=A0do_install_append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in df mktemp base64; do mv ${D}${bindir}/=
$i ${D}${bindir}/$i.${BPN}; done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for i in df mktemp nice base64; do mv ${D}${bin=
dir}/$i ${D}${bindir}/$i.${BPN}; done<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${base_bindir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [ &quot;${base_bindir}&quot; !=3D &quot;${bindi=
r}&quot; ] &amp;&amp; for i in ${base_bindir_progs}; do mv ${D}${bindir}/$i=
 ${D}${base_bindir}/$i.${BPN}; done<br>
@@ -113,6 +113,10 @@ ALTERNATIVE_LINK_NAME[df] =3D &quot;${base_bindir}/df&=
quot;<br>
=C2=A0ALTERNATIVE_TARGET[df] =3D &quot;${bindir}/df.${BPN}&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[df.1] =3D &quot;${mandir}/man1/df.1&quot;<br>
<br>
+ALTERNATIVE_LINK_NAME[nice] =3D &quot;${base_bindir}/nice&quot;<br>
+ALTERNATIVE_TARGET[nice] =3D &quot;${bindir}/nice.${BPN}&quot;<br>
+ALTERNATIVE_LINK_NAME[df.1] =3D &quot;${mandir}/man1/nice.1&quot;<br>
+<br>
=C2=A0ALTERNATIVE_LINK_NAME[lbracket] =3D &quot;${bindir}/[&quot;<br>
=C2=A0ALTERNATIVE_TARGET[lbracket] =3D &quot;${bindir}/lbracket.${BPN}&quot=
;<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--0000000000003a606805759bdd6e--
