Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web09.6671.1606311153667358938
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 05:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CudhbRHj;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id 7so3061231ejm.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2020 05:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MEMXmJcRKHNUHTrxpWMXb2vakd5w+tL71effYljScns=;
        b=CudhbRHj6e9Vy1Yp0IIqoFM5pXFQeHrDMJVX0/rmWeAMnPT3UAv2xZCBK7ncgz25cp
         7sYou/gY7Hk75nzigkKWd4sC/QwzUE3bv8u1AVRP1VekurrNXzM8NMpbI1RwV4xcrE9S
         Zu5M6sWA4y8C5FcMlqRdp1Y5WgxFNc1INN+8p+a2oSUcX7lk8giKzHlrm3JpTIBkZfol
         JyE6jUgsfvF5G3a7wibiFobUYv1rnf+NxoO1rQ/QvxA53eW5bJVXIKA+a4GSw+9Nhb8A
         TEDGJ3YcFVVU82h89pnJXikqiGMQUwew7SLtOxQd11hCUVsiap5AqktxxHFAWuyclOip
         7uuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MEMXmJcRKHNUHTrxpWMXb2vakd5w+tL71effYljScns=;
        b=SJZucgyOCYx0/JGVLwCvLZpbBiWC5A4jQW4EIgfbiqZ2Euexs2VYxZKcEM+f84B0n+
         j90PVSpeGbDzrG8lT/ohWAusktQphcZe9H7fMjNLfWVY7hzje4AqtWzSt1SyPauRONl4
         XMVpP1X19aAu4uwqcLz1gMsyms8DLKQwrmS8ElpGd3L1+ROD8xYUNKUZmMFNo1udS7tc
         xDeIDz4ntTDhbs3U/xYOFmipaJmQyUbhY1ZRyiF1vcmNR/fVNgmFjC3bCtt003isXQYS
         zc6y7xPRS5qgBUtM7YBp8uzLyGpAltSuHYo7w+m3yUsR/Ep02FafSYu9T5L8RGRvkufC
         jk6Q==
X-Gm-Message-State: AOAM5312y5UVHj0jNX+d7gURi0WV7x62dhkQrD2Mg8+vK7M1YoDVtFkR
	eUu/AzVbycKRugeBd1ItJyg4OIp1b7QnOzL0Zj8=
X-Google-Smtp-Source: ABdhPJwOjJc+/oKlDpXi14PUf7OIFWQnAEMdYNiApnDDYOAnj+BiCBTGvPY36YcNZkT9UjF2xhFeqSbXS0/PgMyV9MY=
X-Received: by 2002:a17:906:fcdb:: with SMTP id qx27mr3054498ejb.470.1606311152178;
 Wed, 25 Nov 2020 05:32:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606310940.git.pkj@axis.com> <9d90bc03e13030cfa8c46aafcd6d3c4c1cc6ba25.1606310940.git.pkj@axis.com>
In-Reply-To: <9d90bc03e13030cfa8c46aafcd6d3c4c1cc6ba25.1606310940.git.pkj@axis.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 25 Nov 2020 14:32:20 +0100
Message-ID: <CA+chaQexeaUzhzrstAi0YpcG=0jsvEGXm68kZ0rUg+AKoed1Lg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] bitbake.conf: Add all layers (from BBLAYERS) to PSEUDO_IGNORE_PATHS
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009fd9bb05b4ee7567"

--0000000000009fd9bb05b4ee7567
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks like some unrelated changes sneaked into this one.

On Wed, Nov 25, 2020 at 2:31 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> Instead of ignoring ${COREBASE}/meta in PSEUDO_IGNORE_PATHS (which may
> or may not ignore all layers depending on how they are named and placed
> under ${COREBASE}), ignore all layers.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/conf/bitbake.conf                      | 2 +-
>  meta/conf/machine/include/tune-thunderx.inc | 2 +-
>  scripts/contrib/bb-perf/bb-matrix-plot.sh   | 8 +++++---
>  3 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 0d38eac094..9742fe4fe2 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -685,7 +685,7 @@ SRC_URI =3D ""
>  PSEUDO_LOCALSTATEDIR ?=3D "${WORKDIR}/pseudo/"
>  PSEUDO_PASSWD ?=3D "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
>  PSEUDO_SYSROOT =3D "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
> -PSEUDO_IGNORE_PATHS =3D
> "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${S=
TAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR=
},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,=
${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,$=
{TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR=
}/cache,${COREBASE}/scripts,${COREBASE}/meta,${CCACHE_DIR}"
> +PSEUDO_IGNORE_PATHS =3D
> "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${S=
TAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR=
},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,=
${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,$=
{TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR=
}/cache,${COREBASE}/scripts,${@','.join(d.getVar('BBLAYERS').split())},${CC=
ACHE_DIR}"
>
>  export PSEUDO_DISABLED =3D "1"
>  #export PSEUDO_PREFIX =3D "${STAGING_DIR_NATIVE}${prefix_native}"
> diff --git a/meta/conf/machine/include/tune-thunderx.inc
> b/meta/conf/machine/include/tune-thunderx.inc
> index d1aaf4891e..dadcadedc6 100644
> --- a/meta/conf/machine/include/tune-thunderx.inc
> +++ b/meta/conf/machine/include/tune-thunderx.inc
> @@ -11,7 +11,7 @@ ARMPKGARCH_tune-thunderx ?=3D "thunderx"
>  ARMPKGARCH_tune-thunderx_be ?=3D "thunderx"
>
>  TUNE_FEATURES_tune-thunderx =3D "${TUNE_FEATURES_tune-aarch64} thunderx=
"
> -TUNE_FEATURES_tune-thunderx_be =3D "${TUNE_FEATURES_tune-thunderx}
> bigendian"
> +TUNE_FEATURES_tune-thunderx_be =3D "${TUNE_FEATURES_tune-aarch64_be}
> thunderx"
>  BASE_LIB_tune-thunderx =3D "lib64"
>  BASE_LIB_tune-thunderx_be =3D "lib64"
>
> diff --git a/scripts/contrib/bb-perf/bb-matrix-plot.sh
> b/scripts/contrib/bb-perf/bb-matrix-plot.sh
> index e7bd129e9e..450afcb559 100755
> --- a/scripts/contrib/bb-perf/bb-matrix-plot.sh
> +++ b/scripts/contrib/bb-perf/bb-matrix-plot.sh
> @@ -90,10 +90,12 @@ fi
>  # Determine the dgrid3d mesh dimensions size
>  MIN=3D$(tail -n +2 "$DATFILE" | cut -d ' ' -f 1 | sed 's/^0*//' | sort =
-n |
> uniq | head -n1)
>  MAX=3D$(tail -n +2 "$DATFILE" | cut -d ' ' -f 1 | sed 's/^0*//' | sort =
-n |
> uniq | tail -n1)
> -BB_CNT=3D$[${MAX} - $MIN + 1]
> +#BB_CNT=3D$[${MAX} - $MIN + 1]
> +BB_CNT=3D$[(${MAX} - $MIN)/4 + 1]
>  MIN=3D$(tail -n +2 "$DATFILE" | cut -d ' ' -f 2 | sed 's/^0*//' | sort =
-n |
> uniq | head -n1)
>  MAX=3D$(tail -n +2 "$DATFILE" | cut -d ' ' -f 2 | sed 's/^0*//' | sort =
-n |
> uniq | tail -n1)
> -PM_CNT=3D$[${MAX} - $MIN + 1]
> +#PM_CNT=3D$[${MAX} - $MIN + 1]
> +PM_CNT=3D$[(${MAX} - $MIN)/4 + 1]
>
>
>  (cat <<EOF
> @@ -118,7 +120,7 @@ set output "$PLOT_BASENAME-pm.png"
>  replot
>
>  set view 60,30
> -set term wxt size $SIZE
> +set term qt size $SIZE
>  replot
>  EOF
>  ) | gnuplot --persist
>
>=20
>
>

--0000000000009fd9bb05b4ee7567
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like some unrelated changes sneaked into this one.</=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, Nov 25, 2020 at 2:31 PM Peter Kjellerstedt &lt;<a href=3D"mailto:pete=
r.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Instead of ignoring ${C=
OREBASE}/meta in PSEUDO_IGNORE_PATHS (which may<br>
or may not ignore all layers depending on how they are named and placed<br=
>
under ${COREBASE}), ignore all layers.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt=
@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/conf/machine/include/tune-thunderx.inc | 2 +-<br>
=C2=A0scripts/contrib/bb-perf/bb-matrix-plot.sh=C2=A0 =C2=A0| 8 +++++---<b=
r>
=C2=A03 files changed, 7 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 0d38eac094..9742fe4fe2 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -685,7 +685,7 @@ SRC_URI =3D &quot;&quot;<br>
=C2=A0PSEUDO_LOCALSTATEDIR ?=3D &quot;${WORKDIR}/pseudo/&quot;<br>
=C2=A0PSEUDO_PASSWD ?=3D &quot;${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}&quo=
t;<br>
=C2=A0PSEUDO_SYSROOT =3D &quot;${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-nati=
ve&quot;<br>
-PSEUDO_IGNORE_PATHS =3D &quot;/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/reci=
pe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}=
/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WOR=
KDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/s=
state-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR=
},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta,${=
CCACHE_DIR}&quot;<br>
+PSEUDO_IGNORE_PATHS =3D &quot;/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/reci=
pe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}=
/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WOR=
KDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/s=
state-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR=
},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${@&#39;,&#39;.join=
(d.getVar(&#39;BBLAYERS&#39;).split())},${CCACHE_DIR}&quot;<br>
<br>
=C2=A0export PSEUDO_DISABLED =3D &quot;1&quot;<br>
=C2=A0#export PSEUDO_PREFIX =3D &quot;${STAGING_DIR_NATIVE}${prefix_native=
}&quot;<br>
diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf/machi=
ne/include/tune-thunderx.inc<br>
index d1aaf4891e..dadcadedc6 100644<br>
--- a/meta/conf/machine/include/tune-thunderx.inc<br>
+++ b/meta/conf/machine/include/tune-thunderx.inc<br>
@@ -11,7 +11,7 @@ ARMPKGARCH_tune-thunderx ?=3D &quot;thunderx&quot;<br>
=C2=A0ARMPKGARCH_tune-thunderx_be ?=3D &quot;thunderx&quot;<br>
<br>
=C2=A0TUNE_FEATURES_tune-thunderx =3D &quot;${TUNE_FEATURES_tune-aarch64} =
thunderx&quot;<br>
-TUNE_FEATURES_tune-thunderx_be =3D &quot;${TUNE_FEATURES_tune-thunderx} b=
igendian&quot;<br>
+TUNE_FEATURES_tune-thunderx_be =3D &quot;${TUNE_FEATURES_tune-aarch64_be}=
 thunderx&quot;<br>
=C2=A0BASE_LIB_tune-thunderx =3D &quot;lib64&quot;<br>
=C2=A0BASE_LIB_tune-thunderx_be =3D &quot;lib64&quot;<br>
<br>
diff --git a/scripts/contrib/bb-perf/bb-matrix-plot.sh b/scripts/contrib/b=
b-perf/bb-matrix-plot.sh<br>
index e7bd129e9e..450afcb559 100755<br>
--- a/scripts/contrib/bb-perf/bb-matrix-plot.sh<br>
+++ b/scripts/contrib/bb-perf/bb-matrix-plot.sh<br>
@@ -90,10 +90,12 @@ fi<br>
=C2=A0# Determine the dgrid3d mesh dimensions size<br>
=C2=A0MIN=3D$(tail -n +2 &quot;$DATFILE&quot; | cut -d &#39; &#39; -f 1 | =
sed &#39;s/^0*//&#39; | sort -n | uniq | head -n1)<br>
=C2=A0MAX=3D$(tail -n +2 &quot;$DATFILE&quot; | cut -d &#39; &#39; -f 1 | =
sed &#39;s/^0*//&#39; | sort -n | uniq | tail -n1)<br>
-BB_CNT=3D$[${MAX} - $MIN + 1]<br>
+#BB_CNT=3D$[${MAX} - $MIN + 1]<br>
+BB_CNT=3D$[(${MAX} - $MIN)/4 + 1]<br>
=C2=A0MIN=3D$(tail -n +2 &quot;$DATFILE&quot; | cut -d &#39; &#39; -f 2 | =
sed &#39;s/^0*//&#39; | sort -n | uniq | head -n1)<br>
=C2=A0MAX=3D$(tail -n +2 &quot;$DATFILE&quot; | cut -d &#39; &#39; -f 2 | =
sed &#39;s/^0*//&#39; | sort -n | uniq | tail -n1)<br>
-PM_CNT=3D$[${MAX} - $MIN + 1]<br>
+#PM_CNT=3D$[${MAX} - $MIN + 1]<br>
+PM_CNT=3D$[(${MAX} - $MIN)/4 + 1]<br>
<br>
<br>
=C2=A0(cat &lt;&lt;EOF<br>
@@ -118,7 +120,7 @@ set output &quot;$PLOT_BASENAME-pm.png&quot;<br>
=C2=A0replot<br>
<br>
=C2=A0set view 60,30<br>
-set term wxt size $SIZE<br>
+set term qt size $SIZE<br>
=C2=A0replot<br>
=C2=A0EOF<br>
=C2=A0) | gnuplot --persist<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000009fd9bb05b4ee7567--
