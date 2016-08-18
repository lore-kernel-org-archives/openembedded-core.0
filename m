Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 48B0E77058
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 19:01:37 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id e63so6761563ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 12:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e5D4SW3zYAzS82kzcAWU1xtxqT8MZ78F2BRZvIU7nMg=;
	b=CgXk7rMXo/zDyFJoDgKBvz+7YLvEbWEd8irOtw2ePvRtomKpwRkRNRDqX6S1t5+miC
	dv0pSS4I+FJ/dos2MEqQmtR5pfbhNS/swbH9rXM9MPJaohU2rv2ni8S+oXIh3IWuW2vQ
	9HbweQNP0nrEyqgFctI3hRQ0GaonNf0434Zqi8/x4DJb2RMOBbnTPt54guUoywYH+6RO
	VzzbeE8yrKMlArhw56ahJktvRh15pNcGgPSd8aeC52CVJdxdQ2+6TIxst0oqUNEFhAa2
	4jvJSrMeHjn2mLG1r6mjtoMnINfxUKpSoLzdtNoFXCk0tSSXc9Mc1hE5kqp9veDAGe/0
	OhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e5D4SW3zYAzS82kzcAWU1xtxqT8MZ78F2BRZvIU7nMg=;
	b=dRY4Z2OK7x0hnN592UkUOEdNqJxyzTG9n6ZCIuttRqsBPssk+QpO6cFwNQkYgbvHON
	IUuAZNfZjPCjy6NyopYWMnkjhDmjCrfzsEMoHMa1sGPHf2TQCO8Mw8eO38k9Q22Bp16t
	cHflTnX97Cf9SGyZjcwFeHEzXxyLItP2Uuc7dApjlD8Zfa76KQqw1xLVAJQ6tXGPekGs
	I17bPSqw4RlUgDZp0gZ2xqOLTEPKQFLfxOo6xAViUsyyKmhrRD8qO6C+Bt7bDHAc9xs7
	QrXKkdDV7AQDBiOuh8cylFnJk31hdG7fWx7gDvFeO3obZzYvIQCgu/4tYTHDZqUfriku
	gsLw==
X-Gm-Message-State: AEkoousPePA8kxwympPhe1+Pn93rHrb2tGqZbmqR6bK9Krg0hX3jOc5kz456N5vhitCHteRh9G2k96sCeRuY8OQK
X-Received: by 10.36.57.211 with SMTP id l202mr1393521ita.22.1471546898544;
	Thu, 18 Aug 2016 12:01:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 18 Aug 2016 12:01:18 -0700 (PDT)
In-Reply-To: <1471424736-10547-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
References: <CAJTo0LabQxr69EodUwHuuzjbrdi6kWDumjvYpYHpk3n5VPWugg@mail.gmail.com>
	<1471424736-10547-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Aug 2016 20:01:18 +0100
Message-ID: <CAJTo0LYu=Cnm0s-k3GMxnSZ3WziEUNvLjGRCgGW9CBHMo1EHdQ@mail.gmail.com>
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] adwaita-icon-theme: 3.18.0 -> 3.20
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
X-List-Received-Date: Thu, 18 Aug 2016 19:01:38 -0000
Content-Type: multipart/alternative; boundary=001a114ab3ca289446053a5d36b9

--001a114ab3ca289446053a5d36b9
Content-Type: text/plain; charset=UTF-8

This produces:

WARNING: adwaita-icon-theme-3.20-r0 do_configure: QA Issue:
adwaita-icon-theme depends on intltool but doesn't use it
[redundant-intltool]

Please remove the dependency on intltool and verify the build still works
with a clean sysroot.

Roos

On 17 August 2016 at 10:05, Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
wrote:

> Upgrade adwaita-icon-theme from 3.18.0 to 3.20.
>
> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
> ---
>  .../{adwaita-icon-theme_3.18.0.bb => adwaita-icon-theme_3.20.bb}      |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.18.0.bb =>
> adwaita-icon-theme_3.20.bb} (92%)
>
> diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb
> b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.20.bb
> similarity index 92%
> rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb
> rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.20.bb
> index 34b82b7..5fcc92f 100644
> --- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb
> +++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.20.bb
> @@ -14,8 +14,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>  SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
>            "
>
> -SRC_URI[md5sum] = "ec1fa3fde83ad166ae7075a97dc1ec4b"
> -SRC_URI[sha256sum] = "5e9ce726001fdd8ee93c394fdc3cdb
> 9e1603bbed5b7c62df453ccf521ec50e58"
> +SRC_URI[md5sum] = "411be2bd68dd8b0a3c86aca2eb351ce4"
> +SRC_URI[sha256sum] = "7a0a887349f340dd644032f89d8126
> 4b694c4b006bd51af1c2c368d431e7ae35"
>
>  do_install_append() {
>         # Build uses gtk-encode-symbolic-svg to create png versions:
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

--001a114ab3ca289446053a5d36b9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This produces:<div><br></div><div>WARNING: adwaita-icon-th=
eme-3.20-r0 do_configure: QA Issue: adwaita-icon-theme depends on intltool =
but doesn&#39;t use it [redundant-intltool]<br></div><div><br></div><div>Pl=
ease remove the dependency on intltool and verify the build still works wit=
h a clean sysroot.</div><div><br></div><div>Roos</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On 17 August 2016 at 10:05, Wang=
 Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:wangxin2015.fnst@cn.fujitsu.co=
m" target=3D"_blank">wangxin2015.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">U=
pgrade adwaita-icon-theme from 3.18.0 to 3.20.<br>
<br>
Signed-off-by: Wang Xin &lt;<a href=3D"mailto:wangxin2015.fnst@cn.fujitsu.c=
om">wangxin2015.fnst@cn.fujitsu.<wbr>com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://adwaita-icon-theme_3.18.0.bb" rel=3D"noreferre=
r" target=3D"_blank">adwaita-icon-theme_3.18.<wbr>0.bb</a> =3D&gt; <a href=
=3D"http://adwaita-icon-theme_3.20.bb" rel=3D"noreferrer" target=3D"_blank"=
>adwaita-icon-theme_3.20.bb</a>}=C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-gnome/gnome/{<a href=3D"http://adwaita-icon-theme=
_3.18.0.bb" rel=3D"noreferrer" target=3D"_blank">adwa<wbr>ita-icon-theme_3.=
18.0.bb</a> =3D&gt; <a href=3D"http://adwaita-icon-theme_3.20.bb" rel=3D"no=
referrer" target=3D"_blank">adwaita-icon-theme_3.20.bb</a>} (92%)<br>
<br>
diff --git a/meta/recipes-gnome/gnome/<a href=3D"http://adwaita-icon-theme_=
3.18.0.bb" rel=3D"noreferrer" target=3D"_blank">adw<wbr>aita-icon-theme_3.1=
8.0.bb</a> b/meta/recipes-gnome/gnome/<a href=3D"http://adwaita-icon-theme_=
3.20.bb" rel=3D"noreferrer" target=3D"_blank">adw<wbr>aita-icon-theme_3.20.=
bb</a><br>
similarity index 92%<br>
rename from meta/recipes-gnome/gnome/<a href=3D"http://adwaita-icon-theme_3=
.18.0.bb" rel=3D"noreferrer" target=3D"_blank">adwai<wbr>ta-icon-theme_3.18=
.0.bb</a><br>
rename to meta/recipes-gnome/gnome/<a href=3D"http://adwaita-icon-theme_3.2=
0.bb" rel=3D"noreferrer" target=3D"_blank">adwai<wbr>ta-icon-theme_3.20.bb<=
/a><br>
index 34b82b7..5fcc92f 100644<br>
--- a/meta/recipes-gnome/gnome/<a href=3D"http://adwaita-icon-theme_3.18.0.=
bb" rel=3D"noreferrer" target=3D"_blank">adw<wbr>aita-icon-theme_3.18.0.bb<=
/a><br>
+++ b/meta/recipes-gnome/gnome/<a href=3D"http://adwaita-icon-theme_3.20.bb=
" rel=3D"noreferrer" target=3D"_blank">adw<wbr>aita-icon-theme_3.20.bb</a><=
br>
@@ -14,8 +14,8 @@ MAJ_VER =3D &quot;${@oe.utils.trim_version(&quot;${<wbr>P=
V}&quot;, 2)}&quot;<br>
=C2=A0SRC_URI =3D &quot;${GNOME_MIRROR}/${BPN}/${MAJ_<wbr>VER}/${BPN}-${PV}=
.tar.xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>ec1fa3fde83ad166ae7075a97dc1ec<wbr>4b&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>5e9ce726001fdd8ee93c394fdc3cdb<wbr>9e160=
3bbed5b7c62df453ccf521ec5<wbr>0e58&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>411be2bd68dd8b0a3c86aca2eb351c<wbr>e4&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>7a0a887349f340dd644032f89d8126<wbr>4b694=
c4b006bd51af1c2c368d431e7<wbr>ae35&quot;<br>
<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Build uses gtk-encode-symbolic-svg to create =
png versions:<br>
--<br>
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
</div></div></blockquote></div><br></div>

--001a114ab3ca289446053a5d36b9--
