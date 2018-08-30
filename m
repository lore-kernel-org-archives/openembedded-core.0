Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB9A74CAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 05:58:13 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id 101-v6so4770020uav.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 22:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZK5UELL1IQOA+65ToH4i32f9EI1Ujb9KDcR8o0CxQxc=;
	b=Er3xGPf0CfjlLXKb5H/FaqSrUtcejls3zKyKfI/2cmf9iYcmIw3/2jBy2tVN4X30bD
	QLvoVmqoNxticGPqyW/78Guo6Brzq4YdSoAol0Xaik+6qTPm9NdNLjHif/hJyZT5uxOT
	jFdQO4L2fCYVHTLHI1Pgpf1SUgLbLjYXf9kixNLjbmI/CRkIb7/nX0j7OjKn219uRqa8
	N5qZ3qot/e5t6lJMs8oyi+V+G0KJm0CCV8H4pHB4BptT9L3th4RHH9x9CheSXyuEUVVY
	35slWgMsnM0f7/XYKp/XQh6wk8gPbxcThNNmXIa6D0jO9PbeSTVK2OCwm9NDAGQFoe5J
	KDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZK5UELL1IQOA+65ToH4i32f9EI1Ujb9KDcR8o0CxQxc=;
	b=cjkknYXK6iCtLOhy+CFGG1coA/PgNIJCk4/+QndxU7qfhgNya/0o9IBEngEegl9SAV
	x6eo3R/cOFeH/zpwcF7nZiKSdG7a/kEI3ONaOz1OcliKYKTXLPROmOzrv6DODlvp/tqG
	hYTLDhoDy6gPF4G1FudCeCiLGhnsOHBC0oWEnsTy2cXpfw8U7ne3zh64WTY6fJCxhZ3p
	fE/K+acUGoU1pxIG+6Gm4hLjzYBWgSu69a6Ar3VUVrkk2GZaJNNK0ioKGEmrqtFpYgvd
	Plzqs35c804zHSver0IioIAFpQCJ02lKGccqr+4cHcu7NppSi20gf04UJ6jdOjcxhgex
	hY6A==
X-Gm-Message-State: APzg51BeKch6tdFgdptmeah1wOJ5lJcdunQ4k87RT2C9Ogql5Z3cUpKC
	Q0vFKSsKaqJ2+6FV/Ysdi4qLDcVg/vOaoNO3vCI=
X-Google-Smtp-Source: ANB0VdbtJxvmpV7/ZVqE9VG8RUAlFqNIpkgmEjkLaqwVMSFdHi3aw/NLJ7W0V2BJqpfgX3RF2bF62BBJRdqcPe3FPoU=
X-Received: by 2002:a9f:24ae:: with SMTP id
	43-v6mr6301534uar.181.1535608694215; 
	Wed, 29 Aug 2018 22:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <1535583563-7807-1-git-send-email-texier.pj2@gmail.com>
In-Reply-To: <1535583563-7807-1-git-send-email-texier.pj2@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 30 Aug 2018 06:58:03 +0100
Message-ID: <CAO5Uq5S685HkwZJHtkHHWJ4yUJ+zLVytBC9UOuikQrNKpPC4mQ@mail.gmail.com>
To: texier.pj2@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel-fitimage: Fix no reg property warning
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
X-List-Received-Date: Thu, 30 Aug 2018 05:58:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 29, 2018 at 11:59 PM Pierre-Jean Texier
<texier.pj2@gmail.com> wrote:
>
> The DT specifications demands a unit-address of a node name to match the "reg"
> property in that node. Newer dtc versions will throw warnings if this is
> not the case.
>
> Fixes the following warnings:
>
> | <stdout>: Warning (unit_address_vs_reg): Node /images/kernel@1 has a unit name, but no reg property
> | <stdout>: Warning (unit_address_vs_reg): Node /images/kernel@1/hash@1 has a unit name, but no reg property
> | <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5d27_som1_ek.dtb has a unit name, but no reg property
> | <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5d27_som1_ek.dtb/hash@1 has a unit name, but no reg property
> | <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5d27_som1_ek_pda4.dtb has a unit name, but no reg property
> | <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5d27_som1_ek_pda4.dtb/hash@1 has a unit name, but no reg property
> | <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5d27_som1_ek_pda7.dtb has a unit name, but no reg property
> | <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5d27_som1_ek_pda7.dtb/hash@1 has a unit name, but no reg property
> | <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5d27_som1_ek_pda7b.dtb has a unit name, but no reg property
> | <stdout>: Warning (unit_address_vs_reg): Node /images/fdt@at91-sama5d27_som1_ek_pda7b.dtb/hash@1 has a unit name, but no reg property
>
> Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>

This strikes me as a bad idea... it breaks existing boot
configurations as it changes the name that has to be selected by
U-Boot.

> ---
> Changes in V2:
>         - rebase on master
>
>  meta/classes/kernel-fitimage.bbclass | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index a4d7aca..3d7800a 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -109,7 +109,7 @@ fitimage_emit_section_kernel() {
>         fi
>
>         cat << EOF >> ${1}
> -                kernel@${2} {
> +                kernel-${2} {
>                          description = "Linux kernel";
>                          data = /incbin/("${3}");
>                          type = "kernel";
> @@ -118,7 +118,7 @@ fitimage_emit_section_kernel() {
>                          compression = "${4}";
>                          load = <${UBOOT_LOADADDRESS}>;
>                          entry = <${ENTRYPOINT}>;
> -                        hash@1 {
> +                        hash-1 {
>                                  algo = "${kernel_csum}";
>                          };
>                  };
> @@ -145,14 +145,14 @@ fitimage_emit_section_dtb() {
>                 dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
>         fi
>         cat << EOF >> ${1}
> -                fdt@${2} {
> +                fdt-${2} {
>                          description = "Flattened Device Tree blob";
>                          data = /incbin/("${3}");
>                          type = "flat_dt";
>                          arch = "${UBOOT_ARCH}";
>                          compression = "none";
>                          ${dtb_loadline}
> -                        hash@1 {
> +                        hash-1 {
>                                  algo = "${dtb_csum}";
>                          };
>                  };
> @@ -170,7 +170,7 @@ fitimage_emit_section_setup() {
>         setup_csum="sha1"
>
>         cat << EOF >> ${1}
> -                setup@${2} {
> +                setup-${2} {
>                          description = "Linux setup.bin";
>                          data = /incbin/("${3}");
>                          type = "x86_setup";
> @@ -179,7 +179,7 @@ fitimage_emit_section_setup() {
>                          compression = "none";
>                          load = <0x00090000>;
>                          entry = <0x00090000>;
> -                        hash@1 {
> +                        hash-1 {
>                                  algo = "${setup_csum}";
>                          };
>                  };
> @@ -225,7 +225,7 @@ fitimage_emit_section_ramdisk() {
>         esac
>
>         cat << EOF >> ${1}
> -                ramdisk@${2} {
> +                ramdisk-${2} {
>                          description = "${INITRAMFS_IMAGE}";
>                          data = /incbin/("${3}");
>                          type = "ramdisk";
> @@ -234,7 +234,7 @@ fitimage_emit_section_ramdisk() {
>                          compression = "${ramdisk_ctype}";
>                          ${ramdisk_loadline}
>                          ${ramdisk_entryline}
> -                        hash@1 {
> +                        hash-1 {
>                                  algo = "${ramdisk_csum}";
>                          };
>                  };
> @@ -269,39 +269,39 @@ fitimage_emit_section_config() {
>         if [ -n "${2}" ]; then
>                 conf_desc="Linux kernel"
>                 sep=", "
> -               kernel_line="kernel = \"kernel@${2}\";"
> +               kernel_line="kernel = \"kernel-${2}\";"
>         fi
>
>         if [ -n "${3}" ]; then
>                 conf_desc="${conf_desc}${sep}FDT blob"
>                 sep=", "
> -               fdt_line="fdt = \"fdt@${3}\";"
> +               fdt_line="fdt = \"fdt-${3}\";"
>         fi
>
>         if [ -n "${4}" ]; then
>                 conf_desc="${conf_desc}${sep}ramdisk"
>                 sep=", "
> -               ramdisk_line="ramdisk = \"ramdisk@${4}\";"
> +               ramdisk_line="ramdisk = \"ramdisk-${4}\";"
>         fi
>
>         if [ -n "${5}" ]; then
>                 conf_desc="${conf_desc}${sep}setup"
> -               setup_line="setup = \"setup@${5}\";"
> +               setup_line="setup = \"setup-${5}\";"
>         fi
>
>         if [ "${6}" = "1" ]; then
> -               default_line="default = \"conf@${3}\";"
> +               default_line="default = \"conf-${3}\";"
>         fi
>
>         cat << EOF >> ${1}
>                  ${default_line}
> -                conf@${3} {
> +                conf-${3} {
>                         description = "${6} ${conf_desc}";
>                         ${kernel_line}
>                         ${fdt_line}
>                         ${ramdisk_line}
>                         ${setup_line}
> -                        hash@1 {
> +                        hash-1 {
>                                  algo = "${conf_csum}";
>                          };
>  EOF
> @@ -333,7 +333,7 @@ EOF
>                 sign_line="${sign_line};"
>
>                 cat << EOF >> ${1}
> -                        signature@1 {
> +                        signature-1 {
>                                  algo = "${conf_csum},rsa2048";
>                                  key-name-hint = "${conf_sign_keyname}";
>                                 ${sign_line}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Alex Kiernan

