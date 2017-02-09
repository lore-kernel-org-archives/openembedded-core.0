Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D86070100
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 20:25:51 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id x1so1315878lff.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2017 12:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x78C9R7Jt4/a/EOtrPKT9ntScSHqmTXQX2HTA5+wBVg=;
	b=le9IQjXqo/rj3lZx6pgSog4k8rsa0xel5RB23zBmarsvEzPoMW+52T/XoiedIUy4nx
	6uUhUv08L4Mx1C5sxK8E7bOH40AqlYYejB+oZFT8Xmht3Yj2fQC7Smq2COSYxGBbzpSO
	65haLDaLt3ravze37CedisGa/T+eMX7l7lqIRNTh/9ne9OiFo2te2nSq4DU5w5RMwS2F
	sX6bhluRQQhmzhp/wQCVVVEBz4TyW2l32VG1/Q50AXanTL5rMBSQvXOwpo4bdnFD5K1c
	HoNcy0gi2hDwR2ZQ0diwx1RQQwmKi9BAU3IUZhPTRVfnjSEHCyI6Pnkfw7t8tc1FHAng
	G2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x78C9R7Jt4/a/EOtrPKT9ntScSHqmTXQX2HTA5+wBVg=;
	b=bv5yyf583S24d0uaO6kSc2T/Euwfsyc9/gXdJbKDo2qErsD8lhdKNIb/+zsZyl2Czz
	APsYFqJ4sQqelIIBng7SabyNimv8xz8uUHQRGAn9s5VpatrmaK5W9iitgg2Of/yXLFsU
	NQ2KVu9+7diQA1WLOrRYY72Iwyg5iXCLivNElYiBaW33PvLM6mqz34pwHmbWMPLCqCQw
	BHPnaLrouKwhfWYOFNhBTeckY7qMArKJhqk0jCRQuCG7V8j7luCSq03CNXQRltRyi0MN
	J9ax0GUy4r1euoB5VgY3TwzOcsDrd+IMWMg4ANggIRHpsULJeLKgc2QIztgYA51fqkXs
	YQfQ==
X-Gm-Message-State: AMke39kxzzB6ok4oKN4UNyaxgGOstSEoliYOLM169j3k9O6ByYui81pQiVzAzWfiZfZ2gVa01WAx8KswGzFqTw==
X-Received: by 10.25.195.151 with SMTP id t145mr1814757lff.149.1486671951595; 
	Thu, 09 Feb 2017 12:25:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.163.200 with HTTP; Thu, 9 Feb 2017 12:25:31 -0800 (PST)
X-Originating-IP: [189.114.111.135]
In-Reply-To: <1486656570-20299-1-git-send-email-dwesterg@gmail.com>
References: <1486656570-20299-1-git-send-email-dwesterg@gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 9 Feb 2017 18:25:31 -0200
Message-ID: <CAAPZna0y4nMEUWrQQbBmXsu=4YSYekOATCe8e1c-NbDvGT9xvA@mail.gmail.com>
To: Dalon Westergreen <dwesterg@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uboot-extlinux-config.bbclass: add support for timeout & default
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
X-List-Received-Date: Thu, 09 Feb 2017 20:25:53 -0000
Content-Type: multipart/alternative; boundary=94eb2c1a181892a1ab05481ec919

--94eb2c1a181892a1ab05481ec919
Content-Type: text/plain; charset=UTF-8

I get this error:

Exception: UnboundLocalError: local variable 'localdata' referenced before
assignment

You are using localdata.getVar('UBOOT_EXTLINUX_TIMEOUT') before localdata =
bb.data.createCopy(d).

On Thu, Feb 9, 2017 at 2:09 PM, Dalon Westergreen <dwesterg@gmail.com>
wrote:

> When multible targets are defined it is useful to allow for
> a default target along with a timeout.  After timeout, the
> default target will be selected.
>
> Signed-off-by: Dalon Westergreen <dwesterg@gmail.com>
> ---
>  meta/classes/uboot-extlinux-config.bbclass | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/meta/classes/uboot-extlinux-config.bbclass
> b/meta/classes/uboot-extlinux-config.bbclass
> index ec5fffb..96b5a2e 100644
> --- a/meta/classes/uboot-extlinux-config.bbclass
> +++ b/meta/classes/uboot-extlinux-config.bbclass
> @@ -16,6 +16,10 @@
>  #                                    concatenate and use as an initrd
> (optional).
>  # UBOOT_EXTLINUX_MENU_DESCRIPTION  - Name to use as description.
>  # UBOOT_EXTLINUX_ROOT              - Root kernel cmdline.
> +# UBOOT_EXTLINUX_TIMEOUT           - Timeout before DEFAULT selection is
> made.
> +#                                    Measured in 1/10 of a second.
> +# UBOOT_EXTLINUX_DEFAULT_LABEL     - Target to be selected by default
> after
> +#                                    the timeout period
>  #
>  # If there's only one label system will boot automatically and menu won't
> be
>  # created. If you want to use more than one labels, e.g linux and
> alternate,
> @@ -25,6 +29,9 @@
>  #
>  # UBOOT_EXTLINUX_LABELS ??= "default fallback"
>  #
> +# UBOOT_EXTLINUX_DEFAULT_LABEL ??= "Linux Default"
> +# UBOOT_EXTLINUX_TIMEOUT ??= "30"
> +#
>  # UBOOT_EXTLINUX_KERNEL_IMAGE_default ??= "../zImage"
>  # UBOOT_EXTLINUX_MENU_DESCRIPTION_default ??= "Linux Default"
>  #
> @@ -34,6 +41,8 @@
>  # Results:
>  #
>  # menu title Select the boot mode
> +# TIMEOUT 30
> +# DEFAULT Linux Default
>  # LABEL Linux Default
>  #   KERNEL ../zImage
>  #   FDTDIR ../
> @@ -82,6 +91,15 @@ python create_extlinux_config() {
>              if len(labels.split()) > 1:
>                  cfgfile.write('menu title Select the boot mode\n')
>
> +            timeout =  localdata.getVar('UBOOT_EXTLINUX_TIMEOUT')
> +            if timeout:
> +                cfgfile.write('TIMEOUT %s\n' % (timeout))
> +
> +            if len(labels.split()) > 1:
> +                default = localdata.getVar('UBOOT_
> EXTLINUX_DEFAULT_LABEL')
> +                if default:
> +                    cfgfile.write('DEFAULT %s\n' % (default))
> +
>              for label in labels.split():
>                  localdata = bb.data.createCopy(d)
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c1a181892a1ab05481ec919
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">I get this error:<br><br>Exception: UnboundLoc=
alError: local variable &#39;localdata&#39; referenced before assignment<br=
><br></div><div class=3D"gmail_default" style=3D"font-family:monospace,mono=
space;font-size:small">You are using localdata.getVar(&#39;UBOOT_EXTLINUX_T=
IMEOUT&#39;) before localdata =3D bb.data.createCopy(d).<br></div></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Feb 9, 2017 =
at 2:09 PM, Dalon Westergreen <span dir=3D"ltr">&lt;<a href=3D"mailto:dwest=
erg@gmail.com" target=3D"_blank">dwesterg@gmail.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">When multible targets are defined it is us=
eful to allow for<br>
a default target along with a timeout.=C2=A0 After timeout, the<br>
default target will be selected.<br>
<br>
Signed-off-by: Dalon Westergreen &lt;<a href=3D"mailto:dwesterg@gmail.com">=
dwesterg@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/uboot-extlinux-<wbr>config.bbclass | 18 ++++++++++++++++=
++<br>
=C2=A01 file changed, 18 insertions(+)<br>
<br>
diff --git a/meta/classes/uboot-extlinux-<wbr>config.bbclass b/meta/classes=
/uboot-extlinux-<wbr>config.bbclass<br>
index ec5fffb..96b5a2e 100644<br>
--- a/meta/classes/uboot-extlinux-<wbr>config.bbclass<br>
+++ b/meta/classes/uboot-extlinux-<wbr>config.bbclass<br>
@@ -16,6 +16,10 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 concatenate and=
 use as an initrd (optional).<br>
=C2=A0# UBOOT_EXTLINUX_MENU_<wbr>DESCRIPTION=C2=A0 - Name to use as descrip=
tion.<br>
=C2=A0# UBOOT_EXTLINUX_ROOT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 - Root kernel cmdline.<br>
+# UBOOT_EXTLINUX_TIMEOUT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- Timeout=
 before DEFAULT selection is made.<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Measured in 1/10 of a =
second.<br>
+# UBOOT_EXTLINUX_DEFAULT_LABEL=C2=A0 =C2=A0 =C2=A0- Target to be selected =
by default after<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the timeout period<br>
=C2=A0#<br>
=C2=A0# If there&#39;s only one label system will boot automatically and me=
nu won&#39;t be<br>
=C2=A0# created. If you want to use more than one labels, e.g linux and alt=
ernate,<br>
@@ -25,6 +29,9 @@<br>
=C2=A0#<br>
=C2=A0# UBOOT_EXTLINUX_LABELS ??=3D &quot;default fallback&quot;<br>
=C2=A0#<br>
+# UBOOT_EXTLINUX_DEFAULT_LABEL ??=3D &quot;Linux Default&quot;<br>
+# UBOOT_EXTLINUX_TIMEOUT ??=3D &quot;30&quot;<br>
+#<br>
=C2=A0# UBOOT_EXTLINUX_KERNEL_IMAGE_<wbr>default ??=3D &quot;../zImage&quot=
;<br>
=C2=A0# UBOOT_EXTLINUX_MENU_<wbr>DESCRIPTION_default ??=3D &quot;Linux Defa=
ult&quot;<br>
=C2=A0#<br>
@@ -34,6 +41,8 @@<br>
=C2=A0# Results:<br>
=C2=A0#<br>
=C2=A0# menu title Select the boot mode<br>
+# TIMEOUT 30<br>
+# DEFAULT Linux Default<br>
=C2=A0# LABEL Linux Default<br>
=C2=A0#=C2=A0 =C2=A0KERNEL ../zImage<br>
=C2=A0#=C2=A0 =C2=A0FDTDIR ../<br>
@@ -82,6 +91,15 @@ python create_extlinux_config() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(labels.split()) &gt;=
 1:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cfgfile.write=
(&#39;menu title Select the boot mode\n&#39;)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timeout =3D=C2=A0 localdata.getV=
ar(&#39;UBOOT_<wbr>EXTLINUX_TIMEOUT&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if timeout:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfgfile.write(&#39=
;TIMEOUT %s\n&#39; % (timeout))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(labels.split()) &gt; 1:<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default =3D locald=
ata.getVar(&#39;UBOOT_<wbr>EXTLINUX_DEFAULT_LABEL&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfgf=
ile.write(&#39;DEFAULT %s\n&#39; % (default))<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for label in labels.split()=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localdata =3D=
 bb.data.createCopy(d)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
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

--94eb2c1a181892a1ab05481ec919--
