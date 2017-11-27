Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id A738F781DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 13:36:58 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id p44so39020370qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 05:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dkQU4PrBDSw0NUDEjloYGaC8gsg18mdKbxKYQNmsclw=;
	b=ho7BxE79wk0j6ifzCm7glZJcxopJdrp/W04mSaDA1d5A83oH/8xbzv5ytQyFfOe/BW
	/mR6CEKNCAnCq9VAsOc8FcSA5pAuOuv8XCH0LgX/K8G0T7GZD81nYMrdVtbs0tuSnYtW
	KQ+GIHo5tUl6PDInl2GrZxFsZP9DKnOJleaDuVOL8pAKExGjsVdPZuFbh6KdZSJ/zVyJ
	qyOC/v1iZk2aODJ/aA3DzaHC66fYavaecSR8hu/XTxB0ocGgJaNMbNcx/X37fSOa36lT
	SlYpe3Ze810ErB+prURRm8cTkeDpw2If7maCxLXLvd41502Fa02TwLW+WjLMZ4QzUwmX
	7itA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dkQU4PrBDSw0NUDEjloYGaC8gsg18mdKbxKYQNmsclw=;
	b=jbtk0SpVbjyqxubRYJSvlaTOOeDNntLDqx+bv7nSNW5XgoTIfbZ2AuoeMSCFNa4/gR
	wH5Mau0Bt387Q75LsKXCJjrlsIN/DgbFsHc2pfa/kzHL+n+SBCvvfCgPasYQ1EdDfZ57
	LCRpr+Bs1sQvVlbKSKt1RNclcGumvpIyCT0mHtxmS71g1+cS30C5l8W1NIS817oCPMfG
	4XD3BXXSXPOvpaIu8ib3VbvQovWDK8ToS5wjHpXvh7EpKOCEUIpnPdJ47KeDwu5ItXFv
	3H4LMI6IWMzB+LavF6W5T7DBQlA+b/Q/Luib0RKSe+ELlDXydP5OLMIsNz91kjPbxydH
	7uhA==
X-Gm-Message-State: AJaThX5mXq4InKSYVs5H4taWGQI+I3E9baFR48DVH0LIcySD1Kkbwbat
	o7CvT4LPcza9kWbSzNgr7GIKQxgD+Pwr+EbZ4Rs=
X-Google-Smtp-Source: AGs4zMb8ZjJyD1ZsJKKhA7n3sGgfhDTRPQquojJU9Y6qJEnmQpB17fbSjuS6TrhlYmlFSnLKxy2WOuehB603nUSZ3A4=
X-Received: by 10.237.55.74 with SMTP id i68mr39478334qtb.237.1511789819481;
	Mon, 27 Nov 2017 05:36:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Mon, 27 Nov 2017 05:36:58 -0800 (PST)
In-Reply-To: <1511787260-2490-1-git-send-email-liu.ming50@gmail.com>
References: <1511787260-2490-1-git-send-email-liu.ming50@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Nov 2017 08:36:58 -0500
Message-ID: <CADkTA4N1Zci8nuXLRecGW6Pk0P9MvaY3Luob=jTQWdvnb70hxA@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto: drop KCONF_BSP_AUDIT_LEVEL
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
X-List-Received-Date: Mon, 27 Nov 2017 13:36:58 -0000
Content-Type: multipart/alternative; boundary="001a11359c962a71ca055ef6ffe9"

--001a11359c962a71ca055ef6ffe9
Content-Type: text/plain; charset="UTF-8"

Nope.

This flag can stay. I have new audit code coming that will use it again ..
that's
why it was left in the first place.

Cheers,

Bruce

On Mon, Nov 27, 2017 at 7:54 AM, <liu.ming50@gmail.com> wrote:

> From: Ming Liu <liu.ming50@gmail.com>
>
> The warning that this flag was trying to control, it had been dropped
> by commit 0f698dfd:
> [ kernel-yocto: streamline patch, configuration and audit phases ]
>
> so this flag is useless since that commit merged, drop it as well.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/classes/kernel-yocto.bbclass                  | 1 -
>  meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   | 1 -
>  meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   | 1 -
>  meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    | 1 -
>  meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    | 1 -
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb | 1 -
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb | 1 -
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  | 1 -
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  | 1 -
>  meta/recipes-kernel/linux/linux-yocto.inc          | 1 -
>  meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 1 -
>  meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 1 -
>  meta/recipes-kernel/linux/linux-yocto_4.4.bb       | 1 -
>  meta/recipes-kernel/linux/linux-yocto_4.9.bb       | 1 -
>  14 files changed, 14 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> index 1d44795..1c3b778 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -322,7 +322,6 @@ python do_kernel_configcheck() {
>      ret, result = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
>
>      config_check_visibility = int(d.getVar("KCONF_AUDIT_LEVEL") or 0)
> -    bsp_check_visibility = int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or 0)
>
>      # if config check visibility is non-zero, report dropped
> configuration values
>      mismatch_file = d.expand("${S}/%s/cfg/mismatch.txt" % kmeta)
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
> index f93d953..0c388d5 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
> @@ -22,7 +22,6 @@ LINUX_VERSION ?= "4.10.17"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
>  KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "2"
>
>  LINUX_KERNEL_TYPE = "preempt-rt"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> index 983c1cc..e7172a5 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> @@ -22,7 +22,6 @@ LINUX_VERSION ?= "4.12.14"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
>  KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "2"
>
>  LINUX_KERNEL_TYPE = "preempt-rt"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> index c1cbf35..9c23a3f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
> @@ -22,7 +22,6 @@ LINUX_VERSION ?= "4.4.93"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
>  KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "2"
>
>  LINUX_KERNEL_TYPE = "preempt-rt"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
> index b6c98a5..0ef43cd 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
> @@ -22,7 +22,6 @@ LINUX_VERSION ?= "4.9.57"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
>  KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "2"
>
>  LINUX_KERNEL_TYPE = "preempt-rt"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
> index edaf853..39b58cd 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
> @@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-yocto.inc
>  LINUX_VERSION ?= "4.10.17"
>
>  KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "2"
>
>  SRCREV_machine ?= "c1d8c4408b8aedd88eeb6ccc89ce834dd41b3f09"
>  SRCREV_meta ?= "40ee48ac099c04f60d2c132031d9625a4e0c4c9e"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> index 658ecc0..ed61756 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> @@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-yocto.inc
>  LINUX_VERSION ?= "4.12.14"
>
>  KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "2"
>
>  SRCREV_machine ?= "9cc6b0ae1aad7312e85ac4134398f81c0140de33"
>  SRCREV_meta ?= "cebe198870d781829bd997a188cc34d9f7a61023"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
> index dd38095..7491ed2 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
> @@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-yocto.inc
>  LINUX_VERSION ?= "4.4.93"
>
>  KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "2"
>
>  SRCREV_machine ?= "f070447fb60b5b939c94583d7c05f55ec2b37acd"
>  SRCREV_meta ?= "ae0119a2ff737b8c14bdf904b4c6eb790a7792cb"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
> index 79b8bfd..34ffdb4 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
> @@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-yocto.inc
>  LINUX_VERSION ?= "4.9.57"
>
>  KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "2"
>
>  SRCREV_machine ?= "cd8f9254aaaacbfa7f45fcc0bf2bb307615a174b"
>  SRCREV_meta ?= "cdbd35c54b6a62e4fd543164f1dcdf92c85cff2d"
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index 9c1f61b..07b9af7 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -46,7 +46,6 @@ SRCREV_FORMAT ?= "meta_machine"
>  #   1: report options that are specified, but not in the final config
>  #   2: report options that are not hardware related, but set by a BSP
>  KCONF_AUDIT_LEVEL ?= "1"
> -KCONF_BSP_AUDIT_LEVEL ?= "0"
>  KMETA_AUDIT ?= "yes"
>
>  LINUX_VERSION_EXTENSION ??= "-yocto-${LINUX_KERNEL_TYPE}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
> index 7fcc753..f5b777e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
> @@ -29,7 +29,6 @@ LINUX_VERSION ?= "4.10.17"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
>  KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "2"
>
>  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> index a7dd763..493eb99 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> @@ -29,7 +29,6 @@ LINUX_VERSION ?= "4.12.14"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
>  KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "2"
>
>  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> index 4d8d3da..dbe9665 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> @@ -29,7 +29,6 @@ LINUX_VERSION ?= "4.4.93"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
>  KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "2"
>
>  COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|
> qemuppc|qemumips|qemumips64|qemux86-64"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
> index 2486792..479064a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
> @@ -29,7 +29,6 @@ LINUX_VERSION ?= "4.9.57"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
>  KMETA = "kernel-meta"
> -KCONF_BSP_AUDIT_LEVEL = "2"
>
>  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
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



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11359c962a71ca055ef6ffe9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Nope.=C2=A0<div><br></div><div>This flag can stay. I have =
new audit code coming that will use it again .. that&#39;s</div><div>why it=
 was left in the first place.</div><div><br></div><div>Cheers,</div><div><b=
r></div><div>Bruce<br><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Mon, Nov 27, 2017 at 7:54 AM,  <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">From: Ming Liu &lt;<a href=3D=
"mailto:liu.ming50@gmail.com">liu.ming50@gmail.com</a>&gt;<br>
<br>
The warning that this flag was trying to control, it had been dropped<br>
by commit 0f698dfd:<br>
[ kernel-yocto: streamline patch, configuration and audit phases ]<br>
<br>
so this flag is useless since that commit merged, drop it as well.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.min=
g50@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-yocto.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.10.bb" r=
el=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4.10.bb</a>=C2=A0 =
=C2=A0| 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.12.bb" r=
el=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4.12.bb</a>=C2=A0 =
=C2=A0| 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4.4.bb</a>=C2=A0 =C2=
=A0 | 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.9.bb" re=
l=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4.9.bb</a>=C2=A0 =C2=
=A0 | 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.10.bb"=
 rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-tiny_4.10.bb</a> | 1=
 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-tiny_4.12.bb</a> | 1=
 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.4.bb" =
rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-tiny_4.4.bb</a>=C2=A0=
 | 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.9.bb" =
rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-tiny_4.9.bb</a>=C2=A0=
 | 1 -<br>
=C2=A0meta/recipes-kernel/linux/<wbr>linux-yocto.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.10.bb" rel=
=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.10.bb</a>=C2=A0 =C2=A0=
 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.12.bb</a>=C2=A0 =C2=A0=
 =C2=A0 | 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.4.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.9.bb" rel=
=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.9.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 1 -<br>
=C2=A014 files changed, 14 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel-yocto.<wbr>bbclass b/meta/classes/kernel-y=
octo.<wbr>bbclass<br>
index 1d44795..1c3b778 100644<br>
--- a/meta/classes/kernel-yocto.<wbr>bbclass<br>
+++ b/meta/classes/kernel-yocto.<wbr>bbclass<br>
@@ -322,7 +322,6 @@ python do_kernel_configcheck() {<br>
=C2=A0 =C2=A0 =C2=A0ret, result =3D oe.utils.getstatusoutput(&quot;%s%<wbr>=
s&quot; % (pathprefix, cmd))<br>
<br>
=C2=A0 =C2=A0 =C2=A0config_check_visibility =3D int(d.getVar(&quot;KCONF_AU=
DIT_<wbr>LEVEL&quot;) or 0)<br>
-=C2=A0 =C2=A0 bsp_check_visibility =3D int(d.getVar(&quot;KCONF_BSP_AUDIT_=
<wbr>LEVEL&quot;) or 0)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# if config check visibility is non-zero, report droppe=
d configuration values<br>
=C2=A0 =C2=A0 =C2=A0mismatch_file =3D d.expand(&quot;${S}/%s/cfg/<wbr>misma=
tch.txt&quot; % kmeta)<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.10.bb</a> =
b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.10.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.10.bb</a><br>
index f93d953..0c388d5 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.10.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.10.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.10.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.10.bb</a><br>
@@ -22,7 +22,6 @@ LINUX_VERSION ?=3D &quot;4.10.17&quot;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0LINUX_KERNEL_TYPE =3D &quot;preempt-rt&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.12.bb</a> =
b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.12.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.12.bb</a><br>
index 983c1cc..e7172a5 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.12.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.12.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.12.bb</a><br>
@@ -22,7 +22,6 @@ LINUX_VERSION ?=3D &quot;4.12.14&quot;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0LINUX_KERNEL_TYPE =3D &quot;preempt-rt&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4=
.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.4.bb</a> b/=
meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.4.bb</a><br>
index c1cbf35..9c23a3f 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.4.bb</a><br>
@@ -22,7 +22,6 @@ LINUX_VERSION ?=3D &quot;4.4.93&quot;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0LINUX_KERNEL_TYPE =3D &quot;preempt-rt&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.9=
.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.9.bb</a> b/=
meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.9.bb" rel=3D"n=
oreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.9.bb</a><br>
index b6c98a5..0ef43cd 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.9.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.9.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.9.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.9.bb</a><br>
@@ -22,7 +22,6 @@ LINUX_VERSION ?=3D &quot;4.9.57&quot;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0LINUX_KERNEL_TYPE =3D &quot;preempt-rt&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4=
.10.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.10.bb<=
/a> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.10.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.10.bb</a><br>
index edaf853..39b58cd 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.10.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.10.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.10.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.10.bb</a><br>
@@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-<wbr>yocto.inc<br>
=C2=A0LINUX_VERSION ?=3D &quot;4.10.17&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0SRCREV_machine ?=3D &quot;<wbr>c1d8c4408b8aedd88eeb6ccc89ce83<wbr>4dd=
41b3f09&quot;<br>
=C2=A0SRCREV_meta ?=3D &quot;<wbr>40ee48ac099c04f60d2c132031d962<wbr>5a4e0c=
4c9e&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4=
.12.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.12.bb<=
/a> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.12.bb</a><br>
index 658ecc0..ed61756 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.12.bb</a><br>
@@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-<wbr>yocto.inc<br>
=C2=A0LINUX_VERSION ?=3D &quot;4.12.14&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0SRCREV_machine ?=3D &quot;<wbr>9cc6b0ae1aad7312e85ac4134398f8<wbr>1c0=
140de33&quot;<br>
=C2=A0SRCREV_meta ?=3D &quot;<wbr>cebe198870d781829bd997a188cc34<wbr>d9f7a6=
1023&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4=
.4.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.4.bb</a=
> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.4.bb</a><br>
index dd38095..7491ed2 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.4.bb" =
rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.4.bb" =
rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.4.bb</a><br>
@@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-<wbr>yocto.inc<br>
=C2=A0LINUX_VERSION ?=3D &quot;4.4.93&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0SRCREV_machine ?=3D &quot;<wbr>f070447fb60b5b939c94583d7c05f5<wbr>5ec=
2b37acd&quot;<br>
=C2=A0SRCREV_meta ?=3D &quot;<wbr>ae0119a2ff737b8c14bdf904b4c6eb<wbr>790a77=
92cb&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4=
.9.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.9.bb</a=
> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.9.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.9.bb</a><br>
index 79b8bfd..34ffdb4 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.9.bb" =
rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.9.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.9.bb" =
rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.9.bb</a><br>
@@ -7,7 +7,6 @@ require recipes-kernel/linux/linux-<wbr>yocto.inc<br>
=C2=A0LINUX_VERSION ?=3D &quot;4.9.57&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0SRCREV_machine ?=3D &quot;<wbr>cd8f9254aaaacbfa7f45fcc0bf2bb3<wbr>076=
15a174b&quot;<br>
=C2=A0SRCREV_meta ?=3D &quot;<wbr>cdbd35c54b6a62e4fd543164f1dcdf<wbr>92c85c=
ff2d&quot;<br>
diff --git a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc b/meta/recipes-=
kernel/linux/<wbr>linux-yocto.inc<br>
index 9c1f61b..07b9af7 100644<br>
--- a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
@@ -46,7 +46,6 @@ SRCREV_FORMAT ?=3D &quot;meta_machine&quot;<br>
=C2=A0#=C2=A0 =C2=A01: report options that are specified, but not in the fi=
nal config<br>
=C2=A0#=C2=A0 =C2=A02: report options that are not hardware related, but se=
t by a BSP<br>
=C2=A0KCONF_AUDIT_LEVEL ?=3D &quot;1&quot;<br>
-KCONF_BSP_AUDIT_LEVEL ?=3D &quot;0&quot;<br>
=C2=A0KMETA_AUDIT ?=3D &quot;yes&quot;<br>
<br>
=C2=A0LINUX_VERSION_EXTENSION ??=3D &quot;-yocto-${LINUX_KERNEL_TYPE}&quot;=
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.10.b=
b" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.10.bb</a> b/meta=
/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.10.bb" rel=3D"norefer=
rer" target=3D"_blank">li<wbr>nux-yocto_4.10.bb</a><br>
index 7fcc753..f5b777e 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.10.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.10.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.10.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.10.bb</a><br>
@@ -29,7 +29,6 @@ LINUX_VERSION ?=3D &quot;4.10.17&quot;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.12.b=
b" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.12.bb</a> b/meta=
/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.12.bb" rel=3D"norefer=
rer" target=3D"_blank">li<wbr>nux-yocto_4.12.bb</a><br>
index a7dd763..493eb99 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.12.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.12.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.12.bb</a><br>
@@ -29,7 +29,6 @@ LINUX_VERSION ?=3D &quot;4.12.14&quot;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb=
" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.4.bb</a> b/meta/r=
ecipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=3D"noreferrer=
" target=3D"_blank">li<wbr>nux-yocto_4.4.bb</a><br>
index 4d8d3da..dbe9665 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.4.bb</a><br>
@@ -29,7 +29,6 @@ LINUX_VERSION ?=3D &quot;4.4.93&quot;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarm64|qemux86|<wbr>qemuppc|q=
emumips|qemumips64|<wbr>qemux86-64&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.9.bb=
" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.9.bb</a> b/meta/r=
ecipes-kernel/linux/<a href=3D"http://linux-yocto_4.9.bb" rel=3D"noreferrer=
" target=3D"_blank">li<wbr>nux-yocto_4.9.bb</a><br>
index 2486792..479064a 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.9.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.9.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.9.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.9.bb</a><br>
@@ -29,7 +29,6 @@ LINUX_VERSION ?=3D &quot;4.9.57&quot;<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
-KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<br>
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
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div></div>

--001a11359c962a71ca055ef6ffe9--
