Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id DA3027899D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 12:09:44 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id j7so1588373ita.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 04:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FwyEzADeLE7uoE5ZdWSvTKg6IQiQuhK+rgFQi4q/5yc=;
	b=BVHJcxMtmdO/vkfi78UPcXhZkjwGrGRaLXDnEwnoJHMVOlC07tROFaQHcBoYV30Qki
	/BysG4vNtOzllohmjPwm0HuzNsFnNfhPTLVv1cso0UkkVRhn8NU6k1A2cUzfSkBgBV+l
	BSYh+0cqN/zSkdfm+tWmkjtjyWkd8PgNiox4exvLaScXfwXKdxnjICKEayg00VDBWYYR
	K85Mj2AVG0HxNwqOYqVCj5kRez7KNNj2I2SIv1SlAe5XNlW7UJLm5SgFVgFooAf7a3xN
	YfMmani0M09TAlSD+xf2YeMWnIpsPTxeYepxaVxZ2EBV73xuuxPFlY4G/yy7Z95IKknt
	8qPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FwyEzADeLE7uoE5ZdWSvTKg6IQiQuhK+rgFQi4q/5yc=;
	b=ipw+2ih2/l673MSwv3kLxlCvG9rKN40ZiCglKGLUdqj/Fx3RflZn44e/gXlV03A4JE
	sxR+dUMJQljDwR9WReHpo+ZJ+gwvWyTd0hLM93i+xAcscwT+XblAt4EDAMJS4jHKupI2
	GXX8QO3L3xJOm3eyWMnrUiojYfsBSiRskhH3MNjEae8UoIItPKFOc/R3brUpKHl0dyI5
	X37gAHFE0fR7LUcp0kNnEWvvTYeALJ3G6pXfeW8dNCvm75hVtcVXgXIZDuiUm1WE00oD
	YYDK/Oz0RClc3Fe87JzGwBXqn7AgxRtxpzSA3MQ09yMZjAq0BLyBJcD+soEEgUuvFblj
	5Fqw==
X-Gm-Message-State: AElRT7FZlNH9WQhdTkosX3RGNQO3DTXuQ6DL4RCQIiGr9K9ZCZNT6RXt
	K88LcWD4g+iZPy8WXkpKJiIpVBJdBc+m+VVUqpr0gA==
X-Google-Smtp-Source: AG47ELs10BwzI75rYJdxVoTmPB+36ep7Ay9FJ1IguR/xO0Fa+ukBh0jD2kFDoKsjMu94JqEHaUbnwG1iRQL+swktqcQ=
X-Received: by 10.36.34.11 with SMTP id o11mr2204190ito.60.1519992585697; Fri,
	02 Mar 2018 04:09:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Fri, 2 Mar 2018 04:09:25 -0800 (PST)
In-Reply-To: <20180302045118.3708-1-maxime.roussinbelanger@gmail.com>
References: <20180302045118.3708-1-maxime.roussinbelanger@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Mar 2018 12:09:25 +0000
Message-ID: <CAJTo0LaJLyg14qoOiDXin2Fa48uyvDpXMg38f+cWU7K9Qer-9Q@mail.gmail.com>
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] python-matplotlib: Change download name
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
X-List-Received-Date: Fri, 02 Mar 2018 12:09:45 -0000
Content-Type: multipart/alternative; boundary="001a113f77ba21d20105666cdab9"

--001a113f77ba21d20105666cdab9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wrong list, please sent meta-oe patches to openembedded-devel@

Ross

On 2 March 2018 at 04:51, Maxime Roussin-B=C3=A9langer <
maxime.roussinbelanger@gmail.com> wrote:

> Just having "v2.0.2.tar.gz" was causing problems with other
> similarly misconfigured packages.
>
> Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gmail=
.com>
> ---
>  meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python-
> matplotlib_2.0.2.bb b/meta-python/recipes-devtools/python/python-
> matplotlib_2.0.2.bb
> index 5b1c3f05b..b7a3fcfc1 100644
> --- a/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE/LICENSE;md5=3D
> afec61498aa5f0c45936687da9a53d74"
>  DEPENDS +=3D "python-numpy freetype libpng python-dateutil python-pytz"
>  RDEPENDS_${PN} =3D "python-core python-distutils python-numpy freetype
> libpng python-dateutil python-pytz"
>
> -SRC_URI =3D "https://github.com/matplotlib/matplotlib/archive/v${PV}.tar=
.gz
> \
> +SRC_URI =3D "https://github.com/matplotlib/matplotlib/archive/
> v${PV}.tar.gz;downloadfilename=3D${BP}-${PN}.tar.gz \
>             file://fix_setupext.patch \
>  "
>  SRC_URI[md5sum] =3D "89717c1ef3c6fdcd6fb1f3b597a4858c"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113f77ba21d20105666cdab9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wrong list, please sent meta-oe patches to openembedded-de=
vel@<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">On 2 March 2018 at 04:51, Maxime Roussin-B=C3=A9lang=
er <span dir=3D"ltr">&lt;<a href=3D"mailto:maxime.roussinbelanger@gmail.com=
" target=3D"_blank">maxime.roussinbelanger@gmail.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><span class=3D"">Just having &quot;v2.0.2=
.tar.gz&quot; was causing problems with other<br>
similarly misconfigured packages.<br>
<br>
</span>Signed-off-by: Maxime Roussin-B=C3=A9langer &lt;<a href=3D"mailto:ma=
xime.roussinbelanger@gmail.com">maxime.roussinbelanger@gmail.<wbr>com</a>&g=
t;<br>
<div class=3D"HOEnZb"><div class=3D"h5">---<br>
=C2=A0meta-python/recipes-devtools/<wbr>python/<a href=3D"http://python-mat=
plotlib_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python-matplotlib_2.=
0.<wbr>2.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/recipes-<wbr>devtools/python/<a href=3D"http://pyt=
hon-matplotlib_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>m=
atplotlib_2.0.2.bb</a> b/meta-python/recipes-<wbr>devtools/python/<a href=
=3D"http://python-matplotlib_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank"=
>python-<wbr>matplotlib_2.0.2.bb</a><br>
index 5b1c3f05b..b7a3fcfc1 100644<br>
--- a/meta-python/recipes-<wbr>devtools/python/<a href=3D"http://python-mat=
plotlib_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>matplotl=
ib_2.0.2.bb</a><br>
+++ b/meta-python/recipes-<wbr>devtools/python/<a href=3D"http://python-mat=
plotlib_2.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python-<wbr>matplotl=
ib_2.0.2.bb</a><br>
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE/LICENSE;md5=3D<wb=
r>afec61498aa5f0c45936687da9a53d<wbr>74&quot;<br>
=C2=A0DEPENDS +=3D &quot;python-numpy freetype libpng python-dateutil pytho=
n-pytz&quot;<br>
=C2=A0RDEPENDS_${PN} =3D &quot;python-core python-distutils python-numpy fr=
eetype libpng python-dateutil python-pytz&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://github.com/matplotlib/matplotlib/arch=
ive/v${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
<wbr>matplotlib/matplotlib/archive/<wbr>v${PV}.tar.gz</a> \<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/matplotlib/matplotlib/arch=
ive/v${PV}.tar.gz;downloadfilename=3D${BP}-${PN}.tar.gz" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/<wbr>matplotlib/matplotlib/archive/<w=
br>v${PV}.tar.gz;<wbr>downloadfilename=3D${BP}-${PN}.<wbr>tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix_setupext.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>89717c1ef3c6fdcd6fb1f3b597a485<wbr>8c&=
quot;<br>
--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a113f77ba21d20105666cdab9--
