Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id CE11173190
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 07:49:50 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id q128so12273589wma.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 00:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=xxj8bVGZ0OaJVbVGaZ+HcCjxeUj9EsNc1BZ04Yqpsqs=;
	b=NoL6Ab8Lx4/xlFHiNbAPXUbXueU6dUBVk1mevIDZ2bfD/QTbzRexw+BtuG/TYc87Eb
	cf36Nh9I3pkOTFfDvRyOEfwMoYrcmi90mcwq6SXmg6GgFhq+FMoY4eG6bOpxLuyNe9Dw
	mko4TCAJIi4f11JxSOkDT+64OEtW/2VgbxAPRj2reW7SNtFF08NDSqe+AklcufU4ReFe
	AAhgVNG3qRkqSRPwC6BINiIOeu8yM8gj6kI11LHnKRJsfJIOyZCqFT1WyXviBYRFSdVz
	rSRuWKIBjkjFwd0giyt0VcV8Q2nD9Rdfe3isjLiX8D1p9e6QZV/LubXxpdXqRrhntK89
	rYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=xxj8bVGZ0OaJVbVGaZ+HcCjxeUj9EsNc1BZ04Yqpsqs=;
	b=LEvhlxzFxHjzIIcphI5c7/1ZFyNL2+1CcD3xl+ORCVBm3zlrBnwq35Qaw5OjZ6KU7u
	FjZ6XFmbv/eZZr0zgzJNsLYfrSpXoM0bJvi1dkgXUfOeHFMSVSC4r5YGLr+IgJsr38Da
	IVj+T/4kGKQ5iRMBzTriaDidy8HihC37kwe/S0dkhEXnuxNRXI1S8s1H5cLPGJdbrrKZ
	MhBdFQVz3fwYkuy1TRg2P+2XgM5F3zCya5ZosF89YEPduYbGWRanM3FsQenm1o6PSrQb
	ajBEldA0ibOcYSQnkYIlawJCOupIRpX41CelSdrY5bIO7Wup4kfV3CFhLTKGVL+3B9OK
	P9CQ==
X-Gm-Message-State: ALyK8tK8Vgg5oO90jhDnKru0UzJDQeRbCUCoFqInkaouqgPV6enzOzD7br/B1/9m9kH2iQ==
X-Received: by 10.28.60.136 with SMTP id j130mr16484040wma.93.1469087389841;
	Thu, 21 Jul 2016 00:49:49 -0700 (PDT)
Received: from [192.168.2.129] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114])
	by smtp.gmail.com with ESMTPSA id jr2sm5033148wjb.7.2016.07.21.00.49.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Jul 2016 00:49:49 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1464681309-34628-1-git-send-email-herve.jourdain@neuf.fr>
	<1464681309-34628-2-git-send-email-herve.jourdain@neuf.fr>
	<005d01d1e1cd$ec5a6f30$c50f4d90$@neuf.fr>
From: "piotr.lewicki" <piotr.lewicki@elfin.de>
Message-ID: <2d4ffa1e-6080-745c-620c-b18ee2d4300e@elfin.de>
Date: Thu, 21 Jul 2016 09:49:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <005d01d1e1cd$ec5a6f30$c50f4d90$@neuf.fr>
Subject: Re: [PATCH v3] linux-dtb.inc: Support for .dtbo files for dtb overlays
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
X-List-Received-Date: Thu, 21 Jul 2016 07:49:54 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

+1 : I also use this and I think this would be perfect to have this in 
master instead of using patched fork.

Can this be merged?


Thanks,

Piotr


On 19.07.2016 16:57, Herve Jourdain wrote:
> Ping...
> This is needed for support of "dynamic" device tree overlays, with
> extensions .dtbo (instead of xxx-overlay.dtb), which are used in RaspberryPi
> kernel since 4.4.6.
>
> -----Original Message-----
> From: Herve Jourdain [mailto:herve.jourdain@neuf.fr]
> Sent: mardi 31 mai 2016 09:55
> To: openembedded-core@lists.openembedded.org
> Cc: Herve Jourdain <herve.jourdain@neuf.fr>
> Subject: [OE-core][PATCH v3] linux-dtb.inc: Support for .dtbo files for dtb
> overlays
>
> Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
> ---
>   meta/recipes-kernel/linux/linux-dtb.inc | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
> b/meta/recipes-kernel/linux/linux-dtb.inc
> index 74f5ef8..8528d64 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -33,12 +33,13 @@ do_compile_append() {
>   do_install_append() {
>   	for DTB in ${KERNEL_DEVICETREE}; do
>   		DTB=`normalize_dtb "${DTB}"`
> -		DTB_BASE_NAME=`basename ${DTB} .dtb`
> +		DTB_EXT=${DTB##*.}
> +		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
>   		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
>   			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
>   			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>   			DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
> -			install -m 0644 ${DTB_PATH}
> ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
> +			install -m 0644 ${DTB_PATH}
> ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
>   		done
>   	done
>   }
> @@ -46,7 +47,8 @@ do_install_append() {
>   do_deploy_append() {
>   	for DTB in ${KERNEL_DEVICETREE}; do
>   		DTB=`normalize_dtb "${DTB}"`
> -		DTB_BASE_NAME=`basename ${DTB} .dtb`
> +		DTB_EXT=${DTB##*.}
> +		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
>   		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
>   			base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
>   			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> @@ -54,8 +56,8 @@ do_deploy_append() {
>   			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>   			DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
>   			install -d ${DEPLOYDIR}
> -			install -m 0644 ${DTB_PATH}
> ${DEPLOYDIR}/${DTB_NAME}.dtb
> -			ln -sf ${DTB_NAME}.dtb
> ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
> +			install -m 0644 ${DTB_PATH}
> ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}
> +			ln -sf ${DTB_NAME}.${DTB_EXT}
> ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.${DTB_EXT}
>   		done
>   	done
>   }
> @@ -65,9 +67,10 @@ pkg_postinst_kernel-devicetree () {
>   	for DTB in ${KERNEL_DEVICETREE}; do
>   		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
>   			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> +			DTB_EXT=${DTB##*.}
>   			DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print
> $1}'`
>   			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -			update-alternatives --install
> /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb
> /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +			update-alternatives --install
> /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT}
> /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
>   		done
>   	done
>   }
> @@ -77,9 +80,10 @@ pkg_postrm_kernel-devicetree () {
>   	for DTB in ${KERNEL_DEVICETREE}; do
>   		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
>   			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
> +			DTB_EXT=${DTB##*.}
>   			DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print
> $1}'`
>   			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed
> "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> -			update-alternatives --remove ${DTB_BASE_NAME}.dtb
> /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +			update-alternatives --remove
> ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
> ${KERNEL_PRIORITY} || true
>   		done
>   	done
>   }


