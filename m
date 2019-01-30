Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 837BD6C4A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 21:30:18 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id u18so413931plq.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 13:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=O3FDAVWuBMbQ6AnnDeWbu5runYlZmZc6h1H5BsVC9bs=;
	b=Q0S8snvcxH/rQxcwoVD1JtxvrjYQ36y5BJJvmyPEh5/7CMis5Z6kkwLsGRhxutxpAK
	sv987z1HUoaF/6aZTCCCJrH+QODzfs738BE0+UXmouqyPGi9keoS3P35pjU+7aDNthFW
	u3XGyG4uok2p6VC0MUHiJW2ItQdqXTP2lBRyBnqv5jKrpbvraO+g+enNDmqwjrXRz6BR
	9zLnOKYOt8AjTc9RaANxZHcw+HF0fuDnOEbo+ufZBtrDvb/Mcgm+Nr+64KZmN8uVBmD9
	GnibdFcADYy3J4nLD/ET2xL30r8mQldyOhBWSPZII83tMTXwBRmcO4zJewJ4uIrJbZmg
	u/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=O3FDAVWuBMbQ6AnnDeWbu5runYlZmZc6h1H5BsVC9bs=;
	b=YWlytHc3u03mZt/arylADq3/DhU7keQtsh3IZRvPH60MlsuhRbAJKMjpgo1j2Jl5Ti
	R/tGZQ40eC9dJOjVXWcz/g/7C09tGi9A/n3PyQ5nFE/dbPc65vD4Q5Crm3xRlQ7yx6oQ
	RBc8S0LDTA9+KXqdHcMyJGvOILu4J7VMVWz0El97VsuDq6XZyy7Qvb5rjsGrwsOUsGTh
	qQ5+kUMxl8IWaZc7hQkB0Og7lqE9fXFTXToWKwHWl32/G3mJ3M1WBePqRbsDGFgdMN9J
	ovS44g2ouWoWpV+32Ciae586ko9nV2Oyw2eGOr9ZK85DJ65wtT0RGXBr8oaiOfri56Ha
	eb4A==
X-Gm-Message-State: AJcUukfJUO25O94t7DU93VSPw+SHV3DJCisOsy0de3PDqgMybY8D9Dh1
	UHbq3OgbrgRx5U0Y5YfzGCrTWDO2rrs=
X-Google-Smtp-Source: ALg8bN6Ho9g0VPqmyX9udJJ8IDVNtG/A3MI8z8bVe3ctH9NI5kfs0ocLglFQSxFBycqR8OHXORBH+A==
X-Received: by 2002:a17:902:9692:: with SMTP id
	n18mr32631998plp.333.1548883819400; 
	Wed, 30 Jan 2019 13:30:19 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:a954:fb27:4e83:6750?
	([2601:202:4180:c33:a954:fb27:4e83:6750])
	by smtp.gmail.com with ESMTPSA id
	r130sm5079069pfr.48.2019.01.30.13.30.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 13:30:18 -0800 (PST)
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>,
	openembedded-core@lists.openembedded.org
References: <20190130172006.6534-1-anibal.limon@linaro.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c2cf377c-a97e-1fcc-f302-7d26c149037c@gmail.com>
Date: Wed, 30 Jan 2019 13:30:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190130172006.6534-1-anibal.limon@linaro.org>
Subject: Re: [PATCH][thud] ptest-runner: Upgrade to 2.3.1
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
X-List-Received-Date: Wed, 30 Jan 2019 21:30:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 1/30/19 9:20 AM, Aníbal Limón wrote:
> Changeset,
>
> 05b112b utils.c: Print DURATION after ERROR
> acb5efb utils.c: run_child redirect stderr to stdout
> e1062f7 ptest-runner: make DEFAULT_DIRECTORY be able to be defined when compiling
> 8071258 ptest-runner: Add support to report duration of each ptest
> a16f2c1 ptest-runner: Add support timeout failure type to XML result file

The ptest-runner update has been in my crosshairs for the  stable
branches.. The QA bits are seeing a lot of churn for the stabled
branches at the moment, I suspect this will be backported pending
testing. Thanks for the the change set summary. that helps.

Regards,
- armin
>
> Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
> ---
>  .../{ptest-runner_2.2.bb => ptest-runner_2.3.1.bb}            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/ptest-runner/{ptest-runner_2.2.bb => ptest-runner_2.3.1.bb} (89%)
>
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
> similarity index 89%
> rename from meta/recipes-support/ptest-runner/ptest-runner_2.2.bb
> rename to meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
> index 622d23ba91..056a0c58d8 100644
> --- a/meta/recipes-support/ptest-runner/ptest-runner_2.2.bb
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.3.1.bb
> @@ -7,8 +7,8 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>  
> -SRCREV = "49956f65bb53ea2a2c1b394e5e59ffdfcdcc490f"
> -PV = "2.2+git${SRCPV}"
> +SRCREV = "05b112bda7ac2adba8e9b0f088d6e5843b148a38"
> +PV = "2.3.1+git${SRCPV}"
>  
>  SRC_URI = "git://git.yoctoproject.org/ptest-runner2"
>  S = "${WORKDIR}/git"


