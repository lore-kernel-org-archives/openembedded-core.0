Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web12.973.1625021831170514266
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 19:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VK6hh2UV;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id h3so1395179ilc.9
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 19:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zplS7sr5pgdiP3SWMS/MlrXXUZkKE38EW4lqIfwUcBs=;
        b=VK6hh2UVyV7FldvnOuBS7thYfmA1GpQ3jSpLLeMDYvrWgf0gOnI8Qn4tWITihEEil/
         NWKPQ7F0jroKY+cVWIkFOZruGn4dXtaanWGIo7RGsahCsrYTmNwila20Xt0Qm61zysDQ
         3i1dOzRC645WVvyqb0Z7c9EAgOut3VMzD8ikNJzVg/rEOmgFUkWth1gGVD7MhkUXCOhP
         Xyh1ylTv6nGOqLz/pvxAAaLp12Nt8pUfFwEHTnugEql9AlZDFNEjUTPEQCXikfsoucSt
         UWvZ9yXt53df6I2fP5nyJw4r3KkmW9HIigbM2M1iBsPLABwOSRWJ8oI0XwLFY6wxsryW
         oPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zplS7sr5pgdiP3SWMS/MlrXXUZkKE38EW4lqIfwUcBs=;
        b=EOLYFWwhHzW6IzwppXiHnnj59JuDd+AB+r2jwsFCYbhLo/tAZd3jQiYA8Zz245Uxaz
         6nabaGmN+qTkYW7jW+xIvgae9PbmPYw8D2h5RfitydrWBUpJL0IZrt0AKKScWm4bezkM
         BDMWI56imdcSo9mM/QaX3s3u1h7RGJ+vJ2sT+s8nQrZG4iSy1XEfxzDt8nnIDJkJngwp
         YMvI91BADnAbc3xfj+c8uJedWPP/8mo7VL2oxoYP06g/mEqGDNUlpSVyM5HNpAKbsjn6
         ChtEsXpafWwVBHl8C8406ixhJLG4qMzXICst5NzmgTnGGSzS/1ZOEM1hJpe00C25Ib2Z
         K9zQ==
X-Gm-Message-State: AOAM533YxWC7jsC9NuC3QpLyDb+KP7EHUrCXjm0WNHIGynqW6eVlfDrH
	0DHwCLMwXHVe3N0c88VGjKzwEXQKOo0Gv8oxdy4=
X-Google-Smtp-Source: ABdhPJzYFoYGS7N4LSK4bRNOmW22lbot7iPgK8RHWyf39JKIv/DddDiIHb6iHoREApIXsuwY4WQ3eEbaFBOZMNFh6cE=
X-Received: by 2002:a92:3f01:: with SMTP id m1mr25550357ila.122.1625021830483;
 Tue, 29 Jun 2021 19:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <1625021605-64993-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1625021605-64993-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Tue, 29 Jun 2021 19:56:59 -0700
Message-ID: <CANx9H-BMT29=NXYa1mMpAJ7kNiXgQteUwnq1kZEoc1Mt-gaB7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-importlib-metadata: upgrade 4.5.0 -> 4.6.0
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f553d205c5f2e089"

--000000000000f553d205c5f2e089
Content-Type: text/plain; charset="UTF-8"

Please include change log information or else leave the upgrades to the
maintainer (me). These empty git logs are useless.

On Tue, Jun 29, 2021 at 7:53 PM zhengruoqin <zhengrq.fnst@fujitsu.com>
wrote:

> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  ...ib-metadata_4.5.0.bb => python3-importlib-metadata_4.6.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-importlib-metadata_4.5.0.bb
> => python3-importlib-metadata_4.6.0.bb} (88%)
>
> diff --git a/meta/recipes-devtools/python/
> python3-importlib-metadata_4.5.0.bb b/meta/recipes-devtools/python/
> python3-importlib-metadata_4.6.0.bb
> similarity index 88%
> rename from meta/recipes-devtools/python/
> python3-importlib-metadata_4.5.0.bb
> rename to meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb
> index 7c156787a0..b9fd2fe59e 100644
> --- a/meta/recipes-devtools/python/python3-importlib-metadata_4.5.0.bb
> +++ b/meta/recipes-devtools/python/python3-importlib-metadata_4.6.0.bb
> @@ -8,7 +8,7 @@ inherit pypi setuptools3
>  PYPI_PACKAGE = "importlib_metadata"
>  UPSTREAM_CHECK_REGEX = "/importlib-metadata/(?P<pver>(\d+[\.\-_]*)+)/"
>
> -SRC_URI[sha256sum] =
> "b142cc1dd1342f31ff04bb7d022492b09920cb64fed867cd3ea6f80fe3ebd139"
> +SRC_URI[sha256sum] =
> "4a5611fea3768d3d967c447ab4e93f567d95db92225b43b7b238dbfb855d70bb"
>
>  S = "${WORKDIR}/importlib_metadata-${PV}"
>
> --
> 2.25.1
>
>
> 
>
>

--000000000000f553d205c5f2e089
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please include change log information or else leave the u=
pgrades to the maintainer (me). These empty git logs are useless.</div><div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tu=
e, Jun 29, 2021 at 7:53 PM zhengruoqin &lt;<a href=3D"mailto:zhengrq.fnst@f=
ujitsu.com">zhengrq.fnst@fujitsu.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.=
fnst@fujitsu.com" target=3D"_blank">zhengrq.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://ib-metadata_4.5.0.bb" rel=3D"noreferrer" target=
=
=3D"_blank">ib-metadata_4.5.0.bb</a> =3D&gt; <a href=3D"http://python3-imp=
ortlib-metadata_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-impo=
rtlib-metadata_4.6.0.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-impor=
tlib-metadata_4.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-import=
lib-metadata_4.5.0.bb</a> =3D&gt; <a href=3D"http://python3-importlib-metad=
ata_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-importlib-metada=
ta_4.6.0.bb</a>} (88%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-import=
lib-metadata_4.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-importl=
ib-metadata_4.5.0.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://p=
ython3-importlib-metadata_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-importlib-metadata_4.6.0.bb</a><br>
similarity index 88%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-importl=
ib-metadata_4.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-importli=
b-metadata_4.5.0.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-importlib=
-metadata_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-importlib-=
metadata_4.6.0.bb</a><br>
index 7c156787a0..b9fd2fe59e 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-importlib-met=
adata_4.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-importlib-meta=
data_4.5.0.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-importlib-met=
adata_4.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-importlib-meta=
data_4.6.0.bb</a><br>
@@ -8,7 +8,7 @@ inherit pypi setuptools3<br>
=C2=A0PYPI_PACKAGE =3D &quot;importlib_metadata&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;/importlib-metadata/(?P&lt;pver&gt;(\=
d+[\.\-_]*)+)/&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;b142cc1dd1342f31ff04bb7d022492b09920cb64fed8=
67cd3ea6f80fe3ebd139&quot;<br>
+SRC_URI[sha256sum] =3D &quot;4a5611fea3768d3d967c447ab4e93f567d95db92225b=
43b7b238dbfb855d70bb&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/importlib_metadata-${PV}&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000f553d205c5f2e089--
