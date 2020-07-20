Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.33084.1595230906735264094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 00:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aM3ucf7N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id a6so16775463wrm.4
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 00:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xdNsOiwbXbJFYa+rZ9UDSTuPz4q1DavkpnS7V7wTMEA=;
        b=aM3ucf7NpSPLb5FLFn3iSaga9yuANE55El8RpPNQluV77adHzWt9WAauVIgKFHwHF9
         EfpwPGqk2ni6rbICyKD7ALjC9DPpDxT4SpzIGUfinCvm2nE3KtKj/Rue1pu7i6MWoC2B
         GYLQpUseJQJ268FONUTQZXqFAynPrA2OTHa5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xdNsOiwbXbJFYa+rZ9UDSTuPz4q1DavkpnS7V7wTMEA=;
        b=gs8Vx1CajZWUT/XvGSPda9hzHdRtRc7+nUPToVILjWyqCCDPspDK3VfUL4FFP/WHbu
         Ba4vKF65HU15I5ihJvG+1UYN78wliFKM7Y4/EFI0Ob6it9nX8SkHBs76AVpvNa7Wa4rz
         9e+34jM+J2Y1hXR5RvUyYlp0D5U4YJIDggZqec5fcUTolw2AejI6jdJxGBGk4U6yXGwP
         LcbJcYJl4ewcHCmZYDi1dMkv3kbML3LAeSWOueyq7cRXLEEhOVwSkxRholtVesUN5M3y
         IzWrthQ067tlwvHwB0qz7NtVyPhBcxEgzOKwK1iLXDsCJmX7aNliko3BT2MlGCX4ddyY
         9AFw==
X-Gm-Message-State: AOAM533lQ3Y1t6GpeTLU/vNe5SolYg8w1O2Wj5vZQFLELPR/xb7Kdy4S
	OY5ss9c9Mvu0tmeIo1Qf4MkdRw==
X-Google-Smtp-Source: ABdhPJxrVbWo2L5oHe28XqZAknCsIHY+P7PDf6phekySrTHc4nMs+p8hKqEVS8Kt7J90MDBypSJOjQ==
X-Received: by 2002:adf:b18d:: with SMTP id q13mr20715282wra.256.1595230905192;
        Mon, 20 Jul 2020 00:41:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 5.f.a.a.6.6.c.6.8.7.0.3.0.b.c.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (5.f.a.a.6.6.c.6.8.7.0.3.0.b.c.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1cb0:3078:6c66:aaf5])
        by smtp.gmail.com with ESMTPSA id c24sm5389967wrb.11.2020.07.20.00.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 00:41:44 -0700 (PDT)
Message-ID: <540353726b3e013ad76aa299bbf836f30d618f14.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel-fitimage: build configuration for image tree when dtb is not present
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Usama Arif <usama.arif@arm.com>, openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Mon, 20 Jul 2020 08:41:43 +0100
In-Reply-To: <20200717141936.9689-1-usama.arif@arm.com>
References: <20200717141936.9689-1-usama.arif@arm.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-17 at 15:19 +0100, Usama Arif wrote:
> This patch adds support for adding default config node even
> when dtb is not part of the FIT image. The conf options are
> therefore changed to point to kernel ID rather than dtb
> ID when dtb does not exist.
> 
> Signed-off-by: Usama Arif <usama.arif@arm.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)

I keep asking someone to start providing tests for kernel-fitimage but
nobody does. Its near impossible to tell whether this is a good change
or one that could cause someone else problems as we have little
documented behaviour and no tests.

Could someone please start looking at adding some (and documentation)?

Cheers,

Richard

> diff --git a/meta/classes/kernel-fitimage.bbclass
> b/meta/classes/kernel-fitimage.bbclass
> index 72b05ff8d1..6f4530fc3b 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -257,6 +257,7 @@ fitimage_emit_section_config() {
>  	# Test if we have any DTBs at all
>  	sep=""
>  	conf_desc=""
> +	conf_node="conf@"
>  	kernel_line=""
>  	fdt_line=""
>  	ramdisk_line=""
> @@ -287,12 +288,18 @@ fitimage_emit_section_config() {
>  	fi
>  
>  	if [ "${6}" = "1" ]; then
> -		default_line="default = \"conf@${3}\";"
> +		if [ -n "${3}" ]; then
> +			default_line="default = \"conf@${3}\";"
> +			conf_node=$conf_node${3}
> +		else
> +			default_line="default = \"conf@${2}\";"
> +			conf_node=$conf_node${2}
> +		fi
>  	fi
>  
>  	cat << EOF >> ${1}
>                  ${default_line}
> -                conf@${3} {
> +                $conf_node {
>  			description = "${6} ${conf_desc}";
>  			${kernel_line}
>  			${fdt_line}
> @@ -445,6 +452,9 @@ fitimage_assemble() {
>  			fi
>  			i=`expr ${i} + 1`
>  		done
> +	else
> +		defaultconfigcount=1
> +		fitimage_emit_section_config ${1} "${kernelcount}" ""
> "${ramdiskcount}" "${setupcount}" "${defaultconfigcount}"
>  	fi
>  
>  	fitimage_emit_section_maint ${1} sectend
> 

