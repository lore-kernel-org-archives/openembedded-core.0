Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id B26A5606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 14:41:03 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i6so3613187pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 07:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:references:to:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=fcANhlhba5TZ5Kc3+PHiPe0+83TJVhEbDZx25SXJxpE=;
	b=CIz5pK97purGPEab3KvFtvIMoaaxRL07jgNtHcFYSMzi//P+xcJCrEYTqxsTSpuqxZ
	w3fPol7AM9KdAtErjymU2VEP3IKsUzVEOc++qNiHitst/oynAwO4T2eh09+Bpbz78COw
	MYRpizHAoAG2YLspnEgwnDQrZe/8TpB/PJMIXpghcevMOC7z0fPziJ7S+YR+7lfFkHto
	9+KgPdoGsP9kM23wNVEOai6RyDyZt/ZIkC2uzLa61mUuqIohmSRnoKEfUcB1LDMlgKUF
	CquN1QATpspOcwwisSp5W5piwJXrz78uFaxAtcImts+Cf91ZH2zKMv6udw3pmEQl1CH+
	r52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:references:to:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=fcANhlhba5TZ5Kc3+PHiPe0+83TJVhEbDZx25SXJxpE=;
	b=kMqMmtem4yHCO939Ff0rLK1Uvf/rgsYHbzGAZSLJYWdtsiJEp9XOPFbkGWeEISMgCw
	NibmTsSpniIurCa6ZKuipyWIC+7Bu2fxW3O1/7WzYzw5FRCkaAY1s9DXJPd4eMI0PpJZ
	h/EVivJeRqHVpf+vK3N3JR5DzkcXFzmj4nCgbO/kPi9qF9kDCWvuNQl7tzTNpc7iygBW
	/3noTKMgOn/t+qX1W7DGXz/Ck4MPjac8JEYCXJUmcU3CNJgfjRai9wvhMJlmYzsKN69Z
	tdXvkJHk3DT3jT+aEyND3Wmpl7qMus0fBUbc0I70fEFd5pJSNfUTdtM2ZeAPg/+wlV3v
	1n5Q==
X-Gm-Message-State: ALyK8tL6eRoFKH4z2nVCYBKQZl4bKg1XxSiNFNTCB8vr13AwUgGmINoqYc12h8uK1XxP0w==
X-Received: by 10.98.11.133 with SMTP id 5mr64424232pfl.160.1469025663713;
	Wed, 20 Jul 2016 07:41:03 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:81a:ab00:ca81:5385?
	([2601:202:4001:9ea0:81a:ab00:ca81:5385])
	by smtp.googlemail.com with ESMTPSA id
	ya6sm5309298pab.22.2016.07.20.07.41.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jul 2016 07:41:02 -0700 (PDT)
References: <1467043538-18722-1-git-send-email-akuster808@gmail.com>
	<1467043538-18722-2-git-send-email-akuster808@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <578F8D7D.2030503@gmail.com>
Date: Wed, 20 Jul 2016 07:41:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1467043538-18722-2-git-send-email-akuster808@gmail.com>
Subject: Re: [PATCH] build summary: add TCMODE to build summary
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
X-List-Received-Date: Wed, 20 Jul 2016 14:41:03 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

I noticed this patch was being carried in mut builds and no is missing.

does that mean this is rejected?

- armin

On 06/27/2016 09:05 AM, Armin Kuster wrote:
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index c68e476..017dbbf 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -650,7 +650,7 @@ PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"
>  
>  # Pre-build configuration output
>  BUILDCFG_HEADER = "Build Configuration:"
> -BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU GCC_VERSION"
> +BUILDCFG_VARS = "BB_VERSION BUILD_SYS NATIVELSBSTRING TARGET_SYS MACHINE DISTRO DISTRO_VERSION TUNE_FEATURES TARGET_FPU GCC_VERSION TCMODE"
>  BUILDCFG_VARS[type] = "list"
>  BUILDCFG_NEEDEDVARS = "TARGET_ARCH TARGET_OS"
>  BUILDCFG_NEEDEDVARS[type] = "list"
> 

