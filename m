Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31320.1795561669414430053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 15:07:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=EMEa/veX;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67dc7eb1442so5684494d50.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 15:07:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795561668; cv=none;
        d=google.com; s=arc-20260327;
        b=TcE07Wrcktghi5pkxakng/2F4wN54qj9HwhEPFbbrYxat2q4GsJSb0ZdWWELf/9Aq0
         bzhq0E5AXtG80gnAS+N+OMQXN8f29/8b8ZlSX6YYxaYccGEisHzmCpRX2v5rBC2x3kR1
         Wx+10+mMeVt2oXX/QJQAL8DumJqToVThB/RVF1GJU7fTLAIfXDUCECx129Dj3kQSPVs7
         +DHIiJ0pucViB01HBVUh9Dbfi1cbaCtMyaagiYvL3q0FJDOcpCRLFedahd1JCJpSYz1Y
         POshXOuXGZSpWLLzM0J0WajDY9QAgX+xVtOxErCpPquwZXCph15VW/FrQ459laDfx1Im
         OceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hY7Stx7xdZGBnquZhnFjzsV20hnQVwemrC353KM7Kgg=;
        fh=x4HEGiz3Le+5Lc7a1sPba9pC5kJ18gzkJHpnhl1cn9Y=;
        b=R70FFakAqQzrmVIZfzShvr3C8rA2FCvJGa3QAaGZtNb5e/2AVGQxyFAEUCkBZ2unT5
         I/SQjYsKmR2hhw5gvhGEIbOKHXNb1Tbm9lZbvDflRZMBuQD0lCQMuTqKxjMKxQG+La9S
         PeAsH30eT5EBE46WeuuKhJUfWN4wlPFz7PFz5YOisZvDJsrnfDnovTgc2+9K3WndJoA/
         ahb4zcc4Ep36QxA5mx5bRYKqt8l3sdmfWTOfRfcqte0w4oldtPwofuKxPs95XlKLuka4
         FXPnIdOzRzqevMRT3WlTcssMHnzk48RPQi8Z6uM94S6hcEn+cVmeL1K2D06oWR5tmpxx
         HeaQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795561668; x=1796166468; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hY7Stx7xdZGBnquZhnFjzsV20hnQVwemrC353KM7Kgg=;
        b=EMEa/veXVeHfFVQ4VYRrIqqWRliNiwZAgVIn+s1jxdNLjj58DQeO34NfGMyc8J9v0m
         ZUVCe68k6k2KA6lFs7dIltxM7Xzzvdu+3gW1cU2/pnpt+EJTJw3Ph8V9en34h+4I9G89
         PQ6R2KkjVuLbQjcjlXj/0q4jNIZLEtrMjB2YQlkND24WXdDBj/J4lQggdrdoPAjQw50z
         NgSyP/EW4WYeLeG4YRloR/mq7N+1UsIjYtM397ol0x8SqXFRB8DysIVVFTJTSS9xrvoQ
         47jzgU1QONwW4ls1WE6oKnvazm2eAuzhoHix3RWw55cPRP/octp2pnz2D+tTLibSEjnW
         iIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795561668; x=1796166468;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hY7Stx7xdZGBnquZhnFjzsV20hnQVwemrC353KM7Kgg=;
        b=QlJByKuGWPETCPkYvOpbBlRqHqLtocCTbhJhy7zbT5yo1+rTKkBosUaADsHbTlb6Kb
         ftEHS6HVCmsR/3hz/0j5u//8/xWvcK1ZBm7AVCV1wYZAy1Mr6yo92OvwKOLSlBfFglbd
         WkUcWQm9Q+zXYEnizOCPJ8ENAAkavRYJ28Wvr/veWC1jOXJ2w6cxvKg3FRkF5LLmbpz3
         PfUV89tQvLCFDJcr2BMUjV72GK/v5tkdCI5fukQOH3paz4RvBcuFTfm3+7u54NgMUxuv
         dhUDXP6xoOMw2EU7xD3MM/o68A1mBaBYXrBsBpLsXLjLi0Hthqn8yJTayE7QjK1dAiFm
         eMVA==
X-Gm-Message-State: APuU4Z91ZPzdrplSuJu7fDd0XYQyx2Xwzggg/lXwD9JR1bFwPEIOGABv
	Bb1Ld9CNHwU1GPoAq9B1H3chdHMIvxRplDstrfj8bGx2u/Sc4dF1RHwBJfBibvrpoQDlXHJyTPn
	OxI/9hLMfUU4oOHY6MukZ9MiqCP2s79k=
X-Gm-Gg: AZFdTZdSIYQs3d6Y4zRIpHPGbcTaWYlaFjCsPyt861kDPI/3D3ixgI6xj1lJ2oVgPMu
	teV2YDc3BYP+/KRV4dotwXw5lqNAt3Tb1/8l/EXA+HA4oFmsa8AIgf3V1b7tt9R1sy5ssyjCcV1
	7lVE40EIgu49IkwT33wl8sCUwZpXxai8zNdJcjFjXoPUcoR9xOZecfZ2TphGeQAUhlumL31jjvL
	8IwZ/f6SuuYfh+CmQwECXWWc9LLqomxXFVFJugPWNkm6qU8TexR1Rk4b7riUlw0eqhP5Dp6W4Ys
	gQXJAbVCjd7I9lQns5AUAlX1quPWXA5w5obX2RKi6NfMWZvio3Cx9z0T6wma8gBH5HllMBAYBgP
	WiA6KIQ5/nbf/tc05PmCPCBX1sfOHYwV9IbJvpVf3b7I1CXbMJR4=
X-Received: by 2002:a05:690e:4894:20b0:67d:b54b:3cb8 with SMTP id
 956f58d0204a3-67df43f5c57mr5415395d50.34.1795561668463; Tue, 24 Nov 2026
 15:07:48 -0800 (PST)
MIME-Version: 1.0
References: <20261119204909.2931233-1-stondo@gmail.com> <20261119204909.2931233-2-stondo@gmail.com>
In-Reply-To: <20261119204909.2931233-2-stondo@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 24 Nov 2026 16:07:35 -0700
X-Gm-Features: Aa3M54r1e0dXIlJIBYkFjYy3TxUzkgr25CBxdBbqy78T34-81PzutDwLbzFE32E
Message-ID: <CAJdd5GaQrt_8AN3UziUk_pdz0WV1SAxi+47AFk9vsrLFwWgjAw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] spdx30: Take name, version and PURL of downloads
 from the fetcher
To: Stefano Tondo <stondo@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>, Paul Barker <paul@pbarker.dev>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Peter Marko <peter.marko@siemens.com>, 
	stefano.tondo.ext@siemens.com
Content-Type: multipart/alternative; boundary="0000000000006bce4106610dc7c6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 23:07:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251124

--0000000000006bce4106610dc7c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 1:49=E2=80=AFPM Stefano Tondo <stondo@gmail.com> wr=
ote:

> From: Stefano Tondo <stefano.tondo.ext@siemens.com>
>
> The fetchers of package registries (crate, gomod, npm) know the name
> and the version of each package they download. Today the SPDX of such
> a download only has the file name, so an SBOM scanner cannot match
> the dependency.
>
> Ask the fetcher with package_identity() and set the name, the version
> and the PURL of the download. This needs package_identity() in
> bitbake.
>
> Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
>

LGTM, Thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>


> ---
>  meta/lib/oe/spdx30_tasks.py | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 6eaa74ce3d..eded315819 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -463,6 +463,19 @@ def enrich_source_package(d, dl, fd, file_name,
> primary_purpose):
>              )
>
>
> +def set_package_identity(d, dl, fd):
> +    """Set name, version and PURL of a download that names a package.
> +
> +    Fetchers of package registries (crate, gomod, npm) know which packag=
e
> +    a URL downloads, see FetchMethod.package_identity() in bitbake.
> +    """
> +    identity =3D fd.method.package_identity(fd, d)
> +    if identity:
> +        dl.name =3D identity.name
> +        dl.software_packageVersion =3D identity.version
> +        dl.software_packageUrl =3D identity.purl
> +
> +
>  def add_download_files(d, objset):
>      inputs =3D set()
>      release_date =3D get_release_date(d)
> @@ -528,6 +541,7 @@ def add_download_files(d, objset):
>              )
>
>              enrich_source_package(d, dl, fd, file_name, primary_purpose)
> +            set_package_identity(d, dl, fd)
>
>              if release_date is not None:
>                  dl.releaseTime =3D release_date
> --
> 2.56.1
>
>

--0000000000006bce4106610dc7c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 19,=
 2026 at 1:49=E2=80=AFPM Stefano Tondo &lt;<a href=3D"mailto:stondo@gmail.c=
om">stondo@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">From: Stefano Tondo &lt;<a href=3D"mailto:stefano.tondo=
.ext@siemens.com" target=3D"_blank">stefano.tondo.ext@siemens.com</a>&gt;<b=
r>
<br>
The fetchers of package registries (crate, gomod, npm) know the name<br>
and the version of each package they download. Today the SPDX of such<br>
a download only has the file name, so an SBOM scanner cannot match<br>
the dependency.<br>
<br>
Ask the fetcher with package_identity() and set the name, the version<br>
and the PURL of the download. This needs package_identity() in<br>
bitbake.<br>
<br>
Signed-off-by: Stefano Tondo &lt;<a href=3D"mailto:stefano.tondo.ext@siemen=
s.com" target=3D"_blank">stefano.tondo.ext@siemens.com</a>&gt;<br></blockqu=
ote><div><br></div><div>LGTM, Thanks</div><div><br></div><div>Reviewed-by: =
Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com">JPEWhacker@gmail.co=
m</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
---<br>
=C2=A0meta/lib/oe/spdx30_tasks.py | 14 ++++++++++++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
<br>
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py<br>
index 6eaa74ce3d..eded315819 100644<br>
--- a/meta/lib/oe/spdx30_tasks.py<br>
+++ b/meta/lib/oe/spdx30_tasks.py<br>
@@ -463,6 +463,19 @@ def enrich_source_package(d, dl, fd, file_name, primar=
y_purpose):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
<br>
<br>
+def set_package_identity(d, dl, fd):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Set name, version and PURL of a download t=
hat names a package.<br>
+<br>
+=C2=A0 =C2=A0 Fetchers of package registries (crate, gomod, npm) know whic=
h package<br>
+=C2=A0 =C2=A0 a URL downloads, see FetchMethod.package_identity() in bitba=
ke.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 identity =3D fd.method.package_identity(fd, d)<br>
+=C2=A0 =C2=A0 if identity:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://dl.name" rel=3D"noreferrer" =
target=3D"_blank">dl.name</a> =3D <a href=3D"http://identity.name" rel=3D"n=
oreferrer" target=3D"_blank">identity.name</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dl.software_packageVersion =3D identity.versio=
n<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dl.software_packageUrl =3D identity.purl<br>
+<br>
+<br>
=C2=A0def add_download_files(d, objset):<br>
=C2=A0 =C2=A0 =C2=A0inputs =3D set()<br>
=C2=A0 =C2=A0 =C2=A0release_date =3D get_release_date(d)<br>
@@ -528,6 +541,7 @@ def add_download_files(d, objset):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enrich_source_package(d, dl=
, fd, file_name, primary_purpose)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_package_identity(d, dl, fd)<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if release_date is not None=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dl.releaseTim=
e =3D release_date<br>
-- <br>
2.56.1<br>
<br>
</blockquote></div></div>

--0000000000006bce4106610dc7c6--
