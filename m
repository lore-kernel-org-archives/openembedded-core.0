Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 726F17FCD0
	for <openembedded-core@openembedded.org>;
	Mon,  6 Jan 2020 16:41:16 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id n59so7993067pjb.1
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 08:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=1s2et5BKuu9fYuTSGAe9ezLh366eGzouz4YSg7B3JjY=;
	b=nOBSus4kHrrubnOb8AWcD9THnNK2I2JgwW/bqTugeyGad00PQM9UfaXcOa13XDQxPs
	siVbhYF+pJrtrDIROFwfCTc+/w8RhFtpa0dKw4q0b1l+j7v6AvjWGdJRso5Vl15Z1cJu
	RRohn/angZsT7yun7VOruilwzXqJNRwFgV4CL3n5FeGt/6iH/yn+rSY5UUUztqgHk4oB
	ek7BXxdGkZ60UYE/J5tKlJOe2AqlsWWAnJGl1hq/Nrmas66qoUG1mMAnT+YJ1Sg+ztOn
	hcX2+7lu5XiQeEfYIx7Nx1uEyCdlZPwTKcFGDYw4GBKKhkO3TSps8pptZV4C3HiAWaZb
	FHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=1s2et5BKuu9fYuTSGAe9ezLh366eGzouz4YSg7B3JjY=;
	b=OLKvE2ZyT1m09UiN8L3lxpn+8tFE6DHPwDiygFXJJMXOpaPAL9Uf5fKmo626uZ5a18
	wCkaLJ87+AUP3ecqZJZOeXDs7GK2/ATH5qNqGjqM3HyWs43DkQ2W4dHFqJFb6O4TBqrr
	sW89gfZNWvDdkq16CqQWM+uid2nDk7IkAjefdlG13zyctpqYc54wbm0rUqd+n29qSDME
	8UmkVZkvRUKcUzSB0B4qBVUbtyzC7g4L1QQNTv+g5h1SV0xB5lMzWh19MP24TvTgT9+C
	lnei3ULqX4Ox9IcKARbBj+Sr2ot+g1Q4mIHbK2jFmOUxzf/mwV9JQ5jR2nPfCZivnLob
	s3SQ==
X-Gm-Message-State: APjAAAUAcoWMgBUIU1F/V8qt8OLF9lu5RWI0TEvEvbBd7YW6afwCE9PA
	sGAclyDnG29X1lF9PwGBWV9f7v4O
X-Google-Smtp-Source: APXvYqyrqx2IqweWqMVXYJo5D+lgy/cxuzgvWwb5bw2GjMIifEq1R82SJtpZjFwkrexZ9ICCYSvzPQ==
X-Received: by 2002:a17:902:b40a:: with SMTP id
	x10mr88925548plr.64.1578328877398; 
	Mon, 06 Jan 2020 08:41:17 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:6832:e19c:36b9:d5e?
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	m6sm24968084pjn.21.2020.01.06.08.41.16
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 06 Jan 2020 08:41:16 -0800 (PST)
To: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>,
	openembedded-core@openembedded.org
References: <1578308259-3821-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <67fe9737-2da4-e608-0781-9c650711e393@gmail.com>
Date: Mon, 6 Jan 2020 08:41:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1578308259-3821-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
Subject: Re: [zeus] tune-cortexa72-cortexa53: Add tunes
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
X-List-Received-Date: Mon, 06 Jan 2020 16:41:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/6/20 2:57 AM, Manjukumar Matha wrote:
> From: Joshua Watt <jpewhacker@gmail.com>
>
> Adds tunes for Cortex-A72 Cortex-A53 big.LITTLE SoCs (with and without
> crypto extensions), e.g. Rockchip RK3399

Adding something new fails outside the acceptable changes for a stable
release per current guidelines.
-Armin
>
> (From OE-Core rev: 78a555b324c30b2970eaa046c5d86de7980e678a)
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../machine/include/tune-cortexa72-cortexa53.inc   | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-cortexa72-cortexa53.inc
>
> diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> new file mode 100644
> index 0000000..0d43531
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> @@ -0,0 +1,23 @@
> +DEFAULTTUNE ?= "cortexa72-cortexa53"
> +
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specific processor optimizations"
> +
> +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> +
> +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "" ,d)}"
> +
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mtune=cortex-a72.cortex-a53", "", d)}"
> +
> +# cortexa72.cortexa53 implies crc support
> +AVAILTUNES += "cortexa72-cortexa53 cortexa72-cortexa53-crypto"
> +ARMPKGARCH_tune-cortexa72-cortexa53                  = "cortexa72-cortexa53"
> +ARMPKGARCH_tune-cortexa72-cortexa53-crypto           = "cortexa72-cortexa53"
> +TUNE_FEATURES_tune-cortexa72-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc}"
> +TUNE_FEATURES_tune-cortexa72-cortexa53-crypto        = "${TUNE_FEATURES_tune-armv8a-crc-crypto}"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa72-cortexa53"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72-cortexa53 cortexa72-cortexa53-crypto"
> +BASE_LIB_tune-cortexa72-cortexa53                    = "lib64"
> +BASE_LIB_tune-cortexa72-cortexa53-crypto             = "lib64"
> +


