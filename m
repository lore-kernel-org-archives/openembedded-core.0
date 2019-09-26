Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A67E97ED2F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 15:45:19 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id i16so3344626wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=LxEc+UcPJETUU6TnLOHO0gb6Vk3BjZimZfK22M+ADqk=;
	b=bI1wPZ2JQcNrl6mQGn+H4E82FLWQSrjHX/OfjgRMbFmKUpKJprDxmRa7gez59avZl2
	6uK3EQZy+FRhp6t2DD6auun6H+4x7zGI/h0I6cwY7ACj9R5hI9zmEE37j4NEBIRP9RGx
	yTtgZouNC4fhaqW72vlPCJ4AwuqkpZ684mGVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=LxEc+UcPJETUU6TnLOHO0gb6Vk3BjZimZfK22M+ADqk=;
	b=aHrta4UreYq6rLb5uXn3MwiyudmpaCstVdwqjMYZTjNJ6uwOTDNg6acgNgw4uhv0nq
	rrYsMvalUlNSlPjyGLMZWD0QAsxQUX4Icrmo5plm0+TH+WeT1KlXOOxVIkUVuq5bYDgw
	GHyjOVNi7rmXL4rZZnJc9z3gj8AZDh9yZ4YqBVKEpghMBYj4XMT0GBzGAwDxbxgfgujv
	7Mp9HQIu25hocC1DBkDJ5f0zEZ//h341REd8bpdea/9eeQrAWagSpyVovgZN/pzftuaa
	O2eolAf+S8NvfTpXIyfScq1Nvd7hLAy4MvNqJvbqOQW3Ss/MbKLGcZJcmtFeWvzY0Ctz
	Q0Pw==
X-Gm-Message-State: APjAAAXjUEqc9Bqa8CwQEgBFfKU+J1PdBCWAbWYOjnkDa2pe4BA01xv8
	zehyuEIzjgZvB5entbRhxVsRLQ==
X-Google-Smtp-Source: APXvYqzLehfd4CZY2mcmpRuqazjLJ0Vonb7Y6zgl2eFlq1y3dOww0E+6PldxrTX5EA66y+LlWdRGPw==
X-Received: by 2002:a7b:c4c7:: with SMTP id g7mr3488634wmk.11.1569512720349;
	Thu, 26 Sep 2019 08:45:20 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u22sm4104406wru.72.2019.09.26.08.45.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 08:45:19 -0700 (PDT)
Message-ID: <2d13e0b4b4ca76b8953baef89d5bd7589218928f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?B=F6sz=F6rm=E9nyi_Zolt=E1n?= <zboszor@pr.hu>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2019 16:45:18 +0100
In-Reply-To: <20190926090532.4131-1-zboszor@pr.hu>
References: <20190926090532.4131-1-zboszor@pr.hu>
User-Agent: Evolution 3.34.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] classes/image-live.bbclass: Don't hardcode cpio.gz
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
X-List-Received-Date: Thu, 26 Sep 2019 15:45:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2019-09-26 at 11:05 +0200, Böszörményi Zoltán via Openembedded-
core wrote:
> There's INITRAMFS_FSTYPES that can be set differently.
> 
> Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
> ---
> 
> With the hardcoded initrd filename suffix but INITRAMFS_FSTYPES
> set to cpio.lzma, this error occurs:
> 
> ERROR: sicom-pos-image-1.0-r0 do_bootimg:
> .../deploy/glibc/images/intel-core2-32/core-image-minimal-initramfs-
> intel-core2-32.cpio.lzma is invalid. initrd image creation failed.
> ERROR: sicom-pos-image-1.0-r0 do_bootimg: Function failed:
> build_hddimg (log file is located at .../tmp-sicom-
> glibc/work/intel_core2_32-sicom-linux/sicom-pos-image/1.0-
> r0/temp/log.do_bootimg.32210)
> ERROR: Logfile of failure stored in: .../tmp-sicom-
> glibc/work/intel_core2_32-sicom-linux/sicom-pos-image/1.0-
> r0/temp/log.do_bootimg.32210
> ERROR: Task (.../layers/meta-sicom/images/sicom-pos-
> image.bb:do_bootimg) failed with exit code '1'
> 
>  meta/classes/image-live.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-
> live.bbclass
> index af71be5093..54058b350d 100644
> --- a/meta/classes/image-live.bbclass
> +++ b/meta/classes/image-live.bbclass
> @@ -37,7 +37,7 @@ do_bootimg[depends] += "dosfstools-
> native:do_populate_sysroot \
>  LABELS_LIVE ?= "boot install"
>  ROOT_LIVE ?= "root=/dev/ram0"
>  INITRD_IMAGE_LIVE ?= "${MLPREFIX}core-image-minimal-initramfs"
> -INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-
> ${MACHINE}.cpio.gz"
> +INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-
> ${MACHINE}.${INITRAMFS_FSTYPES}"
>  
>  LIVE_ROOTFS_TYPE ?= "ext4"
>  ROOTFS ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${LIVE_ROOTFS_TYPE}"

I'm a little worried that INITRAMFS_FSTYPES can contain multiple values
by the sounds of its name...

Cheers,

Richard


