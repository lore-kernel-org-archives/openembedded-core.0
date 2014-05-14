Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (unknown [209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5DDA465F99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 22:02:16 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id l13so222062iga.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 15:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=JTV2HrM9q7FCXL58dUnhLcIgyNnEccfeI1JLa0bJG34=;
	b=0WvO86lPUThUlljxBsHEntgHqar/KP6+lnmL8hd/0iTahp+b/xh+/iHMpHlJtqOYp0
	zsV6WX4959VtSDbBp+QxhiWrXOXfKEOLr0L70+FAo+k33hpg35xsA+Oaa5rKFRv+aAVM
	o2TTuubuT0jr6+AVksVxfaDA86VbU21PQn+R/a0GkulpGn/JTG43fK28x+Fc0QduP8xb
	6PBnX2GsjT5PQ70rb2Yx5GEJZhMYf0b9zEJn0ifJWxPuKBGgkMVsDwgdjdrmBU/ZGbtq
	G0/K6m5MEG5Ka9O62Ac4gbHo3dO3V3f3/jCWiRgY/DfFeqfGylu34gclyNQfVJnOCbla
	lzDQ==
X-Received: by 10.50.65.3 with SMTP id t3mr50534660igs.20.1400104937335; Wed,
	14 May 2014 15:02:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Wed, 14 May 2014 15:01:47 -0700 (PDT)
In-Reply-To: <1400101222-26332-1-git-send-email-andrea.adami@gmail.com>
References: <1400101222-26332-1-git-send-email-andrea.adami@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 May 2014 15:01:47 -0700
Message-ID: <CAMKF1sr0dy5m4kNEet2-JozQrBtcyfXKbKgOwc0+db=xprwdyQ@mail.gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mips: add tune file for mips32r2 (only hard-float)
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
X-List-Received-Date: Wed, 14 May 2014 22:02:18 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 14, 2014 at 2:00 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> Kernel and initramfs built and tested on GCW Zero (jz4770)
>

looks good to me.

> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta/conf/machine/include/tune-mips32r2.inc | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-mips32r2.inc
>
> diff --git a/meta/conf/machine/include/tune-mips32r2.inc b/meta/conf/machine/include/tune-mips32r2.inc
> new file mode 100644
> index 0000000..fb60592
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-mips32r2.inc
> @@ -0,0 +1,17 @@
> +DEFAULTTUNE ?= "mips32r2"
> +
> +require conf/machine/include/mips/arch-mips.inc
> +
> +TUNEVALID[mips32r2] = "Enable mips32r2 specific processor optimizations"
> +TUNECONFLICTS[mips32r2] = "n64 n32"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "mips32r2", " -march=mips32r2", "", d)}"
> +
> +AVAILTUNES += "mips32r2 mips32r2el"
> +
> +TUNE_FEATURES_tune-mips32r2 = "${TUNE_FEATURES_tune-mips} mips32r2"
> +MIPSPKGSFX_VARIANT_tune-mips32r2 = "mips32r2"
> +PACKAGE_EXTRA_ARCHS_tune-mips32r2 = "mips mips32 mips32r2"
> +
> +TUNE_FEATURES_tune-mips32r2el = "${TUNE_FEATURES_tune-mipsel} mips32r2"
> +MIPSPKGSFX_VARIANT_tune-mips32r2el = "mips32r2el"
> +PACKAGE_EXTRA_ARCHS_tune-mips32r2el = "mipsel mips32el mips32r2el"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

