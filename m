Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id D9C3F77498
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 17:49:46 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 75so3616107pgf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 09:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=R9ydYT/9lhn0mgHo1n/EI7NgOW0ISELROOt5iRgbsG8=;
	b=oU3/15M+wVxlSqCGY31mttuyIbH1Rp5J4gtpZQUAFXceBnpz/dmBJALo1KDtPp0cpR
	QdJ/nvIaYG/ARysXfPTKvdLSlJbkq+PyXNE6Oi58hHe9BbjyPNXrkJb1zBBxaVi4GY1p
	+O85tHP0JbgWGGQ8MJHcXPW/WU2rGUnhyRiEwjqQVCXe92kqfB2zqFhYmMtEb/Lnicj6
	YRVAsa29Zax6PggbFQ+Y8NxovRJWBGYGzMe6wRVqwlF8KeSe/zX44S1ztYJX7j1acuh+
	nSbkjUEkg7etaSGoe6GA3JCwqX++w9dkAMtnOlnyV8fyAmRt8yJ574+t1kmj6c8pgQMQ
	ZZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=R9ydYT/9lhn0mgHo1n/EI7NgOW0ISELROOt5iRgbsG8=;
	b=VGXA0gWK/5/pjiKfus9R1nv2xv6UC21dahuTvwaumcHWWTYfY8lFveU7yMueVkLQVc
	xBOY0YVnm1YSFcIT4my88+v0amRBmO7j9nR6MZVioNaP5WDDa9hOOYjSDfE2JWKrNV1K
	d+I/elLVwqFbqCSKdf7Jstkj6CEUlBxiTTNFTmeWFB+qHx1hRio7Tez+LaLENWrtBZD1
	wRnNEBxZNU5c+aCGFG2WV6ICS1iIU7ab7eS3H/ig3pNw3hyKxIeUp2XSjNj9ogPV1jWU
	luqQs/LR33asGlCBwNaoBnK3HcRKKoZJ1Cu5uTv8QD6y1bPXllmoZ10FTbgQlD+/azRF
	0+lQ==
X-Gm-Message-State: AMke39l7uQv4h2cNeNx8475Kvki+jDO0YLkYcoGWrrpdwWsaL0KaMXjevDf3sABzozVCLw==
X-Received: by 10.84.217.216 with SMTP id d24mr13072841plj.101.1486748986732; 
	Fri, 10 Feb 2017 09:49:46 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:647:4c00:23ec:9075:bc4c:9a92:4854])
	by smtp.gmail.com with ESMTPSA id
	j78sm6915348pfk.39.2017.02.10.09.49.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Feb 2017 09:49:46 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1486688773-17655-1-git-send-email-dwesterg@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <deee3f52-b8f8-498a-bd8f-74ed46ff9cd1@gmail.com>
Date: Fri, 10 Feb 2017 09:50:27 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1486688773-17655-1-git-send-email-dwesterg@gmail.com>
Subject: Re: [PATCH v2] uboot-extlinux-config.bbclass: add support for timeout & default
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
X-List-Received-Date: Fri, 10 Feb 2017 17:49:47 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 2/9/17 5:06 PM, Dalon Westergreen wrote:
> When multible targets are defined it is useful to allow for
> a default target along with a timeout.  After timeout, the
> default target will be selected.
> 
> Signed-off-by: Dalon Westergreen <dwesterg@gmail.com>
> 

this looks good to me.

> --
> v2:
>  - fixed UnboundLocalError
> ---
>  meta/classes/uboot-extlinux-config.bbclass | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
> index ec5fffb..f075a37 100644
> --- a/meta/classes/uboot-extlinux-config.bbclass
> +++ b/meta/classes/uboot-extlinux-config.bbclass
> @@ -16,6 +16,10 @@
>  #                                    concatenate and use as an initrd (optional).
>  # UBOOT_EXTLINUX_MENU_DESCRIPTION  - Name to use as description.
>  # UBOOT_EXTLINUX_ROOT              - Root kernel cmdline.
> +# UBOOT_EXTLINUX_TIMEOUT           - Timeout before DEFAULT selection is made.
> +#                                    Measured in 1/10 of a second.
> +# UBOOT_EXTLINUX_DEFAULT_LABEL     - Target to be selected by default after
> +#                                    the timeout period
>  #
>  # If there's only one label system will boot automatically and menu won't be
>  # created. If you want to use more than one labels, e.g linux and alternate,
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
> @@ -82,6 +91,14 @@ python create_extlinux_config() {
>              if len(labels.split()) > 1:
>                  cfgfile.write('menu title Select the boot mode\n')
>  
> +            timeout =  d.getVar('UBOOT_EXTLINUX_TIMEOUT')
> +            if timeout:
> +                cfgfile.write('TIMEOUT %s\n' % (timeout))
> +
> +            default = d.getVar('UBOOT_EXTLINUX_DEFAULT_LABEL')
> +            if default:
> +                cfgfile.write('DEFAULT %s\n' % (default))
> +                    
>              for label in labels.split():
>                  localdata = bb.data.createCopy(d)
>  
> 

