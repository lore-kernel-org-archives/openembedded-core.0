Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 08E117DFE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 16:15:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f8so17374582wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 09:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=CUyTct0rHhL1cUVnUTOMl7IxU3rLt4ImTSyyAFW2T6s=;
	b=fzDJ8FEcnC1CyAVt2WyodLADd3brSAwsp7GD8io2KHFcAUgFs0vM1ECOPA1GhE2JCr
	/106+zIhuguTD68BisGmiYQ2mH2fKDiKYn2/N4BLcl7cSYlfxjKLrqFXcPlApIxHAKen
	+vBw61ayd/AiFTrGiaFA+VZXblvLWvHB1j+vM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=CUyTct0rHhL1cUVnUTOMl7IxU3rLt4ImTSyyAFW2T6s=;
	b=LhdCEAD+Lkzw//01BmG0u90OwD0IzCeT8mtlAsP/VQi6tpDfPDeg9RRz1cACInFV5I
	60/wTrjADlVz3swdm2AAbcow4+db4gQtRbPv1JGlNN9DDC2TiibCUHE5sz9Ki+diy3EY
	2ti6pPPMEn2RIDBhH31l/mEyh3dqMqPugo5wQwf5h/rycEcAVIrGWrT24Q1RGd1vXTvk
	KJHcPLVxCeMAz8SvfF+jakqks7g9s2hZBd7zXrZZAN7MGR2u0BrMRBnvilEtEYjbmA2D
	qyMLXPD8Tyq846TK66IGb7B8huuR7TRRArBhJMF/HX4G6iNg1pQDwDNq4ok2nWOyx4rk
	ZORw==
X-Gm-Message-State: APjAAAWFJaPi04yLo9MnbyK67OTHNoNT2tPydvKQlQJeHBV2C0qvNcCU
	YdKXj0MGxQztju93dCmvmPI8lA==
X-Google-Smtp-Source: APXvYqw5ENC9l0zqvOzM6HS/MIx5jg5AGUavdDzA4NhWIKWfSAxMloC6h27BxUB18eREX/zVBXLn2g==
X-Received: by 2002:a5d:54d1:: with SMTP id x17mr58437646wrv.207.1558973724511;
	Mon, 27 May 2019 09:15:24 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q15sm10785568wrr.19.2019.05.27.09.15.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 27 May 2019 09:15:23 -0700 (PDT)
Message-ID: <c9203159ca69c2a880e40180f994770c175c4553.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: chee.yang.lee@intel.com, openembedded-core@lists.openembedded.org
Date: Mon, 27 May 2019 17:15:21 +0100
In-Reply-To: <1558920407-2991-1-git-send-email-chee.yang.lee@intel.com>
References: <1558920407-2991-1-git-send-email-chee.yang.lee@intel.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] wic: bootimg-efi: add label source parameter
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
X-List-Received-Date: Mon, 27 May 2019 16:15:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-05-27 at 09:26 +0800, chee.yang.lee@intel.com wrote:
> From: Chee Yang Lee <chee.yang.lee@intel.com>
> 
> Add new source parameter label to allow boot.conf/grub.cfg label option
> to set as "install-efi", so far it's hardcoded to "Boot".
> 
> The label remain to "Boot" for systemd-boot or blank for grub-efi whenever
> label are not "install-efi".
> 
> when label set to "install-efi" the image can boot into image installation.
> 
> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index 652323f..9b324d3 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -72,9 +72,14 @@ class BootimgEFIPlugin(SourcePlugin):
>              grubefi_conf += "menuentry '%s'{\n" % (title if title else "boot")
>  
>              kernel = "/bzImage"
> +            label = source_params.get('label')
>  
> -            grubefi_conf += "linux %s root=%s rootwait %s\n" \
> -                % (kernel, creator.rootdev, bootloader.append)
> +            if label == "install-efi":
> +                grubefi_conf += "linux %s LABEL=%s rootwait %s\n" \
> +                    % (kernel, label, bootloader.append)
> +            else:
> +                grubefi_conf += "linux %s root=%s rootwait %s\n" \
> +                    % (kernel, creator.rootdev, bootloader.append)

I could be missing something as I don't know the wider code but
wouldn't it make more sense to have:

label = source_params.get('label')
label_conf = "root=%s" % creator.rootdev
if label:
    label_conf = "LABEL=%s" % label

grubefi_conf += "linux %s %s rootwait %s\n" \
    % (kernel, label_conf,
bootloader.append)

Which would then allow custom labels rather than a special case magic 
value? (and also reduce code duplication)

Cheers,

Richard


