Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81181CA0FE9
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 07:53:04 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.59451.1756194771049574093
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 00:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ncN2W+Pr;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e96e3094fd9so187543276.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 00:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756194770; x=1756799570; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gC2tNjh8U2nbQqYHO3fQvu9/nuzTazLO2xEIk7Waofw=;
        b=ncN2W+PrF2hnabaWgV39ZeLSkbm5XeKgMGu5HqK7g/6MIeRSyjADArv5EXLEflnoou
         OUC0GpHjWX4dnY0CPwABnl0gM1pdLXrPi++kTzm6Xc3LXBMd6G/1QEXHwX+Jx4RFlNeD
         qnu5yM0ZyhUADQZ2LLwTu8mOjdkEMxyfBfPdRD/6Fz122NjrYllTfPjsiOKsPHtuBfOY
         qKuTX+mf8BIsj4FAlgVL+3UVebYHmLiwX314Q9M/hFOXNIqfbKhIKcodqCAQLfZS743k
         sL9hp8123dCX2xBmjcdT9qqBrqBUHEdGD0sHx0a3noLrZ7hrsZuBaPDVtrQv8cIOy3UF
         MGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756194770; x=1756799570;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gC2tNjh8U2nbQqYHO3fQvu9/nuzTazLO2xEIk7Waofw=;
        b=B5l0Rv75fE2HjUwpf0E6BcTOCkltaqvc+SDVrjfXPT8HbA7EkIV/yr+K0RPkbDhloH
         kXEiow+zhUnSsneI/aqC7VOOaiFM744t3kBQK8BVQ+l0EzTIX0qzErdBU945+1Geef4d
         hP2Odde4q2hF7oWA1HODDiimav2AHgK3XZfCSTmnCump80ZivLauDQYheRQCNxPi7dFy
         6rrKVyBCCcjU49qtMuC+84GVqSGX6sV9YNSS3LZwIxrEsSq3D8kCCSFgW+4ZgYGqz9aE
         I1zEba45qGCpPXC7AgyjBoM4p5qRX4A/xp0G1zxi37UBd9Pj5aGT37HsMLjc8Lly+l1D
         TG6A==
X-Gm-Message-State: AOJu0YwluoeXQPgsB6h7YqzyXTb7p4I6Qkt3NiVMhuxbwr0l5e/x7d0C
	JPEKB++/vM3CIYSEuXmAz4rCPmjJCq5pJ7UdKT4qmy8aXuUdKY5uXOGTm33jNBVJITRkFnhCQmk
	7bK2Xiq91tR5ydgS/QtjJ4tcRh3RwzpA=
X-Gm-Gg: ASbGncuUy2IlL/Zm7fMq4z/Ea38v/p22nfcNDVsRMwkTrczjZ0BxZEW0WOxAq/54OrA
	U7V+i44rfQETpWlXPlS6phQE5dzMvAaHlPb1yTLuRH54TYKBDGZUrfl6a7Lh1ArHQStAo4PNgxH
	fOK8vk4bktfwKqbQDKHmyOWoJ//knPHFDSd2bphYNiyMWyowuuXr/Dj8KQVFmyMTaO0q3QoIC2p
	PtMcDc2a/JIOAsWgQGM
X-Google-Smtp-Source: AGHT+IHWHjHnQSNx3hE2/pLTz0FdeL+RPL74JCpKUVlwmwkdue0i7quHMMtH8KvZFppMd3a4M3JPEdodCCETG2p+ufE=
X-Received: by 2002:a05:690c:a081:20b0:71f:eede:1fdb with SMTP id
 00721157ae682-71feede3976mr103757497b3.35.1756194769910; Tue, 26 Aug 2025
 00:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250821145438.2537767-1-kamel.bouhara@bootlin.com> <20250821145438.2537767-3-kamel.bouhara@bootlin.com>
In-Reply-To: <20250821145438.2537767-3-kamel.bouhara@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 26 Aug 2025 01:52:37 -0600
X-Gm-Features: Ac12FXzhE_FFJJY02sMsoxEBGjbnzqaFe_hUrNHM81dt6byOk31sLNnQlaBCej0
Message-ID: <CAJdd5GY6h7b_M2XisVOpt7uuh+umdf0w+R-wWjGUUXy0npNM2g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] spdx30_tasks: Add support for exporting
 PACKAGECONFIG to SPDX
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	Miquel Raynal <miquel.raynal@bootlin.com>, mathieu.dubois-briand@bootlin.com, 
	antonin.godard@bootlin.com
Content-Type: multipart/alternative; boundary="0000000000006ac0d1063d3ff528"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 07:53:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222436

--0000000000006ac0d1063d3ff528
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 8:54=E2=80=AFAM Kamel Bouhara <kamel.bouhara@bootli=
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
>

LGTM

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>


>      oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "recipes",
> deploydir)
>
>
> --
> 2.43.0
>
>

--0000000000006ac0d1063d3ff528
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 21,=
 2025 at 8:54=E2=80=AFAM Kamel Bouhara &lt;<a href=3D"mailto:kamel.bouhara@=
bootlin.com">kamel.bouhara@bootlin.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Introduce the SPDX_INCLUDE_PACKAGECON=
FIG variable, which when enabled causes<br>
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
+<br></blockquote><div><br></div><div>LGTM</div><div><br></div><div>Reviewe=
d-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com">JPEWhacker@gm=
ail.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
=C2=A0 =C2=A0 =C2=A0oe.sbom30.write_recipe_jsonld_doc(d, build_objset, &quo=
t;recipes&quot;, deploydir)<br>
<br>
<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div>

--0000000000006ac0d1063d3ff528--

