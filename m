Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 29AEA60618
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2020 00:41:42 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id q127so4466497pga.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 16:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=B/GP+FS+ZqJrNDeAbSkj8shq6iwtqzilYXvcPjEh3tw=;
	b=PqeivU7MlmAImctEOIGSIi0/zZdVXvBaFJVCUtwgqjXWxMOwfJ7IlVtU2pQMWHHCbh
	qPUvI1RynfAVV9ZtlfDyjsa0ZAZzc8VAw3S9LH2wWMmaod3PcA+rRnJwjzsyRsCH0lJW
	KRoNAPbQwPNzl9dJi+O9gh+O9cW7xl1/MFGAhoHxR6u2KmGiYw7TK/qM0LL6oc7708kr
	Ff8h1h+34m++mwSwYcOWTP5IH74XCCcVRlF2J1c8bSXMTKGfQ/Tea+/rm9bcTRcwbTbK
	Z8W+P0uSxQ7YN7ZtiAwJvXHnLC0DNhn02tLF+e4VqmiM+UKZ2NKuvXvOQz27QqT+5UKD
	y6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=B/GP+FS+ZqJrNDeAbSkj8shq6iwtqzilYXvcPjEh3tw=;
	b=kMDPk8vmsQtZZypnGcpYJIm4PL7WwCQ89Db0XbYotG3HDcp5k0KkoftKo/P/wV0HG4
	XjIibnhB/IOcoN1v2D/EfaYzzVBLHKQlFRp5ZX6eA8CSwZrP1GVxaUwYYCqIUlMmyq+M
	jgsSSbSENd8emgTE8xOzUJrqVw8s9zU2l/kwtTW51xBzF67U0JkQ7DecOsfou6oZz7Qr
	GCbN+RG9uG12YMoFDvqbaRAcR6E7u94Pm5rL96UIy+XdTZuJnhSmOVSuE6lvEccuUyvW
	3XEqb8z/erpavPRWmrLYzdTy9HegxFQn1HOygMG9sWe/vyip9tWE2TIIZ+T7V2bUexYk
	iFFg==
X-Gm-Message-State: APjAAAVGJaB5TpsYKtBw1g3iNoIE51OWJZ6xH9zGAhdRqCVlUCFHYfOX
	Vl9t66e0mC8qIlS2IQJvicCBTJPr
X-Google-Smtp-Source: APXvYqzPuSD2n91X2DvRBifCmVugf/6u+K3Z9TYAyQpQD/AhHkhjfYEllclnwmJvxMy7khFaBPWg6Q==
X-Received: by 2002:a63:4702:: with SMTP id u2mr13119096pga.125.1580517702841; 
	Fri, 31 Jan 2020 16:41:42 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:e0e6:3e38:df8b:421b?
	([2601:202:4180:a5c0:e0e6:3e38:df8b:421b])
	by smtp.gmail.com with ESMTPSA id o1sm2545207pfg.60.2020.01.31.16.41.42
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 31 Jan 2020 16:41:42 -0800 (PST)
To: Mark Hatle <mark.hatle@kernel.crashing.org>,
	openembedded-core@lists.openembedded.org
References: <20200131233305.118454-1-mark.hatle@kernel.crashing.org>
	<20200131233305.118454-2-mark.hatle@kernel.crashing.org>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <afe2cf58-4b27-0279-6634-1bf9bd7cab66@gmail.com>
Date: Fri, 31 Jan 2020 16:41:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131233305.118454-2-mark.hatle@kernel.crashing.org>
Subject: Re: [PATCH v2 2/2] microblaze tune: cleanup +=
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
X-List-Received-Date: Sat, 01 Feb 2020 00:41:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/31/20 3:33 PM, Mark Hatle wrote:
> From: Mark Hatle <mark.hatle@xilinx.com>
>
> Various += were used, refactor these to be either = or .= depending on
> usuage.
what is in version 2?
>
> CONFLICTS should be '=', as no leading space is required and they are not
> amending any other conflict settings.
>
> The TUNE_CCARGS should be .= so that if the feature does not define a CCARG
> blank spaces are not added to the CFLAGS.  This is consistent to how the arm
> tuning is implemented.
>
> Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  .../include/microblaze/arch-microblaze.inc    | 22 +++++++++----------
>  .../microblaze/feature-microblaze-math.inc    | 12 +++++-----
>  .../feature-microblaze-versions.inc           |  2 +-
>  3 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/meta/conf/machine/include/microblaze/arch-microblaze.inc b/meta/conf/machine/include/microblaze/arch-microblaze.inc
> index fb777d929c..19cc2b59b9 100644
> --- a/meta/conf/machine/include/microblaze/arch-microblaze.inc
> +++ b/meta/conf/machine/include/microblaze/arch-microblaze.inc
> @@ -9,34 +9,34 @@ MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "64-bit", "microblaze
>  
>  # Endian
>  TUNEVALID[bigendian] = "Use Microblaze Big Endian"
> -TUNECONFLICTS[bigendian] += "v10.0"
> +TUNECONFLICTS[bigendian] = "v10.0"
>  
>  MBPKGARCH_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "eb", "el", d)}"
>  
> -TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "-mbig-endian", "-mlittle-endian", d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "bigendian", " -mbig-endian", " -mlittle-endian", d)}"
>  
>  # General features
>  TUNEVALID[barrel-shift] = "Enable Hardware Barrel Shifter"
>  TUNEVALID[pattern-compare] = "Enable Pattern Compare Instructions"
>  TUNEVALID[reorder] = "Enable Reorder Instructions"
> -TUNECONFLICTS[reorder] += "v8.00 v8.10 v8.20"
> +TUNECONFLICTS[reorder] = "v8.00 v8.10 v8.20"
>  
>  # Core configuration tune optimizations
>  TUNEVALID[frequency-optimized] = "Enabling tuning for frequency optimized core (AREA_OPTIMIZED_2)"
> -TUNECONFLICTS[frequency-optimized] += "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6"
> +TUNECONFLICTS[frequency-optimized] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6"
>  
>  # Feature compiler args
> -TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "barrel-shift", "-mxl-barrel-shift", "-mno-xl-barrel-shift", d)}"
> -TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "pattern-compare", "-mxl-pattern-compare", "-mno-xl-pattern-compare", d)}"
> -TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "frequency-optimized", "-mxl-frequency", "", d)}"
> -TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "64-bit", "-m64", "", d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "barrel-shift", " -mxl-barrel-shift", " -mno-xl-barrel-shift", d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "pattern-compare", " -mxl-pattern-compare", " -mno-xl-pattern-compare", d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "frequency-optimized", " -mxl-frequency", "", d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "64-bit", " -m64", "", d)}"
>  
>  # Disable reorder for v8.30 if pattern-compare is not enabled
> -TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "reorder", \
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "reorder", \
>          bb.utils.contains("TUNE_FEATURES", "v8.30", \
>              bb.utils.contains("TUNE_FEATURES", "pattern-compare", \
> -                "-mxl-reorder", "-mno-xl-reorder", d), \
> -            "-mxl-reorder", d), "-mno-xl-reorder", d)}"
> +                " -mxl-reorder", " -mno-xl-reorder", d), \
> +            " -mxl-reorder", d), " -mno-xl-reorder", d)}"
>  
>  # Feature package architecture formatting
>  MBPKGARCH_TUNE = ""
> diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-math.inc b/meta/conf/machine/include/microblaze/feature-microblaze-math.inc
> index a31516659c..cba0ae67e3 100644
> --- a/meta/conf/machine/include/microblaze/feature-microblaze-math.inc
> +++ b/meta/conf/machine/include/microblaze/feature-microblaze-math.inc
> @@ -13,14 +13,14 @@ TUNECONFLICTS[fpu-hard] = "fpu-soft"
>  TUNECONFLICTS[fpu-hard-extended] = "fpu-soft"
>  
>  # Compiler args
> -TUNE_CCARGS += "${@bb.utils.contains_any('TUNE_FEATURES', ['multiply-low', 'multiply-high'], '-mno-xl-soft-mul', '-mxl-soft-mul', d)}"
> -TUNE_CCARGS += "${@bb.utils.contains('TUNE_FEATURES', 'multiply-high', '-mxl-multiply-high', '', d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains_any('TUNE_FEATURES', ['multiply-low', 'multiply-high'], ' -mno-xl-soft-mul', ' -mxl-soft-mul', d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'multiply-high', ' -mxl-multiply-high', '', d)}"
>  
> -TUNE_CCARGS += "${@bb.utils.contains('TUNE_FEATURES', 'divide-hard', '-mno-xl-soft-div', '-mxl-soft-div', d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'divide-hard', ' -mno-xl-soft-div', ' -mxl-soft-div', d)}"
>  
> -TUNE_CCARGS += "${@bb.utils.contains('TUNE_FEATURES', 'fpu-soft', '', '', d)}"
> -TUNE_CCARGS += "${@bb.utils.contains_any('TUNE_FEATURES', ['fpu-hard', 'fpu-hard-extended'], '-mhard-float', '', d)}"
> -TUNE_CCARGS += "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard-extended', '-mxl-float-convert -mxl-float-sqrt', '', d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-soft', '', '', d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains_any('TUNE_FEATURES', ['fpu-hard', 'fpu-hard-extended'], ' -mhard-float', '', d)}"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'fpu-hard-extended', ' -mxl-float-convert -mxl-float-sqrt', '', d)}"
>  
>  # Set target fpu (bitbake known target) to soft or hard (basic or extended)
>  TARGET_FPU = "${@bb.utils.contains_any('TUNE_FEATURES', 'fpu-hard fpu-hard-extended', 'fpu-hard', 'fpu-soft', d)}"
> diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
> index 003fde3e07..6638accc98 100644
> --- a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
> +++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
> @@ -64,6 +64,6 @@ TUNECONFLICTS[v10.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3
>  TUNECONFLICTS[v11.0] = "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 v9.2 v9.3 v9.4 v9.5 v9.6 v10.0"
>  
>  # Version flags
> -TUNE_CCARGS += "${@'-mcpu=${@microblaze_current_version(d, True)' if microblaze_current_version(d, True) != '' else ''}"
> +TUNE_CCARGS .= "${@' -mcpu=${@microblaze_current_version(d, True)' if microblaze_current_version(d, True) != '' else ''}"
>  MBPKGARCH_VERSION = "${@'-${@microblaze_current_version(d, True)' if microblaze_current_version(d, True) != '' else ''}"
>  


