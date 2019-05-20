Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 759307DF94
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 21:24:49 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id u17so7851381pfn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Rw5XEQTsqLRomGCUMnVfjkfEfefyy8BeYnYK1pmnZn4=;
	b=koIL+qmSsDiN0GyXXLyOOS0j3ofOUeNSCaWmr+WrIO/wxMK/9geuAoSQEo+dawXYC4
	4w4z6koYO8QmYGVCDP2UWSFdgJXwF0fXtc1GdMKy48HVOc4ckdcytvH+KW+LLGt+Qps9
	qU07pnncgUdqXn3+EYH7ZMTMkO1Sap3S/ueAjtAa8OQ3iIsIf4+GY9YUIpshTvVPkgPh
	nZqsUfSPzqCv6TQoIXOgjWARi0miCeUoagiOGj7mxQC9I04oedA6m9LHEf5K/iM+C4so
	EvjfnGvtaFrb/P7KWa+kQl3jS55iLdX544B+LYo/GW4nynrTW/24m4YcxPl0dBR945le
	yWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Rw5XEQTsqLRomGCUMnVfjkfEfefyy8BeYnYK1pmnZn4=;
	b=UcmttF63P+Yk/6gBrkERhA9DlYudrFIzoD0I6y04e1/xkgZ6ylwSnq3geTxLayzdHr
	/tzlUJXhCbfLlN0O8otQ+4CZeXHYenYfzP2fqENUbd9QiEFOqAbr7iHmkQoTFkLEp9DW
	Iq/AOyrm8JoQCa2Ls6gkQlgSf6bvJkeupywRozrA1UoY4Spy40YFyiV1VhxTUApukcT4
	svxvoXYWxrhy8DofUkf8mi8dQH0DgN/98AFe7Cf6QJcWEXCAYq75aO6wS5+XKTL5AevJ
	F321mxWfZIsnenbf+kQtsp+Nx+0uB3cOcz5ybQWDxKvqRvUGN16k/s/N4QVAtpsjnkRF
	DtyA==
X-Gm-Message-State: APjAAAWTUouBjBoYhDJuDVhyD5ayvobUrRqzq99XJCLEBd5esoSUeVc5
	HUBnZ4W7NiOyRH59UpxbRW57ewocc6w=
X-Google-Smtp-Source: APXvYqxj7qDWdqSBQeAz/Nb7XK4w85gtk3qW2VirqdQF11I7bxuwwE2iRKYAAUv6AcYwWf5Z0tEzLg==
X-Received: by 2002:a63:f806:: with SMTP id n6mr77638351pgh.242.1558387490119; 
	Mon, 20 May 2019 14:24:50 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id
	e10sm37931601pfm.137.2019.05.20.14.24.49
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 14:24:49 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>
References: <20190516074834.3014-1-bunk@stusta.de>
	<8e01a707-fda6-ba0e-5731-4fdc337b09b3@gmail.com>
	<20190520211635.GA22230@localhost>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <b3084e96-3476-14ef-8fca-5d1fb30583e4@gmail.com>
Date: Mon, 20 May 2019 14:24:47 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190520211635.GA22230@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] musl: Add TEMP_FAILURE_RETRY from glibc
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
X-List-Received-Date: Mon, 20 May 2019 21:24:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/20/19 2:16 PM, Adrian Bunk wrote:
> On Mon, May 20, 2019 at 01:19:38PM -0700, Khem Raj wrote:
>>
>>
>> On 5/16/19 12:48 AM, Adrian Bunk wrote:
>>> Patch it into musl instead of patching all users
>>> (currently elfutils and next ofono).
>>
>> this violates musl philosophy, and I would like to stay as close as we can,
>> so I would suggest that you propose this patch to upstream musl first and
>> get an opinion, if it gets accepted, we can change OE
> 
> "musl philosophy" is that musl does include the GNU extensions Rich Felker
> likes, and does not include the GNU extensions Rich Felker dislikes.[1]
> 
> TEMP_FAILURE_RETRY is in the latter category.
> 

I would encourage you to start a discussion. Usually a good reason to 
accept or reject comes out of discussions.

> For TEMP_FAILURE_RETRY it's either patching musl once or patching random
> packages all the time, and the patch is not invasive.
> 

No other musl distro is patching musl especially for this case, we can 
live with that since packages will be patched. Eventually applications 
will wean away from using it.

>> Richard,
>>
>> Please revert this patch, I know its now in master, but we should wait until
>> upstream agrees to apply this, we are trying to extend C library which would
>> fall on us eventually forever if upstream does not accept it.
> 
> What is actually the strategy for handling musl changes that will have
> to be shipped in OE forever?
> 
> Especially systemd/musl is a combination that will bring an ever-growing
> amount of changes that cannot be upstreamed on either side.
> 
> And some of the OE patches to systemd make things compile but are of the
> "I wonder if I can get a CVE for that" kind.
> 
> The alternative would be to mark systemd as incompatible with musl,
> which might be the sustainable thing to do.
> 
> cu
> Adrian
> 
> [1] There seem to be sound technical reasons behind what he likes,
>      but this doesn't help when a distribution wants to get existing
>      software building with musl.
> 

