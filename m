Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5540376FE2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 08:44:18 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id c15so53139539oig.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f8RWn/jrIPI0Oyw9p2SjIVP/sTiaD64APfcryiNpfyw=;
	b=Cc5pjsRXwtTsguEaVAKUp78UxrGkXXfMVTONibz2z6sX74aHdgJy2kZy0eMPtK7SoK
	kYjKl790smGTsSYiuDpIggMTR9EpaHxuLlD4yEFb6fvv2J1L88JoctWWSduTOOQHLdrz
	g6qjh4Y0tvy7Y/pHvavOoHvjoksIeA/bkeXRNSsneb13To885zTjcN7Gq6S4Z8XxXyHW
	mjhQbzip9BqF4Gat0bA0mWzZKMpHSViSjkVvdyicxYw5pGNvTzZD9XTi4obykQ5IrXIg
	Sg4McLpzUCcvOOYl4JfBBg5ZVw0PxkRbXSU7VEoRbipZ68Jsfc/TGLp98kqJwcpQwu7f
	oEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f8RWn/jrIPI0Oyw9p2SjIVP/sTiaD64APfcryiNpfyw=;
	b=XUgtcWQInX0L0XkH0fCXsVhYZCcH0pDBQSn0bRph2wStJcvlAwmSQ9yexKkD88dLqE
	guqRiH6Ef14QdPapSg71evXDaOraaP3sRk8GcB1CuipHUiQ3v2G5w/VHQCg9K3yKAl/s
	SDSjadEu21y89zbbg921m+yeG3iO8AWhF4Tl974DyNAvoidJG2Gkp002qsm5TN7TBJae
	CK3FWNSadYI/aeuCWtl3NgP55Q9pk7SQyexmBZZmSY3u4C9tAw6j0vmZ1nrA2lfUX2dg
	U1X6RzseOqYDPLtYPRL0Qj7W5U40KkofIE5e+1l+YGRzFRl2gwARnv+3zzqqp4xjtsAv
	iSug==
X-Gm-Message-State: AEkoouv3MxKaVZ7A9RE9fgTj8+2x9kqx09FhyhnrAzIpXSeHab2L3hmqYVJ56fiAvBfLqRakBlqoN4UjpX1i0US/
X-Received: by 10.157.46.119 with SMTP id c52mr12249422otd.6.1471250659167;
	Mon, 15 Aug 2016 01:44:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.241.11 with HTTP; Mon, 15 Aug 2016 01:43:48 -0700 (PDT)
In-Reply-To: <1471244660-1854-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
References: <1471244660-1854-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 15 Aug 2016 11:43:48 +0300
Message-ID: <CAHiDW_H4=eL=fo0KC7hGCOmEXVK4V7SBXRRecVwv_cm31P7E1w@mail.gmail.com>
To: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] adwaita-icon-theme: 3.18.0 -> 3.21.2
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
X-List-Received-Date: Mon, 15 Aug 2016 08:44:19 -0000
Content-Type: multipart/alternative; boundary=001a113d1334ea66ae053a183c08

--001a113d1334ea66ae053a183c08
Content-Type: text/plain; charset=UTF-8

On 15 August 2016 at 10:04, Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
wrote:

> Upgrade adwaita-icon-theme from 3.18.0 to 3.21.2.
>

I'm pretty sure Adwaita follows the GNOME version scheme where odd minor
versions are development snapshots. We should upgrade to 3.20.x though --
I'm not sure why checkpkg is showing the recipe as up to date...

Jussi



> Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
> ---
>  .../{adwaita-icon-theme_3.18.0.bb => adwaita-icon-theme_3.21.2.bb}    |
> 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.18.0.bb =>
> adwaita-icon-theme_3.21.2.bb} (92%)
>
> diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb
> b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.21.2.bb
> similarity index 92%
> rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb
> rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.21.2.bb
> index 34b82b7..7e0a06e 100644
> --- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.18.0.bb
> +++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.21.2.bb
> @@ -14,8 +14,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>  SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
>            "
>
> -SRC_URI[md5sum] = "ec1fa3fde83ad166ae7075a97dc1ec4b"
> -SRC_URI[sha256sum] = "5e9ce726001fdd8ee93c394fdc3cdb
> 9e1603bbed5b7c62df453ccf521ec50e58"
> +SRC_URI[md5sum] = "cdd4e593ba8bd886c8f26bbaa9219fb1"
> +SRC_URI[sha256sum] = "c083bc8188e5d84379fcd93d2ac833
> ab1b6138f35a330e2a63048a4f63afd165"
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

--001a113d1334ea66ae053a183c08
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
5 August 2016 at 10:04, Wang Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:wa=
ngxin2015.fnst@cn.fujitsu.com" target=3D"_blank">wangxin2015.fnst@cn.fujits=
u.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D=
"HOEnZb"><div class=3D"h5">Upgrade adwaita-icon-theme from 3.18.0 to 3.21.2=
.<br></div></div></blockquote><div><br></div><div>I&#39;m pretty sure Adwai=
ta follows the GNOME version scheme where odd minor versions are developmen=
t snapshots. We should upgrade to 3.20.x though -- I&#39;m not sure why che=
ckpkg is showing the recipe as up to date...</div><div><br></div><div>Jussi=
</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div c=
lass=3D"HOEnZb"><div class=3D"h5">
Signed-off-by: Wang Xin &lt;<a href=3D"mailto:wangxin2015.fnst@cn.fujitsu.c=
om">wangxin2015.fnst@cn.fujitsu.<wbr>com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://adwaita-icon-theme_3.18.0.bb" rel=3D"noreferre=
r" target=3D"_blank">adwaita-icon-theme_3.18.<wbr>0.bb</a> =3D&gt; <a href=
=3D"http://adwaita-icon-theme_3.21.2.bb" rel=3D"noreferrer" target=3D"_blan=
k">adwaita-icon-theme_3.21.2.bb</a>}=C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-gnome/gnome/{<a href=3D"http://adwaita-icon-theme=
_3.18.0.bb" rel=3D"noreferrer" target=3D"_blank">adwa<wbr>ita-icon-theme_3.=
18.0.bb</a> =3D&gt; <a href=3D"http://adwaita-icon-theme_3.21.2.bb" rel=3D"=
noreferrer" target=3D"_blank">adwaita-icon-theme_3.21.2.bb</a>} (92%)<br>
<br>
diff --git a/meta/recipes-gnome/gnome/<a href=3D"http://adwaita-icon-theme_=
3.18.0.bb" rel=3D"noreferrer" target=3D"_blank">adw<wbr>aita-icon-theme_3.1=
8.0.bb</a> b/meta/recipes-gnome/gnome/<a href=3D"http://adwaita-icon-theme_=
3.21.2.bb" rel=3D"noreferrer" target=3D"_blank">adw<wbr>aita-icon-theme_3.2=
1.2.bb</a><br>
similarity index 92%<br>
rename from meta/recipes-gnome/gnome/<a href=3D"http://adwaita-icon-theme_3=
.18.0.bb" rel=3D"noreferrer" target=3D"_blank">adwai<wbr>ta-icon-theme_3.18=
.0.bb</a><br>
rename to meta/recipes-gnome/gnome/<a href=3D"http://adwaita-icon-theme_3.2=
1.2.bb" rel=3D"noreferrer" target=3D"_blank">adwai<wbr>ta-icon-theme_3.21.2=
.bb</a><br>
index 34b82b7..7e0a06e 100644<br>
--- a/meta/recipes-gnome/gnome/<a href=3D"http://adwaita-icon-theme_3.18.0.=
bb" rel=3D"noreferrer" target=3D"_blank">adw<wbr>aita-icon-theme_3.18.0.bb<=
/a><br>
+++ b/meta/recipes-gnome/gnome/<a href=3D"http://adwaita-icon-theme_3.21.2.=
bb" rel=3D"noreferrer" target=3D"_blank">adw<wbr>aita-icon-theme_3.21.2.bb<=
/a><br>
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
+SRC_URI[md5sum] =3D &quot;<wbr>cdd4e593ba8bd886c8f26bbaa9219f<wbr>b1&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>c083bc8188e5d84379fcd93d2ac833<wbr>ab1b6=
138f35a330e2a63048a4f63af<wbr>d165&quot;<br>
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
</div></div></blockquote></div><br></div></div>

--001a113d1334ea66ae053a183c08--
