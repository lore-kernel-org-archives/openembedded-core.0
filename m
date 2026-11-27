Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16592.1795789122318400748
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 06:18:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AtxUA/nk;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67da564d9f2so10606115d50.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 06:18:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795789121; cv=none;
        d=google.com; s=arc-20260327;
        b=Zpg0lGxlFgDkLCFOiHJTO0UN/ZX9eNDElRWwPMPIWh0WcmsiKZMSP6E76hWkDqAeKz
         fk6E0+S6eg6QyoygeKuZOghQLp9fzrUakVQ25CgSDn1Tgbq7KY8JqEp3wVI2jbsxw92q
         Xu8zHsaSMEGwFV75rbe+fySGn5J4hyJbchEk5U5/Jm57m91Vm094uB2T+cz17vNFPsgT
         g6vzYt89tqIq3V/plFb1D5PV5qHcAoIIKJQIhwZNlBiPSEn+2SbwxzguUkVsAoEwRL6m
         h7RgDmHSnHz8poyr1RZE4Vx2miFRapI3dLsK7D2SD8ZWySp09+epgzUlR+iRkNAcgCdm
         9NmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fMfJRvI0haP3eFzxMfzf6d8VeDVXR2qezQd9P/nOd88=;
        fh=TGAJ7QN59OjB8lo9bvDUHuorkqAYrWv9Infvq7Fr0k0=;
        b=J1GkAUDqiE4hHzS19mFQXJjiehckiax7eff/M9BcZzLcYnM9EDQslfHlSFGbrN50Lv
         GLyuJMCdHjJJJa0PL/LBmc5W1/lCtSlmQLQ/AP9dIn+JC39WKptr40vy/vH2SUykvIn5
         yASR0E4zYbhUR8TqTJg6sVFmhQYA6KQ9MrxAtD+KlcCz8vsDkMBZY3sUg85b9j61T0oR
         OSJWH/bkuNGogANqV7tNKe5tNuiOpU0M3WSergZ7ppk7j8MDCeJBEpTTuHPny/3nq5F3
         3drCo031jSiqaDu7wmbPYl90HfDw7H6iIr6usYwhDXlq1o3ChzqcgrzNw6uZFZG9/SB4
         oSFg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795789121; x=1796393921; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fMfJRvI0haP3eFzxMfzf6d8VeDVXR2qezQd9P/nOd88=;
        b=AtxUA/nkRZjtFMex6Vq8dDnHhnAmDX6MzVUvY1YPJJ1zBWXoJuQfs9RM1sT0BHmFev
         7Y+D2+3Ubs/fvpMWMe5oD+XLeOlh1dhy/6bn5zlIDecCEok4HR1IcIQfJd8Apd/DXtvT
         7ukLPe1xU73KLXjFCuW1s/jUCQoV7L4bmVB6vmFpa/AGhvf5++HPVC9Uqk/FZLQcmZXM
         S6igmdWeHt0qIIztHPrCmgWw9OBPrZdyNEXl9wjQpKLEb2Sifk+x9cwbQMkGZwO86M9J
         EdeTCbqtQZYnFB49G8IFCH6gT/U17cNndjb+qQ3VX57EIDoQq7DFpocLmT7kAZbP18dC
         clFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789121; x=1796393921;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fMfJRvI0haP3eFzxMfzf6d8VeDVXR2qezQd9P/nOd88=;
        b=aBukryLMxk+DcE6mT6ul1NRxYmKBgTGzppv1oYwdwy1RAJLQcXq4R//VrKA7xohLkD
         ZbNGYSuh3+KTPTxCJuAk029Z9p2iTnDDVnI9w+lhpfG6vOKsZxxKSVTySU2qrqaVwx4F
         02baGJTeQ5wYR2a41HMN8/Is1Oy8tnr1Nkblx8PaUo6U+AQTE5HBNaldvtxB8R+tuhRN
         RIgcootCxHVcqO8sSVmftTFpLB3GDxC4vUhTj07HaZI+vp248pSoMbCdFMHtIQ8KVVM4
         APMRdGOzoZMYOP9PdW6mCbFZdREIGmkJd7ZzsQFHuMns8/etrDqtynnhym0y3a1AOpv5
         YSLQ==
X-Gm-Message-State: APuU4Z8YXC0b4dXa3ULXPmPoysZWtDf6CZKZ1PjoWcejBiHGbojcBi9M
	C4JyH7KsgeixOr4PRUoUhCE3yYGA9VhAPm/I65p6Tt6Kt9w/9gOn3NkOFP9FV4UJEzkml0X8Jgb
	3un3OFEaWMfhhpDLN6NLI+XN7gZC7Dh0=
X-Gm-Gg: AZFdTZedcunjL2ZnnRfDSMpGCAXv/J0qDxfy1UhyRsMYUO/6Ikj8gB9g6dZPJrS8+rT
	I2OQ8DZW8YMHFQNw0eoI44E8ojF7DrpL7k/ia3hbDojXKg0XhSwlqze59r+Rg6KYNwmYdl9CQM3
	W2UghqTa7N6ujZz2tmq14bSxjCbkKR9PEDTA3abRVX9s3PADM4Q8t+ZJcuIqNpV/LkRERSQurFw
	QhhCrvlZrlS+XSRFaaKSkcwi6A6UHwQRk5BdvGVKTj+qX1BsDTKmt2e3B18BNbOrTN/dB74qlUc
	y9You0h9SoVIEvLkOZeIht8JXb/ITndbwlgAAjza53tn63wXyTnxPhIrwou053FrXhQfhdd03oA
	b1KLbbNmfU8c8kz7wp95VUFSbunqejLuVnksgLlkuYPOSDUnBslEuBfoEoMBJeH9tfn0AaIWGqv
	AEiwY1GgoK3TjVxdeerRjyjmiufiesknY8ORMNLbKK0E287a7fLfY8kWgwwdBzuJsrgZqMAi4lV
	KA=
X-Received: by 2002:a05:690e:408f:b0:67e:5b4:bc41 with SMTP id
 956f58d0204a3-67e05b4bcb0mr10103949d50.63.1795789121070; Fri, 27 Nov 2026
 06:18:41 -0800 (PST)
MIME-Version: 1.0
References: <20261127084231.1188128-1-mark.yang@lge.com>
In-Reply-To: <20261127084231.1188128-1-mark.yang@lge.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 27 Nov 2026 09:18:29 -0500
X-Gm-Features: Aa3M54q_BPSxC-9ZshWKIRlMekBqN1XLr-lWID8aInpVIkUXMr3dsP9ddZTsNCQ
Message-ID: <CADkTA4PAK4QBTCUDD3K_xACf_nGueixuO-4QW=hKGkpAXz+qvQ@mail.gmail.com>
Subject: Re: [PATCH v2] kernel-module-split: fix re-signing of modules built
 in a subdirectory
To: mark.yang@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a728f7066142bc11"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 14:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251392

--000000000000a728f7066142bc11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 3:42=E2=80=AFAM <mark.yang@lge.com> wrote:

> From: "mark.yang" <mark.yang@lge.com>
>
> Out-of-tree modules built in a subdirectory of ${S}, such as
> lttng-modules, are not signed again after package stripping and end up
> in the packages without a signature.
>
> A kernel with CONFIG_MODULE_SIG_FORCE=3Dy then refuses to load them.
> modprobe fails with "Key was rejected by service" and the kernel logs:
>
>   Loading of unsigned module is rejected
>
> To reproduce, set CONFIG_MODULE_SIG=3Dy and CONFIG_MODULE_SIG_ALL=3Dy in
> linux-yocto and build lttng-modules. In log.do_package, modules_sign
> enters ${S}, signs nothing and succeeds:
>
>   NOTE: make ... M=3D.../lttng-modules-2.16.0 modules_sign
>   make[1]: Entering directory '.../lttng-modules-2.16.0'
>   make[1]: Leaving directory '.../lttng-modules-2.16.0'
>
> Since 02890c1eff10 ("kernel-module-split: Remove get_ext_mod")
> modules_sign always gets M=3D${S}, but lttng-modules runs Kbuild in
> ${S}/src and modules.order is only there.
>
> Use MODULES_MODULE_SYMVERS_LOCATION, which module.bbclass already uses
> to find Module.symvers in the same directory. modules_sign then signs
> the modules:
>
>   NOTE: make ... M=3D.../lttng-modules-2.16.0/src modules_sign
>     SIGN    .../lttng-modules/lttng-ring-buffer-client-discard.ko
>
> Give the variable a default in kernel-module-split.bbclass instead of
> module.bbclass, so that it is also set for the kernel recipe and the
> call can expand it directly.
>
> M is now based on ${B} instead of ${S}. They are the same for most
> module recipes, so nothing changes for them. For a recipe that sets B
> to a subdirectory of ${S}, M follows ${B}, which is where
> module_do_compile runs make. This is a behaviour change.
>
> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
> v2:
> - Give MODULES_MODULE_SYMVERS_LOCATION a default in
>   kernel-module-split.bbclass and expand it directly at the call site,
>   as Bruce suggested.
> - Drop the now redundant default from module.bbclass.
> - Mention the ${S} -> ${B} change in the commit message.
>
>
v2 looks good to me.

Bruce



> v1:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20261125005619.4=
5574-1-mark.yang@lge.com/
>
>  meta/classes-recipe/kernel-module-split.bbclass | 4 +++-
>  meta/classes-recipe/module.bbclass              | 1 -
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass
> b/meta/classes-recipe/kernel-module-split.bbclass
> index 9a7f04f37b..b10e9315ba 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass
> @@ -47,6 +47,8 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D ""
>  KERNEL_MODULE_PACKAGE_SUFFIX ?=3D "-${KERNEL_VERSION}"
>  KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D "1"
>
> +MODULES_MODULE_SYMVERS_LOCATION ?=3D ""
> +
>  # This function supports both in-tree and out-of-tree modules.
>  post_strip_kernel_modules_signing(){
>      # Read .config values to determine if module auto-signing is enabled
> @@ -69,7 +71,7 @@ post_strip_kernel_modules_signing(){
>          oe_runmake \
>              -C ${KBUILD_OUTPUT}  \
>              MODLIB=3D${PKGD}${KERNEL_MODULE_INSTALL_PREFIX} \
> -            ${@'M=3D%s' % '${S}' if not "virtual/kernel" in
> d.getVar('PROVIDES') else ''} \
> +            ${@'M=3D${B}/${MODULES_MODULE_SYMVERS_LOCATION}' if not
> "virtual/kernel" in d.getVar('PROVIDES') else ''} \
>              modules_sign
>      fi
>  }
> diff --git a/meta/classes-recipe/module.bbclass
> b/meta/classes-recipe/module.bbclass
> index 985c24bed5..ec6ff91612 100644
> --- a/meta/classes-recipe/module.bbclass
> +++ b/meta/classes-recipe/module.bbclass
> @@ -12,7 +12,6 @@ DEPENDS +=3D "virtual/cross-cc virtual/cross-binutils"
>  EXTRA_OEMAKE +=3D "KERNEL_SRC=3D${STAGING_KERNEL_DIR}"
>
>  MODULES_INSTALL_TARGET ?=3D "modules_install"
> -MODULES_MODULE_SYMVERS_LOCATION ?=3D ""
>
>  python __anonymous () {
>      depends =3D d.getVar('DEPENDS')
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a728f7066142bc11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 27, 2026 at 3:42=
=E2=80=AFAM &lt;<a href=3D"mailto:mark.yang@lge.com">mark.yang@lge.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 &quot;mark.yang&quot; &lt;<a href=3D"mailto:mark.yang@lge.com" target=3D"_=
blank">mark.yang@lge.com</a>&gt;<br>
<br>
Out-of-tree modules built in a subdirectory of ${S}, such as<br>
lttng-modules, are not signed again after package stripping and end up<br>
in the packages without a signature.<br>
<br>
A kernel with CONFIG_MODULE_SIG_FORCE=3Dy then refuses to load them.<br>
modprobe fails with &quot;Key was rejected by service&quot; and the kernel =
logs:<br>
<br>
=C2=A0 Loading of unsigned module is rejected<br>
<br>
To reproduce, set CONFIG_MODULE_SIG=3Dy and CONFIG_MODULE_SIG_ALL=3Dy in<br=
>
linux-yocto and build lttng-modules. In log.do_package, modules_sign<br>
enters ${S}, signs nothing and succeeds:<br>
<br>
=C2=A0 NOTE: make ... M=3D.../lttng-modules-2.16.0 modules_sign<br>
=C2=A0 make[1]: Entering directory &#39;.../lttng-modules-2.16.0&#39;<br>
=C2=A0 make[1]: Leaving directory &#39;.../lttng-modules-2.16.0&#39;<br>
<br>
Since 02890c1eff10 (&quot;kernel-module-split: Remove get_ext_mod&quot;)<br=
>
modules_sign always gets M=3D${S}, but lttng-modules runs Kbuild in<br>
${S}/src and modules.order is only there.<br>
<br>
Use MODULES_MODULE_SYMVERS_LOCATION, which module.bbclass already uses<br>
to find Module.symvers in the same directory. modules_sign then signs<br>
the modules:<br>
<br>
=C2=A0 NOTE: make ... M=3D.../lttng-modules-2.16.0/src modules_sign<br>
=C2=A0 =C2=A0 SIGN=C2=A0 =C2=A0 .../lttng-modules/lttng-ring-buffer-client-=
discard.ko<br>
<br>
Give the variable a default in kernel-module-split.bbclass instead of<br>
module.bbclass, so that it is also set for the kernel recipe and the<br>
call can expand it directly.<br>
<br>
M is now based on ${B} instead of ${S}. They are the same for most<br>
module recipes, so nothing changes for them. For a recipe that sets B<br>
to a subdirectory of ${S}, M follows ${B}, which is where<br>
module_do_compile runs make. This is a behaviour change.<br>
<br>
Suggested-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com=
" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
Signed-off-by: mark.yang &lt;<a href=3D"mailto:mark.yang@lge.com" target=3D=
"_blank">mark.yang@lge.com</a>&gt;<br>
---<br>
v2:<br>
- Give MODULES_MODULE_SYMVERS_LOCATION a default in<br>
=C2=A0 kernel-module-split.bbclass and expand it directly at the call site,=
<br>
=C2=A0 as Bruce suggested.<br>
- Drop the now redundant default from module.bbclass.<br>
- Mention the ${S} -&gt; ${B} change in the commit message.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">v2 looks good to me.</div><div class=3D"gmail_default" sty=
le=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
v1: <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/202=
61125005619.45574-1-mark.yang@lge.com/" rel=3D"noreferrer" target=3D"_blank=
">https://patchwork.yoctoproject.org/project/oe-core/patch/20261125005619.4=
5574-1-mark.yang@lge.com/</a><br>
<br>
=C2=A0meta/classes-recipe/kernel-module-split.bbclass | 4 +++-<br>
=C2=A0meta/classes-recipe/module.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
=C2=A02 files changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes=
-recipe/kernel-module-split.bbclass<br>
index 9a7f04f37b..b10e9315ba 100644<br>
--- a/meta/classes-recipe/kernel-module-split.bbclass<br>
+++ b/meta/classes-recipe/kernel-module-split.bbclass<br>
@@ -47,6 +47,8 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D &quot;&quot;<br>
=C2=A0KERNEL_MODULE_PACKAGE_SUFFIX ?=3D &quot;-${KERNEL_VERSION}&quot;<br>
=C2=A0KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D &quot;1&quot;<br>
<br>
+MODULES_MODULE_SYMVERS_LOCATION ?=3D &quot;&quot;<br>
+<br>
=C2=A0# This function supports both in-tree and out-of-tree modules.<br>
=C2=A0post_strip_kernel_modules_signing(){<br>
=C2=A0 =C2=A0 =C2=A0# Read .config values to determine if module auto-signi=
ng is enabled<br>
@@ -69,7 +71,7 @@ post_strip_kernel_modules_signing(){<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-C ${KBUILD_OUTPUT}=C2=A0 \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MODLIB=3D${PKGD}${KERNEL_MO=
DULE_INSTALL_PREFIX} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@&#39;M=3D%s&#39; % &#39;${S}&=
#39; if not &quot;virtual/kernel&quot; in d.getVar(&#39;PROVIDES&#39;) else=
 &#39;&#39;} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@&#39;M=3D${B}/${MODULES_MODUL=
E_SYMVERS_LOCATION}&#39; if not &quot;virtual/kernel&quot; in d.getVar(&#39=
;PROVIDES&#39;) else &#39;&#39;} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modules_sign<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/modul=
e.bbclass<br>
index 985c24bed5..ec6ff91612 100644<br>
--- a/meta/classes-recipe/module.bbclass<br>
+++ b/meta/classes-recipe/module.bbclass<br>
@@ -12,7 +12,6 @@ DEPENDS +=3D &quot;virtual/cross-cc virtual/cross-binutil=
s&quot;<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;KERNEL_SRC=3D${STAGING_KERNEL_DIR}&quot;<br>
<br>
=C2=A0MODULES_INSTALL_TARGET ?=3D &quot;modules_install&quot;<br>
-MODULES_MODULE_SYMVERS_LOCATION ?=3D &quot;&quot;<br>
<br>
=C2=A0python __anonymous () {<br>
=C2=A0 =C2=A0 =C2=A0depends =3D d.getVar(&#39;DEPENDS&#39;)<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000a728f7066142bc11--
