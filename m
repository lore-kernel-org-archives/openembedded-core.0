Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1A41F6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 02:14:06 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id w201so225855vkw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Feb 2018 18:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PxLxeOQb5pecukXTExfzWYb/VQHqT3eHhnj+Kc6j7RM=;
	b=n0vEOvgB7bVB8fMhDYkH/ey9gj7PN3UDIkutGTtPvxT8U9ZOeB7Prqtbs+UdeXHUD3
	+MYncwkge5EAv43z+Cg08uRhoe/aBR8355N1NHasIHquf7kdYKzmAIX5OimVvieci1vb
	M2u2fJjPSbSxGsxZuXCtFhGMfI+wQT/zuQdDgtYSz8EBpWRX/5FtC9wFPpBL9wPXm1JZ
	XpLb/N7462QFSTavWXlX4uGKYpd1dDUBw3yg/17gfPOQPDjmGuJifQQt7hYLpDk6bdHe
	ANZpYPlIJ9kH4iUUfYWuEZq2uPmR4KK8u4KRYWf+ccZStyZF8vICFLXYQ7ccpCrJNbtu
	YYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PxLxeOQb5pecukXTExfzWYb/VQHqT3eHhnj+Kc6j7RM=;
	b=i06mg2vuJmVR9MkpySVPmIA2jRxm7FJyOCxXuf3GXE+XbThHWnASwTgRsXHhNiyZAP
	Tk/M3yEpyLhx23sskDV36pu/7xnTFXQFZ514oM5eOV7jGKRjqj2Dc58Zinh3HUrTNuki
	D6PSATzo7mjJr1Qu5cFTSsBYt4IWasMMrE0rKaGVuwrQE2Qwh3GcMIqnbE92VG6gcsdY
	F8T2e8HIN1dVpWeiH8SBN4ZxkjVU3dbHkI7uWTb2NZHZMn7jjOOjoZrVPj2fh7Swz5Iv
	vIkj4Hcp68EaWX1qoCHKeeTZIWgbCnFknRWaFn4mX2Nke01QqtzwWc7EXdkQRMARVbic
	U3ww==
X-Gm-Message-State: APf1xPBniexWBPo1xIilsHLiY23CabFuvoevKVYokYtA6QjxiqgqqZw7
	Q9y1RLp7NpGD087jtNRd9Ps+Y8uozJlPZuaM/rk=
X-Google-Smtp-Source: AH8x227WJviMYFeoXqvUStzMu9UJgzWDr4MijvT7Bri99RoJuka6lfNCiKQhoxIOOeWU3Q5CvTXf+s7enSkCAK9j/Sk=
X-Received: by 10.31.185.11 with SMTP id j11mr915797vkf.52.1517883247810; Mon,
	05 Feb 2018 18:14:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.40.66 with HTTP; Mon, 5 Feb 2018 18:13:47 -0800 (PST)
In-Reply-To: <1517855199-67449-1-git-send-email-juro.bystricky@intel.com>
References: <1517855199-67449-1-git-send-email-juro.bystricky@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 5 Feb 2018 19:13:47 -0700
Message-ID: <CABcZANndhca9KF9V-kRCTNWUniv+J3jW+GKii_LE0jJn3GcMGA@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: improve reproducibility with multilib
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
X-List-Received-Date: Tue, 06 Feb 2018 02:14:07 -0000
Content-Type: multipart/alternative; boundary="001a1143a45ccbe028056481bb8f"

--001a1143a45ccbe028056481bb8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2018 at 11:26 AM, Juro Bystricky <juro.bystricky@intel.com>
wrote:

> Multilib builds specify several loaders which will end up embedded in
> some binaries or script files. To support reproducible builds, we must
> ensure the loaders are always in deterministic order.
>
> [YOCTO #2655]
> [YOCTO #12478]
> [YOCTO #12480]
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/recipes-core/glibc/glibc-ld.inc  | 4 ++--
>  meta/recipes-core/glibc/glibc_2.26.bb | 8 +++-----
>  2 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-ld.inc
> b/meta/recipes-core/glibc/glibc-ld.inc
> index c1d635d..607b27c 100644
> --- a/meta/recipes-core/glibc/glibc-ld.inc
> +++ b/meta/recipes-core/glibc/glibc-ld.inc
> @@ -38,8 +38,8 @@ def glibc_dl_info(d):
>          overrides =3D localdata.getVar("OVERRIDES", False) +
> ":virtclass-multilib-" + item
>          localdata.setVar("OVERRIDES", overrides)
>          ld_append_if_tune_exists(localdata, infos, ld_info_all)
> -    infos['ldconfig'] =3D ','.join(infos['ldconfig'])
> -    infos['lddrewrite'] =3D ' '.join(infos['lddrewrite'])
> +    infos['ldconfig'] =3D ','.join(sorted(infos['ldconfig']))
> +    infos['lddrewrite'] =3D ' '.join(sorted(infos['lddrewrite']))
>      return infos
>
>  EGLIBC_KNOWN_INTERPRETER_NAMES =3D "${@glibc_dl_info(d)['ldconfig']}"
> diff --git a/meta/recipes-core/glibc/glibc_2.26.bb
> b/meta/recipes-core/glibc/glibc_2.26.bb
> index 7eb56b3..df520bd 100644
> --- a/meta/recipes-core/glibc/glibc_2.26.bb
> +++ b/meta/recipes-core/glibc/glibc_2.26.bb
> @@ -133,12 +133,10 @@ do_compile () {
>         if [ -n "${RTLDLIST}" ]
>         then
>                 prevrtld=3D`cat ${B}/elf/ldd | grep "^RTLDLIST=3D" | sed
> 's#^RTLDLIST=3D"\?\([^"]*\)"\?$#\1#'`
> -               if [ "${prevrtld}" !=3D "${RTLDLIST}" ]
> -               then
> -                       sed -i ${B}/elf/ldd -e
> "s#^RTLDLIST=3D.*\$#RTLDLIST=3D\"${prevrtld} ${RTLDLIST}\"#"
> -               fi
> +               # remove duplicate entries
> +               newrtld=3D`echo "${prevrtld} ${RTLDLIST}" | xargs -n1 | s=
ort
> -u | xargs`
>


This =E2=80=9C| xargs=E2=80=9D at the end seems redundant. xargs what? xarg=
s is used to run
a command on each word of the input..
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a1143a45ccbe028056481bb8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Feb 5, 2018 at 11:26 AM, Juro Bystricky <span dir=3D"ltr">&lt;<=
a href=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.bystricky=
@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Multilib=
 builds specify several loaders which will end up embedded in<br>
some binaries or script files. To support reproducible builds, we must<br>
ensure the loaders are always in deterministic order.<br>
<br>
[YOCTO #2655]<br>
[YOCTO #12478]<br>
[YOCTO #12480]<br>
<br>
Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.co=
m">juro.bystricky@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc-<wbr>ld.inc=C2=A0 | 4 ++--<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_<wbr>2.26.bb</a> | 8 +++-----<br>
=C2=A02 files changed, 5 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/<wbr>glibc-ld.inc b/meta/recipes-core/=
glibc/<wbr>glibc-ld.inc<br>
index c1d635d..607b27c 100644<br>
--- a/meta/recipes-core/glibc/<wbr>glibc-ld.inc<br>
+++ b/meta/recipes-core/glibc/<wbr>glibc-ld.inc<br>
@@ -38,8 +38,8 @@ def glibc_dl_info(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0overrides =3D localdata.getVar(&quot;OVER=
RIDES&quot;, False) + &quot;:virtclass-multilib-&quot; + item<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localdata.setVar(&quot;OVERRIDES&quot;, o=
verrides)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ld_append_if_tune_exists(<wbr>localdata, =
infos, ld_info_all)<br>
-=C2=A0 =C2=A0 infos[&#39;ldconfig&#39;] =3D &#39;,&#39;.join(infos[&#39;ld=
config&#39;])<br>
-=C2=A0 =C2=A0 infos[&#39;lddrewrite&#39;] =3D &#39; &#39;.join(infos[&#39;=
lddrewrite&#39;])<br>
+=C2=A0 =C2=A0 infos[&#39;ldconfig&#39;] =3D &#39;,&#39;.join(sorted(infos[=
&#39;<wbr>ldconfig&#39;]))<br>
+=C2=A0 =C2=A0 infos[&#39;lddrewrite&#39;] =3D &#39; &#39;.join(sorted(info=
s[&#39;<wbr>lddrewrite&#39;]))<br>
=C2=A0 =C2=A0 =C2=A0return infos<br>
<br>
=C2=A0EGLIBC_KNOWN_INTERPRETER_NAMES =3D &quot;${@glibc_dl_info(d)[&#39;<wb=
r>ldconfig&#39;]}&quot;<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=
=3D"noreferrer" target=3D"_blank">glib<wbr>c_2.26.bb</a> b/meta/recipes-cor=
e/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"noreferrer" target=3D"_blan=
k">glib<wbr>c_2.26.bb</a><br>
index 7eb56b3..df520bd 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"noref=
errer" target=3D"_blank">glib<wbr>c_2.26.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"noref=
errer" target=3D"_blank">glib<wbr>c_2.26.bb</a><br>
@@ -133,12 +133,10 @@ do_compile () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${RTLDLIST}&quot; ]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prevrtld=3D`cat ${B=
}/elf/ldd | grep &quot;^RTLDLIST=3D&quot; | sed &#39;s#^RTLDLIST=3D&quot;\?=
\([^&quot;]*\)&quot;\?$#<wbr>\1#&#39;`<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${prevrt=
ld}&quot; !=3D &quot;${RTLDLIST}&quot; ]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sed -i ${B}/elf/ldd -e &quot;s#^RTLDLIST=3D.*\$#RTLDLIST=3D\&quot=
;$<wbr>{prevrtld} ${RTLDLIST}\&quot;#&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# remove duplicate =
entries<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newrtld=3D`echo &qu=
ot;${prevrtld} ${RTLDLIST}&quot; | xargs -n1 | sort -u | xargs`<br></blockq=
uote><div><br></div><div><br></div><div>This =E2=80=9C| xargs=E2=80=9D at t=
he end seems redundant. xargs what? xargs is used to run a command on each =
word of the input..</div></div>-- <br><div class=3D"gmail_signature" data-s=
martmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christo=
pher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded,=
 OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div><=
/div>
</div></div>

--001a1143a45ccbe028056481bb8f--
