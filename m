Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id DDE8779DB4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2018 17:52:28 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id b11-v6so6454434pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Nov 2018 09:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=SO4+V5jHqzQlO0LGpcDJ/ht3HfDkN93YhyO5QVIo054=;
	b=Z89rHIvcVBwlEsPdrE/oEEGkMOcmfm9a1cADgMm9tOGz6RCqga4cBzBgIhMcSkT8CV
	CGW6kVs8WMqWWUY5tvkSFr6qYJLqPRMWQXaBBpWq4kdEEJK3POf8i7sNoY3Kb+Goicqe
	xHDsb7OveNNlsO43bKuXdAOVtjygrcV3Gms7EgZouABE0myxaRTmY8TvHIvVksJHVXd+
	KomWb1dYe8ny8hQllYKO8nRsPVGfRTP98cZV0rZBJGjkYie5cWb0nsKPqAaP8w0PqVT4
	V8EAxaOylYz9wOS8T3CRV8CsWgLEsEn2ZY8GdiHl9IOsv3P7lHBF2X8wWN+KlVp0Pib1
	op9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=SO4+V5jHqzQlO0LGpcDJ/ht3HfDkN93YhyO5QVIo054=;
	b=st0ndqdQVfZn+HpsdL9QWgPgQ1wyqb+3FlpsqZF2wDxQpaQ67HeJFP28R+VIJ914lX
	Qk7I1mN3Drqgy99bNwvtk9vgJRhC98itmf51x5odxHKl5YrOLLmNf98pVdWhV1EzZzhR
	t9Fp1KBPKbvnP8mZe4OQMwz0PKEh7pcGKSQRCjUBzNuDFhJgqV8khF8gfLBbWz3uqlIy
	vIpPwGHuZhholvvlTyvtqtuTJ7cbBUC8GEwVtcrYLavkIMkDLS5/a5XwoFc8LPEAGBcy
	gAvoMY3PywYW77h2E6TEZIlfqVQ14erAxwsgnR87xjo7gUPIrVmAgU9WNr5CjUY2bYMv
	2ymQ==
X-Gm-Message-State: AGRZ1gJ5nSCV+WVCr6tzhGzfiPPL6IF+y+X4df6hdYAqX/EnObczhg8/
	rNTEriGGDIQB/3sSTnJPjP2FJfPb
X-Google-Smtp-Source: AJdET5cmwRJkVUdFNazh8GJ76CIy+kMfROdPi+SMa8voiPHeGf2AURdwXHbEaYtYtAfd6ZLzrTcQYw==
X-Received: by 2002:a63:4342:: with SMTP id q63mr24688483pga.63.1541526749213; 
	Tue, 06 Nov 2018 09:52:29 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:bd6f:ce:d9fb:a281?
	([2601:202:4180:c33:bd6f:ce:d9fb:a281])
	by smtp.gmail.com with ESMTPSA id
	t77-v6sm39264009pfj.79.2018.11.06.09.52.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Nov 2018 09:52:27 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20181025151040.18615-1-richard.purdie@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <a23468ed-d936-aab4-cdea-77a6937306c1@gmail.com>
Date: Tue, 6 Nov 2018 09:52:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181025151040.18615-1-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] yocto-uninative: Upgrade to verson 2.3 which includes glibc 2.28
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
X-List-Received-Date: Tue, 06 Nov 2018 17:52:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Richard,


On 10/25/18 8:10 AM, Richard Purdie wrote:
> This allows us to handle distros which contain glibc 2.28 such as
> Ubuntu 18.10.


I have this backported to sumo, any reason not try to get this in the
next Rocko release?

- armin

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
> index 180d4e54baa..c9d502ba4f9 100644
> --- a/meta/conf/distro/include/yocto-uninative.inc
> +++ b/meta/conf/distro/include/yocto-uninative.inc
> @@ -6,10 +6,10 @@
>  # to the distro running on the build machine.
>  #
>  
> -UNINATIVE_MAXGLIBCVERSION = "2.27"
> +UNINATIVE_MAXGLIBCVERSION = "2.28"
>  
> -UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.2/"
> -UNINATIVE_CHECKSUM[aarch64] ?= "5c9636d2683dca8b783763b5e52f80f12ac857c0f445cdaa58a8c2370583da77"
> -UNINATIVE_CHECKSUM[i686] ?= "036b60092fe4acfa1a321d110673030db20344a2d56f33a4d047f0279498bdad"
> -UNINATIVE_CHECKSUM[x86_64] ?= "e3b77208169bf1ac4e89496f3cdbf27695f5b18a2694a908a793390f28b67f83"
> +UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.3/"
> +UNINATIVE_CHECKSUM[aarch64] ?= "b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685eaed"
> +UNINATIVE_CHECKSUM[i686] ?= "44253cddbf629082568cea4fff59419106871a0cf81b4845b5d34e7014887b20"
> +UNINATIVE_CHECKSUM[x86_64] ?= "c6954563dad3c95608117c6fc328099036c832bbd924ebf5fdccb622fc0a8684"
>  

