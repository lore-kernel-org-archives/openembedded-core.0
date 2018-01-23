Return-Path: <raj.khem@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4848B7852C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 22:01:55 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id a28so1457167oiy.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=0TDsYmgIWf51NyOPRuwRLt2+KXUkrBvl5VLZ7XleLI4=;
	b=Xzfy8eUtozWJ9RM9LaWCYcVrwCOHbPBOQSV8E0oWPvKnVt+a9v71pRcfOk+Ii02qlk
	KQNXMEiWzu5dsbwls5xyXcqkEx+Xgq2SFsoqcYmoNMRC8gokMsS1o4xaCZONYbhQ70Q3
	zDmiUmX+Ce4l0wm8pZyVnkws0klc5163sSXeCAZdTgMv9W2+QhrFCz51+XLZ1dex+j8T
	3CWFF+POH7xG2d4Vv+7vw3l/avkcpW44wUYYJXolNjONuqgHsgMAX6UzgC9Sn68b6Pc5
	ECp8ocUFNCpKWXw/4ppndS1WASXGdvAyq3A+fz91v1FIPeMt8eyGa285wr8BrWS17Q1O
	yxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0TDsYmgIWf51NyOPRuwRLt2+KXUkrBvl5VLZ7XleLI4=;
	b=rcjX9hJkDyFnkNdB/Wv/xDIJTafaacvU3hKQGLm+Af2hhsYeD697MJpllxq10qbLhV
	ujzOpPt4GA4NXucrY3Wga8mt1kNbbVC1l+WFJZIj++FIvy8OWoreg4JQeVuul7uAuwQk
	pTqE4nh3qYSj5l1NGXCPqYG4vz7Go0J3x39OhyWGvmK84KbiAkdjU5BTinFuqu0xf+MP
	PxxO8ftQ9/4PM3HeKQe7lJyzHKSURlDMiucAbCeUJQRxWlwEsO9nLGWTFwKTyzM41dTN
	PU4a1tPv7468nnFZBDgUdW4t7QTl2PCOKwIsM3bbzVp+LBPokrhaeA0NBwIZIBEmz2h3
	lxfg==
X-Gm-Message-State: AKwxytepfqHKZIrX5FWRxITkZe83z1aVnMx2SkFYnTAoD4NWb8j8TxbC
	2MLEkBeLAr9bf5Bji/qexZkeqNPU
X-Google-Smtp-Source: AH8x225IpFaman+LDkvbuwzb5PYgJ1UdiFQ2AdYtEt0cXilow5lfT2/p//GzDQcZdQv7/uY51EZXlQ==
X-Received: by 10.202.180.133 with SMTP id d127mr7618216oif.328.1516744916588; 
	Tue, 23 Jan 2018 14:01:56 -0800 (PST)
Received: from [172.27.88.30] ([217.140.111.136])
	by smtp.gmail.com with ESMTPSA id y2sm635025oty.76.2018.01.23.14.01.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jan 2018 14:01:55 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1513200676-59900-1-git-send-email-juro.bystricky@intel.com>
	<1513200676-59900-2-git-send-email-juro.bystricky@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <cd2f3d6c-a67e-1cbd-ae34-0d171597d80c@gmail.com>
Date: Tue, 23 Jan 2018 16:01:55 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <1513200676-59900-2-git-send-email-juro.bystricky@intel.com>
Subject: Re: [PATCH 1/4] compiler-options.bbclass: provide and validate options
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
X-List-Received-Date: Tue, 23 Jan 2018 22:01:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/13/17 3:31 PM, Juro Bystricky wrote:
> As we may be using external toolchains, we cannot assume
> various compiler options to be valid.
> 

While looking through my backlog :),  I think the idea is fine but
implementation can be a bit more generic. e.g. a common function to
probe the compiler for a given option then adding/removing it from
compiler commandline.

> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/classes/compiler-options.bbclass | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta/classes/compiler-options.bbclass
> 
> diff --git a/meta/classes/compiler-options.bbclass b/meta/classes/compiler-options.bbclass
> new file mode 100644
> index 0000000..fdd45e8
> --- /dev/null
> +++ b/meta/classes/compiler-options.bbclass
> @@ -0,0 +1,24 @@
> +
> +# Some compiler options are not universal and using them when not
> +# supported can cause build errors.
> +#
> +# Check for a compiler option -ffile-prefix-map.
> +# This option is present in OE-core GCC, but may not be present when
> +# using external toolchains.
> +#
> +# The option can remap any hard-coded __FILE__ typically containing build
> +# host path to a reproducible value, with the absolute build-host path
> +# stripped. This is essential in order to achieve reproducible builds.
> +#
> +# Typical usage:
> +#
> +#    inherit compiler-options
> +#    cc_extra=$(file_prefix_map_option_supported ${CC})
> +#    oe_runmake CFLAGS="${CFLAGS} $cc_extra"
> +#
> +
> +file_prefix_map_option_supported () {
> +	if $1 -Q --help=joined | grep -q "\-ffile-prefix-map=<old=new>"; then
> +		echo "-ffile-prefix-map=${S}=/${BP}/"
> +	fi
> +}
> 


