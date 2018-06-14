Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 786957548B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 22:12:44 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id t2-v6so5356901lfd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 15:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R5XmC1b8eJ0duGdkj471em+qPx0HPFl0kXGWubTc33c=;
	b=fyo8OvchlGsm7BAZ0Hhzl9Hd07mGaS1w0tBStWZU1fd2i1btxsL4VzCCed/zv/mb5l
	Vxk8zaCVLEpk0hpPC9Wg3ZyILdfeky5hNZMD69Gz0FhQLBNRnQZZ6MFLgfPAJwCnydh7
	DZN90cZ6liuYu4arBxs2UA5yz3Uu65odUaT73Jybt6pMflwthUPU3UxAqW63JTpL5KQw
	BqOi7d5ExHa+JGKjhJwUWsTh6WBSwjwag8wubVtfZoH9f6rRNbRJycY+ubBtugNmcfm0
	Fy4wjjNusP4fgIdlE8GDZT/JL+PlW90kShocDdZC+MkqH/U3zkeVX94X6/ln36snOvg+
	X2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R5XmC1b8eJ0duGdkj471em+qPx0HPFl0kXGWubTc33c=;
	b=LY2ZFf84bMMNqxmh20OiRoOxNH2+CxwmX5OocMnemI4HVGoaB2YiFkbJe6uhJQt3H1
	S3op9M5SdO/WS7iLubyj8nZ9pN4uIugRxt71+dPhmZfKubUtATE5fBX/ecTZwcr0OUZR
	g5iWgtMGXBPF1EdqleNv6JYK32LUOW7/bZs7T19lReroQ9iH54Vhlsof8DAQBFi5VflH
	YTY1mIAg81t590OIQczIsKslfL+6a6y/hixkO8n32He4oXJYpknDqKohFYZv8GoS55/S
	2QC7DGWEAhht7qdQHhOyvJQZs2yV0qE+gqj+gEU/PGP7l/qE/+NLij3GB31WNKQ0WqGb
	n7vg==
X-Gm-Message-State: APt69E1zQXcZoHwCcGAe4nHHtqUQDhDA3Px3juaiUlufsTrf/qftLdn5
	tbWmIf6W8i1J9d50ZZFoO6iUC8EDyjSJRcxW89E=
X-Google-Smtp-Source: ADUXVKKtXPEjzq0BlLqfnfHz1KHSSeUwbEORgIDUXOOo8XOl4EVd81KxLkINOTJHJk2nOKxZiwwGdEoqwF4VmtekWTs=
X-Received: by 2002:a2e:585:: with SMTP id 127-v6mr2925224ljf.28.1529014364976;
	Thu, 14 Jun 2018 15:12:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 15:12:44
	-0700 (PDT)
In-Reply-To: <20180614194507.93168-3-alistair.francis@wdc.com>
References: <20180614194507.93168-1-alistair.francis@wdc.com>
	<20180614194507.93168-3-alistair.francis@wdc.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Jun 2018 18:12:44 -0400
Message-ID: <CADkTA4PJuHARyOg7zU4vNktpniz+OFg_1iU7_nUQYWmM2uhxoA@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] recipes-kernel/linux: Add RISC-V support
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
X-List-Received-Date: Thu, 14 Jun 2018 22:12:44 -0000
Content-Type: multipart/alternative; boundary="00000000000014bbaf056ea166a2"

--00000000000014bbaf056ea166a2
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 14, 2018 at 3:45 PM, Alistair Francis <alistair.francis@wdc.com>
wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc     | 4 ++++
>  meta/recipes-kernel/linux/linux-yocto_4.15.bb | 5 ++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index 95ec2a2b41..70a13cdd1e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -26,6 +26,10 @@ DEPENDS_append_nios2 = " libgcc"
>  KERNEL_CC_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
>  KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
>
> +DEPENDS_append_riscv64 = " libgcc"
> +KERNEL_CC_append_riscv64 = " ${TOOLCHAIN_OPTIONS}
> ${SECURITY_NOPIE_CFLAGS}"
> +KERNEL_LD_append_riscv64 = " -no-pie"
> +
>  KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
>
>  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
> index 693670c613..4ea368a011 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
> @@ -36,7 +36,10 @@ KCONF_BSP_AUDIT_LEVEL = "2"
>
>  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
>
> -COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|
> qemuppc|qemumips|qemumips64|qemux86-64"
> +KBUILD_DEFCONFIG_qemuriscv64 = "defconfig"
> +KCONFIG_MODE_qemuriscv64 = "--alldefconfig"
>

This doesn't belong in linux-yocto.

We use defined BSP and configuration fraagments, not in-tree defconfigs

I'm happy to add a BSP definition to the kernel-cache, but this isn't the
way to add configuration support for the linux-yocto trees

Cheers,

Bruce


> +
> +COMPATIBLE_MACHINE = "qemuarm|qemuarm64|qemux86|
> qemuppc|qemumips|qemumips64|qemux86-64|qemurisc532|qemuriscv64"
>
>  # Functionality flags
>  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> --
> 2.17.1
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

--00000000000014bbaf056ea166a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jun 14, 2018 at 3:45 PM, Alistair Francis <span dir=3D"ltr">&lt=
;<a href=3D"mailto:alistair.francis@wdc.com" target=3D"_blank">alistair.fra=
ncis@wdc.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed=
-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com">a=
listair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<wbr>linux-yocto.inc=C2=A0 =C2=A0 =C2=A0| 4=
 ++++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.15.bb</a> | 5 ++++-<br=
>
=C2=A02 files changed, 8 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc b/meta/recipes-=
kernel/linux/<wbr>linux-yocto.inc<br>
index 95ec2a2b41..70a13cdd1e 100644<br>
--- a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
@@ -26,6 +26,10 @@ DEPENDS_append_nios2 =3D &quot; libgcc&quot;<br>
=C2=A0KERNEL_CC_append_nios2 =3D &quot; ${TOOLCHAIN_OPTIONS}&quot;<br>
=C2=A0KERNEL_LD_append_nios2 =3D &quot; ${TOOLCHAIN_OPTIONS}&quot;<br>
<br>
+DEPENDS_append_riscv64 =3D &quot; libgcc&quot;<br>
+KERNEL_CC_append_riscv64 =3D &quot; ${TOOLCHAIN_OPTIONS} ${SECURITY_NOPIE_=
CFLAGS}&quot;<br>
+KERNEL_LD_append_riscv64 =3D &quot; -no-pie&quot;<br>
+<br>
=C2=A0KERNEL_FEATURES_append_<wbr>qemuall=3D&quot; features/debug/printk.sc=
c&quot;<br>
<br>
=C2=A0# A KMACHINE is the mapping of a yocto $MACHINE to what is built<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.15.b=
b" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.15.bb</a> b/meta=
/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.15.bb" rel=3D"norefer=
rer" target=3D"_blank">li<wbr>nux-yocto_4.15.bb</a><br>
index 693670c613..4ea368a011 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.15.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.15.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.15.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.15.bb</a><br>
@@ -36,7 +36,10 @@ KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
=C2=A0KERNEL_DEVICETREE_qemuarm =3D &quot;versatile-pb.dtb&quot;<br>
<br>
-COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarm64|qemux86|<wbr>qemuppc|qemumi=
ps|qemumips64|<wbr>qemux86-64&quot;<br>
+KBUILD_DEFCONFIG_qemuriscv64 =3D &quot;defconfig&quot;<br>
+KCONFIG_MODE_qemuriscv64 =3D &quot;--alldefconfig&quot;<br></blockquote><d=
iv><br></div><div>This doesn&#39;t belong in linux-yocto.</div><div><br></d=
iv><div>We use defined BSP and configuration fraagments, not in-tree defcon=
figs</div><div><br></div><div>I&#39;m happy to add a BSP definition to the =
kernel-cache, but this isn&#39;t the way to add configuration support for t=
he linux-yocto trees</div><div><br></div><div>Cheers,</div><div><br></div><=
div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+<br>
+COMPATIBLE_MACHINE =3D &quot;qemuarm|qemuarm64|qemux86|<wbr>qemuppc|qemumi=
ps|qemumips64|<wbr>qemux86-64|qemurisc532|<wbr>qemuriscv64&quot;<br>
<br>
=C2=A0# Functionality flags<br>
=C2=A0KERNEL_EXTRA_FEATURES ?=3D &quot;features/netfilter/netfilter.<wbr>sc=
c&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.17.1<br>
<br>
-- <br>
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
</div></div>

--00000000000014bbaf056ea166a2--
