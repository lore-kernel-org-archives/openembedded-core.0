Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 618F678411
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 11:54:46 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id 196so15549197iti.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Feb 2018 03:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yCaHhrnS4B035vV8gCQuCnXKkVZRdSr/CGngfMBS2cI=;
	b=nuDvZXJG4mSF9qJY2xa9twJ7asF5uQdPc9yDLDzPa1vPtjIM59kk7BB4HQqLA8kC0Q
	Jy1VZnGfR3+/CXRPO8r+WSuOffmCKQFmhcOgkqrX1/KYLl50rdQLgKaa45rD3VF5NOnE
	YncyI0AHzCRHEfkU6nobd1pmI6eyMpRW17NGuk3tQGkfUzGWbHrHlFGMhpf1yUiEgeKo
	pdgbSMbIQ7Lk/bWE2gqs7z4qFjLaBiYWgf1pq6bqH9O2hqDMMROusQBZnxoiUNwowmmF
	w85dTpArU2wScuF6ruzJOQDb9wDAVkzi2mltPontCMmDC3usVoRccciiDL9cN+AYxa8F
	NYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yCaHhrnS4B035vV8gCQuCnXKkVZRdSr/CGngfMBS2cI=;
	b=Nh7ESVxTFeYSWMSp4qBf4+WLylYlCEFupypp5CfXAfrI4a1cm0XURWKjlxNrOau1nL
	ZxQox1DwAvuaFtkSki6opxxlfinQF7TIgkP7b4toOAwWb6FMrhuuEkHNfYsm4i62Hc0S
	E4lzxgcDqg6XqOW8Iy+Q50hV7joqmfwXVUZN62QXSguJlxHYtYqZ3EmzTGCf48lZPPiv
	kiCJqHwNPr88/E0IOeZszDCT6dctGkpnGSntWSnsN8qCCuXT9qY5LmDxHNTK7ArFjvOL
	vQ4J+yOSxakqsdRHhi7OrArIhePl7wCZIPuYWllST+9uXXNb2qSfnmq+s1BSkatn6yet
	EvNw==
X-Gm-Message-State: AKwxytf/lnttkDyK8pWpknYshVu7g0FNCThIN6pG/bzzpGwqTA1gKh0/
	UkwW8Zk2/hDDTVYNpIbNheBN2HEDMUo9G4/yTM5TQg==
X-Google-Smtp-Source: AH8x2255epc1FAT1HItgbilV0PEAydAuKYbKVDOvVDWG4dvHEmwxpk3ymdunlCo9FlN6hgaDn5nSgTlxGmSxlW9dvCM=
X-Received: by 10.36.0.23 with SMTP id 23mr23286694ita.53.1517831687849; Mon,
	05 Feb 2018 03:54:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 5 Feb 2018 03:54:27 -0800 (PST)
In-Reply-To: <20180201143405.17663-1-Martin.Jansa@gmail.com>
References: <20180201143405.17663-1-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Feb 2018 11:54:27 +0000
Message-ID: <CAJTo0LYjiyxqvM-4qNJOZGJ_eYBhf=JkA4WFCjfmzLO=YyY-0g@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] libpam: be more strict about user's sanity
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
X-List-Received-Date: Mon, 05 Feb 2018 11:54:48 -0000
Content-Type: multipart/alternative; boundary="001a11c0122e9560a6056475ba59"

--001a11c0122e9560a6056475ba59
Content-Type: text/plain; charset="UTF-8"

This breaks world builds on the autobuilder with poky-lsb:

https://autobuilder.yocto.io/builders/nightly-world/builds/736/steps/BuildImages/logs/stdio

Ross

On 1 February 2018 at 14:34, Martin Jansa <martin.jansa@gmail.com> wrote:

> * replace do_pam_sanity function with distro_features_check inherit
> * fixes:
>   WARNING: libpam-1.3.0-r5 do_pam_sanity: Building libpam but 'pam' isn't
> in DISTRO_FEATURES, PAM won't work correctly
>   in world builds and prevents user to build libpam at all without pam
>   in DISTRO_FEATURES, I don't see any users of this which wouldn't respect
>   pam in DISTRO_FEATURES
> * only libuser is depending on libpam without respecting DISTRO_FEATURES
> * there are few recipes in meta-oe layers depending on libpam without
>   respecting DISTRO_FEATURES, I've sent patch for them:
>   samba, openwsman, pam-ssh-agent-auth, sblim-sfcb, passwdqc, python-pam,
> smbnetfs
>   and omxplayer in meta-raspberrypi, I've sent PR for that one:
>   https://github.com/agherzan/meta-raspberrypi/pull/192
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-extended/libuser/libuser_0.62.bb | 3 +++
>  meta/recipes-extended/pam/libpam_1.3.0.bb     | 7 ++-----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-extended/libuser/libuser_0.62.bb
> b/meta/recipes-extended/libuser/libuser_0.62.bb
> index 1765346646..7ec54eb16e 100644
> --- a/meta/recipes-extended/libuser/libuser_0.62.bb
> +++ b/meta/recipes-extended/libuser/libuser_0.62.bb
> @@ -22,6 +22,9 @@ SRC_URI[sha256sum] = "a58ff4fabb01a25043b142185a33ee
> ea961109dd60d4b40b6a9df4fa3c
>
>  DEPENDS = "popt libpam glib-2.0 python3"
>
> +inherit distro_features_check
> +REQUIRED_DISTRO_FEATURES = "pam"
> +
>  inherit autotools gettext python3native python3-dir pkgconfig gtk-doc
>
>  EXTRA_OEMAKE = "PYTHON_CPPFLAGS=-I${STAGING_
> INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
> diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb
> b/meta/recipes-extended/pam/libpam_1.3.0.bb
> index 8f7753d001..92ab72a42f 100644
> --- a/meta/recipes-extended/pam/libpam_1.3.0.bb
> +++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
> @@ -151,11 +151,8 @@ do_install() {
>         fi
>  }
>
> -python do_pam_sanity () {
> -    if not bb.utils.contains('DISTRO_FEATURES', 'pam', True, False, d):
> -        bb.warn("Building libpam but 'pam' isn't in DISTRO_FEATURES, PAM
> won't work correctly")
> -}
> -addtask pam_sanity before do_configure
> +inherit distro_features_check
> +REQUIRED_DISTRO_FEATURES = "pam"
>
>  BBCLASSEXTEND = "nativesdk native"
>
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c0122e9560a6056475ba59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This breaks world builds on the autobuilder with poky-lsb:=
<div><br></div><div><a href=3D"https://autobuilder.yocto.io/builders/nightl=
y-world/builds/736/steps/BuildImages/logs/stdio">https://autobuilder.yocto.=
io/builders/nightly-world/builds/736/steps/BuildImages/logs/stdio</a><br></=
div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">On 1 February 2018 at 14:34, Martin Jansa <span dir=
=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">ma=
rtin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">* replace do_pam_sanity function with distro_features_check inherit<br>
* fixes:<br>
=C2=A0 WARNING: libpam-1.3.0-r5 do_pam_sanity: Building libpam but &#39;pam=
&#39; isn&#39;t in DISTRO_FEATURES, PAM won&#39;t work correctly<br>
=C2=A0 in world builds and prevents user to build libpam at all without pam=
<br>
=C2=A0 in DISTRO_FEATURES, I don&#39;t see any users of this which wouldn&#=
39;t respect<br>
=C2=A0 pam in DISTRO_FEATURES<br>
* only libuser is depending on libpam without respecting DISTRO_FEATURES<br=
>
* there are few recipes in meta-oe layers depending on libpam without<br>
=C2=A0 respecting DISTRO_FEATURES, I&#39;ve sent patch for them:<br>
=C2=A0 samba, openwsman, pam-ssh-agent-auth, sblim-sfcb, passwdqc, python-p=
am, smbnetfs<br>
=C2=A0 and omxplayer in meta-raspberrypi, I&#39;ve sent PR for that one:<br=
>
=C2=A0 <a href=3D"https://github.com/agherzan/meta-raspberrypi/pull/192" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/agherzan/<wbr>meta-ra=
spberrypi/pull/192</a><br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/libuser/<a href=3D"http://libuser_0.62.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>libuser_0.62.bb</a> | 3 +++<br>
=C2=A0meta/recipes-extended/pam/<a href=3D"http://libpam_1.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libp<wbr>am_1.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0| =
7 ++-----<br>
=C2=A02 files changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/<wbr>libuser/<a href=3D"http://libuser_0=
.62.bb" rel=3D"noreferrer" target=3D"_blank">libuser_0.62.bb</a> b/meta/rec=
ipes-extended/<wbr>libuser/<a href=3D"http://libuser_0.62.bb" rel=3D"norefe=
rrer" target=3D"_blank">libuser_0.62.bb</a><br>
index 1765346646..7ec54eb16e 100644<br>
--- a/meta/recipes-extended/<wbr>libuser/<a href=3D"http://libuser_0.62.bb"=
 rel=3D"noreferrer" target=3D"_blank">libuser_0.62.bb</a><br>
+++ b/meta/recipes-extended/<wbr>libuser/<a href=3D"http://libuser_0.62.bb"=
 rel=3D"noreferrer" target=3D"_blank">libuser_0.62.bb</a><br>
@@ -22,6 +22,9 @@ SRC_URI[sha256sum] =3D &quot;<wbr>a58ff4fabb01a25043b1421=
85a33ee<wbr>ea961109dd60d4b40b6a9df4fa3c<br>
<br>
=C2=A0DEPENDS =3D &quot;popt libpam glib-2.0 python3&quot;<br>
<br>
+inherit distro_features_check<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;pam&quot;<br>
+<br>
=C2=A0inherit autotools gettext python3native python3-dir pkgconfig gtk-doc=
<br>
<br>
=C2=A0EXTRA_OEMAKE =3D &quot;PYTHON_CPPFLAGS=3D-I${STAGING_<wbr>INCDIR}/${P=
YTHON_DIR}${PYTHON_<wbr>ABI}&quot;<br>
diff --git a/meta/recipes-extended/pam/<a href=3D"http://libpam_1.3.0.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>bpam_1.3.0.bb</a> b/meta/recipes=
-extended/pam/<a href=3D"http://libpam_1.3.0.bb" rel=3D"noreferrer" target=
=3D"_blank">li<wbr>bpam_1.3.0.bb</a><br>
index 8f7753d001..92ab72a42f 100644<br>
--- a/meta/recipes-extended/pam/<a href=3D"http://libpam_1.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">li<wbr>bpam_1.3.0.bb</a><br>
+++ b/meta/recipes-extended/pam/<a href=3D"http://libpam_1.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">li<wbr>bpam_1.3.0.bb</a><br>
@@ -151,11 +151,8 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
-python do_pam_sanity () {<br>
-=C2=A0 =C2=A0 if not bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#3=
9;pam&#39;, True, False, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Building libpam but &#39;pam&#39=
; isn&#39;t in DISTRO_FEATURES, PAM won&#39;t work correctly&quot;)<br>
-}<br>
-addtask pam_sanity before do_configure<br>
+inherit distro_features_check<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;pam&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;nativesdk native&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.15.1<br>
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

--001a11c0122e9560a6056475ba59--
