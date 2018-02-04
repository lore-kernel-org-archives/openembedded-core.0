Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 962306007A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Feb 2018 08:32:04 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id c80so6500631itb.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Feb 2018 00:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q+oKcKrO5yh7pDnxAVmTSSaaunWX59L0F74l/WEMgkU=;
	b=fOYH3ZuZoqwdYuSnNzUR+7pBnRj6Vx0qeIuVy86PkpK6hrkIfWoI0KyZGlDFP4TJ5p
	v0aIEwF8UJaHHfLhboH1Ew7jf9r/Ub9g5KCYtULeJ8YKabHu5sK/bt3VPBqO7w9iqvOq
	Yc3/LS7I1rV2wjuKH1uiwwr33HX2DRGrHDDNblTDURRfTlBgGsga1lDjPDldkzeIq3kJ
	e7d9ZQ5TjJF/o3lHIv6CYuedyLMqpOfMaNINf9cQB6SpRmFvoR/AlZQxrL2/WSW0+d1R
	hIK+kmPZT6bebu0Oh930e5GdiXFFtvlnls3cDqLiybngFRfGJGIDH6EfERix5lSkVgB4
	Wd2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q+oKcKrO5yh7pDnxAVmTSSaaunWX59L0F74l/WEMgkU=;
	b=cN7NZ1CFi4Gy6peo6K8RDSmOy54C3GiptBpmlc1+L03xu48z9PROGd1+9GhLyW1tsq
	6aH9Fn7SPWsnKTDfBNcyj2BZlG11RJBe/SrXJejP8I9/BpFRkQ5+/0NRyvCx/VcnCKU+
	4WwFfubrIPL/Nlt4zQ8II/b4Z3UGqGG4dk+A9b6i7Pe/fYyYGAskOfNuD4i2VpFOqrhW
	QjdOXeo6uH7gR1FWFUa85Om0lzdIF4sSmifuO34DIUxf/YvzLP6SR+hGvgM7byXttYsX
	KDYh/0FwJmFManMsdAgSzrc6xwmXBMmcfIt0F5D+7DVqxkcJDztlNBOWmIMNuCVCPwbr
	t/Ug==
X-Gm-Message-State: AKwxytdryIf8kIX4/aA288V5K22JV/c0fjk87BcdbDlovQ1NgCuKEOyE
	pjNfwU7LjHWLNP+109Qt4x1BGGo3MBFQvyyK7YLFbqTb
X-Google-Smtp-Source: AH8x225Bby0Z68/0Vxgk8QqHX/4cadGiumriG/LTTLQQSLa86lv3ZSAOwoCF2EBdT1/22qONVAzF6WL7oUgaFVA+gag=
X-Received: by 10.36.185.84 with SMTP id k20mr18613904iti.124.1517733125579;
	Sun, 04 Feb 2018 00:32:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Sun, 4 Feb 2018 00:31:45 -0800 (PST)
In-Reply-To: <20180201180210.21652-16-alexander.kanavin@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
	<20180201180210.21652-16-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 4 Feb 2018 08:31:45 +0000
Message-ID: <CAJTo0LZFzhjunzJANsfm6Poo=idkyd-y6N7BnANc3kjD51Z26Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/20] dtc: upgrade to 1.4.6
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
X-List-Received-Date: Sun, 04 Feb 2018 08:32:04 -0000
Content-Type: multipart/alternative; boundary="f403045d96c2d0799f05645ec756"

--f403045d96c2d0799f05645ec756
Content-Type: text/plain; charset="UTF-8"

This breaks u-boot builds:

|
/data/poky-tmp/master/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/1_2018.01-r0/recipe-sysroot-native/usr/include/libfdt_env.h:70:30:
error: conflicting types for 'fdt64_t'
|  typedef uint64_t FDT_BITWISE fdt64_t;
|                               ^~~~~~~
| In file included from <command-line>:0:0:
|
/data/poky-tmp/master/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/1_2018.01-r0/git/include/libfdt_env.h:19:16:
note: previous declaration of 'fdt64_t' was here
|  typedef __be64 fdt64_t;
|                 ^~~~~~~

Ross

On 1 February 2018 at 18:02, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Drop upstreamed patch.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-kernel/dtc/dtc.inc                    |  1 -
>  ...cks-Use-proper-format-modifier-for-size_t.patch | 43
> ----------------------
>  .../dtc/{dtc_1.4.5.bb => dtc_1.4.6.bb}             |  2 +-
>  3 files changed, 1 insertion(+), 45 deletions(-)
>  delete mode 100644 meta/recipes-kernel/dtc/dtc/
> 0001-checks-Use-proper-format-modifier-for-size_t.patch
>  rename meta/recipes-kernel/dtc/{dtc_1.4.5.bb => dtc_1.4.6.bb} (81%)
>
> diff --git a/meta/recipes-kernel/dtc/dtc.inc
> b/meta/recipes-kernel/dtc/dtc.inc
> index d259c57e8d9..925cca92fac 100644
> --- a/meta/recipes-kernel/dtc/dtc.inc
> +++ b/meta/recipes-kernel/dtc/dtc.inc
> @@ -7,7 +7,6 @@ DEPENDS = "flex-native bison-native"
>
>  SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
>             file://make_install.patch \
> -           file://0001-checks-Use-proper-format-modifier-for-size_t.patch
> \
>             "
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>
> diff --git a/meta/recipes-kernel/dtc/dtc/0001-checks-Use-proper-format-modifier-for-size_t.patch
> b/meta/recipes-kernel/dtc/dtc/0001-checks-Use-proper-format-
> modifier-for-size_t.patch
> deleted file mode 100644
> index cab384dd99a..00000000000
> --- a/meta/recipes-kernel/dtc/dtc/0001-checks-Use-proper-format-
> modifier-for-size_t.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From c7a4c3817796107bb824a1f173faf90fae45396b Mon Sep 17 00:00:00 2001
> -From: Thierry Reding <treding@nvidia.com>
> -Date: Wed, 27 Sep 2017 15:04:09 +0200
> -Subject: [PATCH] checks: Use proper format modifier for size_t
> -
> -The size of size_t can vary between architectures, so using %ld isn't
> -going to work on 32-bit builds. Use the %zu modifier to make sure it is
> -always correct.
> -
> -Upstream-Status: Backport
> -Signed-off-by: Thierry Reding <treding@nvidia.com>
> -Acked-by: Rob Herring <robh@kernel.org>
> -Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - checks.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/checks.c b/checks.c
> -index 902f2e3..08a3a29 100644
> ---- a/checks.c
> -+++ b/checks.c
> -@@ -972,7 +972,7 @@ static void check_property_phandle_args(struct check
> *c,
> -       int cell, cellsize = 0;
> -
> -       if (prop->val.len % sizeof(cell_t)) {
> --              FAIL(c, dti, "property '%s' size (%d) is invalid, expected
> multiple of %ld in node %s",
> -+              FAIL(c, dti, "property '%s' size (%d) is invalid, expected
> multiple of %zu in node %s",
> -                    prop->name, prop->val.len, sizeof(cell_t),
> node->fullpath);
> -               return;
> -       }
> -@@ -1163,7 +1163,7 @@ static void check_interrupts_property(struct check
> *c,
> -               return;
> -
> -       if (irq_prop->val.len % sizeof(cell_t))
> --              FAIL(c, dti, "property '%s' size (%d) is invalid, expected
> multiple of %ld in node %s",
> -+              FAIL(c, dti, "property '%s' size (%d) is invalid, expected
> multiple of %zu in node %s",
> -                    irq_prop->name, irq_prop->val.len, sizeof(cell_t),
> -                    node->fullpath);
> -
> ---
> -2.15.0
> -
> diff --git a/meta/recipes-kernel/dtc/dtc_1.4.5.bb
> b/meta/recipes-kernel/dtc/dtc_1.4.6.bb
> similarity index 81%
> rename from meta/recipes-kernel/dtc/dtc_1.4.5.bb
> rename to meta/recipes-kernel/dtc/dtc_1.4.6.bb
> index 0e46cfbeb4f..78c57363926 100644
> --- a/meta/recipes-kernel/dtc/dtc_1.4.5.bb
> +++ b/meta/recipes-kernel/dtc/dtc_1.4.6.bb
> @@ -3,7 +3,7 @@ require dtc.inc
>  LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
>                     file://libfdt/libfdt.h;beginline=3;endline=52;md5=
> fb360963151f8ec2d6c06b055bcbb68c"
>
> -SRCREV = "22a65c5331c22979d416738eb756b9541672e00d"
> +SRCREV = "e54388015af1fb4bf04d0bca99caba1074d9cc42"
>
>  S = "${WORKDIR}/git"
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

--f403045d96c2d0799f05645ec756
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This breaks u-boot builds:<div><br></div><div><div>| /data=
/poky-tmp/master/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/1_2018.01-=
r0/recipe-sysroot-native/usr/include/libfdt_env.h:70:30: error: conflicting=
 types for &#39;fdt64_t&#39;</div><div>| =C2=A0typedef uint64_t FDT_BITWISE=
 fdt64_t;</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~</div><div>| In=
 file included from &lt;command-line&gt;:0:0:</div><div>| /data/poky-tmp/ma=
ster/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/1_2018.01-r0/git/inclu=
de/libfdt_env.h:19:16: note: previous declaration of &#39;fdt64_t&#39; was =
here</div><div>| =C2=A0typedef __be64 fdt64_t;</div><div>| =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~</div></div><div><br></div=
><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On 1 February 2018 at 18:02, Alexander Kanavin <span dir=3D"ltr">&lt;<=
a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexa=
nder.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">Drop upstreamed patch.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/dtc/dtc.<wbr>inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 -<br>
=C2=A0...cks-Use-proper-format-<wbr>modifier-for-size_t.patch | 43 --------=
--------------<br>
=C2=A0.../dtc/{<a href=3D"http://dtc_1.4.5.bb" rel=3D"noreferrer" target=3D=
"_blank">dtc_1.4.5.bb</a> =3D&gt; <a href=3D"http://dtc_1.4.6.bb" rel=3D"no=
referrer" target=3D"_blank">dtc_1.4.6.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A03 files changed, 1 insertion(+), 45 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-kernel/dtc/dtc/<wbr>0001-checks-Use-p=
roper-format-<wbr>modifier-for-size_t.patch<br>
=C2=A0rename meta/recipes-kernel/dtc/{<a href=3D"http://dtc_1.4.5.bb" rel=
=3D"noreferrer" target=3D"_blank">dtc_<wbr>1.4.5.bb</a> =3D&gt; <a href=3D"=
http://dtc_1.4.6.bb" rel=3D"noreferrer" target=3D"_blank">dtc_1.4.6.bb</a>}=
 (81%)<br>
<br>
diff --git a/meta/recipes-kernel/dtc/dtc.<wbr>inc b/meta/recipes-kernel/dtc=
/dtc.<wbr>inc<br>
index d259c57e8d9..925cca92fac 100644<br>
--- a/meta/recipes-kernel/dtc/dtc.<wbr>inc<br>
+++ b/meta/recipes-kernel/dtc/dtc.<wbr>inc<br>
@@ -7,7 +7,6 @@ DEPENDS =3D &quot;flex-native bison-native&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/util=
s/dtc/dtc.git" rel=3D"noreferrer" target=3D"_blank">git.kernel.org/pub/scm/=
<wbr>utils/dtc/dtc.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://make_install.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-checks-Use-proper-<wb=
r>format-modifier-for-size_t.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)&quo=
t;<br>
<br>
diff --git a/meta/recipes-kernel/dtc/dtc/<wbr>0001-checks-Use-proper-format=
-<wbr>modifier-for-size_t.patch b/meta/recipes-kernel/dtc/dtc/<wbr>0001-che=
cks-Use-proper-format-<wbr>modifier-for-size_t.patch<br>
deleted file mode 100644<br>
index cab384dd99a..00000000000<br>
--- a/meta/recipes-kernel/dtc/dtc/<wbr>0001-checks-Use-proper-format-<wbr>m=
odifier-for-size_t.patch<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-From c7a4c3817796107bb824a1f173faf9<wbr>0fae45396b Mon Sep 17 00:00:00 200=
1<br>
-From: Thierry Reding &lt;<a href=3D"mailto:treding@nvidia.com">treding@nvi=
dia.com</a>&gt;<br>
-Date: Wed, 27 Sep 2017 15:04:09 +0200<br>
-Subject: [PATCH] checks: Use proper format modifier for size_t<br>
-<br>
-The size of size_t can vary between architectures, so using %ld isn&#39;t<=
br>
-going to work on 32-bit builds. Use the %zu modifier to make sure it is<br=
>
-always correct.<br>
-<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Thierry Reding &lt;<a href=3D"mailto:treding@nvidia.com">tr=
eding@nvidia.com</a>&gt;<br>
-Acked-by: Rob Herring &lt;<a href=3D"mailto:robh@kernel.org">robh@kernel.o=
rg</a>&gt;<br>
-Signed-off-by: David Gibson &lt;<a href=3D"mailto:david@gibson.dropbear.id=
.au">david@gibson.dropbear.id.au</a>&gt;<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
----<br>
- checks.c | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/checks.c b/checks.c<br>
-index 902f2e3..08a3a29 100644<br>
---- a/checks.c<br>
-+++ b/checks.c<br>
-@@ -972,7 +972,7 @@ static void check_property_phandle_args(<wbr>struct ch=
eck *c,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int cell, cellsize =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (prop-&gt;val.len % sizeof(cell_t)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(c, dti, &quot;prope=
rty &#39;%s&#39; size (%d) is invalid, expected multiple of %ld in node %s&=
quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(c, dti, &quot;prope=
rty &#39;%s&#39; size (%d) is invalid, expected multiple of %zu in node %s&=
quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prop=
-&gt;name, prop-&gt;val.len, sizeof(cell_t), node-&gt;fullpath);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -1163,7 +1163,7 @@ static void check_interrupts_property(<wbr>struct ch=
eck *c,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq_prop-&gt;val.len % sizeof(cell_t))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(c, dti, &quot;prope=
rty &#39;%s&#39; size (%d) is invalid, expected multiple of %ld in node %s&=
quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(c, dti, &quot;prope=
rty &#39;%s&#39; size (%d) is invalid, expected multiple of %zu in node %s&=
quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 irq_=
prop-&gt;name, irq_prop-&gt;val.len, sizeof(cell_t),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node=
-&gt;fullpath);<br>
-<br>
---<br>
-2.15.0<br>
-<br>
diff --git a/meta/recipes-kernel/dtc/<a href=3D"http://dtc_1.4.5.bb" rel=3D=
"noreferrer" target=3D"_blank">dtc_<wbr>1.4.5.bb</a> b/meta/recipes-kernel/=
dtc/<a href=3D"http://dtc_1.4.6.bb" rel=3D"noreferrer" target=3D"_blank">dt=
c_<wbr>1.4.6.bb</a><br>
similarity index 81%<br>
rename from meta/recipes-kernel/dtc/<a href=3D"http://dtc_1.4.5.bb" rel=3D"=
noreferrer" target=3D"_blank">dtc_1.<wbr>4.5.bb</a><br>
rename to meta/recipes-kernel/dtc/<a href=3D"http://dtc_1.4.6.bb" rel=3D"no=
referrer" target=3D"_blank">dtc_1.<wbr>4.6.bb</a><br>
index 0e46cfbeb4f..78c57363926 100644<br>
--- a/meta/recipes-kernel/dtc/<a href=3D"http://dtc_1.4.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">dtc_<wbr>1.4.5.bb</a><br>
+++ b/meta/recipes-kernel/dtc/<a href=3D"http://dtc_1.4.6.bb" rel=3D"norefe=
rrer" target=3D"_blank">dtc_<wbr>1.4.6.bb</a><br>
@@ -3,7 +3,7 @@ require dtc.inc<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://GPL;md5=3D<wbr>94d55d512a9ba36caa9b=
7df079bae1<wbr>9f \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file:=
//libfdt/libfdt.h;<wbr>beginline=3D3;endline=3D52;md5=3D<wbr>fb360963151f8e=
c2d6c06b055bcbb6<wbr>8c&quot;<br>
<br>
-SRCREV =3D &quot;<wbr>22a65c5331c22979d416738eb756b9<wbr>541672e00d&quot;<=
br>
+SRCREV =3D &quot;<wbr>e54388015af1fb4bf04d0bca99caba<wbr>1074d9cc42&quot;<=
br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
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

--f403045d96c2d0799f05645ec756--
