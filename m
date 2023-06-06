Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A79C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 11:17:30 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.6328.1686050248092291237
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 04:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VECe1B8d;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f63006b4e3so1550564e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 04:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686050246; x=1688642246;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lh7GkdqWq6htrrSHdL8p9je9RRzBJNyXu4xjFcmACQw=;
        b=VECe1B8d/PJIks+rLS9ox81S/3/y8qgRxiz7DtfCxuQZCMZcCewv4Fvmmcx7rnW43i
         WHCF0jshSzB/C6neWeR4/QJX0g6/sA93BsFUIXxrpRzaKQjlficrgJ2gY8dy+hlfc2d0
         ZxGjaUOHsApZZaD+7OfblHezaWPiZ/xmtdXqRR6/lSLOvEUMOy1zg4QWU4mjcoW2Twsp
         igN0VCNINIFMdvpbeiEqQNrpfYabQOfQEb9V1goJ275Fts6AUFqpuK2JHjYrk8Wh0ah0
         viHHIPeuO5aSSWdvOmKm1SE22trVE0Uq8JK4RSqCaiRD/ypme52VzmU3YXi9SDIY3Ptx
         8kFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686050246; x=1688642246;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lh7GkdqWq6htrrSHdL8p9je9RRzBJNyXu4xjFcmACQw=;
        b=EC0rVfRdeUtEgLSeSED0nXnrq7EF0VyWymX6Yipb65DS16YnOxrrr0sq/3ITrpzOwT
         4s6P6/XVWyDdPsv9W4xCscGIUCEFOdk09Z2Xxn1kKVXjRoP1oIAhJE9wBjz6qvbQr5Mf
         r+DNOHQQ2M3UL1KRJN91wrm5Glpc5bLsrw1UcDTwwYZ7wlcFU6sG3pe8Z8EflfsAYEE6
         t9OLQcSnyedYQ8CSQ8Orggm25pQBtHx6ld3QifoxXH02j0aa6K36Qcwqf/fLnRURFPY2
         cfmmPOO4AsuMH1vBqvHoLLXzMgHt4OlB3gP3IxtrnXwmjt8ez31LAOAqx+Vqxs0fhnG1
         SuPQ==
X-Gm-Message-State: AC+VfDyIC06BevFrC7A4myDPbGOcJxbBGaFi90ZPE0/PiztP2/QLwBOg
	UZPJEQ6EuDRq0vhhJsvB6YPG+HhNcUIm/daPtXZ09Pe7
X-Google-Smtp-Source: ACHHUZ5bPINdgvlaf8B7rnrKUcYom2WM/LkZCC8hkbbNz3FpF7KqjEbTtMRgPzCAUOviWS7/pGlZzIAqF2EFQteXesc=
X-Received: by 2002:a05:6512:149:b0:4f6:1b96:4bea with SMTP id
 m9-20020a056512014900b004f61b964beamr949667lfo.42.1686050245927; Tue, 06 Jun
 2023 04:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230513160509.17634-1-liu.ming50@gmail.com>
In-Reply-To: <20230513160509.17634-1-liu.ming50@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 6 Jun 2023 13:17:14 +0200
Message-ID: <CALatG=6D1zVnhUL3jhvJvdevt=QAowzaBNpJSdmE867EEfqCjg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meta: introduce KCONFIG_CONFIG_ENABLE_MENUCONFIG
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fb661d05fd7429e1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 11:17:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182425

--000000000000fb661d05fd7429e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Dear maintainers:

Ping, could you please review this at your convenient time? It's blocking
our uboot do_menuconfig task.

the best,
thank you

<liu.ming50@gmail.com> =E6=96=BC 2023=E5=B9=B45=E6=9C=8813=E6=97=A5 =E9=80=
=B1=E5=85=AD =E4=B8=8B=E5=8D=886:05=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Ming Liu <liu.ming50@gmail.com>
>
> Currently, uboot do_menuconfig task is breaking when UBOOT_CONFIG is
> chosen rather than UBOOT_MACHINE, it simply fails with the following
> errors:
> | make: *** No rule to make target 'menuconfig'. Stio.
> | Command failed.
> | Press any key to continue...
>
> this is due to the work directory of do_menuconfig is set to ${B} but
> not ${B}/$config.
>
> We should distinguish two situations:
> 1) When there is only one config item in UBOOT_CONFIG, do_menuconfig
>    should work just like how it works for UBOOT_MACHINE.
> 2) When there are multiple config items in UBOOT_CONFIG, do_menuconfig
>    should print out some information saying it's not supported other
>    than just failing.
>
> This patch mainly aims to fix that by introducing a extra variable
> KCONFIG_CONFIG_ENABLE_MENUCONFIG, it would be set to 'false' for
> situation 2), and when it's set to 'true', then set
> KCONFIG_CONFIG_ROOTDIR correctly in uboot-config.bbclass to let
> do_menuconfig task work.
>
> DEVTOOL_DISABLE_MENUCONFIG could be replaced by this new variable
> KCONFIG_CONFIG_ENABLE_MENUCONFIG.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/classes-recipe/cml1.bbclass             | 5 +++++
>  meta/classes-recipe/uboot-config.bbclass     | 6 ++++++
>  meta/recipes-bsp/u-boot/u-boot-configure.inc | 1 -
>  scripts/lib/devtool/standard.py              | 6 +++---
>  4 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes-recipe/cml1.bbclass
> b/meta/classes-recipe/cml1.bbclass
> index a09a042c3f..d87d8204e4 100644
> --- a/meta/classes-recipe/cml1.bbclass
> +++ b/meta/classes-recipe/cml1.bbclass
> @@ -32,10 +32,15 @@ CROSS_CURSES_INC =3D '-DCURSES_LOC=3D"<curses.h>"'
>  TERMINFO =3D "${STAGING_DATADIR_NATIVE}/terminfo"
>
>  KCONFIG_CONFIG_COMMAND ??=3D "menuconfig"
> +KCONFIG_CONFIG_ENABLE_MENUCONFIG ??=3D "true"
>  KCONFIG_CONFIG_ROOTDIR ??=3D "${B}"
>  python do_menuconfig() {
>      import shutil
>
> +    if not
> bb.utils.to_boolean(d.getVar("KCONFIG_CONFIG_ENABLE_MENUCONFIG")):
> +        bb.fatal("do_menuconfig is disabled, please check
> KCONFIG_CONFIG_ENABLE_MENUCONFIG variable.")
> +        return
> +
>      config =3D os.path.join(d.getVar('KCONFIG_CONFIG_ROOTDIR'), ".config=
")
>      configorig =3D os.path.join(d.getVar('KCONFIG_CONFIG_ROOTDIR'),
> ".config.orig")
>
> diff --git a/meta/classes-recipe/uboot-config.bbclass
> b/meta/classes-recipe/uboot-config.bbclass
> index fb7a4bc498..9be1d64d3e 100644
> --- a/meta/classes-recipe/uboot-config.bbclass
> +++ b/meta/classes-recipe/uboot-config.bbclass
> @@ -140,4 +140,10 @@ python () {
>
>              if not found:
>                  raise bb.parse.SkipRecipe("The selected UBOOT_CONFIG key
> %s has no match in %s." % (ubootconfig, ubootconfigflags.keys()))
> +
> +            if len(ubootconfig) =3D=3D 1:
> +                d.setVar('KCONFIG_CONFIG_ROOTDIR',
> os.path.join(d.getVar("B"), d.getVar("UBOOT_MACHINE").strip()))
> +            else:
> +                # Disable menuconfig for multiple configs
> +                d.setVar('KCONFIG_CONFIG_ENABLE_MENUCONFIG', "false")
>  }
> diff --git a/meta/recipes-bsp/u-boot/u-boot-configure.inc
> b/meta/recipes-bsp/u-boot/u-boot-configure.inc
> index 04e0894752..235623d25a 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-configure.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-configure.inc
> @@ -26,7 +26,6 @@ do_configure () {
>              unset j
>          done
>          unset i
> -        DEVTOOL_DISABLE_MENUCONFIG=3Dtrue
>      else
>          if [ -n "${UBOOT_MACHINE}" ]; then
>              oe_runmake -C ${S} O=3D${B} ${UBOOT_MACHINE}
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py
> index 0339d12763..852672810a 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -968,9 +968,9 @@ def modify(args, config, basepath, workspace):
>                          '}\n')
>              if rd.getVarFlag('do_menuconfig','task'):
>                  f.write('\ndo_configure:append() {\n'
> -                '    if [ ! ${DEVTOOL_DISABLE_MENUCONFIG} ]; then\n'
> -                '        cp ${B}/.config ${S}/.config.baseline\n'
> -                '        ln -sfT ${B}/.config ${S}/.config.new\n'
> +                '    if [ ${@
> oe.types.boolean(\'${KCONFIG_CONFIG_ENABLE_MENUCONFIG}\') } =3D True ];
> then\n'
> +                '        cp ${KCONFIG_CONFIG_ROOTDIR}/.config
> ${S}/.config.baseline\n'
> +                '        ln -sfT ${KCONFIG_CONFIG_ROOTDIR}/.config
> ${S}/.config.new\n'
>                  '    fi\n'
>                  '}\n')
>              if initial_rev:
> --
> 2.25.1
>
>

--000000000000fb661d05fd7429e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Dear maintainers:<div><br></div><div>Ping, could you p=
lease review this at your convenient=C2=A0time? It&#39;s blocking our uboot=
 do_menuconfig task.</div><div><br></div><div>the best,</div><div>thank you=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">&lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@gmail.com</a>&=
gt; =E6=96=BC 2023=E5=B9=B45=E6=9C=8813=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=
=8B=E5=8D=886:05=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Ming Liu &lt;<a href=3D"mailto:liu.ming50=
@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
<br>
Currently, uboot do_menuconfig task is breaking when UBOOT_CONFIG is<br>
chosen rather than UBOOT_MACHINE, it simply fails with the following<br>
errors:<br>
| make: *** No rule to make target &#39;menuconfig&#39;. Stio.<br>
| Command failed.<br>
| Press any key to continue...<br>
<br>
this is due to the work directory of do_menuconfig is set to ${B} but<br>
not ${B}/$config.<br>
<br>
We should distinguish two situations:<br>
1) When there is only one config item in UBOOT_CONFIG, do_menuconfig<br>
=C2=A0 =C2=A0should work just like how it works for UBOOT_MACHINE.<br>
2) When there are multiple config items in UBOOT_CONFIG, do_menuconfig<br>
=C2=A0 =C2=A0should print out some information saying it&#39;s not supporte=
d other<br>
=C2=A0 =C2=A0than just failing.<br>
<br>
This patch mainly aims to fix that by introducing a extra variable<br>
KCONFIG_CONFIG_ENABLE_MENUCONFIG, it would be set to &#39;false&#39; for<br=
>
situation 2), and when it&#39;s set to &#39;true&#39;, then set<br>
KCONFIG_CONFIG_ROOTDIR correctly in uboot-config.bbclass to let<br>
do_menuconfig task work.<br>
<br>
DEVTOOL_DISABLE_MENUCONFIG could be replaced by this new variable<br>
KCONFIG_CONFIG_ENABLE_MENUCONFIG.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=
=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/cml1.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 5 +++++<br>
=C2=A0meta/classes-recipe/uboot-config.bbclass=C2=A0 =C2=A0 =C2=A0| 6 +++++=
+<br>
=C2=A0meta/recipes-bsp/u-boot/u-boot-configure.inc | 1 -<br>
=C2=A0scripts/lib/devtool/standard.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 6 +++---<br>
=C2=A04 files changed, 14 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/cml1.bbclass b/meta/classes-recipe/cml1.bb=
class<br>
index a09a042c3f..d87d8204e4 100644<br>
--- a/meta/classes-recipe/cml1.bbclass<br>
+++ b/meta/classes-recipe/cml1.bbclass<br>
@@ -32,10 +32,15 @@ CROSS_CURSES_INC =3D &#39;-DCURSES_LOC=3D&quot;&lt;curs=
es.h&gt;&quot;&#39;<br>
=C2=A0TERMINFO =3D &quot;${STAGING_DATADIR_NATIVE}/terminfo&quot;<br>
<br>
=C2=A0KCONFIG_CONFIG_COMMAND ??=3D &quot;menuconfig&quot;<br>
+KCONFIG_CONFIG_ENABLE_MENUCONFIG ??=3D &quot;true&quot;<br>
=C2=A0KCONFIG_CONFIG_ROOTDIR ??=3D &quot;${B}&quot;<br>
=C2=A0python do_menuconfig() {<br>
=C2=A0 =C2=A0 =C2=A0import shutil<br>
<br>
+=C2=A0 =C2=A0 if not bb.utils.to_boolean(d.getVar(&quot;KCONFIG_CONFIG_ENA=
BLE_MENUCONFIG&quot;)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;do_menuconfig is disabled, plea=
se check KCONFIG_CONFIG_ENABLE_MENUCONFIG variable.&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
+<br>
=C2=A0 =C2=A0 =C2=A0config =3D os.path.join(d.getVar(&#39;KCONFIG_CONFIG_RO=
OTDIR&#39;), &quot;.config&quot;)<br>
=C2=A0 =C2=A0 =C2=A0configorig =3D os.path.join(d.getVar(&#39;KCONFIG_CONFI=
G_ROOTDIR&#39;), &quot;.config.orig&quot;)<br>
<br>
diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass<br>
index fb7a4bc498..9be1d64d3e 100644<br>
--- a/meta/classes-recipe/uboot-config.bbclass<br>
+++ b/meta/classes-recipe/uboot-config.bbclass<br>
@@ -140,4 +140,10 @@ python () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not found:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.pars=
e.SkipRecipe(&quot;The selected UBOOT_CONFIG key %s has no match in %s.&quo=
t; % (ubootconfig, ubootconfigflags.keys()))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(ubootconfig) =3D=3D 1:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;KCON=
FIG_CONFIG_ROOTDIR&#39;, os.path.join(d.getVar(&quot;B&quot;), d.getVar(&qu=
ot;UBOOT_MACHINE&quot;).strip()))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Disable menuconf=
ig for multiple configs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;KCON=
FIG_CONFIG_ENABLE_MENUCONFIG&#39;, &quot;false&quot;)<br>
=C2=A0}<br>
diff --git a/meta/recipes-bsp/u-boot/u-boot-configure.inc b/meta/recipes-bs=
p/u-boot/u-boot-configure.inc<br>
index 04e0894752..235623d25a 100644<br>
--- a/meta/recipes-bsp/u-boot/u-boot-configure.inc<br>
+++ b/meta/recipes-bsp/u-boot/u-boot-configure.inc<br>
@@ -26,7 +26,6 @@ do_configure () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unset j<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unset i<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 DEVTOOL_DISABLE_MENUCONFIG=3Dtrue<br>
=C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${UBOOT_MACHINE}&quot; ]; t=
hen<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake -C ${S} O=3D${B}=
 ${UBOOT_MACHINE}<br>
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py<br>
index 0339d12763..852672810a 100644<br>
--- a/scripts/lib/devtool/standard.py<br>
+++ b/scripts/lib/devtool/standard.py<br>
@@ -968,9 +968,9 @@ def modify(args, config, basepath, workspace):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;}\n&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if rd.getVarFlag(&#39;do_me=
nuconfig&#39;,&#39;task&#39;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(&#39;=
\ndo_configure:append() {\n&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=C2=A0 =C2=A0=
 if [ ! ${DEVTOOL_DISABLE_MENUCONFIG} ]; then\n&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 cp ${B}/.config ${S}/.config.baseline\n&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ln -sfT ${B}/.config ${S}/.config.new\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=C2=A0 =C2=A0=
 if [ ${@ oe.types.boolean(\&#39;${KCONFIG_CONFIG_ENABLE_MENUCONFIG}\&#39;)=
 } =3D True ]; then\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 cp ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.baseline\n=
&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ln -sfT ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config.new\n=
&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=C2=A0 =
=C2=A0 fi\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;}\n&#39;=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if initial_rev:<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000fb661d05fd7429e1--

