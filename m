Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8C80F78735
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 15:38:44 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id 25so21288223ioj.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 07:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pdHkAxTMKvV9vYI2gFWzf/7oh7dJvbUvNc92Tm8g4s0=;
	b=pSYBeJIXpYV9zEnH7LvswWwSIJyaJTcl1IISCkz/dX0y98uIiCFkJfm5Zvj5TgfThd
	BmbbI6AgbDbZVppIl1G5YxTnQuNYsHA0QTnSrmH5/QeKkb2ohUuLldHCqg6s68tDhokf
	BA5mtO80O4mncWkY4itVeLOJ5ekb3AmYs9TGYFDz8IklOfXBxjx1lvA1wKwNHITCCOL/
	jUk343qjVRtsLA8TeTbPvUlXAcg+DB5O9CvGMUSxzI+oJ5ccnjvsA27PUhG6jZeNaXeQ
	5M5TRavKQmIM33DgMD3u+ubg3UZzazfRCLD8uK8b2ENy/WNUhEFPncrgrOWOItTZfegF
	Cxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pdHkAxTMKvV9vYI2gFWzf/7oh7dJvbUvNc92Tm8g4s0=;
	b=U7JY4QoXJnFCq1EpaCWH2vXXJlvhh/1BnSTamAjuRTuLbX2EGJDJN20tNQf6YfAL6r
	MolnI8O0/KQljs2IXPxlCvOd3pZNSQASsULkFykEvOPIbEX0b4TNQ6+DATJHAPDygD+2
	zkHaQzvFah9pijYw3l6QerPtXwncdjKLN3tAbaQSasgegYmrdN83vvRT92GHW4PylKef
	mRtcL8eL0cuP1r0U3hSTuui8G98BznkBjG8RDLSHbN3mtGIp/EUILFhv9V17ziOzJXhO
	hudOq7Hwt7nPetX3Hb++jA07URr0Zs9YnozpRAQd4Dbq/o75iJYmJPDUUocLEi85TAs1
	RzIA==
X-Gm-Message-State: AKwxyteu/E8NXYrXaxB/wUOJ6NYMe1u+Im/TC+RN6egKxc6EmAdOwlXB
	XRZjoCzJSYmAfLbv2SWM2lnBZ4togwY5dYOtgen9TQ==
X-Google-Smtp-Source: ACJfBos4LYc17wTrdvHQJ0jFk8+RNvm7uASVKfV446d7DMJB8xxt9ABYqzHFltzyeNDPVXdBxEK/yLcHbyn+Yj0uGe8=
X-Received: by 10.107.175.8 with SMTP id y8mr14392800ioe.37.1516203525734;
	Wed, 17 Jan 2018 07:38:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.157.202 with HTTP; Wed, 17 Jan 2018 07:38:25 -0800 (PST)
In-Reply-To: <20180117092850.9694-1-thomas.perrot@tupi.fr>
References: <20180117092850.9694-1-thomas.perrot@tupi.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Jan 2018 15:38:25 +0000
Message-ID: <CAJTo0LYKQMOBzKnw2Tqoqge3H_BUqMseycXKmd7TES4114V2YA@mail.gmail.com>
To: Thomas Perrot <thomas.perrot@tupi.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: use sha256 checksum
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
X-List-Received-Date: Wed, 17 Jan 2018 15:38:44 -0000
Content-Type: multipart/alternative; boundary="001a1144a2688f16d30562faa406"

--001a1144a2688f16d30562faa406
Content-Type: text/plain; charset="UTF-8"

This and your other kernel-fitimage patches conflict, can you solve that
and send them again?

Ross

On 17 January 2018 at 09:28, Thomas Perrot <thomas.perrot@tupi.fr> wrote:

> Update the bbclass to use sha256 instead of sha1.
>
> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> ---
>  meta/classes/kernel-fitimage.bbclass | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-
> fitimage.bbclass
> index a50f8a18ee..b8c2815fba 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -100,7 +100,7 @@ EOF
>  # $4 ... Compression type
>  fitimage_emit_section_kernel() {
>
> -       kernel_csum="sha1"
> +       kernel_csum="sha256"
>
>         ENTRYPOINT=${UBOOT_ENTRYPOINT}
>         if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
> @@ -133,7 +133,7 @@ EOF
>  # $3 ... Path to DTB image
>  fitimage_emit_section_dtb() {
>
> -       dtb_csum="sha1"
> +       dtb_csum="sha256"
>
>         cat << EOF >> ${1}
>                  fdt@${2} {
> @@ -157,7 +157,7 @@ EOF
>  # $3 ... Path to setup image
>  fitimage_emit_section_setup() {
>
> -       setup_csum="sha1"
> +       setup_csum="sha256"
>
>         cat << EOF >> ${1}
>                  setup@${2} {
> @@ -184,7 +184,7 @@ EOF
>  # $3 ... Path to ramdisk image
>  fitimage_emit_section_ramdisk() {
>
> -       ramdisk_csum="sha1"
> +       ramdisk_csum="sha256"
>         ramdisk_ctype="none"
>         ramdisk_loadline=""
>         ramdisk_entryline=""
> @@ -242,7 +242,7 @@ EOF
>  # $6 ... default flag
>  fitimage_emit_section_config() {
>
> -       conf_csum="sha1"
> +       conf_csum="sha256"
>         if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
>                 conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
>         fi
> --
> 2.13.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144a2688f16d30562faa406
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This and your other kernel-fitimage patches conflict, can =
you solve that and send them again?<div><br></div><div>Ross</div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 17 January 2018 at=
 09:28, Thomas Perrot <span dir=3D"ltr">&lt;<a href=3D"mailto:thomas.perrot=
@tupi.fr" target=3D"_blank">thomas.perrot@tupi.fr</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Update the bbclass to use sha256 instead of =
sha1.<br>
<br>
Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@tupi.fr">t=
homas.perrot@tupi.fr</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-fitimage.<wbr>bbclass | 10 +++++-----<br>
=C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel-<wbr>fitimage.bbclass b/meta/classes/kerne=
l-<wbr>fitimage.bbclass<br>
index a50f8a18ee..b8c2815fba 100644<br>
--- a/meta/classes/kernel-<wbr>fitimage.bbclass<br>
+++ b/meta/classes/kernel-<wbr>fitimage.bbclass<br>
@@ -100,7 +100,7 @@ EOF<br>
=C2=A0# $4 ... Compression type<br>
=C2=A0fitimage_emit_section_kernel() {<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_csum=3D&quot;sha1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel_csum=3D&quot;sha256&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ENTRYPOINT=3D${UBOOT_ENTRYPOINT}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${UBOOT_ENTRYSYMBOL}&quot; ]; the=
n<br>
@@ -133,7 +133,7 @@ EOF<br>
=C2=A0# $3 ... Path to DTB image<br>
=C2=A0fitimage_emit_section_dtb() {<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_csum=3D&quot;sha1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_csum=3D&quot;sha256&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &lt;&lt; EOF &gt;&gt; ${1}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdt@${2} {<br=
>
@@ -157,7 +157,7 @@ EOF<br>
=C2=A0# $3 ... Path to setup image<br>
=C2=A0fitimage_emit_section_setup() {<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0setup_csum=3D&quot;sha1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0setup_csum=3D&quot;sha256&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &lt;&lt; EOF &gt;&gt; ${1}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setup@${2} {<=
br>
@@ -184,7 +184,7 @@ EOF<br>
=C2=A0# $3 ... Path to ramdisk image<br>
=C2=A0fitimage_emit_section_ramdisk(<wbr>) {<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ramdisk_csum=3D&quot;sha1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ramdisk_csum=3D&quot;sha256&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ramdisk_ctype=3D&quot;none&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ramdisk_loadline=3D&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ramdisk_entryline=3D&quot;&quot;<br>
@@ -242,7 +242,7 @@ EOF<br>
=C2=A0# $6 ... default flag<br>
=C2=A0fitimage_emit_section_config() {<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0conf_csum=3D&quot;sha1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0conf_csum=3D&quot;sha256&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${UBOOT_SIGN_ENABLE}&quot; ] ; th=
en<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 conf_sign_keyname=
=3D&quot;${UBOOT_<wbr>SIGN_KEYNAME}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.13.6<br>
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

--001a1144a2688f16d30562faa406--
