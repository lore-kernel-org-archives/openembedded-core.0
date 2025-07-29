Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02A1C87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 14:58:12 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.9789.1753801088545097487
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 07:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XOEyNSND;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-33212cf558fso12674271fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753801087; x=1754405887; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=egSdjeqOyufD34rSy1FvKQUKiLkFWy9bQl05rlJNGSw=;
        b=XOEyNSNDovLTn0TFyktbEgphEv7jvSSQQwnuuoTAaMXeUeIeI21VIKUFW8rL+bJAre
         HreGgL/FiqJQ7ODvvFcexrQOVbcbSjc9uUM9vV5/iyxR+dOwyMHXlL9mMOtLEbjRYNqz
         NL/uL49K/AGQ66ZyARh1/Ej/lGrGYuGuBjW6FubIALkIkmpTzHY5dJWNNg5hQgFHNLGZ
         AS35I+6TcXTWDrRaf0KuwM+aHDqGR9DFuhEQDmLhooFay3IetUIi45WhSm1zCRvFOj72
         B0CFO1+BD+Z+8qB1P8xhbppDEjCMZlnZDnGd9nHJwTZSubTj/IxL/mB4N9JJFLJcL2hX
         0Xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753801087; x=1754405887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=egSdjeqOyufD34rSy1FvKQUKiLkFWy9bQl05rlJNGSw=;
        b=GM5soMHgMRPlNa3bX/grqq7xWUbRtgc/2MlsICu8fZ9AiItP7Mv64DGn5w+Tq3+Adk
         y4zQvrriEH4I4Bbiai8AlRo1lCJNvNlnt4PJccb/njXQQwuiGgucr4DxdUty+ZblJ/mm
         xjTlemteo/S88jNa8NgIeYUqAYpodI8Cve48x4cVhKdAyLlbVuzQtPsbY5cX4sK7Dzvo
         bsolFXGTUYHxC8x/PSSVtfMOGhcwpv7qaz53EDQ72rrDrNjdM9llkwNaJ9vZ/Hd2Cm81
         mTeVVKkQTjcYFTt9vA3jW0OMvAZfxaCHDRwMznei+qde4cMtHk2bLDizzIfPY/Z+i7/e
         WnfQ==
X-Gm-Message-State: AOJu0YyPznnwFq9+8rd3lQ67er8U58APSmHsMGHj0p6T/X+a6M5j8v+0
	VLXWKX5iKD+oLdYA1Gx9kPeTKB6OmWcCOzQIevH0rjihc/nDxGihY8yCHj0PCIVc8xQCcJw1pXX
	UdBXi20dJtd4olPtSCJHyJmY5nrXm9NU=
X-Gm-Gg: ASbGncviPrHr8ZMlDQgplWZpZtliQBqDnZpa3nwfKcDKZM/RKMGfVvI/AJkC03Um8Xn
	qcIlY3HSk3FdeXlAGbnMx1Qh0N19HrYkZznWlcu05fe/TCQGZFqQW+GHN2is3jgdEdEArCGU1F5
	ulkDHP+pyXJPemYQPI3qwJhhNw/IPL9VhKYrgFQMC199rKgmKLHQ3W1up4ZaOvWZkxCAzZyyAa7
	XDIoo9viVeLIy59SZOCkzkszvXRiaVX
X-Google-Smtp-Source: AGHT+IFU2IvEJOHTvemx54X8q4jhPPIAPTe6uXtgF/A7KXT7K6MwcqSNugh4YzapE2z/N62REqG9jifw5SKFiTeMkk8=
X-Received: by 2002:a2e:a7c7:0:b0:332:1de5:c52b with SMTP id
 38308e7fff4ca-3321de5c9f1mr3050881fa.1.1753801086101; Tue, 29 Jul 2025
 07:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250728133044.39757-1-kamel.bouhara@bootlin.com> <20250728133044.39757-3-kamel.bouhara@bootlin.com>
In-Reply-To: <20250728133044.39757-3-kamel.bouhara@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 29 Jul 2025 08:57:53 -0600
X-Gm-Features: Ac12FXxbopev-iNZqL52IAF7Am-iNoYDxF0z5I-jYTKoC_b7J3jXI8PLJp9Wx28
Message-ID: <CAJdd5GbUwXGsL_xM9Ku0kPfvUxMgOgwYc7VxGpW2SfOe_KumjQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] spdx30_tasks: Add support for exporting
 PACKAGECONFIG to SPDX
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	Miquel Raynal <miquel.raynal@bootlin.com>, mathieu.dubois-briand@bootlin.com, 
	antonin.godard@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000be7166063b12a235"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 14:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221081

--000000000000be7166063b12a235
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm not quite sure about this. The PACKAGECONFIG value is already captured
if you do `SPDX_INCLUDE_BUILD_VARIABLES =3D "1"`, so having a explicit way =
to
capture it doesn't seem necessary.

If the build variables are too much data, I'd prefer some way to filter
which ones get included in the SPDX data rather than add special cases for
special variables (for example, maybe `SPDX_INCLUDE_BUILD_VARIABLES =3D "1"=
`
include all variables, but `SPDX_INCLUDE_BUILD_VARIABLES =3D "PACKAGECONFIG=
"`
would only include the value of PACKAGECONFIG)

On Mon, Jul 28, 2025 at 7:30=E2=80=AFAM Kamel Bouhara <kamel.bouhara@bootli=
n.com>
wrote:

> Introduce the SPDX_INCLUDE_PACKAGECONFIG variable, which when enabled
> causes
> PACKAGECONFIG features to be recorded in the SPDX document as build
> parameters.
>
> Each feature is recorded as a DictionaryEntry with key
> PACKAGECONFIG:<feature>
> and value enabled or disabled, depending on whether the feature is active
> in
> the current build.
>
> This makes the build-time configuration more transparent in SPDX output a=
nd
> improves reproducibility tracking.
>
> This makes the build-time configuration more transparent in SPDX output a=
nd
> improves reproducibility tracking. In particular, it allows consumers of
> the
> SBOM to identify enabled/disabled features that may affect security postu=
re
> or feature set.
>
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass |  5 +++++
>  meta/lib/oe/spdx30_tasks.py          | 20 ++++++++++++++++++++
>  2 files changed, 25 insertions(+)
>
> diff --git a/meta/classes/create-spdx-3.0.bbclass
> b/meta/classes/create-spdx-3.0.bbclass
> index 15c31ba9a3..6125e8b547 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -56,6 +56,11 @@ and each CONFIG_* value will be included in the
> Build.build_parameter list as Di
>  items. Set to '0' to disable exporting kernel configuration to improve
> performance or reduce \
>  SPDX document size."
>
> +SPDX_INCLUDE_PACKAGECONFIG ??=3D "0"
> +SPDX_INCLUDE_PACKAGECONFIG[doc] =3D "If set to '1', each PACKAGECONFIG
> feature is recorded in the \
> +build_Build object's build_parameter list as a DictionaryEntry with key =
\
> +'PACKAGECONFIG:<feature>' and value 'enabled' or 'disabled'"
> +
>  SPDX_IMPORTS ??=3D ""
>  SPDX_IMPORTS[doc] =3D "SPDX_IMPORTS is the base variable that describes =
how
> to \
>      reference external SPDX ids. Each import is defined as a key in this=
 \
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index c352dab152..d708715981 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -815,6 +815,26 @@ def create_spdx(d):
>              sorted(list(build_inputs)) + sorted(list(debug_source_ids)),
>          )
>
> +    if d.getVar("SPDX_INCLUDE_PACKAGECONFIG", True) !=3D "0":
> +        packageconfig =3D (d.getVar("PACKAGECONFIG") or "").split()
> +        all_features =3D (d.getVarFlags("PACKAGECONFIG") or {}).keys()
> +
> +        if all_features:
> +            enabled =3D set(packageconfig)
> +            all_features_set =3D set(all_features)
> +            disabled =3D all_features_set - enabled
> +
> +            for feature in sorted(all_features):
> +                status =3D "enabled" if feature in enabled else "disable=
d"
> +                build.build_parameter.append(
> +                    oe.spdx30.DictionaryEntry(
> +                        key=3Df"PACKAGECONFIG:{feature}",
> +                        value=3Dstatus
> +                    )
> +                )
> +
> +            bb.note(f"Added PACKAGECONFIG entries: {len(enabled)}
> enabled, {len(disabled)} disabled")
> +
>      oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "recipes",
> deploydir)
>
>
> --
> 2.43.0
>
>

--000000000000be7166063b12a235
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m not quite sure about this. The PACKAGECONFIG =
value is already captured if you do `SPDX_INCLUDE_BUILD_VARIABLES =3D &quot=
;1&quot;`, so having a explicit way to capture it doesn&#39;t seem necessar=
y.</div><div><br></div><div>If the build variables are too much data, I&#39=
;d prefer some way to filter which ones get included in the SPDX data rathe=
r than add special cases for special variables (for example, maybe `SPDX_IN=
CLUDE_BUILD_VARIABLES =3D &quot;1&quot;` include all variables, but `SPDX_I=
NCLUDE_BUILD_VARIABLES =3D &quot;PACKAGECONFIG&quot;` would only include th=
e value of PACKAGECONFIG) </div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 28, 2025 at 7:3=
0=E2=80=AFAM Kamel Bouhara &lt;<a href=3D"mailto:kamel.bouhara@bootlin.com"=
>kamel.bouhara@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Introduce the SPDX_INCLUDE_PACKAGECONFIG variable=
, which when enabled causes<br>
PACKAGECONFIG features to be recorded in the SPDX document as build paramet=
ers.<br>
<br>
Each feature is recorded as a DictionaryEntry with key PACKAGECONFIG:&lt;fe=
ature&gt;<br>
and value enabled or disabled, depending on whether the feature is active i=
n<br>
the current build.<br>
<br>
This makes the build-time configuration more transparent in SPDX output and=
<br>
improves reproducibility tracking.<br>
<br>
This makes the build-time configuration more transparent in SPDX output and=
<br>
improves reproducibility tracking. In particular, it allows consumers of th=
e<br>
SBOM to identify enabled/disabled features that may affect security posture=
<br>
or feature set.<br>
<br>
Signed-off-by: Kamel Bouhara &lt;<a href=3D"mailto:kamel.bouhara@bootlin.co=
m" target=3D"_blank">kamel.bouhara@bootlin.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/create-spdx-3.0.bbclass |=C2=A0 5 +++++<br>
=C2=A0meta/lib/oe/spdx30_tasks.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 20 ++=
++++++++++++++++++<br>
=C2=A02 files changed, 25 insertions(+)<br>
<br>
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spd=
x-3.0.bbclass<br>
index 15c31ba9a3..6125e8b547 100644<br>
--- a/meta/classes/create-spdx-3.0.bbclass<br>
+++ b/meta/classes/create-spdx-3.0.bbclass<br>
@@ -56,6 +56,11 @@ and each CONFIG_* value will be included in the Build.bu=
ild_parameter list as Di<br>
=C2=A0items. Set to &#39;0&#39; to disable exporting kernel configuration t=
o improve performance or reduce \<br>
=C2=A0SPDX document size.&quot;<br>
<br>
+SPDX_INCLUDE_PACKAGECONFIG ??=3D &quot;0&quot;<br>
+SPDX_INCLUDE_PACKAGECONFIG[doc] =3D &quot;If set to &#39;1&#39;, each PACK=
AGECONFIG feature is recorded in the \<br>
+build_Build object&#39;s build_parameter list as a DictionaryEntry with ke=
y \<br>
+&#39;PACKAGECONFIG:&lt;feature&gt;&#39; and value &#39;enabled&#39; or &#3=
9;disabled&#39;&quot;<br>
+<br>
=C2=A0SPDX_IMPORTS ??=3D &quot;&quot;<br>
=C2=A0SPDX_IMPORTS[doc] =3D &quot;SPDX_IMPORTS is the base variable that de=
scribes how to \<br>
=C2=A0 =C2=A0 =C2=A0reference external SPDX ids. Each import is defined as =
a key in this \<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index c352dab152..d708715981 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -815,6 +815,26 @@ def create_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sorted(list(build_inputs)) =
+ sorted(list(debug_source_ids)),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;SPDX_INCLUDE_PACKAGECONFIG&quot;, True) !=
=3D &quot;0&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 packageconfig =3D (d.getVar(&quot;PACKAGECONFI=
G&quot;) or &quot;&quot;).split()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 all_features =3D (d.getVarFlags(&quot;PACKAGEC=
ONFIG&quot;) or {}).keys()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if all_features:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 enabled =3D set(packageconfig)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 all_features_set =3D set(all_fea=
tures)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 disabled =3D all_features_set - =
enabled<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for feature in sorted(all_featur=
es):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;e=
nabled&quot; if feature in enabled else &quot;disabled&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 build.build_parame=
ter.append(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.s=
pdx30.DictionaryEntry(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 key=3Df&quot;PACKAGECONFIG:{feature}&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 value=3Dstatus<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(f&quot;Added PACKAGECONF=
IG entries: {len(enabled)} enabled, {len(disabled)} disabled&quot;)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0oe.sbom30.write_recipe_jsonld_doc(d, build_objset, &quo=
t;recipes&quot;, deploydir)<br>
<br>
<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div>

--000000000000be7166063b12a235--

