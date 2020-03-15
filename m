Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id B39106092C
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 23:37:57 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id u12so8629171pgb.10
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 16:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=cvmOXEfX9PBG4yMxW4KG6r8YCAbUwvc/Hb2Ft8E7l6w=;
	b=owZLeQu/8rocit/gC1qmcWxklOskiTKXqE+OPQ9kqChlANTNxmvMzSXbTin4VzBjY/
	WpNJWhabBXsH8wYUNY6RJiz12fjNVYuHsyWr1phm5yLazEjlT2fAIbeTLb38LWzT3CtR
	FuXMGEo3HA7xfEDNtHL/57tCOecAGxRNzS4Fin8czWMGzyRTEKNa43lneENPOSzViJo8
	cr5zo45zVsG8WRgM8z/1cc/ScOCGHXHYV7pz9k9OW7eTD+MUoAGfFe6c4PyqkyDoypbl
	YWvUC222zmRvZCMIPVNYl+29bjO8AUtlf4jWhgvBX0I2OAOW0lEuqPOlE/t9TrEmijR7
	HQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=cvmOXEfX9PBG4yMxW4KG6r8YCAbUwvc/Hb2Ft8E7l6w=;
	b=q/gWgWC5sKJnjSHRjUTVOcXzMBukMzj4RdTmpb8OjuJXC82vhbL1InBFwmFttsQ3CS
	dgkZMYCKrRpmPTnMy/94jg3sjsMnPxmcCp4XOij2uOS8G2mPkqZ9L1tdxHfYVc8LFjXs
	jNZugGS+pS6/Fj5Krfjo2noUPtyv36Ac1fSjyOlgd2zR9vvLN5wHgh8ug3zNqNFeeGhz
	5mGswCe4/+vAfThS2Rdiwvq7eRlPMpxbiDqMLaxGGVMZ7admKi24wgkUEZKcua3YI0VI
	dZ1vOlAqkjJsF57u9r7rNBvMVi4XG5/SK/PhiK3eQ5UT9gVWGeSa0QdYOllNThBRqEnM
	gJ/Q==
X-Gm-Message-State: ANhLgQ2PM9OLLOidicWt6aQ9J4upG8fj6HgeRCtsE345Z/7xSn8C/By4
	d3qIocXYy3xX1NBZ8I3NxVd/qqdu
X-Google-Smtp-Source: ADFU+vsZYOyhfgPEG/KyCO6TDi+5ZIY5GLKFXcX3RMkvlsOqWzaU0qqpoXZniw/7YamLN4xRCGgZlQ==
X-Received: by 2002:a63:6f0c:: with SMTP id k12mr12647280pgc.142.1584315478534;
	Sun, 15 Mar 2020 16:37:58 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f?
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	f17sm51257586pge.48.2020.03.15.16.37.57
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 15 Mar 2020 16:37:58 -0700 (PDT)
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@openembedded.org" <openembedded-core@openembedded.org>
References: <cover.1584295805.git.akuster808@gmail.com>
	<78e9dd3291fa0d4de450b5952b57e1a037644a3d.camel@intel.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <1035874e-551d-8733-f203-f018d11ea81f@gmail.com>
Date: Sun, 15 Mar 2020 16:37:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <78e9dd3291fa0d4de450b5952b57e1a037644a3d.camel@intel.com>
Subject: Re: [zeus 00/16] pull request
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
X-List-Received-Date: Sun, 15 Mar 2020 23:37:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/15/20 4:11 PM, Mittal, Anuj wrote:
> Hi Armin,
>
> On Sun, 2020-03-15 at 11:11 -0700, Armin Kuster wrote:
>> Khem Raj (1):
>>   valgrind: Fix build with -fno-common
>>
> This isn't present in stable/zeus-next. Should this pull request be
> updated?

I forgot to remove it before sending the pull request.

folks had issues with it.

- armin
>> Lee Chee Yang (1):
>>   virglrenderer: fix multiple CVEs
>>
>> Mark Hatle (1):
>>   gcc-cross-canadian: A missing space in an append caused an invalid
>>     option
>>
>> Michael Halstead (1):
>>   yocto-uninative.inc: version 2.8 updates glibc to 2.31
>>
>> Nathan Rossi (2):
>>   gcc-cross.inc: Prevent native sysroot from leaking into
>> configargs.h
>>   gcc-target.inc: Prevent sysroot from leaking into configargs.h
>>
>> Ovidiu Panait (1):
>>   dhcp: Fix REQUIRE(ctx->running) assertion triggered on
>> SIGTERM/SIGINT
>>
>> Rahul Chauhan (1):
>>   ruby: fix CVE-2019-16254
>>
>> Richard Purdie (2):
>>   dummy-sdk-package: Add DUMMYPROVIDES_PACKAGES
>>   maintainers: Add entry for buildtools-extended-tarball
>>
> Since there is no recipe, this is probably unnecessary?
>
> Thanks,
>
> Anuj


