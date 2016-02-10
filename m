Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 49F5E731E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:32:07 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id xk3so24461562obc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 04:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Mrt0aOTQlb/9HvGn311PS6oE+2GloGgkg+HRn5f+65k=;
	b=S2EOh2K5PluuZSMLFiOnDrE0PalKPa+fzjGgYIP9QvFBGK3xC8EZrLgwqivRQNQZWU
	gTF5IRSX9tMuyu/5dU0tvrCDV75XijIvqwI9P9H/W0tc8e8E6kZEw6nNtQgfHqZE26FE
	EbaJw/UU5wCwa2yb7MiwxxqThSPzI8vMV76gWqcQ85YnPlLx3S3qbPnKdAXMvvER5Yq+
	DE+SkSFtjDcsqCmR4CP1TE5Xrs093guf95MbxOb96lwBkTADdjOdtQQzKt9MsLKtXSuV
	EkSEFVxegv9O8uu9x5DwHjPjzqhYz6jqIUs51o3GqPgF5RFyBT8vRT8Z8TXgWmj/Lp3q
	ZJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Mrt0aOTQlb/9HvGn311PS6oE+2GloGgkg+HRn5f+65k=;
	b=bG091L2OlZbEI0AuH7NBZluVw16i/ifDog9r8tiPSY/1PjDofE07uf8QhdSZnwIyDZ
	MEZeDzVcbBECYbhcV5XZNZIo8WESkQTwmg4esNV58vo19J7ZVWWzyj4POGoZXThJ1MRT
	1Io+vkWDgYnCXo348tvNKzg2YBACmV86WpZyKhE87vNu4E5lifZkOqaEqZjq9NpWUPZQ
	CRcaKrFm0Vrc6KxMK0OQv6UtbeUxlY+OSmroFMxqhE4jsyFLODl5T6WJ4p+m4X6vOCe8
	ju2VcNy1R+t9PWl+wbF937/cVogjD0qvPoQWPjAVJ72cSoJzo7e+BPB3By7UhaHlvr07
	2uHA==
X-Gm-Message-State: AG10YOTv2qZFAxlnvLGk9ZopgGMXWhEmQRtbAMZM/E9tqaV+vDmUAYAOI9QxgQK9Bu5m0OJmwYr6JBh10l/OmcWg
X-Received: by 10.182.131.194 with SMTP id oo2mr36223031obb.84.1455107528075; 
	Wed, 10 Feb 2016 04:32:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.224.68 with HTTP; Wed, 10 Feb 2016 04:31:38 -0800 (PST)
In-Reply-To: <b23c413682080d988bd163c6df0f439cd41ae7ad.1448455166.git.jussi.kukkonen@intel.com>
References: <cover.1448455166.git.jussi.kukkonen@intel.com>
	<b23c413682080d988bd163c6df0f439cd41ae7ad.1448455166.git.jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 10 Feb 2016 14:31:38 +0200
Message-ID: <CAHiDW_FsnjAnXJrjAdow+kfT7Bk12+W5ZE4_TB0V3ui2Oc-csQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] connman-gnome: rrecommend connman, don't rdepend
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
X-List-Received-Date: Wed, 10 Feb 2016 12:32:08 -0000
Content-Type: multipart/alternative; boundary=089e01634b8a5241e1052b699f4d

--089e01634b8a5241e1052b699f4d
Content-Type: text/plain; charset=UTF-8

Ping? Please let me know if this was not actually a good idea.

 - Jussi


On 25 November 2015 at 15:05, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> connman-gnome doesn't have a binary dependency on connman, and using
> RRECOMMEND is better for multilib builds (connman-gnome works fine
> with connman from a different architecture).
>
> Fixes [YOCTO #8586]
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta/recipes-connectivity/connman/connman-gnome_0.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> index 7b875f0..1849dbd 100644
> --- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> +++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> @@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
>  inherit autotools-brokensep gtk-icon-cache pkgconfig distro_features_check
>  ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
>
> -RDEPENDS_${PN} = "connman"
> +RRECOMMENDS_${PN} = "connman"
>
>  do_install_append() {
>      install -m 0644 ${WORKDIR}/images/*
> ${D}/usr/share/icons/hicolor/22x22/apps/
> --
> 2.1.4
>
>

--089e01634b8a5241e1052b699f4d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Ping? Please let me know if thi=
s was not actually a good idea.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">=C2=A0- Jussi</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 25 Nove=
mber 2015 at 15:05, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mailto:=
jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">connman-gnome doesn&#39;t=
 have a binary dependency on connman, and using<br>
RRECOMMEND is better for multilib builds (connman-gnome works fine<br>
with connman from a different architecture).<br>
<br>
Fixes [YOCTO #8586]<br>
<br>
Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.co=
m">jussi.kukkonen@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/connman/<a href=3D"http://connman-gnome_0.7=
.bb" rel=3D"noreferrer" target=3D"_blank">connman-gnome_0.7.bb</a> | 2 +-<b=
r>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-connectivity/connman/<a href=3D"http://connman-gn=
ome_0.7.bb" rel=3D"noreferrer" target=3D"_blank">connman-gnome_0.7.bb</a> b=
/meta/recipes-connectivity/connman/<a href=3D"http://connman-gnome_0.7.bb" =
rel=3D"noreferrer" target=3D"_blank">connman-gnome_0.7.bb</a><br>
index 7b875f0..1849dbd 100644<br>
--- a/meta/recipes-connectivity/connman/<a href=3D"http://connman-gnome_0.7=
.bb" rel=3D"noreferrer" target=3D"_blank">connman-gnome_0.7.bb</a><br>
+++ b/meta/recipes-connectivity/connman/<a href=3D"http://connman-gnome_0.7=
.bb" rel=3D"noreferrer" target=3D"_blank">connman-gnome_0.7.bb</a><br>
@@ -22,7 +22,7 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0inherit autotools-brokensep gtk-icon-cache pkgconfig distro_features_=
check<br>
=C2=A0ANY_OF_DISTRO_FEATURES =3D &quot;${GTK2DISTROFEATURES}&quot;<br>
<br>
-RDEPENDS_${PN} =3D &quot;connman&quot;<br>
+RRECOMMENDS_${PN} =3D &quot;connman&quot;<br>
<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/images/* ${D}/usr/share/icon=
s/hicolor/22x22/apps/<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br></div></div>

--089e01634b8a5241e1052b699f4d--
