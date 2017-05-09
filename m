Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 74F6D7017B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 21:24:17 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a23so1406406pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 May 2017 14:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=HZgi1vcfVHwzcxBFJcHghDsP3X4tP209kPdekdMEJWQ=;
	b=tq7uvGSNU1a3KpxqVVmaEowjZGvhEi8gQwnEs3VGxt7JYW54VWwPjORfB1h36MI5lR
	foUUDlyWFhG6Vu0LJdabnUiuq5NUpIMEeWDX2UKFFSz+n2ZtHpmDXf19y/L6102dvyYD
	hCdSFPAj/An94xI3J8FfjPh8cAicf7jNJlWlUa2MxOg/fqK9op6K5UWWzI5nBWMU8Mvb
	K87UCFJkP0gpLYkN2JtexbWLkt02NdX3LFLZ4M3o+EDwTBj7oR2KvpFz1XsskvlM+itx
	0q2kexEaAWGVCczyZuCJFoxIDFE8S1C4fTWayrH0D9rkdsWA2WP3sBGyH60EN01OzayV
	ygVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=HZgi1vcfVHwzcxBFJcHghDsP3X4tP209kPdekdMEJWQ=;
	b=TGxlXXP6QZECWTdek3i04ddADhLqT3rptRlMav9kfX14FlyLMRNd70XIUaivGSVyLI
	RyL7KzWyqeefkPsxPUT1pFT2Hr3LXqaf8qZ0BDy/NSLvdL+1ygI4GG16VJTobuTjQut5
	d5axxbkrcOTN+bMFC4ZhTQs2onsgsKjk1ZVhk/zBZnPIxjTz9Ied99M3uQ13LhFXA7np
	5eDBTnSGOonTzQI4LTOXBPszFBqDvaiPGpHlRLH+Z6vWkX1DeJzKJWVr84Pp5zwA7gej
	6LKdY9pwSOlECNwH24x4xV39aXXXU/o5VokH7iEJG4Ob872Qy8/hBPo3g8Glx56f1qp0
	2uEQ==
X-Gm-Message-State: AODbwcC1RXOT9MrPUyQ5Rp34NsL6EUXbTjaVVpDWfrL7dDuB2mDTD/4V
	WW9gQ+iRVMLLQA==
X-Received: by 10.84.241.77 with SMTP id u13mr3059566plm.28.1494365059501;
	Tue, 09 May 2017 14:24:19 -0700 (PDT)
Received: from [10.43.100.166] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	w23sm1376777pfl.133.2017.05.09.14.24.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 May 2017 14:24:19 -0700 (PDT)
To: Marek Belisko <marek.belisko@open-nandra.com>, yocto@yoctoproject.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1494364209-17742-1-git-send-email-marek.belisko@open-nandra.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <3615c946-3e41-61bf-8f39-1eeb8c839335@gmail.com>
Date: Tue, 9 May 2017 14:24:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494364209-17742-1-git-send-email-marek.belisko@open-nandra.com>
Subject: Re: [yocto] [PATCH] recipes-support: Add recipe for libgpiod
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
X-List-Received-Date: Tue, 09 May 2017 21:24:18 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Marek,

There is another mailing list that is geared towards the core 
development and recipes like this that are targeted for the main "meta" 
layer.

You should resend this patch to: openembedded-core@lists.openembedded.org.

regards,

Armin


On 05/09/2017 02:10 PM, Marek Belisko wrote:
> libgpiod - C library and tools for interacting with the linux GPIO
> character device
>
> Since linux 4.8 the GPIO sysfs interface is deprecated.
> User space should use the character device instead.
> This library encapsulates the ioctl calls and data structures behind a
> straightforward API.
>
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> ---
>   meta/recipes-support/libgpiod/libgpiod_0.2.bb | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>   create mode 100644 meta/recipes-support/libgpiod/libgpiod_0.2.bb
>
> diff --git a/meta/recipes-support/libgpiod/libgpiod_0.2.bb b/meta/recipes-support/libgpiod/libgpiod_0.2.bb
> new file mode 100644
> index 0000000..fe2cd80
> --- /dev/null
> +++ b/meta/recipes-support/libgpiod/libgpiod_0.2.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "C library and tools for interacting with the linux GPIO character device"
> +HOMEPAGE = "https://github.com/brgl/libgpiod"
> +
> +LICENSE = "LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
> +
> +UPSTREAM_CHECK_URI = "https://github.com/brgl/libgpiod/releases"
> +
> +SRC_URI = "https://github.com/brgl/libgpiod/archive/v${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "e3430f35b6efa842693d659c0bfb7ad5"
> +SRC_URI[sha256sum] = "de1947f3cb2cc4174364af430309fe6238976658575655bdbd76c60cffa7df92"
> +
> +inherit autotools pkgconfig
> +
> +# enable tools
> +PACKAGECONFIG ?= "tools"
> +
> +PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
> +PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
> +
> +PACKAGES += " ${PN}-tools"
> +
> +FILES_${PN} = "${libdir}/*"
> +FILES_${PN}-tools = "${bindir}/*"


