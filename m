Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 17ACB788FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 10:18:57 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id x13so2891781iti.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 02:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EfLegSRRylDghMzdEj4Nc/4H9CMeskYWMxM1PtQpx3A=;
	b=DAytS6vsYTUO24yyOyqA84cjrnrlEpcBC/P4Ur7aDrJbvvliuQcORD1r6+mc5f/ntF
	MMZt6jWec1horD+qSnSRSv9J3uJp4lUZhpcPHtttgxfj5jNzeyxeOVV92eJly7r6oGMJ
	7bfIQ9Roc5dijkzT6C4YfzvrW4DHPbT4H1M64/qh/ePn7yeupGQz1cJA1uHr7yM3RY0L
	7GXcuXqlvJxDJ8UHg/1kdZ/ZxpzI33hB4dzubQk+bXo9RgPNxBU3XuVOmnM4NBzFO7wy
	a1pxzT+alXiCRAHIKAMsJyw2aGxpg6QKpUaGdf4eSXkBm9o2iUp4tktkKT/1ImvSzY/l
	8zaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EfLegSRRylDghMzdEj4Nc/4H9CMeskYWMxM1PtQpx3A=;
	b=gQX0lPIr7J1dxIjGB2Kqm4TUA/88DjCPO1n6BmWoq6c7cWbqLOkBj9R7KQJWxcZjE5
	MXmZCqH69+rnCHLTWPDUynfXWjk/YSjnDyi4k6vKnedSre8syo+D/ob1szfxXx+xuoYi
	MO0ciW688t9p6IMtMfvjnXIP/89p3PzN+iOyyDGbCw0hCyvYQJjJnZe8KWmik3r6mahM
	T13IJ7kr/tnYgwYmRv7yd0xm4dm8qYGAXcWLLXRM1wtOWWChkRCss9dnHp6WlNTdPREE
	JJwRz3cXdg6egtaOuQywtG7QxHbrsNLkSB2dTvHUKlyiPmCCK9gfLvTjxHy63rJ3dAey
	iIvg==
X-Gm-Message-State: AJaThX6UwjFoA3/B5xy3XYl/nXW2FAwaiXgHlxzSI2ZKHFbtYlqcU4Hg
	4CHTAIplxEmlU8l5ioPug38+B7qsebj0zXjz+6SkHg==
X-Google-Smtp-Source: AGs4zMbIrkr2ltjnvsKqlgZGfJgkuIQPE9knWHaXePsio2TSdC3f5Jw+gp9zsqakyPNKsaL07MrZBG0AfA/D4zx0ap0=
X-Received: by 10.36.172.31 with SMTP id s31mr17934175ite.124.1511173139099;
	Mon, 20 Nov 2017 02:18:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Mon, 20 Nov 2017 02:18:38 -0800 (PST)
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF732EEA29B8@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1510823468-63055-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAJTo0LaH1N4+rUCeKuzZtHhoUOFqCPLJe+YXs-Q=iECUa9oodw@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF732EEA29B8@G08CNEXMBPEKD01.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Nov 2017 10:18:38 +0000
Message-ID: <CAJTo0LYv_iq0m=JDk6PEAxiLhxiVYzzUsSKwDKg+JNJupL+2ug@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 20 Nov 2017 10:18:58 -0000
Content-Type: multipart/alternative; boundary="94eb2c1fc0f8268ca7055e676a6b"

--94eb2c1fc0f8268ca7055e676a6b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please update both at the same time as otherwise there will be a series of
commits which won't build.

Ross

On 20 November 2017 at 08:02, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> Hi Ross
>
>
>
> Is it means that I should make a new patch for python3-setuptools?
>
>
>
> --------------------------------------------------
>
> Zheng Ruoqin
>
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
>
> ADDR.: No.6 Wenzhu Road
> <https://maps.google.com/?q=3DNo.6+Wenzhu+Road&entry=3Dgmail&source=3Dg>,
> Software Avenue,
>
>        Nanjing, 210012, China
>
> MAIL : zhengrq.fnst@cn.fujistu.com
>
>
>
> *From:* Burton, Ross [mailto:ross.burton@intel.com]
> *Sent:* Friday, November 17, 2017 7:18 AM
> *To:* Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujitsu=
.com>
> *Cc:* OE-core <openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] [PATCH] python-setuptools: update to 36.7.2
>
>
>
> python3-setuptools includes this file too, so this patch breaks that
> recipe.
>
>
>
> Ross
>
>
>
> On 16 November 2017 at 09:11, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote=
:
>
> 1) Upgrade python-setuptools from 36.5.0 to 36.7.2.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/python/python-setuptools.inc                    |
> 4 ++--
>  .../{python-setuptools_36.5.0.bb =3D> python-setuptools_36.7.2.bb}      =
| 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python-setuptools_36.5.0.bb =3D>
> python-setuptools_36.7.2.bb} (100%)
>
> diff --git a/meta/recipes-devtools/python/python-setuptools.inc
> b/meta/recipes-devtools/python/python-setuptools.inc
> index 1eae0b6..56b17ad 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -9,8 +9,8 @@ SRCNAME =3D "setuptools"
>
>  SRC_URI =3D "https://files.pythonhosted.org/packages/source/s/${
> SRCNAME}/${SRCNAME}-${PV}.zip"
>
> -SRC_URI[md5sum] =3D "704f500dd55f4bd0be905444f3ba892c"
> -SRC_URI[sha256sum] =3D "ce2007c1cea3359870b80657d63425
> 3a0765b0c7dc5a988d77ba803fc86f2c64"
> +SRC_URI[md5sum] =3D "1874983171af0f7b16b5ec48558e6e55"
> +SRC_URI[sha256sum] =3D "ad86fd8dd09c285c33b4c5b82bbc21
> d21883637faef78b0ab58fa9984847220d"
>
>  UPSTREAM_CHECK_URI =3D "https://pypi.python.org/pypi/setuptools"
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
>
>

--94eb2c1fc0f8268ca7055e676a6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please update both at the same time as otherwise there wil=
l be a series of commits which won&#39;t build.<div><br></div><div>Ross</di=
v></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 20 Nov=
ember 2017 at 08:02, Zheng, Ruoqin <span dir=3D"ltr">&lt;<a href=3D"mailto:=
zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.fujitsu.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-5443937025629252321WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Ross<u></u><u></u></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Is it means that I should make =
a new patch for</span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-f=
amily:&quot;Calibri&quot;,sans-serif;color:#1f497d">
</span><span lang=3D"EN-US">python3-setuptools?</span><span lang=3D"EN-US" =
style=3D"font-size:10.5pt;font-family:&quot;Calibri&quot;,sans-serif;color:=
#1f497d"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">----------------------=
--------<wbr>--------------------<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">Zheng Ruoqin<u></u><u>=
</u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">Nanjing Fujitsu Nanda =
Software Tech. Co., Ltd.(FNST)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">ADDR.: <a href=3D"http=
s://maps.google.com/?q=3DNo.6+Wenzhu+Road&amp;entry=3Dgmail&amp;source=3Dg"=
>No.6 Wenzhu Road</a>, Software Avenue,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Nanjing, 210012, China<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d">MAIL : <a href=3D"mail=
to:zhengrq.fnst@cn.fujistu.com" target=3D"_blank">zhengrq.fnst@cn.fujistu.c=
om</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Calibri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></=
span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11.0pt;fo=
nt-family:&quot;Calibri&quot;,sans-serif">From:</span></b><span lang=3D"EN-=
US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif"> =
Burton, Ross [mailto:<a href=3D"mailto:ross.burton@intel.com" target=3D"_bl=
ank">ross.burton@intel.com</a>]
<br>
<b>Sent:</b> Friday, November 17, 2017 7:18 AM<br>
<b>To:</b> Zheng, Ruoqin/</span><span style=3D"font-size:11.0pt">=E9=83=91<=
/span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-=
serif">
</span><span style=3D"font-size:11.0pt">=E8=8B=A5=E9=92=A6</span><span lang=
=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-s=
erif"> &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank"=
>zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
<b>Cc:</b> OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedd=
ed.org" target=3D"_blank">openembedded-core@lists.<wbr>openembedded.org</a>=
&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] python-setuptools: update to 36.7.2<u=
></u><u></u></span></p><div><div class=3D"h5">
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">python3-setuptools includes thi=
s file too, so this patch breaks that recipe.<u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Ross<u></u><u></u></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On 16 November 2017 at 09:11, z=
hengrq &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank"=
>zhengrq.fnst@cn.fujitsu.com</a>&gt; wrote:<u></u><u></u></span></p>
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0c=
m 0cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm">
<p class=3D"MsoNormal"><span lang=3D"EN-US">1) Upgrade python-setuptools fr=
om 36.5.0 to 36.7.2.<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.c=
om" target=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<wbr>python-setuptools.inc=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A0.../{<a href=3D"http://python-setuptools_36.5.0.bb" target=3D"_blank"=
>python-setuptools_36.5.<wbr>0.bb</a> =3D&gt;
<a href=3D"http://python-setuptools_36.7.2.bb" target=3D"_blank">python-set=
uptools_36.7.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python-setupto=
ols_36.5.0.bb" target=3D"_blank"><wbr>python-setuptools_36.5.0.bb</a> =3D&g=
t;
<a href=3D"http://python-setuptools_36.7.2.bb" target=3D"_blank">python-set=
uptools_36.7.2.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>python/python-setuptools.inc b/meta=
/recipes-devtools/<wbr>python/python-setuptools.inc<br>
index 1eae0b6..56b17ad 100644<br>
--- a/meta/recipes-devtools/<wbr>python/python-setuptools.inc<br>
+++ b/meta/recipes-devtools/<wbr>python/python-setuptools.inc<br>
@@ -9,8 +9,8 @@ SRCNAME =3D &quot;setuptools&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://files.pythonhosted.org/packages/=
source/s/$%7bSRCNAME%7d/$%7bSRCNAME%7d-$%7bPV%7d.zip" target=3D"_blank">htt=
ps://files.pythonhosted.<wbr>org/packages/source/s/${<wbr>SRCNAME}/${SRCNAM=
E}-${PV}.zip</a>&quot;<br>
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
setuptools" target=3D"_blank">https://pypi.python.org/pypi/<wbr>setuptools<=
/a>&quot;<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python-set=
uptools_36.5.0.bb" target=3D"_blank">python-setuptools_36.5.<wbr>0.bb</a> b=
/meta/recipes-devtools/<wbr>python/<a href=3D"http://python-setuptools_36.7=
.2.bb" target=3D"_blank">python-setuptools_36.7.<wbr>2.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python-setuptool=
s_36.5.0.bb" target=3D"_blank">p<wbr>ython-setuptools_36.5.0.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python-setuptools_=
36.7.2.bb" target=3D"_blank">p<wbr>ython-setuptools_36.7.2.bb</a><br>
<span class=3D"m_-5443937025629252321hoenzb"><span style=3D"color:#888888">=
--</span></span><span style=3D"color:#888888"><br>
<span class=3D"m_-5443937025629252321hoenzb">2.7.4</span><br>
<br>
<br>
<br>
<span class=3D"m_-5443937025629252321hoenzb">--</span><br>
<span class=3D"m_-5443937025629252321hoenzb">______________________________=
<wbr>_________________</span><br>
<span class=3D"m_-5443937025629252321hoenzb">Openembedded-core mailing list=
</span><br>
<span class=3D"m_-5443937025629252321hoenzb"><a href=3D"mailto:Openembedded=
-core@lists.openembedded.org" target=3D"_blank">Openembedded-core@lists.<wb=
r>openembedded.org</a></span><br>
<span class=3D"m_-5443937025629252321hoenzb"><a href=3D"http://lists.openem=
bedded.org/mailman/listinfo/openembedded-core" target=3D"_blank">http://lis=
ts.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a></span>=
</span><u></u><u></u></span></p>
</blockquote>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
</div></div></div>
</div>

</blockquote></div><br></div>

--94eb2c1fc0f8268ca7055e676a6b--
