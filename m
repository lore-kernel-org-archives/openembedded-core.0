Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B57057807D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 21:01:23 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id o2so11399316wro.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 13:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7UOefVXq3PixRln6BoTTHRwrbRSIlbTSFdvJK05Bbjo=;
	b=OG6BKc7i3y2olDSHCsQsdd21D0AcCayVg1nq+aorQokuXA+aYSZpLU9AqRvxYsaUb5
	jIBrApsQoSuNlP74vsdtnW68aFlMg3C7g7NlBcTRiDH8I1gfOTdK3UbsVSYOHO/9vS68
	cnCDizeYkfBSe0zEf9Da24cHB/5xV92Z+YSxW5wBRhEqwGoY5oim4qegDdcDaDHd5Oax
	9vIfgVcOLETU1twN0KeAyOwjQZrbHtNwCG0ZG5bUQ1Mp7PQcByPy1N15T/uRAaFWTGQb
	CanDEFzx8ot9Kme8RR74/1uBIyjzBdmLHOU4ALPUPIl30t9qHizfw51dOWIZlOfn4Ah1
	wtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7UOefVXq3PixRln6BoTTHRwrbRSIlbTSFdvJK05Bbjo=;
	b=n3mvsNlE6IkzEg1msDtdXhsFnG+PxG4XNy3IKXNqakoY2T/MW00qlADntOeKF7xbC4
	PwyqPR5LDkwgO2BNU6+UYjsx3ModNjWRvzIz2ff0ogrGB0P4pRA1ujkdSQzTEIAd7NE/
	fb+3l0jfU7qa1+ho8M5d+svq9tY32RQ6OJg8k8MKxSycUFVyPaLqL9nwtHZ9tNixeCKN
	61m/DghZ+U0RRMVKmdHsQlEMIFxdVmuMM+Mci3on5TSwhNOVgLqBXiBq2VfzZqRYIxcP
	Bn7sijT+Qf0P/DtFxdpH2lIdbVtcaYZYiU7Np4w9i1c5zyApyRaRkNy1XcPdDXKTuzv9
	6RWw==
X-Gm-Message-State: AJaThX5+5stXvIiIuIj4zchTrwyAwOZinumLGTZAk9e9DNYWnBCGAHfP
	uCN1yWky4gfutJfaIIsC1yizg/raUTPfgbtZawnFnw==
X-Google-Smtp-Source: AGs4zMZpqywZkXAAgRbIBbupsPQQ3grK6ncnCLlogXbhQCi7JAURIU9/0Bdr/Rg4THcWMzIKqJDo7vEceOR9cb1wU/4=
X-Received: by 10.223.165.89 with SMTP id j25mr6557680wrb.206.1512162084403;
	Fri, 01 Dec 2017 13:01:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.122.19 with HTTP; Fri, 1 Dec 2017 13:01:23 -0800 (PST)
In-Reply-To: <20171114220340.28764-1-california.l.sullivan@intel.com>
References: <20171114212050.15881-1-california.l.sullivan@intel.com>
	<20171114220340.28764-1-california.l.sullivan@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Dec 2017 22:01:23 +0100
Message-ID: <CA+chaQe+qJCwz3dyYh51Pr8Gum5L0wt3VDqrTxs+a36cbOyzYQ@mail.gmail.com>
To: California Sullivan <california.l.sullivan@intel.com>
Cc: "Wold, Saul" <saul.wold@intel.com>, henry.bruce@intel.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3 V2] initramfs-framework: add install module
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
X-List-Received-Date: Fri, 01 Dec 2017 21:01:23 -0000
Content-Type: multipart/alternative; boundary="f403045f194ae240e0055f4dab8c"

--f403045f194ae240e0055f4dab8c
Content-Type: text/plain; charset="UTF-8"

Why does it inherit allarch when it depends on TUNE_PKGARCH grub and other
packages?

Also it should repect the restrictions which are in grub recipe:

COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
COMPATIBLE_HOST_armv7a = 'null'
COMPATIBLE_HOST_armv7ve = 'null'

because without it it adds new ERROR to "bitbake world":
ERROR: Nothing RPROVIDES 'grub' (but
oe-core/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
RDEPENDS on or otherwise requires it)
grub was skipped: incompatible with host arm-oe-linux-gnueabi (not in
COMPATIBLE_HOST)
grub was skipped: incompatible with host arm-oe-linux-gnueabi (not in
COMPATIBLE_HOST)
NOTE: Runtime target 'grub' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['grub']
ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.

On Tue, Nov 14, 2017 at 11:03 PM, California Sullivan <
california.l.sullivan@intel.com> wrote:

> The non-EFI counterpart for installation was previously missing for
> initramfs-framework. This simply puts the normal install script in the
> correct location for initramfs-framework to make use of it.
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
> V2 changes:
> * Add the module's dependencies to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS, since
>   its dependencies changing don't matter in regards building the package.
> * PR = "r1" since its a new recipe.
>
>  meta/conf/layer.conf                                 |  4 ++++
>  .../initrdscripts/initramfs-module-install_1.0.bb    | 20
> ++++++++++++++++++++
>  2 files changed, 24 insertions(+)
>  create mode 100644 meta/recipes-core/initrdscripts/initramfs-
> module-install_1.0.bb
>
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 0342324..6782058 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -57,6 +57,10 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    initramfs-module-install-efi->e2fsprogs \
>    initramfs-module-install-efi->parted \
>    initramfs-module-install-efi->util-linux \
> +  initramfs-module-install->e2fsprogs \
> +  initramfs-module-install->grub \
> +  initramfs-module-install->parted \
> +  initramfs-module-install->util-linux \
>    liberation-fonts->fontconfig \
>    cantarell-fonts->fontconfig \
>    gnome-icon-theme->librsvg \
> diff --git a/meta/recipes-core/initrdscripts/initramfs-
> module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-
> module-install_1.0.bb
> new file mode 100644
> index 0000000..ce7f165
> --- /dev/null
> +++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "initramfs-framework module for installation option"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=
> 3da9cfbcb788c80a0384361b4de20420"
> +RDEPENDS_${PN} = "initramfs-framework-base grub parted e2fsprogs-mke2fs
> util-linux-blkid"
> +
> +PR = "r1"
> +
> +inherit allarch
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> +SRC_URI = "file://init-install.sh"
> +
> +S = "${WORKDIR}"
> +
> +do_install() {
> +    install -d ${D}/init.d
> +    install -m 0755 ${WORKDIR}/init-install.sh ${D}/init.d/install.sh
> +}
> +
> +FILES_${PN} = "/init.d/install.sh"
> --
> 2.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045f194ae240e0055f4dab8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why does it inherit allarch when it depends on TUNE_PKGARC=
H grub and other packages?<div><br></div><div>Also it should repect the res=
trictions which are in grub recipe:</div><div><div><br></div><div>COMPATIBL=
E_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)&#39;<=
/div><div>COMPATIBLE_HOST_armv7a =3D &#39;null&#39;</div><div>COMPATIBLE_HO=
ST_armv7ve =3D &#39;null&#39;</div></div><div><br></div><div>because withou=
t it it adds new ERROR to &quot;bitbake world&quot;:</div><div><div>ERROR: =
Nothing RPROVIDES &#39;grub&#39; (but oe-core/meta/recipes-core/initrdscrip=
ts/<a href=3D"http://initramfs-module-install_1.0.bb">initramfs-module-inst=
all_1.0.bb</a> RDEPENDS on or otherwise requires it)</div><div>grub was ski=
pped: incompatible with host arm-oe-linux-gnueabi (not in COMPATIBLE_HOST)<=
/div><div>grub was skipped: incompatible with host arm-oe-linux-gnueabi (no=
t in COMPATIBLE_HOST)</div><div>NOTE: Runtime target &#39;grub&#39; is unbu=
ildable, removing...</div><div>Missing or unbuildable dependency chain was:=
 [&#39;grub&#39;]</div><div>ERROR: Required build target &#39;meta-world-pk=
gdata&#39; has no buildable providers.</div></div></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On Tue, Nov 14, 2017 at 11:03 PM, Ca=
lifornia Sullivan <span dir=3D"ltr">&lt;<a href=3D"mailto:california.l.sull=
ivan@intel.com" target=3D"_blank">california.l.sullivan@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">The non-EFI=
 counterpart for installation was previously missing for<br>
initramfs-framework. This simply puts the normal install script in the<br>
correct location for initramfs-framework to make use of it.<br>
<br>
</span><span class=3D"">Signed-off-by: California Sullivan &lt;<a href=3D"m=
ailto:california.l.sullivan@intel.com">california.l.sullivan@intel.<wbr>com=
</a>&gt;<br>
---<br>
</span>V2 changes:<br>
* Add the module&#39;s dependencies to SIGGEN_EXCLUDE_SAFE_RECIPE_<wbr>DEPS=
, since<br>
=C2=A0 its dependencies changing don&#39;t matter in regards building the p=
ackage.<br>
* PR =3D &quot;r1&quot; since its a new recipe.<br>
<br>
=C2=A0meta/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 4 ++++<br>
=C2=A0.../initrdscripts/<a href=3D"http://initramfs-module-install_1.0.bb" =
rel=3D"noreferrer" target=3D"_blank">initramfs-<wbr>module-install_1.0.bb</=
a>=C2=A0 =C2=A0 | 20 ++++++++++++++++++++<br>
=C2=A02 files changed, 24 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/<wbr>initrdscripts/<a href=3D"ht=
tp://initramfs-module-install_1.0.bb" rel=3D"noreferrer" target=3D"_blank">=
initramfs-<wbr>module-install_1.0.bb</a><br>
<br>
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf<br>
index 0342324..6782058 100644<br>
--- a/meta/conf/layer.conf<br>
+++ b/meta/conf/layer.conf<br>
@@ -57,6 +57,10 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_<wbr>DEPS +=3D &quot; \<br>
=C2=A0 =C2=A0initramfs-module-install-efi-&gt;<wbr>e2fsprogs \<br>
=C2=A0 =C2=A0initramfs-module-install-efi-&gt;<wbr>parted \<br>
=C2=A0 =C2=A0initramfs-module-install-efi-&gt;<wbr>util-linux \<br>
+=C2=A0 initramfs-module-install-&gt;<wbr>e2fsprogs \<br>
+=C2=A0 initramfs-module-install-&gt;grub \<br>
+=C2=A0 initramfs-module-install-&gt;<wbr>parted \<br>
+=C2=A0 initramfs-module-install-&gt;<wbr>util-linux \<br>
=C2=A0 =C2=A0liberation-fonts-&gt;fontconfig \<br>
=C2=A0 =C2=A0cantarell-fonts-&gt;fontconfig \<br>
=C2=A0 =C2=A0gnome-icon-theme-&gt;librsvg \<br>
<span class=3D"">diff --git a/meta/recipes-core/<wbr>initrdscripts/<a href=
=3D"http://initramfs-module-install_1.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">initramfs-<wbr>module-install_1.0.bb</a> b/meta/recipes-core/<wbr>ini=
trdscripts/<a href=3D"http://initramfs-module-install_1.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">initramfs-<wbr>module-install_1.0.bb</a><br>
new file mode 100644<br>
</span>index 0000000..ce7f165<br>
<span class=3D"">--- /dev/null<br>
+++ b/meta/recipes-core/<wbr>initrdscripts/<a href=3D"http://initramfs-modu=
le-install_1.0.bb" rel=3D"noreferrer" target=3D"_blank">initramfs-<wbr>modu=
le-install_1.0.bb</a><br>
@@ -0,0 +1,20 @@<br>
+SUMMARY =3D &quot;initramfs-framework module for installation option&quot;=
<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/<wbr>COPYING.MIT;md5=3D=
<wbr>3da9cfbcb788c80a0384361b4de204<wbr>20&quot;<br>
+RDEPENDS_${PN} =3D &quot;initramfs-framework-base grub parted e2fsprogs-mk=
e2fs util-linux-blkid&quot;<br>
+<br>
</span>+PR =3D &quot;r1&quot;<br>
<div class=3D"HOEnZb"><div class=3D"h5">+<br>
+inherit allarch<br>
+<br>
+FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/files:&quot;<br>
+SRC_URI =3D &quot;file://init-install.sh&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}&quot;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 install -d ${D}/init.d<br>
+=C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/init-install.sh ${D}/init.d/insta=
ll.sh<br>
+}<br>
+<br>
+FILES_${PN} =3D &quot;/init.d/install.sh&quot;<br>
--<br>
2.9.5<br>
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

--f403045f194ae240e0055f4dab8c--
