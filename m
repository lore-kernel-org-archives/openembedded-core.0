Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A78D07199A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Dec 2017 07:11:53 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f140so42302746wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Dec 2017 23:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yR2G4CqRQFR0CNcibs8bKYyI63vBNDmL299TbklDeKA=;
	b=Dnrp5cioyyNukrnWvSQsBsc37rsOSmCsIitmdom+z5iNBGhooxtSmuk5gud+cmssYE
	7ZFcYmqcw7QBnKEe/9vhRpfAQV+uzyGNIjpqqqA8mwfsTTvahNZvt7h4ZnyGt4EfZpUt
	qXizjNTBNAFehc9mEn8A0fClwtmtffT1FV7RzpYy07ljTh2vCIIKtRNCKLG2kew/aqQB
	qyQ92Yj6fw5gNAsU4PWHs3Q2chk50a9g/5dFVJGTvP1FmocYYh28JqvXOoD2Wx47F+tf
	KLoNkDuszMhBm1GHnOAEavWv4051iWSleOhzDAcWJ6+cw0PY8SmGS0TWEcZ09kKVbjZX
	etgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yR2G4CqRQFR0CNcibs8bKYyI63vBNDmL299TbklDeKA=;
	b=BEbJ+1Ickg7JS04jMENhekEaVBJyRfVi7ew/I7P+UYlKdCoZMV7dkEmh2TdfDJ5FWx
	DvtNiVN+4gDlX3Tyic+0ZxGqQe9R7ljKzgP129NXF1WII5CfMO4JtyZWc+7W8ZzuTqJV
	FXZ8ej4ToZ0swIiEoM/voLNB9CZ9IjG03341grxWf3z3atp/Pq5dITfPHYM0uoxBhVnd
	L7sbQ2rZmnd8diLqQOToZRdZvF9P6VgMpaLkXW5v9YH2WPFoJ4dDYDyBZo/v5P3n9/Vg
	4bccw+K6kby62J3l3aGH1z/j4/rJhYoe0ooOqngIAoO6rB8Z4/QBv8nmP70vfB8mPwlK
	qDYA==
X-Gm-Message-State: AKGB3mJ5N5IkMz2edZAi5aOvg34qOAIJUJyDirZCOpBJpqWQ+yljk1sE
	CIglwgdP4GVoTbhAqnOCILs6L4uLAZ2uamTBMzY=
X-Google-Smtp-Source: ACJfBovd7T8hvXD8rMKJVQ8E9PMHkM+iTGwzw2ah/H4gg/n/Sjl2QxOjJgS5D0zefwSM53gZNGhJwSGfKmnYTSyRtig=
X-Received: by 10.28.103.68 with SMTP id b65mr26536913wmc.117.1514445114438;
	Wed, 27 Dec 2017 23:11:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Wed, 27 Dec 2017 23:11:53 -0800 (PST)
In-Reply-To: <20171228022126.219745-1-jibin.xu@windriver.com>
References: <20171228022126.219745-1-jibin.xu@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 28 Dec 2017 08:11:53 +0100
Message-ID: <CA+chaQeUVEHAjLEGAVTxyr0JbBX5VTeaOeZsEL1ohhe7ijP7wg@mail.gmail.com>
To: Jibin Xu <jibin.xu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fontcache : fix build warning when using quemu usermode
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
X-List-Received-Date: Thu, 28 Dec 2017 07:11:53 -0000
Content-Type: multipart/alternative; boundary="001a114b2faa13f7e30561613b7a"

--001a114b2faa13f7e30561613b7a
Content-Type: text/plain; charset="UTF-8"

There are 2 typos in "qemu".

Does this mean that MACHINEs which use qemu usermode won't be able to use
read-only images where this postinst cannot be executed on read-only rootfs?

On Thu, Dec 28, 2017 at 3:21 AM, Jibin Xu <jibin.xu@windriver.com> wrote:

> fontcache uses quemu usermode by default, but some architecture
> such as Intel skylake does not support qemu usermode, this can
> lead to a build warning as below:
> "WARNING: The postinstall intercept hook 'update_font_cache' failed".
>
> Add a judgement of qemu usermode to fix the build warning.
>
> Signed-off-by: Jibin Xu <jibin.xu@windriver.com>
> ---
>  meta/classes/fontcache.bbclass | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.
> bbclass
> index e76331131e..3eb868fa08 100644
> --- a/meta/classes/fontcache.bbclass
> +++ b/meta/classes/fontcache.bbclass
> @@ -17,13 +17,17 @@ FONTCONFIG_CACHE_PARAMS ?= "-v"
>  FONTCONFIG_CACHE_ENV ?= "FC_DEBUG=1"
>  fontcache_common() {
>  if [ -n "$D" ] ; then
> -       $INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG}
> mlprefix=${MLPREFIX} \
> -               'bindir="${bindir}"' \
> -               'libdir="${libdir}"' \
> -               'base_libdir="${base_libdir}"' \
> -               'fontconfigcachedir="${FONTCONFIG_CACHE_DIR}"' \
> -               'fontconfigcacheparams="${FONTCONFIG_CACHE_PARAMS}"' \
> -               'fontconfigcacheenv="${FONTCONFIG_CACHE_ENV}"'
> +       if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode',
> 'true','false', d)}; then
> +               $INTERCEPT_DIR/postinst_intercept update_font_cache
> ${PKG} mlprefix=${MLPREFIX} \
> +                       'bindir="${bindir}"' \
> +                       'libdir="${libdir}"' \
> +                       'base_libdir="${base_libdir}"' \
> +                       'fontconfigcachedir="${FONTCONFIG_CACHE_DIR}"' \
> +                       'fontconfigcacheparams="${FONTCONFIG_CACHE_PARAMS}"'
> \
> +                       'fontconfigcacheenv="${FONTCONFIG_CACHE_ENV}"'
> +       else
> +               exit 1
> +       fi
>  else
>         ${FONTCONFIG_CACHE_ENV} fc-cache ${FONTCONFIG_CACHE_PARAMS}
>  fi
> --
> 2.13.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114b2faa13f7e30561613b7a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There are 2 typos in &quot;qemu&quot;.<div><br></div><div>=
Does this mean that MACHINEs which use qemu usermode won&#39;t be able to u=
se read-only images where this postinst cannot be executed on read-only roo=
tfs?</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n Thu, Dec 28, 2017 at 3:21 AM, Jibin Xu <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jibin.xu@windriver.com" target=3D"_blank">jibin.xu@windriver.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">fontcache uses quemu us=
ermode by default, but some architecture<br>
such as Intel skylake does not support qemu usermode, this can<br>
lead to a build warning as below:<br>
&quot;WARNING: The postinstall intercept hook &#39;update_font_cache&#39; f=
ailed&quot;.<br>
<br>
Add a judgement of qemu usermode to fix the build warning.<br>
<br>
Signed-off-by: Jibin Xu &lt;<a href=3D"mailto:jibin.xu@windriver.com">jibin=
.xu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/fontcache.bbclass | 18 +++++++++++-------<br>
=C2=A01 file changed, 11 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/classes/fontcache.<wbr>bbclass b/meta/classes/fontcache.<=
wbr>bbclass<br>
index e76331131e..3eb868fa08 100644<br>
--- a/meta/classes/fontcache.<wbr>bbclass<br>
+++ b/meta/classes/fontcache.<wbr>bbclass<br>
@@ -17,13 +17,17 @@ FONTCONFIG_CACHE_PARAMS ?=3D &quot;-v&quot;<br>
=C2=A0FONTCONFIG_CACHE_ENV ?=3D &quot;FC_DEBUG=3D1&quot;<br>
=C2=A0fontcache_common() {<br>
=C2=A0if [ -n &quot;$D&quot; ] ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$INTERCEPT_DIR/postinst_<wbr>intercept update_f=
ont_cache ${PKG} mlprefix=3D${MLPREFIX} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;bindir=3D&quot=
;${bindir}&quot;&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;libdir=3D&quot=
;${libdir}&quot;&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;base_libdir=3D=
&quot;${base_libdir}&quot;&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;fontconfigcach=
edir=3D&quot;${<wbr>FONTCONFIG_CACHE_DIR}&quot;&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;fontconfigcach=
eparams=3D&quot;${<wbr>FONTCONFIG_CACHE_PARAMS}&quot;&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;fontconfigcach=
eenv=3D&quot;${<wbr>FONTCONFIG_CACHE_ENV}&quot;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;MACHINE_<wbr>FEATU=
RES&#39;, &#39;qemu-usermode&#39;, &#39;true&#39;,&#39;false&#39;, d)}; the=
n<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$INTERCEPT_DIR/post=
inst_<wbr>intercept update_font_cache ${PKG} mlprefix=3D${MLPREFIX} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;bindir=3D&quot;${bindir}&quot;&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;libdir=3D&quot;${libdir}&quot;&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;base_libdir=3D&quot;${base_libdir}&quot;&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;fontconfigcachedir=3D&quot;${<wbr>FONTCONFIG_CACHE_DIR}&quot=
;&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;fontconfigcacheparams=3D&quot;${<wbr>FONTCONFIG_CACHE_PARAMS=
}&quot;&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;fontconfigcacheenv=3D&quot;${<wbr>FONTCONFIG_CACHE_ENV}&quot=
;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${FONTCONFIG_CACHE_ENV} fc-cache ${FONTCONFIG_C=
ACHE_PARAMS}<br>
=C2=A0fi<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a114b2faa13f7e30561613b7a--
