Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.443.1602546328566481939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 16:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mURy/tRZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id p15so25656548ejm.7
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 16:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uIbEadNPz11Riw6QAUyv+3O5IyIM3MHxzfBERazkum4=;
        b=mURy/tRZzgmCt5QHruA1HCihOVJFpUBWcR/Q/CojFR2FUDzLcssqCeCMvi4D50YY5l
         fUSLuEFq9aDlbfJYeonoIusZhKjTPEYsLkBwLBLN3wwjwtiRZ6wHcp7lQjpVMPsZoiDE
         ee7WW0msQBszLG2v/29kolrKzGn36lJ/dMJefO2/Jr1BFQAVcqJt5Y40XkkB4ce4H1BA
         a+tZGuwWRa92vpl9Ngd2ofQDi2c0J1FRxrvFGWxP2JNfX/e+5q1t7Ktnm2z4amIOqvvE
         qzOENehMivLhx4aI0WFJ3SAbJArIIRJ7scE1FQq8/zpMNBBEDnF8jWk1cm54CA1RG7Iy
         +uRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uIbEadNPz11Riw6QAUyv+3O5IyIM3MHxzfBERazkum4=;
        b=oglUHYAeAW89CqGy3xYcAo2uD+PI0SudlxFmtmrEzRHJPYdho/Q0hvqmXIb0mJR7d0
         jYUX6g/sHGbkPw6DOuWOUVRV1uqE52xRXy+eqMlKgCr8Kzq15o8zFA0k9aNO18VsGCMW
         lUBXSERX+a9WK1QTGXLHsBRqZdytttWJSTvBwiXxJwozhC/tviIEhBW1cJ7ia5R3xTK/
         Q0o6GdJtjyR18a33r9HnTW3KW5jss1C6wPPbG4DIArXOevzPr0wScliYtmdGpHr/p0Rk
         U74Oq6rsZMwEzie5eWhV94rTl8OcjOy2FBUKSUusSwIpsKYs/TvRXdaxYEkgapEpyN7P
         f21g==
X-Gm-Message-State: AOAM5338ADQC1m3dHWTM6BTogrwexZTyq2dmVn4zp+L+BI+R1cEWZGzv
	/tWzOk2OuqnK4g97neRXNMYeit1rttcpPh8r1BE=
X-Google-Smtp-Source: ABdhPJwFFHrAgVkXPq4Zr0BZHhwRintJTwcfTPaFIosmHnL4B/tv8yNFlizd+UfF8OPtsJ1Aw9fvpOlutCb5f9H8/j0=
X-Received: by 2002:a17:906:ca54:: with SMTP id jx20mr604015ejb.541.1602546326819;
 Mon, 12 Oct 2020 16:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200928130551.21346-1-jon.mason@arm.com> <20200928130551.21346-6-jon.mason@arm.com>
In-Reply-To: <20200928130551.21346-6-jon.mason@arm.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 13 Oct 2020 01:45:15 +0200
Message-ID: <CA+chaQdfzN9B1y9uEFWUc-EtPadcPxY0F-B=+z9+X+vAc+=V_Q@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v4 5/6] armv8/tunes: Add tunes for supported ARMv8.2a cores
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008bd7d905b181e44c"

--0000000000008bd7d905b181e44c
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 28, 2020 at 3:32 PM Jon Mason <jdmason@kudzu.us> wrote:

> Add tunes for all the ARMv8.2a cores currently supported in GCC.  This
> is: Cortex-A65, Cortex-A65AE, Cortex-A75, Cortex-A76, Cortex-A76AE,
> Cortex-A77, Neoverse-E1, Neoverse-N1, Cortex-A75-Cortex-A55, and
> Cortex-A76-Cortex-A55.
>
> Signed-off-by: Jon Mason <jon.mason@arm.com>
> ---
>  meta/conf/machine/include/tune-cortexa65.inc  | 16 +++++++++++++++
>  .../conf/machine/include/tune-cortexa65ae.inc | 16 +++++++++++++++
>  .../include/tune-cortexa75-cortexa55.inc      | 20 +++++++++++++++++++
>  meta/conf/machine/include/tune-cortexa75.inc  | 16 +++++++++++++++
>  .../include/tune-cortexa76-cortexa55.inc      | 20 +++++++++++++++++++
>  meta/conf/machine/include/tune-cortexa76.inc  | 16 +++++++++++++++
>  .../conf/machine/include/tune-cortexa76ae.inc | 16 +++++++++++++++
>  meta/conf/machine/include/tune-cortexa77.inc  | 16 +++++++++++++++
>  meta/conf/machine/include/tune-neoversee1.inc | 16 +++++++++++++++
>  meta/conf/machine/include/tune-neoversen1.inc | 17 ++++++++++++++++
>  10 files changed, 169 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-cortexa65.inc
>  create mode 100644 meta/conf/machine/include/tune-cortexa65ae.inc
>  create mode 100644 meta/conf/machine/include/tune-cortexa75-cortexa55.inc
>  create mode 100644 meta/conf/machine/include/tune-cortexa75.inc
>  create mode 100644 meta/conf/machine/include/tune-cortexa76-cortexa55.inc
>  create mode 100644 meta/conf/machine/include/tune-cortexa76.inc
>  create mode 100644 meta/conf/machine/include/tune-cortexa76ae.inc
>  create mode 100644 meta/conf/machine/include/tune-cortexa77.inc
>  create mode 100644 meta/conf/machine/include/tune-neoversee1.inc
>  create mode 100644 meta/conf/machine/include/tune-neoversen1.inc
>
> diff --git a/meta/conf/machine/include/tune-cortexa76ae.inc
> b/meta/conf/machine/include/tune-cortexa76ae.inc
> new file mode 100644
> index 000000000000..d368aa104d0f
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-cortexa76ae.inc
> @@ -0,0 +1,16 @@
> +#
> +# Tune Settings for Cortex-A76AE
> +#
> +DEFAULTTUNE                                        ?= "cortexa76ae"
> +
> +TUNEVALID[cortexa76ae] = "Enable Cortex-A76AE specific processor
> optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa76ae', '
> -mcpu=cortex-a76ae', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8-2a.inc
> +
> +# Little Endian base configs
> +AVAILTUNES                                         += "cortexa76ae"
> +ARMPKGARCH_tune-cortexa76ae                         = "cortexa76ae"
> +TUNE_FEATURES_tune-cortexa65ae                      =
> "${TUNE_FEATURES_tune-armv8-2a-crypto} cortexa76ae"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa76ae                =
> "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa76ae"
> +BASE_LIB_tune-cortexa76ae                           = "lib64"
>
>
typo here as shown in

https://git.openembedded.org/openembedded-core-contrib/diff/scripts/tune/log.fake-cortexa76ae?h=jansa/tune-test

--0000000000008bd7d905b181e44c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 28, 2020 at 3:32 PM Jon M=
ason &lt;<a href=3D"mailto:jdmason@kudzu.us">jdmason@kudzu.us</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add tunes for =
all the ARMv8.2a cores currently supported in GCC.=C2=A0 This<br>
is: Cortex-A65, Cortex-A65AE, Cortex-A75, Cortex-A76, Cortex-A76AE,<br>
Cortex-A77, Neoverse-E1, Neoverse-N1, Cortex-A75-Cortex-A55, and<br>
Cortex-A76-Cortex-A55.<br>
<br>
Signed-off-by: Jon Mason &lt;<a href=3D"mailto:jon.mason@arm.com" target=3D=
"_blank">jon.mason@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/tune-cortexa65.inc=C2=A0 | 16 +++++++++++++=
++<br>
=C2=A0.../conf/machine/include/tune-cortexa65ae.inc | 16 +++++++++++++++<br=
>
=C2=A0.../include/tune-cortexa75-cortexa55.inc=C2=A0 =C2=A0 =C2=A0 | 20 +++=
++++++++++++++++<br>
=C2=A0meta/conf/machine/include/tune-cortexa75.inc=C2=A0 | 16 +++++++++++++=
++<br>
=C2=A0.../include/tune-cortexa76-cortexa55.inc=C2=A0 =C2=A0 =C2=A0 | 20 +++=
++++++++++++++++<br>
=C2=A0meta/conf/machine/include/tune-cortexa76.inc=C2=A0 | 16 +++++++++++++=
++<br>
=C2=A0.../conf/machine/include/tune-cortexa76ae.inc | 16 +++++++++++++++<br=
>
=C2=A0meta/conf/machine/include/tune-cortexa77.inc=C2=A0 | 16 +++++++++++++=
++<br>
=C2=A0meta/conf/machine/include/tune-neoversee1.inc | 16 +++++++++++++++<br=
>
=C2=A0meta/conf/machine/include/tune-neoversen1.inc | 17 ++++++++++++++++<b=
r>
=C2=A010 files changed, 169 insertions(+)<br>
=C2=A0create mode 100644 meta/conf/machine/include/tune-cortexa65.inc<br>
=C2=A0create mode 100644 meta/conf/machine/include/tune-cortexa65ae.inc<br>
=C2=A0create mode 100644 meta/conf/machine/include/tune-cortexa75-cortexa55=
.inc<br>
=C2=A0create mode 100644 meta/conf/machine/include/tune-cortexa75.inc<br>
=C2=A0create mode 100644 meta/conf/machine/include/tune-cortexa76-cortexa55=
.inc<br>
=C2=A0create mode 100644 meta/conf/machine/include/tune-cortexa76.inc<br>
=C2=A0create mode 100644 meta/conf/machine/include/tune-cortexa76ae.inc<br>
=C2=A0create mode 100644 meta/conf/machine/include/tune-cortexa77.inc<br>
=C2=A0create mode 100644 meta/conf/machine/include/tune-neoversee1.inc<br>
=C2=A0create mode 100644 meta/conf/machine/include/tune-neoversen1.inc<br>
<br>diff --git a/meta/conf/machine/include/tune-cortexa76ae.inc b/meta/conf=
/machine/include/tune-cortexa76ae.inc<br>
new file mode 100644<br>
index 000000000000..d368aa104d0f<br>
--- /dev/null<br>
+++ b/meta/conf/machine/include/tune-cortexa76ae.inc<br>
@@ -0,0 +1,16 @@<br>
+#<br>
+# Tune Settings for Cortex-A76AE<br>
+#<br>
+DEFAULTTUNE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ?=3D &quot;cortexa76ae&quot;<br>
+<br>
+TUNEVALID[cortexa76ae] =3D &quot;Enable Cortex-A76AE specific processor op=
timizations&quot;<br>
+TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;=
cortexa76ae&#39;, &#39; -mcpu=3Dcortex-a76ae&#39;, &#39;&#39;, d)}&quot;<br=
>
+<br>
+require conf/machine/include/arm/arch-armv8-2a.inc<br>
+<br>
+# Little Endian base configs<br>
+AVAILTUNES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+=3D &quot;cortexa76ae&quot;<br>
+ARMPKGARCH_tune-cortexa76ae=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;cortexa76ae&quot;<br=
>
+TUNE_FEATURES_tune-cortexa65ae=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;${TUNE_FEATURES_tune-armv8-2a-=
crypto} cortexa76ae&quot;<br>
+PACKAGE_EXTRA_ARCHS_tune-cortexa76ae=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cor=
texa76ae&quot;<br>
+BASE_LIB_tune-cortexa76ae=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;lib64&quot;<br><b=
r></blockquote><div><br></div><div>typo here as shown in</div><div><br></di=
v><div><a href=3D"https://git.openembedded.org/openembedded-core-contrib/di=
ff/scripts/tune/log.fake-cortexa76ae?h=3Djansa/tune-test">https://git.opene=
mbedded.org/openembedded-core-contrib/diff/scripts/tune/log.fake-cortexa76a=
e?h=3Djansa/tune-test</a>=C2=A0</div></div></div>

--0000000000008bd7d905b181e44c--
