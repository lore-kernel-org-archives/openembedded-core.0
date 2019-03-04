Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id A9A577C88E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 15:25:49 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id i20so3250282pfo.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 07:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=utZ0SdTVC4N6dX5kCw+EsuWHez5t9b0XR8j48UCPV8U=;
	b=ux6vAToGRcNZI3BBVRdXgW08oz9fuY+/nsHC58Fujt1x5rw4XisK2cUfb1JKqsvsW+
	5DPTURRD1KY5ofAvSaZrSx6ys+Kp2/G36DNIpDiRQcKS8jFyq8leIzx42KpiB6EIEYqE
	Os54NbTm7a1K92ZgUB3IJ4mCr9H78TG1pSYrxAoUXT6PgRD2eiuys/Cf7n6/n1sD83Q/
	f0mTdeDgs94qPffAhfvCgVNWBw5WBfZTZJU88EPTUdIZeqeldiB+pEHB95vLCxmMv1T/
	3kB0cQG69sr1rwcOPGtiTNJMvfY1nRKTimrgZkeNgK9LlTnM8GHw1b+jYNdczqNlg/kf
	UV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=utZ0SdTVC4N6dX5kCw+EsuWHez5t9b0XR8j48UCPV8U=;
	b=DQtRqqolrpmWTax/syOjlvLTwVBN6EH/Oo+HyHCcLed9D4YKatO1uQUg/YHVqAM9w5
	leVxvOqcDqzkaUG1U5+1QsJtE7RQyMkefL9F6dQ0Utq2lQ8r/UIaOboOm7ObsMX8Q5hn
	nCtRsvWzZ/yGeqOGLOZUZmVlP6iIgEY7Bp4wgXW4cZCT7rjD5qLuRV19ZeWyNfVXAblY
	LnSDjy6azymUqxfEJ/rnd3tRNUvQKvJohEvbJmpQyIwml6COJtUgeWDdgDpEG/x4xoBz
	uXmKKAjXuU+0GBAiMjcRlfF2iCFQSxKfWrnwStreXIuM1Uyov1cTv5GbSqga8yFQx26i
	Qjsw==
X-Gm-Message-State: APjAAAW6UDIOYFabysSXtFNyYD/cUakkhJBeZdPLS3/8c7+/nTB/yylS
	eFxFtC4tPiDSQwOsuaupG84KLQJW
X-Google-Smtp-Source: APXvYqyl2OOklIMn2WY9lXupFzlEs94SDF+0rmuJAcxz2B8o/NvnbYWFc4pUz5hRY6esUCuF2N+Y8w==
X-Received: by 2002:a63:e106:: with SMTP id z6mr5075193pgh.418.1551713150608; 
	Mon, 04 Mar 2019 07:25:50 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:153a:43ee:4b76:7dc7?
	([2601:202:4180:c33:153a:43ee:4b76:7dc7])
	by smtp.gmail.com with ESMTPSA id z6sm9700675pgo.31.2019.03.04.07.25.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 07:25:50 -0800 (PST)
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-core@lists.openembedded.org
References: <20190304041822.118083-1-oleksandr.kravchuk@pelagicore.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <37c86bee-0222-7eab-c001-97dadee76def@gmail.com>
Date: Mon, 4 Mar 2019 07:25:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190304041822.118083-1-oleksandr.kravchuk@pelagicore.com>
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
Subject: Re: [meta-oe][thud][PATCH] target-sdk-provides-dummy: add perl-module-overload
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
X-List-Received-Date: Mon, 04 Mar 2019 15:25:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/3/19 8:18 PM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>

is this in master? What does it fix?

- armin
> ---
>  meta/recipes-core/meta/target-sdk-provides-dummy.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> index edf07c4a23..13741f0a64 100644
> --- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> +++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> @@ -26,6 +26,7 @@ DUMMYPROVIDES = "\
>      perl-module-getopt-long \
>      perl-module-io-file \
>      perl-module-posix \
> +    perl-module-overload \
>      perl-module-thread-queue \
>      perl-module-threads \
>      /bin/sh \


