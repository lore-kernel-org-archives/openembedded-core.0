Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1F073169
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 22:26:37 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id w104so55352120qge.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2016 14:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=8KVNXI+69V7XQsmN/xeTQvrs596coAg8mICNozsteH0=;
	b=hFLjrpnVDKx10Q3PaWkG3nBfkmalJoZwKGM2pduyun5M67LYwm41bYUAIIgUmYG5Jz
	3CA9fYGPeEk6C+N6BQ2R0DdufbXso2JBa93ZsFsrQU7pzIWYAjuP6ea1Vl1s7lbANwlp
	oyRcMbTUrxrHxYORWCeF5onTbvRmKIZMFUS2p63kkkHSkCFh13dYAL4b0cgZvRQ7NHaM
	Zu34jm8p/Z2ewVS28P2ZvXeLYOeLZfAuCuWRESmH8eBYL4k+w42ieHwZ4wRj3G73YNNT
	ZTPIid21ojy5DYuz49Z4PQd7FT1s/QFlzb6nohVosn5K66rLZCh23USdYI2RzOHlMBNe
	w1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=8KVNXI+69V7XQsmN/xeTQvrs596coAg8mICNozsteH0=;
	b=h+ZdycsfhNUUgyrIXAntvsFkCrcjGVBBow50KQyIxO44HUY97aj33uRk/+zYkxtY71
	8AMNRq4vxpU5Mo5bspwqMFkb5MOHs3jyTpxfuCiGk3zFC/XQ1k/UQbYvZnXzhJxOaqlH
	ODxHboG9Dz8FNn4YsMqA+YBUrSlyxnG4rVKM2c3L3qonRLxywF7peBRsUPHkdgmgof83
	CMBBHmmD3rQHaBsBHjL0ut/ZiOXX6Ch9xrEnIgZJzQjCJydfBnWeInmkCTTw6YNLKT3f
	300WqXc3m6l2ncoIzVG3Gw3O+crsj5c+a1CAXqP7UuLfw77UiPcCakO3iZ8ZIsEZspxr
	VsfQ==
X-Gm-Message-State: AD7BkJJs9AYh9Z8NJ2IIlvPxsLbDEx3C7NVL97FkjNXc+Zv5YAHl3qAkdKdvbrwolitp5k0iR1VLgp2NumidoA==
MIME-Version: 1.0
X-Received: by 10.140.241.68 with SMTP id m65mr13944287qhc.98.1457130397561;
	Fri, 04 Mar 2016 14:26:37 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Fri, 4 Mar 2016 14:26:37 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Fri, 4 Mar 2016 14:26:37 -0800 (PST)
In-Reply-To: <1457108920.2804.44.camel@linuxfoundation.org>
References: <1457108920.2804.44.camel@linuxfoundation.org>
Date: Fri, 4 Mar 2016 14:26:37 -0800
Message-ID: <CAMKF1srgYVX1DEocL7hSgowXBGqdMmdNqNcQCM+L6r5mkk4wNw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linuxloader/image-prelink/image-mklibs: Fix non-standard path prelinking
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
X-List-Received-Date: Fri, 04 Mar 2016 22:26:38 -0000
Content-Type: multipart/alternative; boundary=001a11392de2bcfdd6052d409bc4

--001a11392de2bcfdd6052d409bc4
Content-Type: text/plain; charset=UTF-8

This looks good to me
On Mar 5, 2016 12:28 AM, "Richard Purdie" <
richard.purdie@linuxfoundation.org> wrote:

> Prelinking on x86-64 wasn't working out the box as it uses /lib and
> not /lib64 for libs. Prelink was refusing to link as the dynamic loader
> didn't match its idea of the right path. Passing in the --dyanmic-linker
> option avoids this.
>
> We can share code from image-mklibs so abstract that into a new class,
> linuxloader.bbclass.
>
> This does break prelinking of multilib images, I've opened a bug so we
> can loop back and fix that problem, the code would need to iterate the
> dynamic loaders (and setup ld.so.conf files for it).
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/image-mklibs.bbclass
> b/meta/classes/image-mklibs.bbclass
> index cfb3ffc..45a66fb 100644
> --- a/meta/classes/image-mklibs.bbclass
> +++ b/meta/classes/image-mklibs.bbclass
> @@ -2,6 +2,8 @@ do_rootfs[depends] += "mklibs-native:do_populate_sysroot"
>
>  IMAGE_PREPROCESS_COMMAND += "mklibs_optimize_image; "
>
> +inherit linuxloader
> +
>  mklibs_optimize_image_doit() {
>         rm -rf ${WORKDIR}/mklibs
>         mkdir -p ${WORKDIR}/mklibs/dest
> @@ -15,26 +17,8 @@ mklibs_optimize_image_doit() {
>                 | sed "s+^\./++" \
>                 > ${WORKDIR}/mklibs/executables.list
>
> -       case ${TARGET_ARCH} in
> -               powerpc | mips | mipsel | microblaze )
> -                       dynamic_loader="${base_libdir}/ld.so.1"
> -                       ;;
> -               powerpc64)
> -                       dynamic_loader="${base_libdir}/ld64.so.1"
> -                       ;;
> -               x86_64)
> -
>  dynamic_loader="${base_libdir}/ld-linux-x86-64.so.2"
> -                       ;;
> -               i*86 )
> -                       dynamic_loader="${base_libdir}/ld-linux.so.2"
> -                       ;;
> -               arm )
> -                       dynamic_loader="${base_libdir}/ld-linux.so.3"
> -                       ;;
> -               * )
> -                       dynamic_loader="/unknown_dynamic_linker"
> -                       ;;
> -       esac
> +       # Set $dynamic_loader
> +        linuxloader
>
>         mklibs -v \
>                 --ldlib ${dynamic_loader} \
> diff --git a/meta/classes/image-prelink.bbclass
> b/meta/classes/image-prelink.bbclass
> index 53c4b0b..3fe097b 100644
> --- a/meta/classes/image-prelink.bbclass
> +++ b/meta/classes/image-prelink.bbclass
> @@ -6,6 +6,8 @@ python prelink_setup () {
>      oe.utils.write_ld_so_conf(d)
>  }
>
> +inherit linuxloader
> +
>  prelink_image () {
>  #      export PSEUDO_DEBUG=4
>  #      /bin/env | /bin/grep PSEUDO
> @@ -31,8 +33,11 @@ prelink_image () {
>         fi
>         cat ${STAGING_DIR_TARGET}${sysconfdir}/ld.so.conf >> $ldsoconf
>
> +       # Set $dynamic_loader
> +       linuxloader
> +
>         # prelink!
> -       ${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root
> ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf
> +       ${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root
> ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynamic-linker
> $dynamic_loader
>
>         # Remove the prelink.conf if we had to add it.
>         if [ "$dummy_prelink_conf" = "true" ]; then
> diff --git a/meta/classes/linuxloader.bbclass
> b/meta/classes/linuxloader.bbclass
> new file mode 100644
> index 0000000..af649cc
> --- /dev/null
> +++ b/meta/classes/linuxloader.bbclass
> @@ -0,0 +1,23 @@
> +
> +linuxloader () {
> +       case ${TARGET_ARCH} in
> +               powerpc | mips | mipsel | microblaze )
> +                       dynamic_loader="${base_libdir}/ld.so.1"
> +                       ;;
> +               powerpc64)
> +                       dynamic_loader="${base_libdir}/ld64.so.1"
> +                       ;;
> +               x86_64)
> +
>  dynamic_loader="${base_libdir}/ld-linux-x86-64.so.2"
> +                       ;;
> +               i*86 )
> +                       dynamic_loader="${base_libdir}/ld-linux.so.2"
> +                       ;;
> +               arm )
> +                       dynamic_loader="${base_libdir}/ld-linux.so.3"
> +                       ;;
> +               * )
> +                       dynamic_loader="/unknown_dynamic_linker"
> +                       ;;
> +       esac
> +}
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11392de2bcfdd6052d409bc4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">This looks good to me</p>
<div class=3D"gmail_quote">On Mar 5, 2016 12:28 AM, &quot;Richard Purdie&qu=
ot; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdi=
e@linuxfoundation.org</a>&gt; wrote:<br type=3D"attribution"><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Prelinking on x86-64 wasn&#39;t working out the box as it =
uses /lib and<br>
not /lib64 for libs. Prelink was refusing to link as the dynamic loader<br>
didn&#39;t match its idea of the right path. Passing in the --dyanmic-linke=
r<br>
option avoids this.<br>
<br>
We can share code from image-mklibs so abstract that into a new class,<br>
linuxloader.bbclass.<br>
<br>
This does break prelinking of multilib images, I&#39;ve opened a bug so we<=
br>
can loop back and fix that problem, the code would need to iterate the<br>
dynamic loaders (and setup ld.so.conf files for it).<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
<br>
diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.=
bbclass<br>
index cfb3ffc..45a66fb 100644<br>
--- a/meta/classes/image-mklibs.bbclass<br>
+++ b/meta/classes/image-mklibs.bbclass<br>
@@ -2,6 +2,8 @@ do_rootfs[depends] +=3D &quot;mklibs-native:do_populate_sys=
root&quot;<br>
<br>
=C2=A0IMAGE_PREPROCESS_COMMAND +=3D &quot;mklibs_optimize_image; &quot;<br>
<br>
+inherit linuxloader<br>
+<br>
=C2=A0mklibs_optimize_image_doit() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${WORKDIR}/mklibs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${WORKDIR}/mklibs/dest<br>
@@ -15,26 +17,8 @@ mklibs_optimize_image_doit() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | sed &quot;s+^\./+=
+&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; ${WORKDIR}/mkl=
ibs/executables.list<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case ${TARGET_ARCH} in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0powerpc | mips | mi=
psel | microblaze )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld.so.1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0powerpc64)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld64.so.1&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x86_64)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux-x86-64.so.2&quot;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i*86 )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux.so.2&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux.so.3&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* )<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dynamic_loader=3D&quot;/unknown_dynamic_linker&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Set $dynamic_loader<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 linuxloader<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mklibs -v \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --ldlib ${dynamic_l=
oader} \<br>
diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelin=
k.bbclass<br>
index 53c4b0b..3fe097b 100644<br>
--- a/meta/classes/image-prelink.bbclass<br>
+++ b/meta/classes/image-prelink.bbclass<br>
@@ -6,6 +6,8 @@ python prelink_setup () {<br>
=C2=A0 =C2=A0 =C2=A0oe.utils.write_ld_so_conf(d)<br>
=C2=A0}<br>
<br>
+inherit linuxloader<br>
+<br>
=C2=A0prelink_image () {<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 export PSEUDO_DEBUG=3D4<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 /bin/env | /bin/grep PSEUDO<br>
@@ -31,8 +33,11 @@ prelink_image () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat ${STAGING_DIR_TARGET}${sysconfdir}/ld.so.co=
nf &gt;&gt; $ldsoconf<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Set $dynamic_loader<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0linuxloader<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # prelink!<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_DIR_NATIVE}${sbindir_native}/prelink =
--root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${STAGING_DIR_NATIVE}${sbindir_native}/prelink =
--root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynamic-link=
er $dynamic_loader<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove the prelink.conf if we had to add it.<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$dummy_prelink_conf&quot; =3D &quot;=
true&quot; ]; then<br>
diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bb=
class<br>
new file mode 100644<br>
index 0000000..af649cc<br>
--- /dev/null<br>
+++ b/meta/classes/linuxloader.bbclass<br>
@@ -0,0 +1,23 @@<br>
+<br>
+linuxloader () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case ${TARGET_ARCH} in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0powerpc | mips | mi=
psel | microblaze )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld.so.1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0powerpc64)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld64.so.1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x86_64)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux-x86-64.so.2&quot;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i*86 )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux.so.2&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dynamic_loader=3D&quot;${base_libdir}/ld-linux.so.3&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* )<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dynamic_loader=3D&quot;/unknown_dynamic_linker&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
+}<br>
<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a11392de2bcfdd6052d409bc4--
