Return-Path: <akuster808@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9BCD260616
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 07:38:52 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u138so14207688wmu.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 00:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=XGGMnATRZCsk3E7/EZ81pRmu0+iS/BlS+4+9m/So+RU=;
	b=PDu+FOEXsuL1uADKaVcOn5N1d7dKRuvXabLbNzDKX9BdtXvIf+k1VC1s6Lg2vnztdl
	AI4OPvKHchO4J5Krao3LM5C+NxgJVpnK/A02PKhrSoy6TX+kIqTnltmgtsHPavMNvABu
	jyCWx2A02lsO69voXjHQqAa9WgNKoqR/592YkZPtykbark34bfE76J48kKPw01gBMTq2
	V6IBNaLuWOdZa9iDGZPYXRoOgg9v0CYNsqVcqgiyZM0J2PdWK4o8pJMMJE20d4PnrlmH
	7b5gvn8eGXcQGOIEB9JT+Lw0DAIgODXIn7WgFTxmmFY8iZqKmfACLXX/GQTRWNnXBkMl
	DpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=XGGMnATRZCsk3E7/EZ81pRmu0+iS/BlS+4+9m/So+RU=;
	b=fkON+GsQvpfrtVtWrWtOPixzqHMJhVvmqbIGkYmeWXm+OPEAj2TO8P5ZAllTvYRSPm
	ssW4ulXAGQkuf35lpf5aTRqfTVXn/xlmoDlwRx63Few1slIO6g0zC9EAbY1yw9tLpHeQ
	fltaUdk9260SO79R231WNExFCLwSN5Lczm6+iLvx1cQftxNA/KPFVb6Ul6adpRtaul9X
	wI1XqBxq2gjs0tPgDTap7PPekT7UwHszucD0f7k6v4veepxJEdnTisIyo0o017nO64n0
	mipJbQvcmepjluX/nOHgqhPuZczKaUYghduy6ustZNj1JeyMPy7WVAhIITo7dLeu7P2e
	taHw==
X-Gm-Message-State: AMCzsaXRMo6t5edxNAzjFXk4D1nNugWyTrO7hg3fbMah+bLuoGEJDeQ5
	6gmcLMN7oShbknAy2O36LGP/6Q==
X-Google-Smtp-Source: ABhQp+TXVyF9NMJRMQdtZQaEQI0OxaR9EQ3GrcU90pQryl/sKsaGBfPQAuoR76369TII+VP7AI4ghQ==
X-Received: by 10.80.222.76 with SMTP id a12mr19616799edl.214.1508830733118;
	Tue, 24 Oct 2017 00:38:53 -0700 (PDT)
Received: from [10.253.4.130] ([62.168.35.105])
	by smtp.gmail.com with ESMTPSA id a5sm7602760edm.18.2017.10.24.00.38.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Oct 2017 00:38:52 -0700 (PDT)
To: Thomas Perrot <thomas.perrot@tupi.fr>,
	openembedded-core@lists.openembedded.org
References: <20171020094709.27155-1-thomas.perrot@tupi.fr>
From: akuster808 <akuster808@gmail.com>
Message-ID: <1f7a9ec0-9493-140d-d811-e7782d52b7fa@gmail.com>
Date: Tue, 24 Oct 2017 00:38:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171020094709.27155-1-thomas.perrot@tupi.fr>
Subject: Re: [meta][pyro][PATCHv2] Fix some issues in the fitImage generation
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
X-List-Received-Date: Tue, 24 Oct 2017 07:38:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/20/2017 02:47 AM, Thomas Perrot wrote:
> - Bad image type replacement for aarch64
> - Fix DTB path in fitimage.its
> - Ignore fitImage type in do_bundle_initramfs task because the packaging is made by do_assemble_fitimage_initramfs
> - the images for arm64 are not compressed the linux_comp variable must therefore be none
>
> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> ---
>  meta/classes/kernel-fitimage.bbclass |  6 +++++-
>  meta/classes/kernel-uboot.bbclass    | 11 ++++++++---
>  meta/classes/kernel.bbclass          |  4 +++-
I don't see this in master. Please resubmit for Master.

- armin
>  3 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 2630b47316..abbc309b09 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -7,8 +7,11 @@ python __anonymous () {
>          depends = "%s u-boot-mkimage-native dtc-native" % depends
>          d.setVar("DEPENDS", depends)
>  
> -        if d.getVar("UBOOT_ARCH") == "x86":
> +        uarch = d.getVar("UBOOT_ARCH")
> +        if uarch == "x86":
>              replacementtype = "bzImage"
> +        elif uarch == "arm64":
> +            replacementtype = "Image"
>          else:
>              replacementtype = "zImage"
>  
> @@ -351,6 +354,7 @@ fitimage_assemble() {
>  				DTB_PATH="arch/${ARCH}/boot/${DTB}"
>  			fi
>  
> +			DTB=$(echo "${DTB}" | tr '/' '_')
>  			DTBS="${DTBS} ${DTB}"
>  			fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}
>  		done
> diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
> index 868e97d7a7..940f91d90e 100644
> --- a/meta/classes/kernel-uboot.bbclass
> +++ b/meta/classes/kernel-uboot.bbclass
> @@ -1,12 +1,17 @@
>  uboot_prep_kimage() {
> -	if [ -e arch/${ARCH}/boot/compressed/vmlinux ]; then
> +	if [ -e arch/${ARCH}/boot/compressed/vmlinux ] ; then
>  		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
>  		linux_suffix=""
>  		linux_comp="none"
>  	else
>  		vmlinux_path="vmlinux"
> -		linux_suffix=".gz"
> -		linux_comp="gzip"
> +		if [ "${ARCH}" = "arm64" ] ; then
> +			linux_suffix=""
> +			linux_comp="none"
> +		else
> +			linux_suffix=".gz"
> +			linux_comp="gzip"
> +		fi
>  	fi
>  
>  	${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ce2cab65ae..14677ac0fc 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -219,7 +219,9 @@ do_bundle_initramfs () {
>  		# Backing up kernel image relies on its type(regular file or symbolic link)
>  		tmp_path=""
>  		for type in ${KERNEL_IMAGETYPES} ; do
> -			if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
> +			if [ "$type" = "fitImage" ] ; then
> +				continue
> +			elif [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
>  				linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$type`
>  				realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$type`
>  				mv -f $realpath $realpath.bak


