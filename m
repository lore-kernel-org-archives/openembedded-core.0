Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7B00B6D470
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 10:55:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n9so2065606wru.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 03:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=K3ZXXgsJ6sOJfaMz4D2nLz6NmbBhdroj+qO5ftPdepI=;
	b=W6EN7zRdApsp0kDItqd+GAHFyVQJN94lviGOMrMa0hKyDDObCOWJMKbn2a3B92mzFf
	NHYa7nn6g2W0/LVtZMmvvfZ2b1cvM6rUwwLXX5V1dkqbd+H82rHdLwlAAr1rxVK7ua+8
	F+RPYz5ohcquHrECtebyL62Whb2SJTDCX7QF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=K3ZXXgsJ6sOJfaMz4D2nLz6NmbBhdroj+qO5ftPdepI=;
	b=OxwWnCMvukwKVKn49k7Cvo0mns7e3OUwZId0Y7dvb1BAM0y4VEphbsFj3wfjD4bYfc
	RRPsLeFCXaR8mmGPEt3oX/MIKsX4yr+ZoxZ63nb0zShWTTXtj52ANiKzdByf/1KKtwbc
	vG0kWvDD5tzYBtF0E5X6Ar27RI8gg3EcTDX1EoAxkiLP4fYxH1dOyjasiyCx+njzRlob
	7AIFeZBzflKlTzXQW5I+kxm9hiVdNvHx2VaESNuXvYAReAwR82fyveOEI0kheeDMrxDb
	d67uNGAMoP4KlPDIKXB+eTXez0Q1LRmMWvCd3dyDXrFWe8gAo0XoJ/CPLuKCzg8TJUSJ
	RK5w==
X-Gm-Message-State: APjAAAXxVmUVpRyEymXSqbnV9vJvNkKuu2sd6JcLKn2oDn1gBNRa8IkL
	Opw5xRQSjI9rzfMGlZ6BHdC+qg==
X-Google-Smtp-Source: APXvYqyKURPHvo/plgSaZK8FskedxzffQWTnKw/DbAgZI+qp/N3MAoVNASDrHvbxKB37uw5YYYET8w==
X-Received: by 2002:adf:e3cc:: with SMTP id k12mr7242601wrm.159.1560509701103; 
	Fri, 14 Jun 2019 03:55:01 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id t6sm3928589wmb.29.2019.06.14.03.55.00
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 14 Jun 2019 03:55:00 -0700 (PDT)
Message-ID: <31526320140c91a4d7fde587a5e475e2071c00e0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 14 Jun 2019 11:54:59 +0100
In-Reply-To: <20190613201701.31014-2-alejandro.delcastillo@ni.com>
References: <20190613201701.31014-1-alejandro.delcastillo@ni.com>
	<20190613201701.31014-2-alejandro.delcastillo@ni.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] opkg: upgrade to version 0.4.1
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
X-List-Received-Date: Fri, 14 Jun 2019 10:55:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-06-13 at 15:17 -0500, Alejandro del Castillo wrote:
> - Drop 0001-libopkg-add-add-ignore-recommends-option.patch
> - Drop 0001-opkg-add-target-for-testsuite-installation.patch
> - Drop 0001-regress-issue72.py-resolve-paths-before-comparision.patch
> 
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
>  ...pkg-add-add-ignore-recommends-option.patch | 259 ----------------
> --
>  ...dd-target-for-testsuite-installation.patch |  43 ---
>  ....py-resolve-paths-before-comparision.patch |  31 ---
>  .../opkg/{opkg_0.4.0.bb => opkg_0.4.1.bb}     |   7 +-
>  4 files changed, 2 insertions(+), 338 deletions(-)
>  delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-libopkg-add-
> add-ignore-recommends-option.patch
>  delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-opkg-add-
> target-for-testsuite-installation.patch
>  delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-regress-
> issue72.py-resolve-paths-before-comparision.patch
>  rename meta/recipes-devtools/opkg/{opkg_0.4.0.bb => opkg_0.4.1.bb}
> (87%)

Unfortunately this doesn't quite build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/706

ERROR: opkg-1_0.4.1-r0 do_package: Fatal errors occurred in subprocesses:
Command '['arm-poky-linux-gnueabi-objcopy', '--only-keep-debug', '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/opkg/1_0.4.1-r0/package/usr/lib/opkg/ptest/tests/libopkg_test', '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/opkg/1_0.4.1-r0/package/usr/lib/opkg/ptest/tests/.debug/libopkg_test']' returned non-zero exit status 1
Subprocess output:arm-poky-linux-gnueabi-objcopy:/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/opkg/1_0.4.1-r0/package/usr/lib/opkg/ptest/tests/libopkg_test: file format not recognized

ERROR: opkg-1_0.4.1-r0 do_package: 
ERROR: opkg-1_0.4.1-r0 do_package: Function failed: split_and_strip_files

This might only be an issue on non-IA machines?

Cheers,

Richard




