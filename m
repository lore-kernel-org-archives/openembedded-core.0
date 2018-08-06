Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8A80278887
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 16:22:34 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id j205-v6so23259213oib.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 09:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Fl27+g7uN7D2EpAE9ilZo5cGaUNS7EXlxJJZoFu8dA0=;
	b=awqDyY4te5iSim2O33cjjQgeCt763huwtGRRTeOBgd0Su3NPa48R9b3huK3oN1Gcc8
	0R00Q80/7Q6ET3pxumPFpyd+OPuYU4yjMIdfA98lm7WxjDTPy7LPLGjncHwCwH6f6R3m
	uBF9xvjgjsEpfxI8o+sypldGq3p58Riu6l2+Ls0hWU3nbGAAnMQLqMGq/koIq9cMGw3a
	kq18IkRhTBlYDod1VGeMktkz+sGXfSHXGCRcrdjtYnQcSRPV2tZHzJW5OoYrqF0IdCT1
	QLzRsUquwW2rbTNjNkUHreKXMYx/k7aWLhfIJN4VlpElPhGNPOZrwkH2Xi+/WYqkX9s+
	cyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Fl27+g7uN7D2EpAE9ilZo5cGaUNS7EXlxJJZoFu8dA0=;
	b=oXNtd0tYYqHTyZdaOsHt8xLY2+4/ucDRa+618Zan+zlndVD8N0HPkKMXUHzHiZQ5iX
	cR/nQo4q5C6+Oz/YHxpUS2FwucSSnND7XqynlfvOIuF3RwrjCGUKB9RflwZ9KatV5rNK
	KMXpwivGNj8sPPdweSGfEGYGmFF9bpIXXsrsNqgIb1uCTF/dZuEWY1jJM28/d7SHU7+M
	tedg5p9mmmwGxEIPF01x1nOFNYeMPP+vVnfqbaphe8twLOY3lhP6f5efe5gGuX57ICIe
	Y5HhgsAaFJP9TBjB262qBpBJqntYcrN1njSYJUjpa65UUGu5KQZhhwpbpw3DA/lyIHi1
	hydA==
X-Gm-Message-State: AOUpUlE/vEmjxFCNQqKElG+WMS4TjGrKK4YPdRBPTcKrnrenQeREz/7Y
	CoZLoF45QymN5tGyDPJNR+Q/Ecpx
X-Google-Smtp-Source: AAOMgpdTqy1tdLVm+hSIEA2DWXefPeY5vRFd5TeAjIHjQKYjSJ6X71h6bM2Oeoar5BAtyoQ7GHoa3Q==
X-Received: by 2002:aca:5841:: with SMTP id
	m62-v6mr16379583oib.346.1533572555556; 
	Mon, 06 Aug 2018 09:22:35 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:ac25:fc33:9f90:b6d1?
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	o125-v6sm19357060oig.44.2018.08.06.09.22.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 09:22:35 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d05d198f-a4f1-ae81-864f-34389d534ca7@gmail.com>
Date: Mon, 6 Aug 2018 09:22:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
Subject: Re: [PATCH 1/8] yocto-uninative: Update to version 2.1
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
X-List-Received-Date: Mon, 06 Aug 2018 16:22:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/06/2018 09:20 AM, Armin Kuster wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> This fixes issues with fontforge-native.
>
> (From OE-Core rev: cec85a6fcadc24fd266fa34631cb095e0a773c1a)

this series for for Rocko. git giving me fits today.

-armin
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/conf/distro/include/yocto-uninative.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
> index a8e82cb..dcd59f8 100644
> --- a/meta/conf/distro/include/yocto-uninative.inc
> +++ b/meta/conf/distro/include/yocto-uninative.inc
> @@ -8,6 +8,6 @@
>  
>  UNINATIVE_MAXGLIBCVERSION = "2.27"
>  
> -UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/1.9/"
> -UNINATIVE_CHECKSUM[i686] ?= "83a4f927da81d9889ef0cbe5c12cb782e21c6cc11e6155600b94ff0c99576dce"
> -UNINATIVE_CHECKSUM[x86_64] ?= "c26622a1f27dbf5b25de986b11584b5c5b2f322d9eb367f705a744f58a5561ec"
> +UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.1/"
> +UNINATIVE_CHECKSUM[i686] ?= "a90db17d8845ece764aaac19348cd78504c0e554cb998da39ebad03aeef76185"
> +UNINATIVE_CHECKSUM[x86_64] ?= "d43555df8d5a056ef5b20c7d8e0287207974e09df1e969a3e19302c8b4ea6b4b"


