Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 419BE78C8E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Aug 2018 15:12:32 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id 8-v6so29102984oip.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2018 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=zJMxQvbW+9Y/ZSOaUfOoTlB99obwXggsJzdTPBM5qWI=;
	b=Uv6G7ZSBYWS3Uhqf167VzXneXZgymTWmNmacqZ/9qKIQtO1gJAPPplR2Tg4xwtSxR1
	z+qEA1sDN7YTKVHNxTaXVUX2X4/SdaBvNMAT76OQfUUT4UKhr01MLaH/LcHniRzY8rmY
	zEin41mg6qcIgT6sS6U6pWG3pnKuQtw/0w1ukrJnXaYrziRi2sEBUcPPZwcsTGDycFjw
	qCjSFfGXiEZ3pA+w4kbMsgN09adr+pHcmsDPkQawkR+WYvkW3kZA5e/ubdU4AelM8UAc
	VLBg0zyCGgUdO09kCWAuTcrLXMNhhOyQHHXjwcOpW7MBvuKks3M4cy8VIYAzZelCYbI1
	z0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=zJMxQvbW+9Y/ZSOaUfOoTlB99obwXggsJzdTPBM5qWI=;
	b=AiWjhFcLsDfJAtHFx0RaB5xY9eNB+YzdZxp7FHt3F8gXQ5vp4jjws67rq5DvEhcB3W
	+6mC+IX+TDN0PwJs5U+O9twqN8pgwA7u970m11NKL6EQUeq1D46IaFREaQO/M5I6dd/j
	s/pC5s1BMn0ergqbn81+9VwCUCGtWlaqJo/1Ku4UzpM3tSHRqZmW8VomryoqPUqv1dA5
	ZUzIH8/Y2UdUMHjEZcfyG35ed5srL814VPw7pQona2HdqyRrGh77LGDUkYonbGEVTwe6
	zMP1UEFCb86/gxFUY+jbgNOKjjct3G1cM3a2CuBVJD7d8nEE4kPJjh/+hosZ+C5RjAFc
	AwPQ==
X-Gm-Message-State: AOUpUlHUKl2/swzx/saxiCBWwfZ9u669pgqyR0K162Zt/mFG++qlUg0n
	CE8NG68vBPuZj43ORDg7EdFEwWuA
X-Google-Smtp-Source: AAOMgpe+imfeFe1qgEKkumn/wUl6DFVh1Puewf365rqsn2mG07EkPVQtqQdPJTRBml0H9d6s7vIdKA==
X-Received: by 2002:aca:6206:: with SMTP id
	w6-v6mr18309573oib.201.1533654752926; 
	Tue, 07 Aug 2018 08:12:32 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:641d:8f98:9b24:337e?
	([2601:202:4180:c33:641d:8f98:9b24:337e])
	by smtp.gmail.com with ESMTPSA id
	e204-v6sm3447338oif.21.2018.08.07.08.12.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Aug 2018 08:12:32 -0700 (PDT)
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180807032109.10104-1-anuj.mittal@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <5dee0228-1a0c-fe71-8299-43a52296d10d@gmail.com>
Date: Tue, 7 Aug 2018 08:12:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180807032109.10104-1-anuj.mittal@intel.com>
Subject: Re: [rocko][PATCH] cryptodev: Fix build errors with v4.13+
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
X-List-Received-Date: Tue, 07 Aug 2018 15:12:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/06/2018 08:21 PM, Anuj Mittal wrote:
> From: Daniel Schultz <d.schultz@phytec.de>
>
> Without this compiles of 4.13 and later kernels fail.
>
> Backport from https://github.com/cryptodev-linux/cryptodev-linux
> Based on commit f0d69774afb27ffc62bf353465fba145e70cb85a
>
> (From OE-Core rev: 317fd9814653ee22496dda63a02e628e8a16899b)

I just pulled it in.
Thanks

>
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../cryptodev/cryptodev-module_1.9.bb         |  1 +
>  ...01-ioctl.c-Fix-build-with-linux-4.13.patch | 49 +++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch
>
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
> index 552eb6abaa..ed6d0ecae9 100644
> --- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
> +++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
> @@ -9,6 +9,7 @@ DEPENDS += "cryptodev-linux"
>  
>  SRC_URI += " \
>  file://0001-Disable-installing-header-file-provided-by-another-p.patch \
> +file://0001-ioctl.c-Fix-build-with-linux-4.13.patch \
>  "
>  
>  EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
> diff --git a/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch b/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch
> new file mode 100644
> index 0000000000..a41efacdd9
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch
> @@ -0,0 +1,49 @@
> +From f0d69774afb27ffc62bf353465fba145e70cb85a Mon Sep 17 00:00:00 2001
> +From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +Date: Mon, 4 Sep 2017 11:05:08 +0200
> +Subject: [PATCH] ioctl.c: Fix build with linux 4.13
> +
> +git/ioctl.c:1127:3: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
> +   {0, },
> +    ^
> +note: (near initialization for 'verbosity_ctl_dir[1]')
> +git/ioctl.c:1136:3: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
> +   {0, },
> +    ^
> +
> +Linux kernel has added -Werror=designated-init around 4.11 (c834f0e8a8b)
> +triggering build errors with gcc 5 and 6 (but not with gcc 4)
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +Signed-off-by: Cristian Stoica <cristian.stoica@nxp.com>
> +---
> + ioctl.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/ioctl.c b/ioctl.c
> +index 0385203..8d4a162 100644
> +--- a/ioctl.c
> ++++ b/ioctl.c
> +@@ -1124,7 +1124,7 @@ static struct ctl_table verbosity_ctl_dir[] = {
> + 		.mode           = 0644,
> + 		.proc_handler   = proc_dointvec,
> + 	},
> +-	{0, },
> ++	{},
> + };
> + 
> + static struct ctl_table verbosity_ctl_root[] = {
> +@@ -1133,7 +1133,7 @@ static struct ctl_table verbosity_ctl_root[] = {
> + 		.mode           = 0555,
> + 		.child          = verbosity_ctl_dir,
> + 	},
> +-	{0, },
> ++	{},
> + };
> + static struct ctl_table_header *verbosity_sysctl_header;
> + static int __init init_cryptodev(void)
> +-- 
> +2.7.4
> +


