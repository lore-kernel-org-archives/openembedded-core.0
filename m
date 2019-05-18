Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 300B37BE3C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 18:57:08 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id g57so16236103edc.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 11:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0soC3kQ2V//ixv5GQpVd/AyqwJ0oP6SHnOpQ2qixE1k=;
	b=Ehlr554vr0SNQxtJtWYVuyOGqoa0YwmIjRsqwRiG6YUvA9BaCN8PCfcIzLQOtGxUE7
	zA0AmO/WRcAoDCtds9uzfcmUbgMO3fH4AA1kxtXrrZXRfdZ2k3Ot2N352QbZ2EUIYQKQ
	vmU2fk+7URvIeAv9GedJFtvojPPb0jxg1cIJpIl6EEdyf8luqcYhOiQUdLzEhIW5Wf0x
	1CJDO6khw6vb5c5sCp32DEdQ5KNaqipngljYBVD9H8LZMDI1MQ+Mes1DM3aR0IRWlDcj
	517Xwd0taSpSRSq/eQ5/d4M+wM40Ra8LmyOYeQ8OVlYQufRzTph5IAOSoJ3KIzouiVkU
	dkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0soC3kQ2V//ixv5GQpVd/AyqwJ0oP6SHnOpQ2qixE1k=;
	b=bB/aF+tSgjkmGoysCBoEDCbwYfyBNkISlo6F4hjQIucTgkZvXz4qqokFufH82GIYIj
	pqRG+mAfwRetHMrOWfLlKK1ecrxcDqYj6rBdaBxK5cY5hACC5uZkO5DFOaRadzPTNksf
	ocv3TbXSm2vbycmMtf8cWDi8dPalOn/P53tfYOc/exhLl8UAqiwcrpnol56VwrO86eFu
	xQKUytoGzBR7yPOiTyzv6wMQTm2p9xT5hPmIqkaK4ssAGdFq673fFkJzLW9TIqKED5t2
	YTHuRNx4VWrlPkZj+8lXW98NvexUcdm+UTOAtgBFW1Mpr1vEjd5QVcDxNU9OdWWdf2ha
	k1qw==
X-Gm-Message-State: APjAAAVVZwZcrylRMp0mlF4PK3vy3bXLLg2gPJRN6ynWRx6BioyBUARh
	4QF2qSKwVVTngZVQDp6lEiLKU5UNmlBnFYDhCKU=
X-Google-Smtp-Source: APXvYqzaRc1QZigjO6dDGHj/14wbhBm22CYPHyBFGWzxSbjj2yzNaSUWr1oU/1AepMbgch9CWm0jAIk0VufHY7Yp+K0=
X-Received: by 2002:a50:896b:: with SMTP id f40mr66008213edf.152.1558205828754;
	Sat, 18 May 2019 11:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190517135309.116495-1-alex.kanavin@gmail.com>
	<1558204453-8142-1-git-send-email-trini@konsulko.com>
In-Reply-To: <1558204453-8142-1-git-send-email-trini@konsulko.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 18 May 2019 20:57:02 +0200
Message-ID: <CA+chaQdA-jTDBMz_S9gMDLzSU8NWd3b4tvfyRPVdLkq46_vKSQ@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vim: Rework things so vim adds features not vim-tiny removes
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
X-List-Received-Date: Sat, 18 May 2019 18:57:09 -0000
Content-Type: multipart/alternative; boundary="000000000000e8eff105892e1026"

--000000000000e8eff105892e1026
Content-Type: text/plain; charset="UTF-8"

Thanks Tom for quick update.

ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
looks strange, IIRC TARGET and LINK_NAME should always point to different
filepath, it was added in meta-oe commit:

commit 897c10b7c17c138a85bdeb36cf72e7201daf0e0e
Author: Dan McGregor <dan.mcgregor@usask.ca>
Date:   Thu Oct 18 09:46:27 2018 -0600

    vim: alternatify xxd

    toybox also provides xxd.

but I wonder what u-a does (or is supposed to do in this scenario). Maybe
u-a bbclass automatically adds .${BPN} suffix to TARGET and renames the
installed file?

On Sat, May 18, 2019 at 8:34 PM Tom Rini <trini@konsulko.com> wrote:

> Now that we have a common inc file for both vim and vim-tiny move a few
> bits of logic out of vim.inc and in to vim_$VER.bb so that vim adds
> things rather than vim-tiny removes them.
>
> Suggested-by: Martin Jansa <martin.jansa@gmail.com>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  meta/recipes-support/vim/vim-tiny_8.1.1240.bb | 3 ---
>  meta/recipes-support/vim/vim.inc              | 8 +-------
>  meta/recipes-support/vim/vim_8.1.1240.bb      | 9 +++++++++
>  3 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
> b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
> index 139e626e4444..e4c26d23f69d 100644
> --- a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
> +++ b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
> @@ -2,9 +2,6 @@ require vim.inc
>
>  SUMMARY += " (with tiny features)"
>
> -PROVIDES_remove = "xxd"
> -ALTERNATIVE_${PN}_remove = "xxd"
> -
>  PACKAGECONFIG += "tiny"
>
>  do_install() {
> diff --git a/meta/recipes-support/vim/vim.inc
> b/meta/recipes-support/vim/vim.inc
> index f5c74684bfa7..433f23344826 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -1,7 +1,6 @@
>  SUMMARY = "Vi IMproved - enhanced vi editor"
>  SECTION = "console/utils"
>
> -PROVIDES = "xxd"
>  DEPENDS = "ncurses gettext-native"
>  # vimdiff doesn't like busybox diff
>  RSUGGESTS_${PN} = "diffutils"
> @@ -52,7 +51,6 @@ PACKAGECONFIG += " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
>  "
> -PACKAGECONFIG_class-native = ""
>
>  PACKAGECONFIG[gtkgui] = "--enable-gui=gtk2,--enable-gui=no,gtk+,"
>  PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
> @@ -130,12 +128,8 @@ RDEPENDS_${BPN} = "ncurses-terminfo-base"
>  # Recommend that runtime data is installed along with vim
>  RRECOMMENDS_${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc
> ${PN}-common"
>
> -ALTERNATIVE_${PN} = "vi vim xxd"
> +ALTERNATIVE_${PN} = "vi vim"
>  ALTERNATIVE_PRIORITY = "100"
>  ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
>  ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
>  ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
> -ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
> -ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-support/vim/vim_8.1.1240.bb
> b/meta/recipes-support/vim/vim_8.1.1240.bb
> index baaaacc0b77f..60946a181f42 100644
> --- a/meta/recipes-support/vim/vim_8.1.1240.bb
> +++ b/meta/recipes-support/vim/vim_8.1.1240.bb
> @@ -1 +1,10 @@
>  require vim.inc
> +
> +PROVIDES = "xxd"
> +
> +PACKAGECONFIG_class-native = ""
> +BBCLASSEXTEND = "native"
> +
> +ALTERNATIVE_${PN}_append = " xxd"
> +ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
> +ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000e8eff105892e1026
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks Tom for quick update.<div><br></di=
v><div>ALTERNATIVE_TARGET[xxd] =3D &quot;${bindir}/xxd&quot;<br></div><div>=
ALTERNATIVE_LINK_NAME[xxd] =3D &quot;${bindir}/xxd&quot;<br></div><div>look=
s strange, IIRC TARGET and LINK_NAME should always point to different filep=
ath, it was added in meta-oe commit:</div><div><div><br></div><div>commit 8=
97c10b7c17c138a85bdeb36cf72e7201daf0e0e</div><div>Author: Dan McGregor &lt;=
<a href=3D"mailto:dan.mcgregor@usask.ca">dan.mcgregor@usask.ca</a>&gt;</div=
><div>Date:=C2=A0 =C2=A0Thu Oct 18 09:46:27 2018 -0600</div><div><br></div>=
<div>=C2=A0 =C2=A0 vim: alternatify xxd</div><div><br></div><div>=C2=A0 =C2=
=A0 toybox also provides xxd.</div></div><div><br></div><div>but I wonder w=
hat u-a does (or is supposed to do in this scenario). Maybe u-a bbclass aut=
omatically adds .${BPN} suffix to TARGET and renames the installed file?</d=
iv></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Sat, May 18, 2019 at 8:34 PM Tom Rini &lt;<a href=3D"mailto:tri=
ni@konsulko.com">trini@konsulko.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Now that we have a common inc file for b=
oth vim and vim-tiny move a few<br>
bits of logic out of vim.inc and in to vim_$VER.bb so that vim adds<br>
things rather than vim-tiny removes them.<br>
<br>
Suggested-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
Signed-off-by: Tom Rini &lt;<a href=3D"mailto:trini@konsulko.com" target=3D=
"_blank">trini@konsulko.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.1.1240.bb" rel=
=3D"noreferrer" target=3D"_blank">vim-tiny_8.1.1240.bb</a> | 3 ---<br>
=C2=A0meta/recipes-support/vim/vim.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 8 +-------<br>
=C2=A0meta/recipes-support/vim/<a href=3D"http://vim_8.1.1240.bb" rel=3D"no=
referrer" target=3D"_blank">vim_8.1.1240.bb</a>=C2=A0 =C2=A0 =C2=A0 | 9 +++=
++++++<br>
=C2=A03 files changed, 10 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.1.1240.b=
b" rel=3D"noreferrer" target=3D"_blank">vim-tiny_8.1.1240.bb</a> b/meta/rec=
ipes-support/vim/<a href=3D"http://vim-tiny_8.1.1240.bb" rel=3D"noreferrer"=
 target=3D"_blank">vim-tiny_8.1.1240.bb</a><br>
index 139e626e4444..e4c26d23f69d 100644<br>
--- a/meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.1.1240.bb" rel=
=3D"noreferrer" target=3D"_blank">vim-tiny_8.1.1240.bb</a><br>
+++ b/meta/recipes-support/vim/<a href=3D"http://vim-tiny_8.1.1240.bb" rel=
=3D"noreferrer" target=3D"_blank">vim-tiny_8.1.1240.bb</a><br>
@@ -2,9 +2,6 @@ require vim.inc<br>
<br>
=C2=A0SUMMARY +=3D &quot; (with tiny features)&quot;<br>
<br>
-PROVIDES_remove =3D &quot;xxd&quot;<br>
-ALTERNATIVE_${PN}_remove =3D &quot;xxd&quot;<br>
-<br>
=C2=A0PACKAGECONFIG +=3D &quot;tiny&quot;<br>
<br>
=C2=A0do_install() {<br>
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc<br>
index f5c74684bfa7..433f23344826 100644<br>
--- a/meta/recipes-support/vim/vim.inc<br>
+++ b/meta/recipes-support/vim/vim.inc<br>
@@ -1,7 +1,6 @@<br>
=C2=A0SUMMARY =3D &quot;Vi IMproved - enhanced vi editor&quot;<br>
=C2=A0SECTION =3D &quot;console/utils&quot;<br>
<br>
-PROVIDES =3D &quot;xxd&quot;<br>
=C2=A0DEPENDS =3D &quot;ncurses gettext-native&quot;<br>
=C2=A0# vimdiff doesn&#39;t like busybox diff<br>
=C2=A0RSUGGESTS_${PN} =3D &quot;diffutils&quot;<br>
@@ -52,7 +51,6 @@ PACKAGECONFIG +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;acl =
selinux&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x1=
1&#39;, &#39;x11 gtkgui&#39;, &#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
-PACKAGECONFIG_class-native =3D &quot;&quot;<br>
<br>
=C2=A0PACKAGECONFIG[gtkgui] =3D &quot;--enable-gui=3Dgtk2,--enable-gui=3Dno=
,gtk+,&quot;<br>
=C2=A0PACKAGECONFIG[acl] =3D &quot;--enable-acl,--disable-acl,acl,&quot;<br=
>
@@ -130,12 +128,8 @@ RDEPENDS_${BPN} =3D &quot;ncurses-terminfo-base&quot;<=
br>
=C2=A0# Recommend that runtime data is installed along with vim<br>
=C2=A0RRECOMMENDS_${BPN} =3D &quot;${PN}-syntax ${PN}-help ${PN}-tutor ${PN=
}-vimrc ${PN}-common&quot;<br>
<br>
-ALTERNATIVE_${PN} =3D &quot;vi vim xxd&quot;<br>
+ALTERNATIVE_${PN} =3D &quot;vi vim&quot;<br>
=C2=A0ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
=C2=A0ALTERNATIVE_TARGET =3D &quot;${bindir}/${BPN}.${BPN}&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[vi] =3D &quot;${base_bindir}/vi&quot;<br>
=C2=A0ALTERNATIVE_LINK_NAME[vim] =3D &quot;${bindir}/vim&quot;<br>
-ALTERNATIVE_TARGET[xxd] =3D &quot;${bindir}/xxd&quot;<br>
-ALTERNATIVE_LINK_NAME[xxd] =3D &quot;${bindir}/xxd&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta/recipes-support/vim/<a href=3D"http://vim_8.1.1240.bb" re=
l=3D"noreferrer" target=3D"_blank">vim_8.1.1240.bb</a> b/meta/recipes-suppo=
rt/vim/<a href=3D"http://vim_8.1.1240.bb" rel=3D"noreferrer" target=3D"_bla=
nk">vim_8.1.1240.bb</a><br>
index baaaacc0b77f..60946a181f42 100644<br>
--- a/meta/recipes-support/vim/<a href=3D"http://vim_8.1.1240.bb" rel=3D"no=
referrer" target=3D"_blank">vim_8.1.1240.bb</a><br>
+++ b/meta/recipes-support/vim/<a href=3D"http://vim_8.1.1240.bb" rel=3D"no=
referrer" target=3D"_blank">vim_8.1.1240.bb</a><br>
@@ -1 +1,10 @@<br>
=C2=A0require vim.inc<br>
+<br>
+PROVIDES =3D &quot;xxd&quot;<br>
+<br>
+PACKAGECONFIG_class-native =3D &quot;&quot;<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
+<br>
+ALTERNATIVE_${PN}_append =3D &quot; xxd&quot;<br>
+ALTERNATIVE_TARGET[xxd] =3D &quot;${bindir}/xxd&quot;<br>
+ALTERNATIVE_LINK_NAME[xxd] =3D &quot;${bindir}/xxd&quot;<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000e8eff105892e1026--
