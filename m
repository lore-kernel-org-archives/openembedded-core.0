Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id D9F05611E1
	for <openembedded-core@openembedded.org>;
	Tue,  3 Mar 2020 21:17:35 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id h3so5297565ioj.6
	for <openembedded-core@openembedded.org>;
	Tue, 03 Mar 2020 13:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XYOPJwo8PzaHuWVnlbtzGXTzxzR1dm6m58+MfpWm5To=;
	b=JrfRsX0Ha3G7BcE96B2GX8dMmEjU2KpwAClTnkMOiBVSzFck+AkVoVKyTvqgx6RbVO
	HdlHUVE//FLluJHQnWnYcIdQY+G5fLBYd1q7N9uJvbqnbZFJq2vUK4oOthzIScqhxl3m
	Xl73JuVJulf6PUMUfdIiVlcc7SsdqbDeQlQ0rszQThOscrS/sGKVf0jQ6w8LQh16kNiQ
	9KVIM7DZ7n+Mo+/L7eO/Uyxt3cpDnYDpguVjcHFkcgn7pKrDAmSXWrCAaKUaIlo9IEzn
	CQAxWyDhi7P9wcXOILfQmo75mi37ZlPpFbEw7cp5A3dVD1QiS9TInkoNzS+sT6aTzTKJ
	krag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XYOPJwo8PzaHuWVnlbtzGXTzxzR1dm6m58+MfpWm5To=;
	b=C6XkQ5AXWczicqe5W1psIdiKRGJj68NQ5xzWfMUDqGtJe2KKp+E7gwIdKMM6KlxRMV
	EMnEjJAA8Y5g43Z6ZsLB+7dKWgiK0I3qljBHO28DGSuLvnhHepYW70PU3QlnPwJ53/Xz
	pR3ANKlsV1Sid/MxA82Sn+B4qJSMtq9zuh8r4rMiF1tICVeq6QWUDRP4I2hKWh12Ru4K
	eXEHjbgA0C5bj7Hm0SqxYcn109wo0TljiKRHpGF0Vu48LhZS29zTVyAKsapT8h1kls5u
	WirEJTqnv/3ieZTswooojFBaUkxd3hBz9ztdOGm9PVRFC0d2cQWBllu9EjMZ3Vr5jO7i
	LdzQ==
X-Gm-Message-State: ANhLgQ0lRPE9DQ012apofRNnaX7W2jCaiZa8b02O9HyFfplISWz8SY1E
	EIysw/VpDxb3Kw0cIHPzrZ4=
X-Google-Smtp-Source: ADFU+vuYZSu3VlFh8sks4aTWo+W118lFUv3SX+mlM+1vQvL1bUkN2B9I+qpT1O5dTaC5od8HvzThDQ==
X-Received: by 2002:a05:6638:1b4:: with SMTP id
	b20mr5483213jaq.119.1583270256020; 
	Tue, 03 Mar 2020 13:17:36 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:31ff:997f:e0c7:a3a0?
	([2601:646:9200:4e0:31ff:997f:e0c7:a3a0])
	by smtp.gmail.com with ESMTPSA id
	x87sm8261839ilk.39.2020.03.03.13.17.35
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 03 Mar 2020 13:17:35 -0800 (PST)
To: Armin Kuster <akuster808@gmail.com>, openembedded-core@openembedded.org
References: <20200303210903.29570-1-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <8f852a36-aa41-7f75-0f57-7d82fd19377e@gmail.com>
Date: Tue, 3 Mar 2020 13:17:34 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303210903.29570-1-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [v2][PATCH] libuv: move from meta-oe to core for bind update
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
X-List-Received-Date: Tue, 03 Mar 2020 21:17:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Please send removal for meta-oe as well, once its merged in core, 
otherwise meta-oe will override it.

On 3/3/20 1:09 PM, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> 
> [v2]
> Add maintainer
> Update to newer version in meta-oe
> ---
>   meta/conf/distro/include/maintainers.inc      |  1 +
>   .../libuv/libuv_1.34.2.bb                     | 19 +++++++++++++++++++
>   2 files changed, 20 insertions(+)
>   create mode 100644 meta/recipes-connectivity/libuv/libuv_1.34.2.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 10095ffe76..d724148014 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -392,6 +392,7 @@ RECIPE_MAINTAINER_pn-liburcu = "Alexander Kanavin <alex.kanavin@gmail.com>"
>   RECIPE_MAINTAINER_pn-liburi-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
>   RECIPE_MAINTAINER_pn-libusb1 = "Anuj Mittal <anuj.mittal@intel.com>"
>   RECIPE_MAINTAINER_pn-libubootenv = "Stefano Babic <sbabic@denx.de>"
> +RECIPE_MAINTAINER_pn-libuv = "Armin Kuster <akuster@mvista.com>"
>   RECIPE_MAINTAINER_pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
>   RECIPE_MAINTAINER_pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
>   RECIPE_MAINTAINER_pn-libvorbis = "Tanu Kaskinen <tanuk@iki.fi>"
> diff --git a/meta/recipes-connectivity/libuv/libuv_1.34.2.bb b/meta/recipes-connectivity/libuv/libuv_1.34.2.bb
> new file mode 100644
> index 0000000000..234cec37bb
> --- /dev/null
> +++ b/meta/recipes-connectivity/libuv/libuv_1.34.2.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "A multi-platform support library with a focus on asynchronous I/O"
> +HOMEPAGE = "https://github.com/libuv/libuv"
> +BUGTRACKER = "https://github.com/libuv/libuv/issues"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
> +
> +SRCREV = "f868c9ab0c307525a16fff99fd21e32a6ebc3837"
> +SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +do_configure() {
> +    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
> +    oe_runconf
> +}
> +
> +BBCLASSEXTEND = "native"
> 

