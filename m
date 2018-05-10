Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id DD3C27484C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 05:44:22 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id l2-v6so464084pgc.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 22:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=z0gBaKVZIcxq3cx/i2rpgKuYDzHAoNyK5gx7+NCTfWo=;
	b=cFXZ9Ujz14UXanf9kGN18opM7F7oQ7ZE+ewu6LpCRDm8SzlwTH1oeXISpnz2Jw3KCC
	tGsj3B2tRESAfGWAQC+4hezyyDWVG/NJJrhW9S++qWFc6A1rPiFGKeyIcK5p7RWM5neM
	GfSbceZy7P5j1TugFeeo0SjTgEBujxE/UpcxFAU6otK8z7aHyI/0FQL3/eBsMXDyURBI
	oq1l58PqT1QCm2+pthfl4l6V142Wxu9I7Tx9Wfdeb+k9tmDmm7x9L1wDrDB5MRDAvWUt
	vvcMFelsTkrl6ek/ldoye51kcA6cUkUtETQp7gErp5FvxjeFWJBECRCojPA+oADnymqj
	KAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=z0gBaKVZIcxq3cx/i2rpgKuYDzHAoNyK5gx7+NCTfWo=;
	b=W8YbOGpTricsWMBktjLAszfjID69IGt+HdBH2WBxj0xwtTWl2Kge9QE/31doXbx4CP
	ginL9t7Ycj69lNFtZn0SBy1DsV6sqBZxmKrpyYCrriZr7o2GhoQZC4Shm86hKISchXF9
	5of+i4MG8Rz3ITPnxlrSWFxWUhlpYu9lSoXmoRzxYwxYbFt5WvxIX8ZzGfIaZVtgSr59
	KZTEbDs47CaScsTxKWpM7sA8ynLtvPKdiqvBW50bKVqZqoXx0XLpWtNLCjYu8F+bwz2z
	QLbrU152UzQcVh9zI5eBfXvEDbVWHCo/1go5Wcus1GCA7c4kfCnzPHxPxBe57IRB7B2j
	fB7g==
X-Gm-Message-State: ALKqPwdNSWN8hfYuHi6c2dUcgbaBRNXXliITCfCZ/iNqZCBYbrErRl0D
	GSDd2HiMxBRM6Q/0u5ICT10zAACs
X-Google-Smtp-Source: AB8JxZrfUN4H1OMtgUALknsznRMGqu2nuVQ9VdXHIa7MFC6fqDn4urlq9c/oisYg/PxQvu/I3vAfHQ==
X-Received: by 2002:a62:8b92:: with SMTP id e18-v6mr53141pfl.60.1525931063339; 
	Wed, 09 May 2018 22:44:23 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:d4fd:d1d6:d3fa:558c])
	by smtp.gmail.com with ESMTPSA id
	n67sm64081738pfh.188.2018.05.09.22.44.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 22:44:22 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1525922097-15292-1-git-send-email-armccurdy@gmail.com>
	<1525922097-15292-3-git-send-email-armccurdy@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <86e5dada-7bd6-5cbb-95ff-0bf9ccdf0e1e@gmail.com>
Date: Wed, 9 May 2018 22:44:21 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1525922097-15292-3-git-send-email-armccurdy@gmail.com>
Subject: Re: [PATCH 3/3] bitbake.conf: drop _build-${BUILD_OS} over-ride
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
X-List-Received-Date: Thu, 10 May 2018 05:44:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/9/18 8:14 PM, Andre McCurdy wrote:
> Building on a host OS other than a recent version of Linux is not
> recommended or supported. Drop the historical _build-${BUILD_OS}
> over-ride to avoid giving the impression that other host OS's might
> be supported.

if this is not causing issues, I would suggest to keep this in.

> 
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>   meta/classes/cross.bbclass  | 1 -
>   meta/classes/native.bbclass | 1 -
>   meta/conf/bitbake.conf      | 2 +-
>   3 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
> index 4e85cab2..34d7951 100644
> --- a/meta/classes/cross.bbclass
> +++ b/meta/classes/cross.bbclass
> @@ -37,7 +37,6 @@ CPPFLAGS = "${BUILD_CPPFLAGS}"
>   CFLAGS = "${BUILD_CFLAGS}"
>   CXXFLAGS = "${BUILD_CFLAGS}"
>   LDFLAGS = "${BUILD_LDFLAGS}"
> -LDFLAGS_build-darwin = "-L${STAGING_LIBDIR_NATIVE}"
>   
>   TOOLCHAIN_OPTIONS = ""
>   
> diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
> index ad7e98a..ddccfe2e1 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -44,7 +44,6 @@ CPPFLAGS = "${BUILD_CPPFLAGS}"
>   CFLAGS = "${BUILD_CFLAGS}"
>   CXXFLAGS = "${BUILD_CXXFLAGS}"
>   LDFLAGS = "${BUILD_LDFLAGS}"
> -LDFLAGS_build-darwin = "-L${STAGING_LIBDIR_NATIVE} "
>   
>   STAGING_BINDIR = "${STAGING_BINDIR_NATIVE}"
>   STAGING_BINDIR_CROSS = "${STAGING_BINDIR_NATIVE}"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index a772cab..702f498 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -735,7 +735,7 @@ DISTRO_NAME ??= "OpenEmbedded"
>   #
>   # This works for  functions as well, they are really just environment variables.
>   # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
> -OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
> +OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
>   LIBCOVERRIDE ?= ""
>   CLASSOVERRIDE ?= "class-target"
>   DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
> 

