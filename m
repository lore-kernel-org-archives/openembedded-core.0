Return-Path: <mike@foundries.io>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 477CB6C216
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 17:41:46 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id e92so1117240plb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 10:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=7GoM0+3+DV2m6KrcPYhvppzeiAc7zISoin9TkpP4oCA=;
	b=MggDrTe0YxRiIMpcZ0N4I9bZg2Ew3fij5iazoMGiBfYQhUeDliyn5DP2M7/HdDUGLQ
	3ZKZ0BcxWWW42qN37TSHFbsxfMdNRA9O3DAvzuSn7XysEMKJPmtOt/x0YtmcVKBpymcg
	5vHa2KkVt8+Qxy4PQRz4h6Q9X0IVvveSgZgL6O77LpO0mEMNsuvQ24Bk4QY/Fz2PYUV4
	bhNs5rWZnngN9sqmGck/X9MBZ6W8kSLQAfin0G/+sZyxcL+BiwT6Tkbw/U4xQZM/aWqG
	NJ+3SyHetowWXu6dVdERjDE8nbOJOiMGCaPKxK8N62h5Bb1BA1YqAlcARniYHmyFy8L/
	uqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=7GoM0+3+DV2m6KrcPYhvppzeiAc7zISoin9TkpP4oCA=;
	b=l7Dhm0aKvPIyDc5AhbvIRkHN5qUGc4HLI04mmkhQHS0Mv46L39K7aJ4e/lfX0JQsMK
	CZqHUqN+mBb8yinZCcVNMuiTT4j9UCQ8DTpqFGZVqupL/Ki77gBie+jz1GONebeTEotg
	m0L4irG7AD+CPsIRZSLqA5Q7roBFP/0nWyrzwHScpsGoh8JmoJlQpxqP3OSoEGCohJG5
	JtkCTzyQ7CR7ehrT3d75zg+RTJc4JUpbdixXqB+tzZe41urv/q0v7sBtAG822ulIPqok
	Yx0M5rrNqhz7sJhoANZTQKJ/yk6UQV0A1O31eCBXiZRe/iEx5RnP/KtevV5HOIsDb5J/
	GSGw==
X-Gm-Message-State: APjAAAWMY4e8tjirGttogY91Lz6AzWtyZfcHxlU7F0dCPY+sPsPM35VW
	ACbihjFOmJB1vR1k0dJZCJZQrdGCRa4=
X-Google-Smtp-Source: APXvYqydYCy+QigXp43+r1y05sfHvVVaWR6dnLTVdO6AXLBpS12i0uEFyjif5EKe+Fqkc2F/atIfQQ==
X-Received: by 2002:a17:902:7044:: with SMTP id
	h4mr5030674plt.274.1555695706710; 
	Fri, 19 Apr 2019 10:41:46 -0700 (PDT)
Received: from [192.168.69.121] (107-198-5-8.lightspeed.irvnca.sbcglobal.net.
	[107.198.5.8]) by smtp.gmail.com with ESMTPSA id
	p66sm12780866pfb.4.2019.04.19.10.41.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Apr 2019 10:41:45 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>, Alistair Francis <alistair23@gmail.com>
References: <20190413045641.3659-1-mike@foundries.io>
From: Michael Scott <mike@foundries.io>
Message-ID: <88e820e3-d8b5-e57e-5362-4e36b4799461@foundries.io>
Date: Fri, 19 Apr 2019 10:41:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190413045641.3659-1-mike@foundries.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-fitimage: support RISC-V
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
X-List-Received-Date: Fri, 19 Apr 2019 17:41:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 4/12/19 9:56 PM, Michael Scott wrote:
> Support RISC-V kernel image, using the "Image" target.
>
> This change allows RISC-V support for fitImage via the following
> flow: OpenSBI -> u-boot (as payload) -> Linux kernel (as fitImage
> with ramdisk and dtb).
>
> This was tested using QEMU RISC-V 64-bit.
>
> Signed-off-by: Michael Scott <mike@foundries.io>
> ---
>   meta/classes/kernel-fitimage.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 2517d75746..09abedff8e 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -8,7 +8,7 @@ python __anonymous () {
>           d.setVar("DEPENDS", depends)
>   
>           uarch = d.getVar("UBOOT_ARCH")
> -        if uarch == "arm64":
> +        if uarch == "arm64" or uarch == "riscv":

I didn't see any response to this v2 patch.  Is this approach 
acceptible?  RISC-V should not attempt to use zImage for fitImage as it 
now stands.

>               replacementtype = "Image"
>           elif uarch == "mips":
>               replacementtype = "vmlinuz.bin"

-- 
Michael Scott
Embedded Software Engineer at Foundries.io
"microPlatforms™ for Connected Products"
E: mike@foundries.io
W: https://www.foundries.io


