Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id CB62E731C1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 16:25:11 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id yl2so12994667pac.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 09:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=QNU711jl6OkvQZWQyNYw5tdr1qiZVb2xrTGgUd3VQuU=;
	b=o3WGw1yQXUqlGFAdcQMA7OS4kAaNRf8NgWCQRQIcszBYNwGq17P29F2sKEEYNLG5Qo
	WKiHat7fgWn6lTB5zYV4gcByg+oL5s6FhHMJR5SDkDrmO8s1QvLbmDhqTmNRsSnLda9W
	xHHuySgMmqBsubxYyuDu+G7d0cwbxBoRgvsIZg8bsC/TpxEKNqT0YTGOqGAPJpVp+x0/
	dLbbHqpdweiTe79XIkrKdyPF7beNU5mWPwnIVDVCxwJMMHuY05OCe2hLvgw+rGk+Jr+H
	xXghgOw5B1Z/90pXpN/w4cdydK/Pr9MzeHsq5IxTU96pi+/+wP9Ak8Uclgx15dX7A8l1
	zw9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=QNU711jl6OkvQZWQyNYw5tdr1qiZVb2xrTGgUd3VQuU=;
	b=DqwHbUaXCgKC78vIcbb//CdQ1z6zB8qnbs/F8Rr0X2rVC0XcKDoSL8QzKTBofdKdM4
	eZ+CWJzce0Dku5Yq+rzVoS16QQiy9pSUMC140cFBZjefIZ2AEI7nQZhhF2YLAipvYP94
	W/Aq/Emg0tFOXOFwYG2M/ADvTgQHcHZchJH+uDKlXPym35Qmzhds7U+tilFMEBU4/+d5
	pQWHWydQzNfGGhDrSxSGyz8BTLn1v9ftTUY4RsjeRPdDjOd45nRJy74/G89k8tU7l8N6
	AaLXl8TUMo34zdmhMgdDmXvP4QkVeDu+/djg2b9xO9c0X0X1CVEO7NrLpb6ldaNFhwXT
	IumQ==
X-Gm-Message-State: ALyK8tJFNSSbKHLTssRjIpsGSVXbCsnoz3fgrxpq+q+FUoEBPc3byB7hboqTjaR+jPDjeg==
X-Received: by 10.67.22.168 with SMTP id ht8mr23719340pad.50.1464366312024;
	Fri, 27 May 2016 09:25:12 -0700 (PDT)
Received: from [192.168.18.4] (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.googlemail.com with ESMTPSA id
	eh9sm29320243pad.47.2016.05.27.09.25.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2016 09:25:10 -0700 (PDT)
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	richard.purdie@linuxfoundation.org
References: <1464365915-8522-1-git-send-email-bruce.ashfield@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <574874E4.8080408@gmail.com>
Date: Fri, 27 May 2016 09:25:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1464365915-8522-1-git-send-email-bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] linux-yocto/4.1: fix musb compilation error
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
X-List-Received-Date: Fri, 27 May 2016 16:25:13 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

does this affect krogoth?

- armin

On 05/27/2016 09:18 AM, Bruce Ashfield wrote:
> We had a partial musb change merged into the 4.1 tree, which resulted in:
> 
>   | kernel-source/drivers/usb/musb/musb_dsps.c:
>   In function 'dsps_create_musb_pdev':
>   | kernel-source/drivers/usb/musb/musb_dsps.c:750:8:
>   error: 'struct musb_hdrc_config' has no member named 'maximum_speed'
>   |   config->maximum_speed = usb_get_maximum_speed(&parent->dev);
>   |         ^~
> 
> By backporting commit:
> 
>   9b7537642cb6a [usb: musb: set the controller speed based on the config setting]
> 
> We get our missing structure field, and we can once again build musb.
> 
> [YOCTO: #9680]
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
>  meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
> index 1d4c404ef0ca..24cc0ac07703 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
> @@ -11,7 +11,7 @@ python () {
>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>  }
>  
> -SRCREV_machine ?= "320892013ad33ab41f530ad321939aec07d09d22"
> +SRCREV_machine ?= "e22280e8c2905d96c7cc5917df202b6ed904d042"
>  SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
>  
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
> index 9757c4d02067..bf7d6c5959e1 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
> @@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.24"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>  
> -SRCREV_machine ?= "ecc983477682203619da0e456fa4a8689ac41097"
> +SRCREV_machine ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
>  SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
>  
>  PV = "${LINUX_VERSION}+git${SRCPV}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> index e0d288b6e93c..c325bc59c6c8 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
> @@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
>  KBRANCH_qemux86-64 ?= "standard/base"
>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>  
> -SRCREV_machine_qemuarm ?= "d11c336b38ab0d4e55eb683aca5ca9c6b6cd8b42"
> -SRCREV_machine_qemuarm64 ?= "ecc983477682203619da0e456fa4a8689ac41097"
> -SRCREV_machine_qemumips ?= "f8e363f638b283738369155b4a9990b5d0f902a7"
> -SRCREV_machine_qemuppc ?= "ecc983477682203619da0e456fa4a8689ac41097"
> -SRCREV_machine_qemux86 ?= "ecc983477682203619da0e456fa4a8689ac41097"
> -SRCREV_machine_qemux86-64 ?= "ecc983477682203619da0e456fa4a8689ac41097"
> -SRCREV_machine_qemumips64 ?= "1db47ec6c39071b29f82a040b9b9a81584f50461"
> -SRCREV_machine ?= "ecc983477682203619da0e456fa4a8689ac41097"
> +SRCREV_machine_qemuarm ?= "cadb80aa4bcee282f1b0798ef35ad8b96ec44931"
> +SRCREV_machine_qemuarm64 ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
> +SRCREV_machine_qemumips ?= "737eda6388a529d0937e9d91daa3644b11f322dc"
> +SRCREV_machine_qemuppc ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
> +SRCREV_machine_qemux86 ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
> +SRCREV_machine_qemux86-64 ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
> +SRCREV_machine_qemumips64 ?= "f276d128428b031521d766bfbfe84f9f9f992930"
> +SRCREV_machine ?= "403eda4633e9037fb715d0d1e8ae847b2bd0651a"
>  SRCREV_meta ?= "4b4199bd24f206d459061bb0a920d009429d5ed3"
>  
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
> 

