Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id A318371CBD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 11:28:14 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id d16so1258467ioj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 04:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XL2X3f6UKybQ0Gh3INlxGaFD1LsyRTlbuEtamZ+kFZs=;
	b=S6FsR2AXPTbWANFHkGV6/Rvd85zsgy+acpWrgh8UOsG4vk8xd74bh1hy6U90x3/QKG
	KG3dNhH/SQaNQ+QWCOiEUL1UEBxuuW6jWNyDI1MZhmGEskztZMe7iQ+2Yh0zQEqmX8P1
	ni2CjCtSgAYJB8RLDuvc/URow+X4cRLcChByaULyU0clziMFQJamB2+EdYHNw4HREzC0
	rRKo80zeNqUaQiLAH5yGdNP+QAmH4Rhdi4ESOhGjvgTTBr3QmZyBk1i38nP4I9rNX2Rp
	otIhHAKaHE1vB2CoPK4Ouh6TrxW/gThQsbVv4gurlXwQuv5eQACVIiVZl+OoVpFT8JJd
	TqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XL2X3f6UKybQ0Gh3INlxGaFD1LsyRTlbuEtamZ+kFZs=;
	b=Dtu5aLVoRVyI/AM+XGIjH8k4BRhGWmmIttTREnzi1eEEsVnJJ+4YFIkPKnLsWS7dHy
	uGjhBoY5vI9R948EdLayrhcr+hVYJYCGLk4m7/bG7LG+rfM3UM2tAz371UuBEUafNZYa
	fo3FQxD5WdaSIyzV3LrZSlJmsiyFAYqYvgfWhBBhj6erW+ZnjWjONXRH/y4wPuxvpIb3
	qiYSR610solXXwascPb9ZuMCEJfQdxhvUqzNgUgS96lIgOwpZegXmWrI+JpjvitAembk
	eZ1D0XUMCEVoOHwU8dNjfBc6IGcVgvU2A8E/9bL7GfEc7WOK43LatmZJLYnnOlSIcPrj
	p2cA==
X-Gm-Message-State: AHPjjUhhKPamXWIDOr0wxwzbLsD2LEkBvCzL535Aeu+zvc1NTeKx06IZ
	d12MY6j5fYB/GQHbRd1lyG77n0MogHCQq4FZ0HnX1w==
X-Google-Smtp-Source: AOwi7QDx8XEaHp56aRVQM02Zuz3SuzAa3GfUi95JOapaEwi87PzMvTaQ2iJzZNCqNFKgKNAslzq13jPkanDPjl7mJTM=
X-Received: by 10.107.41.135 with SMTP id p129mr6395351iop.142.1506598095951; 
	Thu, 28 Sep 2017 04:28:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Thu, 28 Sep 2017 04:27:55 -0700 (PDT)
In-Reply-To: <20170831055458.9197-1-jackie.huang@windriver.com>
References: <20170831055458.9197-1-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Sep 2017 12:27:55 +0100
Message-ID: <CAJTo0LaXfJCZ5hw+sLcm4yWe_K9ck_H+7kTgva1+i9NSLdB6RA@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs-postcommands.bbclass: add support for /etc/ld.so.conf.d/*.conf
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
X-List-Received-Date: Thu, 28 Sep 2017 11:28:16 -0000
Content-Type: multipart/alternative; boundary="001a1141f226545524055a3e3421"

--001a1141f226545524055a3e3421
Content-Type: text/plain; charset="UTF-8"

Why implement this as a rootfs postinstall command?  glibc writes this
file, so we can alter it when that recipe is written.

Ross

On 31 August 2017 at 06:54, <jackie.huang@windriver.com> wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>
> There are advantages in changing the contents of ld.so.conf to
> "include /etc/ld.so.conf.d/*.conf" instead of directly listing
> directories in it, just like most distributions are doing the same.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/classes/rootfs-postcommands.bbclass | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/meta/classes/rootfs-postcommands.bbclass
> b/meta/classes/rootfs-postcommands.bbclass
> index dc5a76baba..af01eb550a 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -20,6 +20,9 @@ ROOTFS_POSTPROCESS_COMMAND +=
> '${@bb.utils.contains("IMAGE_FEATURES", "read-only
>  # Generates test data file with data store variables expanded in json
> format
>  ROOTFS_POSTPROCESS_COMMAND += "write_image_test_data ; "
>
> +# Add support for /etc/ld.so.conf.d/*.conf if ldconfig is enabled
> +ROOTFS_POSTINSTALL_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES',
> 'ldconfig', 'add_ld_so_conf_d ;', '', d)}"
> +
>  # Write manifest
>  IMAGE_MANIFEST = "${IMGDEPLOYDIR}/${IMAGE_NAME}.rootfs.manifest"
>  ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
> @@ -244,6 +247,16 @@ make_zimage_symlink_relative () {
>         fi
>  }
>
> +# Add support for /etc/ld.so.conf.d/*.conf
> +add_ld_so_conf_d() {
> +    if [ -f ${IMAGE_ROOTFS}${sysconfdir}/ld.so.conf ]; then
> +        if ! `grep -q 'include ld.so.conf.d\/\*.conf' /etc/ld.so.conf`;
> then
> +            echo 'include ld.so.conf.d/*.conf' >>
> ${IMAGE_ROOTFS}${sysconfdir}/ld.so.conf
> +        fi
> +        mkdir -p ${IMAGE_ROOTFS}${sysconfdir}/ld.so.conf.d
> +    fi
> +}
> +
>  python write_image_manifest () {
>      from oe.rootfs import image_list_installed_packages
>      from oe.utils import format_pkg_list
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141f226545524055a3e3421
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why implement this as a rootfs postinstall command? =C2=A0=
glibc writes this file, so we can alter it when that recipe is written.<div=
><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 31 August 2017 at 06:54,  <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jackie.huang@windriver.com" target=3D"_blank">jackie.huang@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Ja=
ckie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.com">jackie.huang@w=
indriver.com</a>&gt;<br>
<br>
There are advantages in changing the contents of ld.so.conf to<br>
&quot;include /etc/ld.so.conf.d/*.conf&quot; instead of directly listing<br=
>
directories in it, just like most distributions are doing the same.<br>
<br>
Signed-off-by: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.co=
m">jackie.huang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/rootfs-<wbr>postcommands.bbclass | 13 +++++++++++++<br>
=C2=A01 file changed, 13 insertions(+)<br>
<br>
diff --git a/meta/classes/rootfs-<wbr>postcommands.bbclass b/meta/classes/r=
ootfs-<wbr>postcommands.bbclass<br>
index dc5a76baba..af01eb550a 100644<br>
--- a/meta/classes/rootfs-<wbr>postcommands.bbclass<br>
+++ b/meta/classes/rootfs-<wbr>postcommands.bbclass<br>
@@ -20,6 +20,9 @@ ROOTFS_POSTPROCESS_COMMAND +=3D &#39;${@bb.utils.contains=
(&quot;IMAGE_<wbr>FEATURES&quot;, &quot;read-only<br>
=C2=A0# Generates test data file with data store variables expanded in json=
 format<br>
=C2=A0ROOTFS_POSTPROCESS_COMMAND +=3D &quot;write_image_test_data ; &quot;<=
br>
<br>
+# Add support for /etc/ld.so.conf.d/*.conf if ldconfig is enabled<br>
+ROOTFS_POSTINSTALL_COMMAND +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wb=
r>FEATURES&#39;, &#39;ldconfig&#39;, &#39;add_ld_so_conf_d ;&#39;, &#39;&#3=
9;, d)}&quot;<br>
+<br>
=C2=A0# Write manifest<br>
=C2=A0IMAGE_MANIFEST =3D &quot;${IMGDEPLOYDIR}/${IMAGE_NAME}<wbr>.rootfs.ma=
nifest&quot;<br>
=C2=A0ROOTFS_POSTUNINSTALL_COMMAND =3D+ &quot;write_image_manifest ; &quot;=
<br>
@@ -244,6 +247,16 @@ make_zimage_symlink_relative () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
+# Add support for /etc/ld.so.conf.d/*.conf<br>
+add_ld_so_conf_d() {<br>
+=C2=A0 =C2=A0 if [ -f ${IMAGE_ROOTFS}${sysconfdir}/<wbr>ld.so.conf ]; then=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ! `grep -q &#39;include ld.so.conf.d\/\*.co=
nf&#39; /etc/ld.so.conf`; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;include ld.so.conf.d/*=
.conf&#39; &gt;&gt; ${IMAGE_ROOTFS}${sysconfdir}/<wbr>ld.so.conf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${IMAGE_ROOTFS}${sysconfdir}/<wbr>ld.=
so.conf.d<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
=C2=A0python write_image_manifest () {<br>
=C2=A0 =C2=A0 =C2=A0from oe.rootfs import image_list_installed_packages<br>
=C2=A0 =C2=A0 =C2=A0from oe.utils import format_pkg_list<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
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
</font></span></blockquote></div><br></div>

--001a1141f226545524055a3e3421--
