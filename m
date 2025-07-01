Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43550C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 22:56:49 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web11.10600.1751410602489665769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 15:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B60Lufx1;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86fea8329cdso3070295241.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751410601; x=1752015401; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sbefn7N4iHrY4SmfOxSdiL63vzuILQTZ+UrJlGXdK7E=;
        b=B60Lufx126VUzVrt0CVnX6dCqTfQ3Ulu0WDRXyn6pom8K2OQEADzgbyFyEH0xP027D
         Iu0oh36IG3pBc+3WuYYCzdFnrUaLSKDcCjtsmnIIFbIddohHkTJReKgtKC+ujiWX8PS9
         CG6QpqUYivfwZm/7Mk8N4i9WQ8TbuOuXzymw45uU4uk/jmJDIHWidp7WHakua/RudKfA
         XybXTVOarwI+3zq09Ag7xSkgNTtMNUm1e7O0NzAyHY6IWTG6ZEVOTr/l6/FMdabfPEno
         PaGb0oLTN0ypdu/F9pAoFQVTtbKnN6g8yqeWGNTOFAI0DQRfpb6sjGMJYUOi4+YlB7yp
         m04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751410601; x=1752015401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sbefn7N4iHrY4SmfOxSdiL63vzuILQTZ+UrJlGXdK7E=;
        b=f1w01OZNrvbIm6Q0yvLoJ2PMGa7u7L+rRjBsRhcl5+IDY1nlsmkUAt00DnNY1MIzmE
         0ECcgL4G8b/X3x9couTLbpV92llIwKCcq6w1Fe2nDhlsaCAm+Dm0dFR1aGbiqI5dTBah
         ki9twDp2cLNWirRJsQyhUYOiVsyolWSqZWQUmueTVd9y3v8ddcgoZxTwm9DpXc0MOM6J
         Cw6xRfnDVtjmPVUtqoa1Nj08gceJRpmZTlGHTP0lRAkoBcBmLLV1Zur+d5VS4Zfc2xe7
         4uHifErmk2Jk+CcXZk3O+yRAR0gIEq/vIMveqdA46a6O0K0SGevnBoyltggxYCmuSY4z
         SpIQ==
X-Gm-Message-State: AOJu0YwqTgcKY8pUMgsphPlTl+L7vD2LCFiaiIAsR9wuYIPoEIozRb7B
	2pz0VfXyDNSs0+nJkRK5BTNoM+fv6wcCSd+q/O4GDmUEkCCpQ0eNU2oiD+IWPVIUaKuXSZ5syXy
	OclHVAroCg5uTwVKGaUz6ZU5lBCWMogI=
X-Gm-Gg: ASbGncvY9cPQEwt8QLGfunH2ClDnV/gJ8X2KNn8RL2KyA/9kGpx0yJcqhCsUASh4DQf
	CJ6vczyRJwq4sep6J0w+xvFwLLorc5Zl1Fer/QTFx8ya3u7F53ed21LIVT6HHBh+aw6g10/Oe2X
	YAO7yk7SJimAAeYJzzqVxK/hxEOWd4w0EHF69hiRCrfFviHF1Xf8QUJIg=
X-Google-Smtp-Source: AGHT+IExi44dgeEpaQEZ1VAVjct18/Qiy7LtfxJlKn68w9yxy+IAuFGMO+5Ls/Bb5xmR8TStu37eQQO6E2W34JsMTRw=
X-Received: by 2002:a05:6102:6d1:b0:4e9:8f71:bd4f with SMTP id
 ada2fe7eead31-4f160f18c62mr278920137.3.1751410601281; Tue, 01 Jul 2025
 15:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250701180410.33055-1-JPEWhacker@gmail.com>
In-Reply-To: <20250701180410.33055-1-JPEWhacker@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 1 Jul 2025 23:56:30 +0100
X-Gm-Features: Ac12FXyQYURT3AGt7bcxNIqqfOusGDVNqzFPEO8KkjKK3swYyvVycu2-DbhYvZ0
Message-ID: <CANPvuRkmkZUaWXYLmZzTzzxUTbTPsWSq=A38OjA6ELm_g_WcWQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] spdx30: Allow VEX Justification to be configurable
To: JPEWhacker@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bece200638e60ec2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 22:56:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219736

--000000000000bece200638e60ec2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Joshua Watt via lists.openembedded.org <JPEWhacker=3D
gmail.com@lists.openembedded.org> escreveu (ter=C3=A7a, 1/07/2025 =C3=A0(s)=
 19:04):

> Instead of hard coding the VEX justifications for "Ignored" CVE status,
> add a map that configures what justification should be used for each
> status.
>
> This allows other justifications to be easily added, and also ensures
> that status fields added externally (by downstream) can set an
> appropriate justification if necessary.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/conf/cve-check-map.conf |  4 ++++
>  meta/lib/oe/spdx30_tasks.py  | 33 ++++++++++++++++-----------------
>  2 files changed, 20 insertions(+), 17 deletions(-)
>
> diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf
> index ac956379d19..0563bcaf94b 100644
> --- a/meta/conf/cve-check-map.conf
> +++ b/meta/conf/cve-check-map.conf
> @@ -28,8 +28,12 @@ CVE_CHECK_STATUSMAP[cpe-incorrect] =3D "Ignored"
>  CVE_CHECK_STATUSMAP[disputed] =3D "Ignored"
>  # use when vulnerability depends on build or runtime configuration which
> is not used
>  CVE_CHECK_STATUSMAP[not-applicable-config] =3D "Ignored"
> +CVE_CHECK_VEX_JUSTIFICATION[not-applicable-config] =3D
> "vulnerableCodeNotPresent"
> +
>  # use when vulnerability affects other platform (e.g. Windows or Debian)
>  CVE_CHECK_STATUSMAP[not-applicable-platform] =3D "Ignored"
> +CVE_CHECK_VEX_JUSTIFICATION[not-applicable-config] =3D
> "vulnerableCodeNotPresent"
>

Looks like this one should be not-applicable-platform instead of
not-applicable-config.

Jose


> +
>  # use when upstream acknowledged the vulnerability but does not plan to
> fix it
>  CVE_CHECK_STATUSMAP[upstream-wontfix] =3D "Ignored"
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 5d9f3168d97..c352dab1520 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -724,24 +724,23 @@ def create_spdx(d):
>                              impact_statement=3Ddescription,
>                          )
>
> -                        if detail in (
> -                            "ignored",
> -                            "cpe-incorrect",
> -                            "disputed",
> -                            "upstream-wontfix",
> -                        ):
> -                            # VEX doesn't have justifications for this
> -                            pass
> -                        elif detail in (
> -                            "not-applicable-config",
> -                            "not-applicable-platform",
> -                        ):
> -                            for v in spdx_vex:
> -                                v.security_justificationType =3D (
> -
> oe.spdx30.security_VexJustificationType.vulnerableCodeNotPresent
> +                        vex_just_type =3D d.getVarFlag(
> +                            "CVE_CHECK_VEX_JUSTIFICATION", detail
> +                        )
> +                        if vex_just_type:
> +                            if (
> +                                vex_just_type
> +                                not in
> oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS
> +                            ):
> +                                bb.fatal(
> +                                    f"Unknown vex justification
> '{vex_just_type}', detail '{detail}', for ignored {cve}"
>                                  )
> -                        else:
> -                            bb.fatal(f"Unknown detail '{detail}' for
> ignored {cve}")
> +
> +                            for v in spdx_vex:
> +                                v.security_justificationType =3D
> oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS[
> +                                    vex_just_type
> +                                ]
> +
>                      elif status =3D=3D "Unknown":
>                          bb.note(f"Skipping {cve} with status 'Unknown'")
>                      else:
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219713):
> https://lists.openembedded.org/g/openembedded-core/message/219713
> Mute This Topic: https://lists.openembedded.org/mt/113933828/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000bece200638e60ec2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Joshua Watt via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;J=
PEWhacker=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@l=
ists.openembedded.org</a>&gt; escreveu (ter=C3=A7a, 1/07/2025 =C3=A0(s) 19:=
04):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Instead of =
hard coding the VEX justifications for &quot;Ignored&quot; CVE status,<br>
add a map that configures what justification should be used for each<br>
status.<br>
<br>
This allows other justifications to be easily added, and also ensures<br>
that status fields added externally (by downstream) can set an<br>
appropriate justification if necessary.<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/cve-check-map.conf |=C2=A0 4 ++++<br>
=C2=A0meta/lib/oe/spdx30_tasks.py=C2=A0 | 33 ++++++++++++++++--------------=
---<br>
=C2=A02 files changed, 20 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf<br=
>
index ac956379d19..0563bcaf94b 100644<br>
--- a/meta/conf/cve-check-map.conf<br>
+++ b/meta/conf/cve-check-map.conf<br>
@@ -28,8 +28,12 @@ CVE_CHECK_STATUSMAP[cpe-incorrect] =3D &quot;Ignored&quo=
t;<br>
=C2=A0CVE_CHECK_STATUSMAP[disputed] =3D &quot;Ignored&quot;<br>
=C2=A0# use when vulnerability depends on build or runtime configuration wh=
ich is not used<br>
=C2=A0CVE_CHECK_STATUSMAP[not-applicable-config] =3D &quot;Ignored&quot;<br=
>
+CVE_CHECK_VEX_JUSTIFICATION[not-applicable-config] =3D &quot;vulnerableCod=
eNotPresent&quot;<br>
+<br>
=C2=A0# use when vulnerability affects other platform (e.g. Windows or Debi=
an)<br>
=C2=A0CVE_CHECK_STATUSMAP[not-applicable-platform] =3D &quot;Ignored&quot;<=
br>
+CVE_CHECK_VEX_JUSTIFICATION[not-applicable-config] =3D &quot;vulnerableCod=
eNotPresent&quot;<br></blockquote><div><br></div><div>Looks like this one s=
hould=C2=A0be not-applicable-platform instead=C2=A0of not-applicable-config=
.<br><br>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+<br>
=C2=A0# use when upstream acknowledged the vulnerability but does not plan =
to fix it<br>
=C2=A0CVE_CHECK_STATUSMAP[upstream-wontfix] =3D &quot;Ignored&quot;<br>
<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index 5d9f3168d97..c352dab1520 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -724,24 +724,23 @@ def create_spdx(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0impact_statement=3Ddescription,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if detail in (<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ignored&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cpe-incorrect&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;disputed&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;upstream-wontfix&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 # VEX doesn&#39;t have justifications for this<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 pass<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 elif detail in (<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;not-applicable-config&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;not-applicable-platform&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 for v in spdx_vex:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v.security_justificationType =3D (<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.spdx30.security_Vex=
JustificationType.vulnerableCodeNotPresent<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 vex_just_type =3D d.getVarFlag(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CVE_CHECK_VEX_JUSTIFICATION&quot;, detail<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if vex_just_type:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vex_just_type<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 not in oe.spdx30.security_VexJustifi=
cationType.NAMED_INDIVIDUALS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f&quot;Unknown vex jus=
tification &#39;{vex_just_type}&#39;, detail &#39;{detail}&#39;, for ignore=
d {cve}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(f&quot;Unknown detail &#39;{detail}&#39; =
for ignored {cve}&quot;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 for v in spdx_vex:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v.security_justificationType =3D oe.=
spdx30.security_VexJustificationType.NAMED_INDIVIDUALS[<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vex_just_type<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0elif status =3D=3D &quot;Unknown&quot;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bb.note(f&quot;Skipping {cve} with status &#39;Unknown&#39=
;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0else:<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#219713): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/219713" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/219713</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113933828/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113933828/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--000000000000bece200638e60ec2--

