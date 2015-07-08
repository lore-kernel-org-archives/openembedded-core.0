Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id EBAE075D37
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 21:15:51 +0000 (UTC)
Received: by wibdq8 with SMTP id dq8so224539264wib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jul 2015 14:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kopllQzFNQkfJXAVbOyOpxyvfYfsoXrCZAh4V0EevJA=;
	b=Ub/RFDY9JIdcTOanifQ3VhW38qotU0sQWoYVedc1YsCvvVuyDUKGZnf/c3IO07XlSo
	0PElG3lO/KBh6Y+UShrDzEUNNrbE0CZYorxbD1uhRVJbJwmuhD/TayDL9k75I5j23jiy
	1oXPnYMEOkvHxBS6W6z/caOEaCExvlmVHDBV3Wds2zzTpCDdicYfFevWBTognWRDkJX9
	jU+BfJI4UoLv02myCtKlaUTxjPXpUco4Z84DslKvhXXQaimRiRiUtJmi+Dvco5ynaZVK
	VCH0SV27Ofx3eh4KDOHy2+f+oWNyFWr8haWOX7ZbXKvtnaii0jv/Ygxy3Nxwp434640B
	LxjA==
MIME-Version: 1.0
X-Received: by 10.181.12.20 with SMTP id em20mr29195211wid.28.1436390150968;
	Wed, 08 Jul 2015 14:15:50 -0700 (PDT)
Received: by 10.28.167.2 with HTTP; Wed, 8 Jul 2015 14:15:50 -0700 (PDT)
In-Reply-To: <1436385751-17757-1-git-send-email-ross.burton@intel.com>
References: <1436385751-17757-1-git-send-email-ross.burton@intel.com>
Date: Wed, 8 Jul 2015 23:15:50 +0200
Message-ID: <CA+chaQeyW6RBbZdq=p3nAHVtzQUud0dHFJn+OSZ09=vRA3aWdw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnome-icon-theme: inherit allarch
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
X-List-Received-Date: Wed, 08 Jul 2015 21:15:53 -0000
Content-Type: multipart/alternative; boundary=f46d043bdfa2b51c00051a63a47e

--f46d043bdfa2b51c00051a63a47e
Content-Type: text/plain; charset=UTF-8

How can it be allarch when it depends on TUNE_PKGARCH glib-2.0?

On Wed, Jul 8, 2015 at 10:02 PM, Ross Burton <ross.burton@intel.com> wrote:

> The intltool 0.51 doesn't do compile tests in the autoconf macros, so this
> recipe can be allarch again.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
> b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
> index fde2bc0..988ba21 100644
> --- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
> +++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
> @@ -10,7 +10,7 @@ PR = "r5"
>
>  DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native
> libxml-simple-perl-native"
>
> -inherit autotools perlnative gtk-icon-cache pkgconfig gettext
> +inherit allarch autotools perlnative gtk-icon-cache pkgconfig gettext
>
>  SRC_URI = "${GNOME_MIRROR}/${BPN}/2.31/${BPN}-${PV}.tar.bz2 \
>             file://iconpath-option.patch"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f46d043bdfa2b51c00051a63a47e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">How can it be allarch when it depends on TUNE_PKGARCH glib=
-2.0?</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed=
, Jul 8, 2015 at 10:02 PM, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">The intltool 0.51 doesn&#39=
;t do compile tests in the autoconf macros, so this<br>
recipe can be allarch again.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-gnome/gnome/<a href=3D"http://gnome-icon-theme_2.31.0.bb=
" rel=3D"noreferrer" target=3D"_blank">gnome-icon-theme_2.31.0.bb</a> | 2 +=
-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-gnome/gnome/<a href=3D"http://gnome-icon-theme_2.=
31.0.bb" rel=3D"noreferrer" target=3D"_blank">gnome-icon-theme_2.31.0.bb</a=
> b/meta/recipes-gnome/gnome/<a href=3D"http://gnome-icon-theme_2.31.0.bb" =
rel=3D"noreferrer" target=3D"_blank">gnome-icon-theme_2.31.0.bb</a><br>
index fde2bc0..988ba21 100644<br>
--- a/meta/recipes-gnome/gnome/<a href=3D"http://gnome-icon-theme_2.31.0.bb=
" rel=3D"noreferrer" target=3D"_blank">gnome-icon-theme_2.31.0.bb</a><br>
+++ b/meta/recipes-gnome/gnome/<a href=3D"http://gnome-icon-theme_2.31.0.bb=
" rel=3D"noreferrer" target=3D"_blank">gnome-icon-theme_2.31.0.bb</a><br>
@@ -10,7 +10,7 @@ PR =3D &quot;r5&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;icon-naming-utils-native glib-2.0 intltool-native l=
ibxml-simple-perl-native&quot;<br>
<br>
-inherit autotools perlnative gtk-icon-cache pkgconfig gettext<br>
+inherit allarch autotools perlnative gtk-icon-cache pkgconfig gettext<br>
<br>
=C2=A0SRC_URI =3D &quot;${GNOME_MIRROR}/${BPN}/2.31/${BPN}-${PV}.tar.bz2 \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://iconpath-option.patch&quot=
;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--f46d043bdfa2b51c00051a63a47e--
