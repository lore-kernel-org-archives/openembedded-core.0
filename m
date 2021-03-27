Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.7524.1616856104858344277
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Mar 2021 07:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QlyMO5AM;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: idadelm@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a7so12747105ejs.3
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Mar 2021 07:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JLT0ni/D4UnC+RnhwgifmZ+i6vBYMWzwOB9Av8vsdCk=;
        b=QlyMO5AMSWIbuaFJdCTzDcmDBzKrsAWd8IXnV4MtrMgquWrG/du166YKcjtt+CtdRY
         Owkv0umq07moYh+cWo3N2WkthmS3WlD8sPC8FR1uLrYITIYYngxlV+GtNlSWcs/fq6SJ
         X0tGHIStXzih27xlixU9XNyVJ6jBq5CnIwQTFJUmfIL5BA7+TbXdrZf9xjQiscAH2JD0
         Q+mWSEeK7ksZDkU6fHIfdkGnKwhNHfFquUHdJpymdb2Bwjj21X2w1qpFWw6t4hyd5ISN
         xXxBSDb3s+3PboBSP2DJcRSRwxMGOklm3Hue4WGG3KAkuB/CSRTiAyevmbcInxPiAypi
         LlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JLT0ni/D4UnC+RnhwgifmZ+i6vBYMWzwOB9Av8vsdCk=;
        b=A5aOoK7MLJg92thqLJqK5wv1kYV0U1KzdLHkOKd3bvO8OcaXrqyL9AtnOayZRKYjLw
         sZTMpff1TnBMXHaXGnxDziPnX+sosnOwbnFCtuN4ExOKTapjiv1lUkXIN3E8O5Ixh1QK
         ZHeEoFnY/a6Sgni3iS+Am2MMmNF/xxlhfhbXPmK1uu8ZUFinkraUg05llzxM65ngj7Wj
         kMkpuCO06yj/CZLZBIcJoGBbKd96KOBDRdYCQwu8FVeW8yDl0RicnhQMn4IxcxVFqsaN
         pY5pOE68wbDWZLneZHoKXtv/CBJMVHShH+L7+JAkruhohccgho+UHdwk8bHpKjrPKifR
         C4Rg==
X-Gm-Message-State: AOAM531zHo77Fenm06QqryOYFfuWsNRfuL9D3eW1vsY86sACWlI3E5MN
	cC5YctBHTqdASX85h2o9maCdfOV4wmwc/2IZVuw=
X-Google-Smtp-Source: ABdhPJwGXPYiFM1O5slRhZgiCMC1n2mwK5qGwF09s841kDY+dEmHs2xyygn8dDhbgjnUPG+zBprSUBlBshTkn91nm9A=
X-Received: by 2002:a17:906:6c4:: with SMTP id v4mr20179967ejb.198.1616856103376;
 Sat, 27 Mar 2021 07:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210316084845.379201-1-idadelm@gmail.com> <166CC6734A7D03BD.5213@lists.openembedded.org>
In-Reply-To: <166CC6734A7D03BD.5213@lists.openembedded.org>
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
Date: Sat, 27 Mar 2021 15:41:31 +0100
Message-ID: <CAN7sTgspvGJ+62esZ88EmJBMUu69cUJ79_dZscpV00kEJmp2fg@mail.gmail.com>
Subject: Re: [OE-core] [poky-contrib][PATCH v2 3/6] oe.license: Add functions to split and canonicalise license strings.
To: Ida Delphine <idadelm@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b1db3805be85a5bd"

--000000000000b1db3805be85a5bd
Content-Type: text/plain; charset="UTF-8"

Hello,
A gentle reminder to please review this patch.

Cheers,
Ida.

On Tue, 16 Mar 2021, 9:49 am Meh Mbeh Ida Delphine via
lists.openembedded.org, <idadelm=gmail.com@lists.openembedded.org> wrote:

> These functions ensures recipe LICENSE strings are split into their
> individual licenses and then canonicalised to easily enable their matching
> with licenses of sources during the packaging process.
>
> Signed-off-by: Ida Delphine <idadelm@gmail.com>
> ---
>  meta/lib/oe/license.py | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
> index c1274a61de..dc1bc6682c 100644
> --- a/meta/lib/oe/license.py
> +++ b/meta/lib/oe/license.py
> @@ -243,3 +243,22 @@ def list_licenses(licensestr):
>      except SyntaxError as exc:
>          raise LicenseSyntaxError(licensestr, exc)
>      return visitor.licenses
> +
> +def canonical_license(license, d):
> +    """
> +    Return the canonical (SPDX) form of the license if available (so GPLv3
> +    becomes GPL-3.0), for the license named 'X+', return canonical form of
> +    'X' if available and the tailing '+' (so GPLv3+ becomes GPL-3.0+),
> +    or the passed license if there is no canonical form.
> +    """
> +    lic = d.getVarFlag('SPDXLICENSEMAP', license) or ""
> +    return lic or license
> +
> +def split_spdx_lic(licensestr,d):
> +    """
> +    Split the license strings and returns a set of the
> +    canonicalised licenses.
> +    """
> +    split_lic = list_licenses(licensestr)
> +    spdx_lic = set([canonical_license(l, d) for l in split_lic])
> +    return spdx_lic
> --
> 2.25.1
>
>
> 
>
>

--000000000000b1db3805be85a5bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,<div dir=3D"auto">A gentle reminder to please revie=
w this patch.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</d=
iv><div dir=3D"auto">Ida.</div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, 16 Mar 2021, 9:49 am Meh Mbeh Ida De=
lphine via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a>, &lt;idadelm=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gma=
il.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">These functions ensures recipe LICENSE strings are split into the=
ir individual licenses and then canonicalised to easily enable their matchi=
ng with licenses of sources during the packaging process.<br>
<br>
Signed-off-by: Ida Delphine &lt;<a href=3D"mailto:idadelm@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">idadelm@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/license.py | 19 +++++++++++++++++++<br>
=C2=A01 file changed, 19 insertions(+)<br>
<br>
diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py<br>
index c1274a61de..dc1bc6682c 100644<br>
--- a/meta/lib/oe/license.py<br>
+++ b/meta/lib/oe/license.py<br>
@@ -243,3 +243,22 @@ def list_licenses(licensestr):<br>
=C2=A0 =C2=A0 =C2=A0except SyntaxError as exc:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise LicenseSyntaxError(licensestr, exc=
)<br>
=C2=A0 =C2=A0 =C2=A0return visitor.licenses<br>
+<br>
+def canonical_license(license, d):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Return the canonical (SPDX) form of the license if availabl=
e (so GPLv3<br>
+=C2=A0 =C2=A0 becomes GPL-3.0), for the license named &#39;X+&#39;, retur=
n canonical form of<br>
+=C2=A0 =C2=A0 &#39;X&#39; if available and the tailing &#39;+&#39; (so GP=
Lv3+ becomes GPL-3.0+),<br>
+=C2=A0 =C2=A0 or the passed license if there is no canonical form.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 lic =3D d.getVarFlag(&#39;SPDXLICENSEMAP&#39;, license) or =
&quot;&quot;<br>
+=C2=A0 =C2=A0 return lic or license<br>
+<br>
+def split_spdx_lic(licensestr,d):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Split the license strings and returns a set of the<br>
+=C2=A0 =C2=A0 canonicalised licenses.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 split_lic =3D list_licenses(licensestr)<br>
+=C2=A0 =C2=A0 spdx_lic =3D set([canonical_license(l, d) for l in split_li=
c])<br>
+=C2=A0 =C2=A0 return spdx_lic<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000b1db3805be85a5bd--
