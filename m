Return-Path: <kristian.amlie@mender.io>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1CC70178
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:01:47 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id c47so5454699qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=BXp7hr5/MA3/v2ohfFXvQt52W0ypr1/VxVDnHzvJKII=;
	b=fnyOgbnsKEZUT5qIS8eQq7irVtOuMiMIwUJC4kTxzxBeXGfNnXNVH/+4LhYVE6vJyp
	PHGr0394wwEUQ/1G1Wb0vHwREvbZrAuz7WdDV4k0BE4zkPjjOIUHsY/VeM0lyThQwySq
	x2ODpF1cbTjo0txthRrqgGO+4l4FjJZv4nGaZJUoOptJK6McOAqfACCe1gnBycJTapZW
	bqhI3MpBIsBUq+yo7iqxEvYIZrNjHsogmdx4D1vY7TkJG3erwsKsDuAeH3M4SuegPsN/
	uP/hae9pKX93WFaYgq5SNsWgLFdSs1e5BwB/Wfl/MMQbrjeLPXHBZwf+QFvHxktu2bS5
	MoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=BXp7hr5/MA3/v2ohfFXvQt52W0ypr1/VxVDnHzvJKII=;
	b=i/EPJG+/3nlr/hNQq1Ws1ykTPRZrRX4pl89c4vBtiy3mZcytAoIY4awQJd+yLdYfvO
	JeFFzURIpWlqz8M1q6NpSbRtv42se4WXTSmdFkLs9z+6pXWCRZpjb7xaWES2P0gjn1u9
	CpHzrm7n42zaa5L/I/5il2zU4GI0AckV3JPYi1ZGB4SPMRQ6J/SZ9gfq2eE/TO0hWycI
	J/c5E5STGoNQmjczhNCyQDQdYCxGf9CGuNwG3rOvmwOxla9o2TgySa1C0MmwxK6B9uSA
	kvjhBuke4qmeDGhPKQ15bn0TiCTsZ1x5brlIDJY3yJtotn0AzsQZtbxUGRWKeDaDmH3t
	gJig==
X-Gm-Message-State: AKaTC00E4xBAjLL7ZuUmfkmYjHpM1v67wOZHHCovBUfT3KNEoQTlfMFXmb1mJ9WSvpVIZA==
X-Received: by 10.25.206.3 with SMTP id e3mr558109lfg.42.1479891708724;
	Wed, 23 Nov 2016 01:01:48 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	e37sm7004323lji.42.2016.11.23.01.01.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:01:47 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1d5954ab-1a9a-b73d-7f72-fbe84c8e2250@gmail.com>
	<839768d8-710e-b4b0-88ad-1c5780f4c51d@mender.io>
	<FDD8C344-D3E7-45B6-A463-2E4803B95572@gmail.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <3f864d97-817c-bef3-242d-64a68000f7dc@mender.io>
Date: Wed, 23 Nov 2016 10:01:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <FDD8C344-D3E7-45B6-A463-2E4803B95572@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Wed, 23 Nov 2016 09:01:48 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 23/11/16 08:26, Khem Raj wrote:
> 
>> On Nov 22, 2016, at 11:13 PM, Kristian Amlie <kristian.amlie@mender.io> wrote:
>>
>> On 23/11/16 00:45, Khem Raj wrote:
>>> Firstly, it needs to be defined what the data partition is about.
>>> 1. is it some pre-initialized/seeded data that can then be modified during
>>> subsequent boots ?
>>> 2. Is it read-only data which is then used to populate r/w data segments in
>>> RAM during boot
>>> 3. is it data that does not change over the course of install and reboots of
>>> the device
>>
>> It's preseeded, but modifiable data, that survives complete rootfs
>> updates. IOW if you overwrite either of your A/B rootfs partitions, the
>> data partition and its content survives.
> 
> at some point this data segment will be seeded.
> think of factory case. 

The creation of the initial partitioned image for the memory card
preseeds the data partition. This is meant to be used in initial factory
flashing (by which I mean literally "at the factory", not the factory
reset button). Subsequent rootfs updates would not touch the data partition.

> So in such a case updates should not touch them unless user does a factory reset
> which should clean it up

Factory reset is not covered in my suggestion. While also important, I
consider this a separate feature, which would require cooperation by the
running OS. I hope it's acceptable to keep this out of the first patchset?

-- 
Kristian

