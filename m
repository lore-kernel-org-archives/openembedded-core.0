Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id CFE947C556
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 15:56:00 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id i8so7887377pgm.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 08:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=EvrVZczMwm4eKII3q1qG9ivoAaBdGYS8kmX9h13S+Js=;
	b=qVdLJkHWv5MdcC9GcKY2FjJVLgq08UaEP384EN59a9f/D+fydf8vcNIcm7j837xDjS
	l+Ejm9FMkfZY24UrMiADLdIm/aQf2om+A5X7tfGBW+4ICMjvGDXYuWa3VywnipZtJVgO
	4zZXpsWvluHwLg3yiEe/aYHppuOdzpUhR4diXIyocBLwU4/u22+1MXx9PNhaCwJj7mVD
	DIcdGGc+6loGKVuMA8IJFobXbLEgnsb+2tdHCf69PP90HsO2ZNlcP7qW2aR8YAvAsxOa
	b/Vua04vvtA6KEnii9BdVkkAUXCQBpeVNshyiJc6uWd4ZLZN07je22yr+UA2foWf1ASs
	46ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=EvrVZczMwm4eKII3q1qG9ivoAaBdGYS8kmX9h13S+Js=;
	b=BPukBP5+Hw2kO+7bNWtTIeua41ioxquPXq8NQIJpB784iMROf9mV4YBgTuPHZgjftY
	JTAlzib3Qfwhzw5mU5OWYZyxYX+3J+6Q9vrY7AbHQGi+OpMciRXj7sjXyC9Vi0USeSGP
	gmUBx7ghR2t1kMl/dOPgjgJ42Q7eGySsSXBxrqV/4FvDh9MvFJr74DSR1uJ1/usjyi6B
	PrnmMYmu+8t0vHpgl6wkQitqfGWCXhl2Y2+N8l+y6awpr5Kv1Lblwu3bQEU8y8V/tYWQ
	3dE3Z4nsri1BGeaNS74wudtTnxhEbSUdzC6ooyppgaWDDMBf3EcGULgabZnaakWM6EuD
	WqoQ==
X-Gm-Message-State: APjAAAU+zxnVW8gX8+F99YCt0vX0vaisRPooD09leMQ2gQbV5GF5Xts0
	/U6f2Qxgt80gjGB9l4YxzY15kMcKv+Q=
X-Google-Smtp-Source: APXvYqwpofhT8BnP/v/trUChNlQhpgAl7ZFeWE/wXnh/FykFMi98Pgnlai/SKMdwo1SBISrOF4SEOw==
X-Received: by 2002:a63:510a:: with SMTP id f10mr24216413pgb.435.1562601361505;
	Mon, 08 Jul 2019 08:56:01 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:693b:41d3:261b:3345?
	([2601:202:4180:c33:693b:41d3:261b:3345])
	by smtp.gmail.com with ESMTPSA id
	y11sm25359136pfb.119.2019.07.08.08.56.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jul 2019 08:56:00 -0700 (PDT)
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1562570956.git.Qi.Chen@windriver.com>
	<0dee845494880f0c201e79d6ee0f50390f183465.1562570957.git.Qi.Chen@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <bb6b7bb9-6e78-0b0d-62cd-2a67d86e13b8@gmail.com>
Date: Mon, 8 Jul 2019 08:55:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <0dee845494880f0c201e79d6ee0f50390f183465.1562570957.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] buildtools-tarball: add nativesdk-libxml2-utils
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
X-List-Received-Date: Mon, 08 Jul 2019 15:56:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/8/19 12:37 AM, Chen Qi wrote:
> For build-sysroots.bb, the xmlcatalog would not be in its
> staging directory. Causing the following error for eSDK.
>
> ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Command '/PATH/TO/IMAGE/testsdkext/tmp/sysroots/x86_64/usr/bin/postinst-docbook-xml-dtd4-native-xmlcatalog' returned non-zero exit status 127.
> ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Function failed: do_build_native_sysroot
>
> The problem could be reproduced by the following steps.
> 1. Add in local.conf:
>    IMAGE_INSTALL_append = " btrfs-tools"
>    DISTRO_FEATURES_append = " api-documentation"
>    INHERIT += "testsdk"
> 2. bitbake core-image-minimal -c populate_sdk_ext
> 3. bitbake core-image-minimal -c testsdkext

should these steps be added to eSDK tests?

- armin
>
> So we add nativesdk-libxml2-utils to buildtools-tarball
> to ensure the existence of xmlcatalog. Also add it
> to HOSTTOOLS_NONFATAL so it could be seen by bitbake.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/conf/bitbake.conf                       | 3 +++
>  meta/recipes-core/meta/buildtools-tarball.bb | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 5e93f5c..2f64eae 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -517,6 +517,9 @@ HOSTTOOLS_NONFATAL += "scp"
>  # Link to git-lfs if present
>  HOSTTOOLS_NONFATAL += "git-lfs"
>  
> +# build-sysroot needs xmlcatalog in order for eSDK installation
> +HOSTTOOLS_NONFATAL += "xmlcatalog"
> +
>  CCACHE ??= ""
>  
>  TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> index 91df6f1..d39d6f7 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -25,6 +25,7 @@ TOOLCHAIN_HOST_TASK ?= "\
>      nativesdk-texinfo \
>      nativesdk-libnss-nis \
>      nativesdk-rpcsvc-proto \
> +    nativesdk-libxml2-utils \
>      "
>  
>  MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"


