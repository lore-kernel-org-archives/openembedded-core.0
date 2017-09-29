Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4A86E70101
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 16:31:45 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id z187so255182ioz.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 09:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0pkM+q8Ontd9VaolpVh4cKOhEcyJe3dkovb4caLrebM=;
	b=wwir8o3M6CsVp2MJn267kLpoa10E1pbQZFAmWx6sAgfYsko+Yeu9LbVu8mdQyZmLMP
	XqKrv8/lb/PTjj3xNKf49bn61PVXmholMr/rFodrSKPdC99GD44Ks9bdLIy2NLmjgoM1
	1HslAxD0r6Wu/6AQbOF3AZINjis0mpvBe2aC5v6WZHwp/P6yuhjvDtGtP04/QW9pGp/L
	wSOJgQv9MIO8WU3qC1yu/e1c+wlYTV8IN8895WBfb+igtZsOAw71k3xdgwk8fgbzzDU6
	+QWVVyLh1tKD5jPNuaFQsq0l6+makmpGxHQJp7js0LHIviCxdbEHoHmAPo2mhoplhEbi
	VcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0pkM+q8Ontd9VaolpVh4cKOhEcyJe3dkovb4caLrebM=;
	b=Ssb9eJoanSKvGWsNL5DN/qKw0Q2iWdCwUKFX1GwDAr4R2YYFhSTR8+xEUy/yxKy1a9
	SkkvVTAuYLrlVPM9Z2mgoxAK57ArUw1VSnuUtV+RN9cWjKJNntDt/OBiEOPZln2KkdW6
	ydJwYXLSVi68nKn+jbs6ZCX7hnjhJ7H2c94JTsMshiJ92wVWTaRiyOyiIOKBfnosMKmX
	5DLIn8QCY6tm764XhDIDBjx1l81gB96hYDzNlxC2PwPOQQAjLSRv370xjpCAciWdDOiw
	ZB8LUzUPIBxkjgcMrOI9RwqxVmhg0/3XfJVnmK75IZoXPLOppqcYcCeIzhD5wonjlAfP
	hlMg==
X-Gm-Message-State: AHPjjUgblyt6ONuZFjOgl5IrpKZgl0e6vzhtUNRHyZEyfJ0tHnj0dXW6
	dymuGpgr4gznkUpailILcpDkiXQyOSOCl0NoNYve2A==
X-Google-Smtp-Source: AOwi7QBmiCgzSqCH2waSknIYkFGGvEecvwxGjoo4afzI71Zwiz92V44K52hgRySAKVc12uHx4W+HU7hAjvWa03eEoKE=
X-Received: by 10.107.41.135 with SMTP id p129mr12686480iop.142.1506702707423; 
	Fri, 29 Sep 2017 09:31:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Fri, 29 Sep 2017 09:31:26 -0700 (PDT)
In-Reply-To: <20170928163521.21828-1-andreas.kling@gmail.com>
References: <20170927094014.2666-1-andreas.kling@gmail.com>
	<20170928163521.21828-1-andreas.kling@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Sep 2017 17:31:26 +0100
Message-ID: <CAJTo0LaWULzrFRwq+7Pwnv-_Py5-AHAYuKoc9iT61q1iuMLNFg@mail.gmail.com>
To: Andy Kling <andreas.kling@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: add runtime dependencies to pam plugins.
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
X-List-Received-Date: Fri, 29 Sep 2017 16:31:46 -0000
Content-Type: multipart/alternative; boundary="001a1141f226a8c583055a568f97"

--001a1141f226a8c583055a568f97
Content-Type: text/plain; charset="UTF-8"

I wish I knew why git was ignoring the commit message entirely when
applying...  It's ignoring everything apart from the SOB:

$ git show
commit 079754f2681ded614c5ee90e61f4ddbd8407998a
Author: andreas.kling@peiker-cee.de <andreas.kling@peiker-cee.de>
Date:   Thu Sep 28 18:35:21 2017 +0200

    systemd: add runtime dependencies to pam plugins.

    Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
    Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross

On 28 September 2017 at 17:35, <andreas.kling@gmail.com> wrote:

> From: Andy Kling <andreas.kling@peiker-cee.de>
>
>   This ensures pam plugins required by /etc/pam.d/systemd-user
>   to open a user session are installed.
>
>   systemd[1]: Starting User Manager for UID 994...
>   systemd[6493]: PAM unable to dlopen(/lib/security/pam_keyinit.so)
>
>   Drop package systemd-pam to prevent confusion.
>   It is unused for a long time now.
>
> Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
> ---
>  v2: improve commit message
>  v3: drop systemd-pam
>  v4: move version info to annotation
>  meta/recipes-core/systemd/systemd_234.bb | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_234.bb
> b/meta/recipes-core/systemd/systemd_234.bb
> index 881896bfb5..acc4c4623b 100644
> --- a/meta/recipes-core/systemd/systemd_234.bb
> +++ b/meta/recipes-core/systemd/systemd_234.bb
> @@ -31,6 +31,12 @@ SRC_URI += " \
>             "
>  SRC_URI_append_qemuall = " file://0001-core-device.c-
> Change-the-default-device-timeout-to-2.patch"
>
> +PAM_PLUGINS = " \
> +    pam-plugin-unix \
> +    pam-plugin-loginuid \
> +    pam-plugin-keyinit \
> +"
> +
>  PACKAGECONFIG ??= "xz \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam
> selinux ldconfig usrmerge', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'xkbcommon', '', d)} \
> @@ -100,7 +106,7 @@ PACKAGECONFIG[importd] = "--enable-importd,--disable-
> importd"
>  PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
>  PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
>  PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native
> xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
> -PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
> +PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam,${PAM_PLUGINS}"
>  # Verify keymaps on locale change
>  PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-
> xkbcommon,libxkbcommon"
>  # Update NAT firewall rules
> @@ -295,7 +301,6 @@ PACKAGES =+ "\
>      ${PN}-kernel-install \
>      ${PN}-rpm-macros \
>      ${PN}-binfmt \
> -    ${PN}-pam \
>      ${PN}-zsh-completion \
>      ${PN}-xorg-xinitrc \
>      ${PN}-container \
> --
> 2.14.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141f226a8c583055a568f97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I wish I knew why git was ignoring the commit message enti=
rely when applying...=C2=A0 It&#39;s ignoring everything apart from the SOB=
:<div><br></div><div><div>$ git show</div><div>commit 079754f2681ded614c5ee=
90e61f4ddbd8407998a</div><div>Author: <a href=3D"mailto:andreas.kling@peike=
r-cee.de">andreas.kling@peiker-cee.de</a> &lt;<a href=3D"mailto:andreas.kli=
ng@peiker-cee.de">andreas.kling@peiker-cee.de</a>&gt;</div><div>Date: =C2=
=A0 Thu Sep 28 18:35:21 2017 +0200</div><div><br></div><div>=C2=A0 =C2=A0 s=
ystemd: add runtime dependencies to pam plugins.</div><div><br></div><div>=
=C2=A0 =C2=A0 Signed-off-by: Andy Kling &lt;<a href=3D"mailto:andreas.kling=
@peiker-cee.de">andreas.kling@peiker-cee.de</a>&gt;</div><div>=C2=A0 =C2=A0=
 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ro=
ss.burton@intel.com</a>&gt;</div></div><div><br></div><div>Ross</div></div>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 28 September 2=
017 at 17:35,  <span dir=3D"ltr">&lt;<a href=3D"mailto:andreas.kling@gmail.=
com" target=3D"_blank">andreas.kling@gmail.com</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><span class=3D"">From: Andy Kling &lt;<a href=
=3D"mailto:andreas.kling@peiker-cee.de">andreas.kling@peiker-cee.de</a>&gt;=
<br>
<br>
=C2=A0 This ensures pam plugins required by /etc/pam.d/systemd-user<br>
=C2=A0 to open a user session are installed.<br>
<br>
=C2=A0 systemd[1]: Starting User Manager for UID 994...<br>
=C2=A0 systemd[6493]: PAM unable to dlopen(/lib/security/pam_<wbr>keyinit.s=
o)<br>
<br>
=C2=A0 Drop package systemd-pam to prevent confusion.<br>
=C2=A0 It is unused for a long time now.<br>
<br>
</span><span class=3D"">Signed-off-by: Andy Kling &lt;<a href=3D"mailto:and=
reas.kling@peiker-cee.de">andreas.kling@peiker-cee.de</a>&gt;<br>
---<br>
=C2=A0v2: improve commit message<br>
=C2=A0v3: drop systemd-pam<br>
</span>=C2=A0v4: move version info to annotation<br>
<div><div class=3D"h5">=C2=A0meta/recipes-core/systemd/<a href=3D"http://sy=
stemd_234.bb" rel=3D"noreferrer" target=3D"_blank">syst<wbr>emd_234.bb</a> =
| 9 +++++++--<br>
=C2=A01 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" re=
l=3D"noreferrer" target=3D"_blank">sy<wbr>stemd_234.bb</a> b/meta/recipes-c=
ore/systemd/<a href=3D"http://systemd_234.bb" rel=3D"noreferrer" target=3D"=
_blank">sy<wbr>stemd_234.bb</a><br>
index 881896bfb5..acc4c4623b 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"no=
referrer" target=3D"_blank">sy<wbr>stemd_234.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_234.bb" rel=3D"no=
referrer" target=3D"_blank">sy<wbr>stemd_234.bb</a><br>
@@ -31,6 +31,12 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI_append_qemuall =3D &quot; file://0001-core-device.c-<wbr>Chan=
ge-the-default-device-<wbr>timeout-to-2.patch&quot;<br>
<br>
+PAM_PLUGINS =3D &quot; \<br>
+=C2=A0 =C2=A0 pam-plugin-unix \<br>
+=C2=A0 =C2=A0 pam-plugin-loginuid \<br>
+=C2=A0 =C2=A0 pam-plugin-keyinit \<br>
+&quot;<br>
+<br>
=C2=A0PACKAGECONFIG ??=3D &quot;xz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.filter(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;efi pam selinux ldconfig=
 usrmerge&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;x11&#39;, &#39;xkbcomm=
on&#39;, &#39;&#39;, d)} \<br>
@@ -100,7 +106,7 @@ PACKAGECONFIG[importd] =3D &quot;--enable-importd,--dis=
able-<wbr>importd&quot;<br>
=C2=A0PACKAGECONFIG[libidn] =3D &quot;--enable-libidn,--disable-<wbr>libidn=
,libidn&quot;<br>
=C2=A0PACKAGECONFIG[audit] =3D &quot;--enable-audit,--disable-<wbr>audit,au=
dit&quot;<br>
=C2=A0PACKAGECONFIG[manpages] =3D &quot;--enable-manpages,--disable-<wbr>ma=
npages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-styl=
esheets-<wbr>native&quot;<br>
-PACKAGECONFIG[pam] =3D &quot;--enable-pam,--disable-pam,<wbr>libpam&quot;<=
br>
+PACKAGECONFIG[pam] =3D &quot;--enable-pam,--disable-pam,<wbr>libpam,${PAM_=
PLUGINS}&quot;<br>
=C2=A0# Verify keymaps on locale change<br>
=C2=A0PACKAGECONFIG[xkbcommon] =3D &quot;--enable-xkbcommon,--disable-<wbr>=
xkbcommon,libxkbcommon&quot;<br>
=C2=A0# Update NAT firewall rules<br>
@@ -295,7 +301,6 @@ PACKAGES =3D+ &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${PN}-kernel-install \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-rpm-macros \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-binfmt \<br>
-=C2=A0 =C2=A0 ${PN}-pam \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-zsh-completion \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-xorg-xinitrc \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-container \<br>
--<br>
</div></div>2.14.2<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1141f226a8c583055a568f97--
