Return-Path: <kristian.amlie@mender.io>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id D147C60750
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:13:02 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f82so8663282wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=0wQJ+b86Wt4km7diRGdGJc1gYrBKBABEELPyuMDE99s=;
	b=qF3cjPWXB8T0EjwZh16dBqGkEtrRAXaC8Gu3Y35wk7GTYgEXQujdcTOPg5feWTYxdY
	DNIYGGOqFAC07xpkBNxYrQxH4Qw3pj9NZi05r4UM6bHhGOijMwmNxN27dDa3T9XekYyS
	cHgDMspvXyt6J/k4YmkY0JORkhffWWFZW8hvx1U5j1MGyVVu0PoWdvCrudgARC+Dbsuq
	Tk9jBY0TuKsTwiyrIZEsX9nWuZIMq9KGsFP4/sZRpsDiKFI4OjJjVvxpkBB/WBO41CD9
	odiWiGjp3gSbdgALO0nVYwkXNM+hIWuAUV7tOlma5xJL+26k2+ojT3j9LAnl1Pq9mKVQ
	S/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=0wQJ+b86Wt4km7diRGdGJc1gYrBKBABEELPyuMDE99s=;
	b=TkZpypaLZocyeMtukFKKu8qVUuUs2ZoTnQRUtQla/kdicZ+nfCK5zf+MyD0gh6bGGl
	qFroVrC/viN0UMxQZuz+2FEDpU2mBrk2Y8w9OIaUoPH6LQ672ZP+uKqtrpHP7VQ4omPq
	DtCJqg24s+EWf38LWjQ1jvF3EuJrY4nLxfkMjZ/JLAaD6DA3lPsWSE0RcODRFUbSo+6h
	W2Jw8Wj5l1h2P3goALQ7mIACIl5HzO+QDDkE6phUehrtQ8v9W8R79AfVd2/PvfJuRHBY
	85hZX04/qaBrjIiCLJuAXY6uo8N1thCT8trIG8ltm/l6gQs/vjp/Zzw57nOyv7w3h+O4
	m+Qg==
X-Gm-Message-State: AKaTC03fNIJT89zl+Qe4OnAbRomOWGlbReHAVXoJmjkfznZQPoqCERWAiyrtR9brEqCvGw==
X-Received: by 10.46.71.15 with SMTP id u15mr514488lja.74.1479885183409;
	Tue, 22 Nov 2016 23:13:03 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	e30sm6920887lji.41.2016.11.22.23.13.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 23:13:02 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1d5954ab-1a9a-b73d-7f72-fbe84c8e2250@gmail.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <839768d8-710e-b4b0-88ad-1c5780f4c51d@mender.io>
Date: Wed, 23 Nov 2016 08:13:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1d5954ab-1a9a-b73d-7f72-fbe84c8e2250@gmail.com>
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
X-List-Received-Date: Wed, 23 Nov 2016 07:13:04 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 23/11/16 00:45, Khem Raj wrote:
> On 11/22/16 1:05 AM, Kristian Amlie wrote:
>> Hey
>>
>> In Mender we are using a dual rootfs partition layout (A/B layout) with a persistent data partition on the side. We're using wic to do the actual image building.
>>
>> However, putting files into this data partition is not a straightforward operation ATM. All recipes in OE put files into the rootfs only, and we'd like there to be a way to specify that files should go into the data partition.
>>
>> I haven't seen any straightforward way to do this in OE. Some suggestions for how it could be done:
>>
>> * A "DATA_FILES" variable (like "IMAGE_BOOT_FILES"), where you can list files you'd like to be included. This is very straightforward, but has the disadvantage of being a bit hairy when paths are involved, and it doesn't allow for much logic.
>>
>> * Keep a special "data" directory, something similar to sysroot, where recipes could install files into in order to have it included on the data partition. We could potentially have a bbclass for use in recipes to make this more streamlined.
>>
> 
> Firstly, it needs to be defined what the data partition is about.
> 1. is it some pre-initialized/seeded data that can then be modified during
> subsequent boots ?
> 2. Is it read-only data which is then used to populate r/w data segments in
> RAM during boot
> 3. is it data that does not change over the course of install and reboots of
> the device

It's preseeded, but modifiable data, that survives complete rootfs
updates. IOW if you overwrite either of your A/B rootfs partitions, the
data partition and its content survives.

-- 
Kristian

