Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id E4CC578272
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 04:04:41 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g69so3006155pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 21:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=9zDHuBQcC0vqOd3xlm9qkE7J3w1HGY0GVXtMZuHXvl0=;
	b=gNXL+7KXaf3as6fCAUlZ/k/NISbycBXuAp5dP+2mWuZmFqeYxz3CRkKnQKaqBbMX7/
	VSUx3BqrZiFnk1AbwWd4EMssXLqtd8Tk2Nit0mKCLnV5L0WOs40k5or2nlEqZFVBcUZu
	HD/MDUvQmCTk4/A+CU7e3OsMyVGDTOOPGFXUWW6V3Hvn8VYKgUktH27NhIId6VdExbbI
	0x7oRy2pbhDbzvUlKdbrc0jOVtjtoGLTa2ENOpziaZnZH1pMp3+V+dDZJxdycrZNhs4g
	Gjr0mngDi5LT92AbilTrh92rDndS3ElUdTLJPI1Co7GxDVPFDDbWIcutTbXbKbwctKAj
	AxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=9zDHuBQcC0vqOd3xlm9qkE7J3w1HGY0GVXtMZuHXvl0=;
	b=EgRcPD7doiWbHmis5Oxb9bL78pahNOYTO0ijBjFnrDVTzeZ33lBkssZkQO2zbotniU
	9opnyk3icMIq7SFvSiM38PIbiN4K3dWxV7Udb23oeHnJZBn0Is031422U6cBxc9z6e6p
	H31xbZcLCR/QugV5CZWbYTA3uUbi8LDodFnUwWQLZsLP686oqDfX1eAQXZ7KVmPwE4ar
	3ESUxZV2SJrniHSsz6I+dsI3u8HATD9ktq/HoOWXwH98UTgVoZwrQujWHNzJGtXK8nSu
	sCn3kBBlRWFY5xsI1n3fChJrzCCzjqrCFVgDV2AJZVzYczFyk8umi4007ot4bxKkkWRx
	oYjw==
X-Gm-Message-State: AIVw110AHTNRUMF1/Klsyw3ss+luNLYZms1F3KlwXm+AdGfVNCzZmelh
	SJtg2apZNzedXSy0UfU=
X-Received: by 10.84.238.1 with SMTP id u1mr20608191plk.187.1500955482842;
	Mon, 24 Jul 2017 21:04:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:295d:737f:7f55:755?
	([2601:202:4001:9ea0:295d:737f:7f55:755])
	by smtp.gmail.com with ESMTPSA id
	t3sm21888135pfb.147.2017.07.24.21.04.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 21:04:42 -0700 (PDT)
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1500551462-19196-1-git-send-email-maxin.john@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <11c0cdf9-c369-f90e-1c3c-3e1e60ac9e57@gmail.com>
Date: Mon, 24 Jul 2017 21:04:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1500551462-19196-1-git-send-email-maxin.john@intel.com>
Subject: Re: [morty][PATCH 1/2] libpng: move SRC_URI back to SOURCEFORGE_MIRROR
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
X-List-Received-Date: Tue, 25 Jul 2017 04:04:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 07/20/2017 04:51 AM, Maxin B. John wrote:
> Since GENTOO_MIRROR removes older binaries, move back to
> SOURCEFORGE_MIRROR
your fix is cleaner than what I had stagged.
thanks,
Armin
> [YOCTO #11554]
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>   meta/recipes-multimedia/libpng/libpng_1.6.24.bb | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.24.bb b/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
> index f91ab7f..4ee5983 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
> @@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5089214833586ba444048fd1dbbc76a4 \
>                       file://png.h;endline=149;md5=376d8ff7f69b7c4ad3a09f4672cec696"
>   DEPENDS = "zlib"
>   
> -SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
> -          "
> +LIBV = "16"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/older-releases/${PV}/libpng-${PV}.tar.xz"
> +
>   SRC_URI[md5sum] = "ffcdbd549814787fa8010c372e35ff25"
>   SRC_URI[sha256sum] = "7932dc9e5e45d55ece9d204e90196bbb5f2c82741ccb0f7e10d07d364a6fd6dd"
>   


