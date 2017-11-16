Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id A45EB7877D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 23:17:58 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id u132so2074152ita.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 15:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Tx6vHucrHZToiPiuZ/bw6l8o5vmJrkE+Ya0cnRijgjk=;
	b=Yav2aVs6OY9oXkRooFihVcGEkmw9ppY0b5ag8YGe4E4vLPLb3Av6ezWFHjobK1PsCn
	C+HhlLkoYlsYP/PBSa8vKZlvtLeSp7YhdGSPqX1z93I5mw6DNFmhcupPjzkV8BP5YrUy
	bV6g7ftxYVIThb7uasWEx4rYjZUxNfo+84zXDI4gOP94IC3m5vbERITd3mcRyzDfA9bD
	5RdGSZLFC9uWZGMcT8gKlMr3HDO4EZgh+8VOX0+WOdOPgI7EbYUPrCYiGrLIhY6LJu56
	1uHJqZaOYlZiOtYiIDqsubwv8j6qJSvCx4XjFXzCUZiutKJ32e65qGfpLXX/M+b9G9pd
	rTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Tx6vHucrHZToiPiuZ/bw6l8o5vmJrkE+Ya0cnRijgjk=;
	b=Un7gJ13FKXfxFcHvVtHv/ssAsWEdUPocIm/XmvsbqI/bpsEBDUeRPRi+6BAgB0HOI4
	yQOta33D3t1upnE0vxSQ0WRLETiTfaeOvLlbM4bWelnzvxtcji6MK5FjFy09r0wPKzaJ
	kDM9v6NoME6F1GTBeJl5uoZl/OAqNVH+3jwtS5Ewd4S99p2/8jKj+DlMyQbo5fYzQm/l
	T6W5OdhhXR+vmem3lT7NLDlJ58Z8/YuBv/eEE8dB2PxxzVZ4PFEsbPHiBlVJiZjtS3T8
	P+0xKUXU4i9VlSDrSuewXv7AkdJLC1CAEh5kLK9/k03kLStVSr96/UQl2F0BGZOQNwdY
	lnug==
X-Gm-Message-State: AJaThX4o3AFad6A0CReauooWJiZl23OuR7/0jqNpuCN8rO3+Lgcagfl+
	oGqS+YBHARsEM86wItoG8moL1ezGbp8aWrtnWOsh6Q==
X-Google-Smtp-Source: AGs4zMYcEFIJLi00Q0qBc7Hv9ZUgwWpL6lIidB65d70p9LlMMiXX9ljRVLGR5cpJhp09exY93MJIuOHtG9DlG86pfSA=
X-Received: by 10.36.120.11 with SMTP id p11mr4336996itc.10.1510874279746;
	Thu, 16 Nov 2017 15:17:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Thu, 16 Nov 2017 15:17:39 -0800 (PST)
In-Reply-To: <1510823468-63055-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1510823468-63055-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Nov 2017 23:17:39 +0000
Message-ID: <CAJTo0LaH1N4+rUCeKuzZtHhoUOFqCPLJe+YXs-Q=iECUa9oodw@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-setuptools: update to 36.7.2
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
X-List-Received-Date: Thu, 16 Nov 2017 23:17:58 -0000
Content-Type: multipart/alternative; boundary="001a114a9b5ebeb17d055e21d427"

--001a114a9b5ebeb17d055e21d427
Content-Type: text/plain; charset="UTF-8"

python3-setuptools includes this file too, so this patch breaks that recipe.

Ross

On 16 November 2017 at 09:11, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:

> 1) Upgrade python-setuptools from 36.5.0 to 36.7.2.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/python/python-setuptools.inc                    |
> 4 ++--
>  .../{python-setuptools_36.5.0.bb => python-setuptools_36.7.2.bb}      | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python-setuptools_36.5.0.bb =>
> python-setuptools_36.7.2.bb} (100%)
>
> diff --git a/meta/recipes-devtools/python/python-setuptools.inc
> b/meta/recipes-devtools/python/python-setuptools.inc
> index 1eae0b6..56b17ad 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -9,8 +9,8 @@ SRCNAME = "setuptools"
>
>  SRC_URI = "https://files.pythonhosted.org/packages/source/s/${
> SRCNAME}/${SRCNAME}-${PV}.zip"
>
> -SRC_URI[md5sum] = "704f500dd55f4bd0be905444f3ba892c"
> -SRC_URI[sha256sum] = "ce2007c1cea3359870b80657d63425
> 3a0765b0c7dc5a988d77ba803fc86f2c64"
> +SRC_URI[md5sum] = "1874983171af0f7b16b5ec48558e6e55"
> +SRC_URI[sha256sum] = "ad86fd8dd09c285c33b4c5b82bbc21
> d21883637faef78b0ab58fa9984847220d"
>
>  UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/setuptools"
>
> diff --git a/meta/recipes-devtools/python/python-setuptools_36.5.0.bb
> b/meta/recipes-devtools/python/python-setuptools_36.7.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python-setuptools_36.5.0.bb
> rename to meta/recipes-devtools/python/python-setuptools_36.7.2.bb
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114a9b5ebeb17d055e21d427
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">python3-setuptools includes this file too, so this patch b=
reaks that recipe.<div><br></div><div>Ross</div></div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">On 16 November 2017 at 09:11, zhengrq =
<span dir=3D"ltr">&lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=
=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">1) Upgrade python-setuptools from 36.5.0 to 36.7.2.<br=
>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.c=
om">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<wbr>python-setuptools.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0.../{<a href=3D"http://python-setuptools_36.5.0.bb" rel=3D"noreferrer=
" target=3D"_blank">python-setuptools_36.5.0.<wbr>bb</a> =3D&gt; <a href=3D=
"http://python-setuptools_36.7.2.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython-setuptools_36.7.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python-setupto=
ols_36.5.0.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>python-setuptools_=
36.5.0.bb</a> =3D&gt; <a href=3D"http://python-setuptools_36.7.2.bb" rel=3D=
"noreferrer" target=3D"_blank">python-setuptools_36.7.2.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>python/python-setuptools.inc b/meta=
/recipes-devtools/<wbr>python/python-setuptools.inc<br>
index 1eae0b6..56b17ad 100644<br>
--- a/meta/recipes-devtools/<wbr>python/python-setuptools.inc<br>
+++ b/meta/recipes-devtools/<wbr>python/python-setuptools.inc<br>
@@ -9,8 +9,8 @@ SRCNAME =3D &quot;setuptools&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://files.pythonhosted.org/packages/=
source/s/${SRCNAME}/${SRCNAME}-${PV}.zip" rel=3D"noreferrer" target=3D"_bla=
nk">https://files.pythonhosted.<wbr>org/packages/source/s/${<wbr>SRCNAME}/$=
{SRCNAME}-${PV}.zip</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>704f500dd55f4bd0be905444f3ba89<wbr>2c&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>ce2007c1cea3359870b80657d63425<wbr>3a076=
5b0c7dc5a988d77ba803fc86f<wbr>2c64&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>1874983171af0f7b16b5ec48558e6e<wbr>55&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>ad86fd8dd09c285c33b4c5b82bbc21<wbr>d2188=
3637faef78b0ab58fa9984847<wbr>220d&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://pypi.python.org/pypi/=
setuptools" rel=3D"noreferrer" target=3D"_blank">https://pypi.python.org/py=
pi/<wbr>setuptools</a>&quot;<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python-set=
uptools_36.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python-setuptools_3=
6.5.<wbr>0.bb</a> b/meta/recipes-devtools/<wbr>python/<a href=3D"http://pyt=
hon-setuptools_36.7.2.bb" rel=3D"noreferrer" target=3D"_blank">python-setup=
tools_36.7.<wbr>2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python-setuptool=
s_36.5.0.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>ython-setuptools_36=
.5.0.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python-setuptools_=
36.7.2.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>ython-setuptools_36.7=
.2.bb</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
<br>
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

--001a114a9b5ebeb17d055e21d427--
