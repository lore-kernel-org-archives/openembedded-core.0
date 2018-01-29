Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id D3E4C787F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 17:33:46 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id n7so8467912iob.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 09:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=shptyAsi5AT1C4wPnnBffQv5dKrxqCgotfx4mGFWP7U=;
	b=l2SzGAlFDHdpsKKYKhD0c6y19UqJDoDEekMlah2sf2ez58Wz5z4cwhKIEYWDwamJQr
	kiLii54XVRX1oIdJdegtktIAPglfqT2M/73L7td8jQySzhL2qbkZoQ0tmGYW8fpBz1Tq
	UA/bsXg5r3VqofnYNsb2Jf7bwkvkuZ+1QTX7wQ+pqmiOE91DE3zGr0s3Wiyn1L16cu4B
	m9FooC3/xg9/9lzvdAa4kKvtyjUrXi2bNVUQuxBZzFws5LQywpQ2+MKoo+7oCp6wt08A
	BEERwtwGOlo2pJvhvHw09VduXpMrtNTHWpIaBdkcsuQLWHAXGSRDzJM2dgJIYEQDaZM6
	7NjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=shptyAsi5AT1C4wPnnBffQv5dKrxqCgotfx4mGFWP7U=;
	b=W6vNqtB22jhJOk7U4CoLxpKNoXM0AaXzJQexIINXp4rV20XsizHe+FFbcPzaO6GLjL
	/FKHsUQzHE3SnH+L2lAeYxIcifUR4A2fSQOg5z45cpVjQBDK+b6x8YRp2mwSMvORMkQM
	4ilzjHDP4r86yCutJzyMyd9Z2jl1eYvJ3wc5D/aJBi2VAY9uNlivZ+DFbU9lIZV6YH9T
	LE/+LHkf0GFKf4jfzXGycCrFEoB5IUi/SWx+Ee2eULjIf59TaOcU2XOi2q4QS83Ks7en
	diww4TUi7910yMC5evvxYeG64Zgb4vABCr//Ig133CeVUmXoqc3fvFGn9naacEBB/702
	/rIw==
X-Gm-Message-State: AKwxytfGvWXSLCmA21qKsrUsL1cqmfc5k88GBx/q6+Z5UtLtWMqwKnIm
	/FVxWz/UI6ASkSrhJ4uGBgURRGJo4cJPlZS3b8pfRA==
X-Google-Smtp-Source: AH8x226Id70ddNQkovljt5ObTXZKraDHMpvtLINDqsmORQnROJyKCFItoGbiOC71H8lyfBLqCRmv2BEcE7zBjEIxsyY=
X-Received: by 10.107.175.8 with SMTP id y8mr27064626ioe.37.1517247227927;
	Mon, 29 Jan 2018 09:33:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 29 Jan 2018 09:33:27 -0800 (PST)
In-Reply-To: <20180127035303.7076-1-pkj@axis.com>
References: <20180127035303.7076-1-pkj@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jan 2018 17:33:27 +0000
Message-ID: <CAJTo0LZ2Yc_57pjJwiitsq+LuDcGvgkVv4sDU3v+z9Ki-5mbzg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Adapt do_install_append_aarch64() for usrmerge
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
X-List-Received-Date: Mon, 29 Jan 2018 17:33:47 -0000
Content-Type: multipart/alternative; boundary="001a1144a2680f073a0563eda636"

--001a1144a2680f073a0563eda636
Content-Type: text/plain; charset="UTF-8"

How does the patch relate to the comment which states the ABI says the path
*must* be /lib/.  Is that wrong?  How does this interact with the merged
symlink creation in image.bbclass?  Please expand on the message so it's
clear what is meant to be happening.

Ross

On 27 January 2018 at 03:53, Peter Kjellerstedt <peter.kjellerstedt@axis.com
> wrote:

> Change hardcoded /lib to ${nonarch_base_libdir} to correctly adapt the
> code in do_install_append_aarch64() for when usrmerge is enabled in
> DISTRO_FEATURES.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc
> b/meta/recipes-core/glibc/glibc-package.inc
> index 817d850358..4d3dc679b4 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -114,15 +114,15 @@ do_install_append () {
>  }
>
>  do_install_append_aarch64 () {
> -       if [ "${base_libdir}" != "/lib" ] ; then
> +       if [ "${base_libdir}" != "${nonarch_base_libdir}" ]; then
>                 # The aarch64 ABI says the dynamic linker -must- be
> /lib/ld-linux-aarch64[_be].so.1
> -               install -d ${D}/lib
> +               install -d ${D}${nonarch_base_libdir}
>                 if [ -e ${D}${base_libdir}/ld-linux-aarch64.so.1 ]; then
> -                       ln -s ${@base_path_relative('/lib',
> '${base_libdir}')}/ld-linux-aarch64.so.1 \
> -                               ${D}/lib/ld-linux-aarch64.so.1
> +                       ln -s ${@base_path_relative('${nonarch_base_libdir}',
> '${base_libdir}')}/ld-linux-aarch64.so.1 \
> +                               ${D}${nonarch_base_libdir}/ld-
> linux-aarch64.so.1
>                 elif [ -e ${D}${base_libdir}/ld-linux-aarch64_be.so.1 ];
> then
> -                       ln -s ${@base_path_relative('/lib',
> '${base_libdir}')}/ld-linux-aarch64_be.so.1 \
> -                               ${D}/lib/ld-linux-aarch64_be.so.1
> +                       ln -s ${@base_path_relative('${nonarch_base_libdir}',
> '${base_libdir}')}/ld-linux-aarch64_be.so.1 \
> +                               ${D}${nonarch_base_libdir}/ld-
> linux-aarch64_be.so.1
>                 fi
>         fi
>         do_install_armmultilib
> --
> 2.12.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1144a2680f073a0563eda636
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">How does the patch relate to the comment which states the =
ABI says the path *must* be /lib/.=C2=A0 Is that wrong?=C2=A0 How does this=
 interact with the merged symlink creation in image.bbclass?=C2=A0 Please e=
xpand on the message so it&#39;s clear what is meant to be happening.<div><=
br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On 27 January 2018 at 03:53, Peter Kjellerstedt <span dir=3D"l=
tr">&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">pe=
ter.kjellerstedt@axis.com</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Change hardcoded /lib to ${nonarch_base_libdir} to correctly adapt t=
he<br>
code in do_install_append_aarch64() for when usrmerge is enabled in<br>
DISTRO_FEATURES.<br>
<br>
Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@=
axis.com">peter.kjellerstedt@axis.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc-<wbr>package.inc | 12 ++++++------<br>
=C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/<wbr>glibc-package.inc b/meta/recipes-=
core/glibc/<wbr>glibc-package.inc<br>
index 817d850358..4d3dc679b4 100644<br>
--- a/meta/recipes-core/glibc/<wbr>glibc-package.inc<br>
+++ b/meta/recipes-core/glibc/<wbr>glibc-package.inc<br>
@@ -114,15 +114,15 @@ do_install_append () {<br>
=C2=A0}<br>
<br>
=C2=A0do_install_append_aarch64 () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${base_libdir}&quot; !=3D &quot;/lib=
&quot; ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${base_libdir}&quot; !=3D &quot;${no=
narch_base_libdir}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # The aarch64 ABI s=
ays the dynamic linker -must- be /lib/ld-linux-aarch64[_be].so.<wbr>1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/lib=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${no=
narch_base_libdir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${D}${base_=
libdir}/ld-linux-<wbr>aarch64.so.1 ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -s ${@base_path_relative(&#39;/lib&#39;, &#39;${base_libdir}&#=
39;)}/ld-linux-<wbr>aarch64.so.1 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/lib/ld-linux-aarch64.so.1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -s ${@base_path_relative(&#39;${<wbr>nonarch_base_libdir}&#39;=
, &#39;${base_libdir}&#39;)}/ld-linux-<wbr>aarch64.so.1 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${nonarch_base_libdir}/ld-<wbr>li=
nux-aarch64.so.1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ -e ${D}${bas=
e_libdir}/ld-linux-<wbr>aarch64_be.so.1 ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -s ${@base_path_relative(&#39;/lib&#39;, &#39;${base_libdir}&#=
39;)}/ld-linux-<wbr>aarch64_be.so.1 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/lib/ld-linux-aarch64_be.<wbr>so.=
1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ln -s ${@base_path_relative(&#39;${<wbr>nonarch_base_libdir}&#39;=
, &#39;${base_libdir}&#39;)}/ld-linux-<wbr>aarch64_be.so.1 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${nonarch_base_libdir}/ld-<wbr>li=
nux-aarch64_be.so.1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_install_armmultilib<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.12.0<br>
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

--001a1144a2680f073a0563eda636--
