Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13547.1793085860512993331
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 00:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tz3yWZ5B;
 spf=pass (domain: linaro.org, ip: 209.85.214.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e95bd1c14cso33874265ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 00:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793085860; x=1793690660; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wiujvZQNX+VEUZG5ac0F0v+q+e9sUryxfhw8B1x9XC8=;
        b=tz3yWZ5B5jtQrtaK7XygvtXHyV9zBEKEYkJfEyhnfgoPHL4D28ljYIc6SRvrV1AB4k
         JtOwsM3BtVhG/qJDLhtPqxMEHlP//c240ZpS78oEM02RVb44pGUUrS8nm1HLYXKy1f1f
         ue0zJxpLTn0GUzzr9+xFS7FwHYTAflm25uM9aVv7TUeHRtqMzvYcEe+Fx3OfGSVIe1RH
         UMR5a7yRtDcRuW2y7QXtBHrCCvUSpNTH1b9nzoufJ8KMcJWnlUkPdjf2k2eHHRC4rYTj
         LjJ4O9BTSl6iAqvO6lFusC6Bllkfg6XeSCzsBHDcfh7ycP1BeQELeU/bP7HqgLQlwy7u
         hT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793085860; x=1793690660;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wiujvZQNX+VEUZG5ac0F0v+q+e9sUryxfhw8B1x9XC8=;
        b=fWEmqjnc+Qs4LfdzVVeUsTCkJeAWbE2MnumxNBvGbz04Dm6kpCJWK1C+d+ViIiwR98
         5+s2K+LhIbJ3V/liSurfZtR5+07UAcYyuHaW91YW6qcEXNcDcVvaw0LDSkOcPzjXLeqf
         TuP3kEoqGIHUDkcbUPgpx3ItPKdeboSjxAb1UE1igyYprBjVd3K45L9GrP44iihnJdd3
         Kab8egtjhaJj4xYe6mrBZRd+XhA2quNtz0XiwKyXjx4B7EwOS8ZOoBVJaKwVhso+Io9W
         hN/S6/ni9xEE7nD0AyhvhoAV8GcsHzv73COHiYHLONOZdl7sbZmXVlrepHATYlHqEuom
         aPCA==
X-Gm-Message-State: AFq9FYKE5h4HWY01pkFKrC4sogIfRxVlGH4r0dixyqsRauCW8ADt/eTD
	W5DA5Xxcv2hmKBZGErjstyO8rlrhgy5oGHhxOxHa2i/pi4lytsFkSH9Mc/6BlFAl8oTEkoHlice
	MhSjaHaI=
X-Gm-Gg: AYBFou3ncgFCnVT9FQu86BVBhssPcoNVij3oEhMUNZeXVfMOU+uM5GUqs/CrI+wq4sd
	lPTqg8j303yfLW2xNeoUTAtxZVFRn40FlA33xeR7egeSSlDbz/nCdUMYOQYoTCyo4KfY1P2XAqY
	ew8c2DT+7tIMAdO8o/PUChPSCVZ4uFJzIj74N9fu2jTJ/bz3xi+8g75IPTgqY7NvWFyUMJXvqw3
	dbzs02nYl7MaEYZoU3T0HCHnT7wNFmFUVtGl3vFrKQDzSMtTvSTF7pKP28xuwJTr9TnrRTDeUiP
	dnCkBtgLJnHddq6N4B62/F+OJJGtEyLsN6WqHRybB8Zj5t+uaQ6WsGabaFm/UziPXAt3cI+YFg/
	NxfLg75kEQmlKpZu3DkjcodThvA2FHzYlkDzPRbOnSF3rdd3S9hmHN3V8vWHXKjrwPLS+9sC8NP
	GWBogblXpdd+wV8yM0jJMfUnvqwlJrhfrqDMVtn82qPdUC1Exqox++eALyD5ZskUh/+8I8+8dnp
	M7ELAFqzQQ5bb6TGzezrmPtCt/qdeVdTjDsgsCzjen4YZLPjl+ArL26VR5FK/Kh9BZ1l6ZKsC4Q
	KNrBM28=
X-Received: by 2002:a17:90b:2642:b0:3ac:9df3:6b07 with SMTP id 98e67ed59e1d1-3adead488demr7529876a91.24.1793085859692;
        Tue, 27 Oct 2026 00:24:19 -0700 (PDT)
Return-Path: <mikko.rapeli@linaro.org>
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40451f4bsm2451488a91.10.2026.10.27.00.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:24:19 -0700 (PDT)
Date: Tue, 27 Oct 2026 09:24:15 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: JPEWhacker@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH v5 5/6] Add SPDX deploy tasks to various recipes
Message-ID: <auBRnwhMKmTkFpQB@nuoska>
References: <20260630210422.1903245-1-JPEWhacker@gmail.com>
 <20261026214627.2388650-1-JPEWhacker@gmail.com>
 <20261026214627.2388650-6-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026214627.2388650-6-JPEWhacker@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 07:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248711

On Mon, Oct 26, 2026 at 03:45:25PM -0600, Joshua Watt via lists.openembedded.org wrote:
> Adds SPDX deploy tasks to many recipes to record their output when
> consumed in an SBoM

I think this should be the default in deploy.bbclass.

The class is used to deploy files to "build output". A lot of BSP etc
recipes use the class for this purpose and they are currently missing in SPDX
output unless some output packages go to image rootfs.

I think capturing too much data in SPDX is less of a problem than not capturing
enough. Thus deploy.bbclass should support SPDX output by default, when SPDX
is enabled.

If there are other very good reasons for not enabling this by default, then
I think the commit message should say that.

Cheers,

-Mikko

> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes-recipe/barebox.bbclass           | 1 +
>  meta/classes-recipe/devicetree.bbclass        | 1 +
>  meta/classes-recipe/kernel-fit-image.bbclass  | 1 +
>  meta/classes-recipe/kernel.bbclass            | 1 +
>  meta/recipes-bsp/grub/grub-efi_2.14.bb        | 1 +
>  meta/recipes-bsp/opensbi/opensbi_1.9.bb       | 1 +
>  meta/recipes-bsp/u-boot/u-boot.inc            | 1 +
>  meta/recipes-core/systemd/systemd-boot_262.bb | 2 +-
>  8 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-recipe/barebox.bbclass
> index 3980849b53..252e97fa65 100644
> --- a/meta/classes-recipe/barebox.bbclass
> +++ b/meta/classes-recipe/barebox.bbclass
> @@ -165,5 +165,6 @@ barebox_do_deploy () {
>          fi
>  }
>  addtask deploy after do_compile
> +SPDX_DEPLOY_TASKS += "do_deploy"
>  
>  EXPORT_FUNCTIONS do_configure do_compile do_install do_deploy
> diff --git a/meta/classes-recipe/devicetree.bbclass b/meta/classes-recipe/devicetree.bbclass
> index 4fe389bed8..affbf115c2 100644
> --- a/meta/classes-recipe/devicetree.bbclass
> +++ b/meta/classes-recipe/devicetree.bbclass
> @@ -166,6 +166,7 @@ devicetree_do_deploy() {
>      done
>  }
>  addtask deploy before do_build after do_install
> +SPDX_DEPLOY_TASKS += "do_deploy"
>  
>  EXPORT_FUNCTIONS do_compile do_install do_deploy
>  
> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
> index 7b2bcd4673..d0f7274e70 100644
> --- a/meta/classes-recipe/kernel-fit-image.bbclass
> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> @@ -260,3 +260,4 @@ do_deploy() {
>      fi
>  }
>  addtask deploy after do_compile before do_build
> +SPDX_DEPLOY_TASKS += "do_deploy"
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> index 0a6d754108..14c71dec54 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -840,6 +840,7 @@ kernel_do_deploy() {
>  do_deploy[prefuncs] += "read_subpackage_metadata"
>  
>  addtask deploy after do_install do_populate_sysroot do_packagedata
> +SPDX_DEPLOY_TASKS += "do_deploy"
>  
>  EXPORT_FUNCTIONS do_deploy
>  
> diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb b/meta/recipes-bsp/grub/grub-efi_2.14.bb
> index d19b33b504..8d8671614a 100644
> --- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
> +++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
> @@ -99,6 +99,7 @@ do_deploy() {
>  }
>  
>  addtask deploy after do_install before do_build
> +SPDX_DEPLOY_TASKS += "do_deploy"
>  
>  FILES:${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
>                 ${datadir}/grub \
> diff --git a/meta/recipes-bsp/opensbi/opensbi_1.9.bb b/meta/recipes-bsp/opensbi/opensbi_1.9.bb
> index 96167f7c73..bb35f906b2 100644
> --- a/meta/recipes-bsp/opensbi/opensbi_1.9.bb
> +++ b/meta/recipes-bsp/opensbi/opensbi_1.9.bb
> @@ -49,6 +49,7 @@ do_deploy () {
>  }
>  
>  addtask deploy before do_build after do_install
> +SPDX_DEPLOY_TASKS += "do_deploy"
>  
>  FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_jump.*"
>  FILES:${PN} += "/share/opensbi/*/${RISCV_SBI_PLAT}/firmware/fw_payload.*"
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index b9f61a185c..1c9911ff6e 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -474,3 +474,4 @@ uboot_deploy_spl () {
>  }
>  
>  addtask deploy before do_build after do_compile
> +SPDX_DEPLOY_TASKS += "do_deploy"
> diff --git a/meta/recipes-core/systemd/systemd-boot_262.bb b/meta/recipes-core/systemd/systemd-boot_262.bb
> index bab2e7ae27..c9bc3e2a91 100644
> --- a/meta/recipes-core/systemd/systemd-boot_262.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_262.bb
> @@ -71,4 +71,4 @@ do_deploy () {
>  }
>  
>  addtask deploy before do_build after do_compile
> -
> +SPDX_DEPLOY_TASKS += "do_deploy"
> -- 
> 2.56.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248698): https://lists.openembedded.org/g/openembedded-core/message/248698
> Mute This Topic: https://lists.openembedded.org/mt/121950655/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

