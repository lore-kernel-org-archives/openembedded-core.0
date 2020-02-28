Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4D291618E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 04:18:27 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id a16so401378pju.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 20:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=7zCdxFEyjjGuf2uQfYm5K/S9IjWReBRfe6NwbCe7Zjs=;
	b=SU4syn1BlCDqMGq+80dxIR2WvmjE4FrFTH8Xr74KRGtUItS6zmaKdaglFx2z5nTt+4
	lwVcgPv1/a4PinJgXKOjY5shg7fy2YaRQUF7CX/1jDla7iDsJ42BhkjkCxFPZcnJayu1
	Wf4CpVQbXcDWg8gI7xT9khsAU7r7REYI6JwMuF8rG1UPjIPeASxX45o5ymryxWZQM/rC
	2iyvttZHGA/mG4BhKqXqYyqPM3etr5QHjygtkA1fRfWKxiQRyNJAVBn+0sjn/2h6TdKC
	FlcNpKW6wAD9HcsDclP2Pipy/GgS+C3p/ZEQxZ1WBxOopYSog39dRLv9a+c+5aBQg39W
	X91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=7zCdxFEyjjGuf2uQfYm5K/S9IjWReBRfe6NwbCe7Zjs=;
	b=oG8W6Z+hmgmmz0SglFTh9n18/rN2f3RAaXzvgHRZR9rk+gvo/fX566oVYjdmjXitYD
	DrxfF0w4sV8GQ0AmQlSGT8XgKbdvMT9Ip5t2y+iKtkJxlMbQM8sRC8fOuyr8887udyPI
	+ssLzv9GFCjizkmaQvm8QpayLitpJxxBi/SA/VkBAcUgLnqFqQJo72eL9trs0tKJu7an
	o2HVG0w1b9rWRkiiw5z5oL8hTSRL4YqQuDkFhwLkVegn/5YFVmlx1pmO8PItrSee7MWM
	vWHhd11FPn5z/9Q+dZx7yFZE6FqS4sCiJZiSlgOcVGP5MoM/UNSCa/dRNZaqKCCgYkx5
	8n9Q==
X-Gm-Message-State: APjAAAUduegvRb+DjcVomAWz32Sshn82e5/1dC7zoIOHoKpPNb406lk4
	EoJW7GGhlN+Wdw812ergLXl41zLl
X-Google-Smtp-Source: APXvYqz3JJnr3HfaVrJE3yY0enT7D7guFOpYdS1ktba2OiEZHFNgya56tt2ggOr42JILYdGsHJ0hWQ==
X-Received: by 2002:a17:90a:bd89:: with SMTP id
	z9mr2461016pjr.13.1582863507764; 
	Thu, 27 Feb 2020 20:18:27 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:3d0b:bd00:40e0:2589?
	([2601:202:4180:a5c0:3d0b:bd00:40e0:2589])
	by smtp.gmail.com with ESMTPSA id c3sm8880004pfb.85.2020.02.27.20.18.26
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 27 Feb 2020 20:18:27 -0800 (PST)
To: Paul Barker <pbarker@konsulko.com>
References: <20200227042658.19619-1-akuster808@gmail.com>
	<312d477b-f5f5-16df-7867-c5c9f5619abb@geanix.com>
	<4e4b134c-3ac1-814b-5055-3a539904f52e@gmail.com>
	<CAM9ZRVtM2Yy3KEKtNue+8PV9bp1q+JmXinFDb1LoBp4a13_6qA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <ddf31fa5-8dd2-5613-8c06-af6665f8bccb@gmail.com>
Date: Thu, 27 Feb 2020 20:18:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVtM2Yy3KEKtNue+8PV9bp1q+JmXinFDb1LoBp4a13_6qA@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Add include-dir option
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
X-List-Received-Date: Fri, 28 Feb 2020 04:18:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Paul,


On 2/27/20 11:50 AM, Paul Barker wrote:
> On Thu, 27 Feb 2020 at 19:43, akuster808 <akuster808@gmail.com> wrote:
>>
>>
>> On 2/27/20 12:12 AM, Martin Hundebøll wrote:
>>> Hi Armin,
>>>
>>> On 27/02/2020 05.26, Armin Kuster wrote:
>>>> This option allows for the inclusion of a single directory
>>>> for a partition.
>>> I am unsure how this is used in a .wks file.
>> Yeah, the documentation does not cover this.
>>
>> This is what I used to verified it works
>>
>> part  / --source rootfs --ondisk mmcblk1 --fstype=ext4 --label rootfs
>> --align 4096 --exclude-path=var
>> part  /var --source rootfs --ondisk mmcblk1 --fstype=ext4 --label var
>> --align 4096 --include-dir=var
>>
>>
>>> From the code it looks similar to the include-path option, but
>>> relative to the rootfs source dir instead of the wic working dir?
>> the --include-path adds an entire rootfs  to the partition. I don't want
>> the another rootfs. The help file even says that.  I want on directory.
>> --exclude-dir allows me to "exclude" a dir .
>>
>>
>> I used wic ls {path to partition}:{partition number}  to view the
>> contents  of the partition.
>>
>>> But the include-dir value is also used in the destination path?
>> Then please document it and I don't mean the "help" file which is unclear.
>>
>> So how would you have "home" or "var" be in their own partitions? Please
>> show an example.
> IIRC,
>
> part  / --source rootfs --ondisk mmcblk1 --fstype=ext4 --label rootfs
> --align 4096 --exclude-path=var
> part  /var --source rootfs --ondisk mmcblk1 --fstype=ext4 --label var
> --align 4096 --rootfs-dir=${IMAGE_ROOTFS}/var
>
> For an example see scripts/lib/wic/canned-wks/efi-bootdisk.wks.in
Yeah, I looked all  the wks files an nothing jumped out at me.  The
"--rootfs-dir" is not  intuitive for selecting a single dir  but I see
that it does address my issue.

thanks,
Armin
>
> Thanks,
> Paul


