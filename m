Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id A8D8F719BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 16:03:02 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id w194so1272740vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 08:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iW30OL/D9msspI8u6vZ05VSldnY+0C5ddblONwiowc4=;
	b=MVqt4Ngrqi994XDqihddfJNKHIarfwhuaFEu9taL/tBlnGSDk9Fgw+hXc9XAcCqjm4
	d6TI5Lvh3ef/EgqC89R6BUcAaVvQNd4uxqyve8XIcV7hw1pyUXgxAh5m0WQLpgjj5hC6
	LtICjRltnlQ/YCnXOHsALOPlbCUwKBj1fTjIr9E58R7ITAPJXzddVas+EcE/iwszwIpy
	EaBMKnOpv1B3MAv27t7jmZPchUjE7gruCbvkbe65mX0BkuXi8F3iJ1PsontdZ5/ZeX+Q
	mtXy6cI1V/vr6rxe6FFIJYiwmw68PUKeu19BSXMTG6Eax32XdoteCqeWHhTNsf95v166
	o5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iW30OL/D9msspI8u6vZ05VSldnY+0C5ddblONwiowc4=;
	b=RpNiiz/Hfj/nCU6TrIY8yV87o0PsVS66nkn/TUPC6ReQJXo9HWOtA3NhkSzybM5kyV
	HciARgyIqvrrPY0Ta99kGS55pEhaLtE8TjEINBeL9DadPTqZtxcEh3L/eV2H8cy9SfCI
	bZJugBYCcZtMY/NOVsIV7Yn3ClQ84erDy4om+rwF9bBLaZ4YE7QZBcnFFdf1+3lTBRNg
	LoSJs/+67MHbqgyWi2bh8QsBW8olcBTHQnN794dIUbKiDU7GFpFGFqb+6VRLwj9l3q35
	GWKn97+B/GYF+XWBhNACch3vRq/35XmQPPF3A3canO/MtS1mNF98YBZTCBXKrARmfuS0
	tcpg==
X-Gm-Message-State: ABUngvd1SxuN1PFSlWlXW5sFacHOzzeMeiqxtsgirDZHkxDuZ6jy+OEqcaZL0907HeStyFpPGwByc+G9bMNFjg==
X-Received: by 10.31.244.9 with SMTP id s9mr2253635vkh.31.1478880183397; Fri,
	11 Nov 2016 08:03:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Fri, 11 Nov 2016 08:02:32 -0800 (PST)
In-Reply-To: <d8dfb2d5-66de-8daf-99c3-13c611a7f5b2@linux.intel.com>
References: <20161110003935.1858-1-raj.khem@gmail.com>
	<d8dfb2d5-66de-8daf-99c3-13c611a7f5b2@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Nov 2016 08:02:32 -0800
Message-ID: <CAMKF1sou_spk+SLREA6v8TBynki-2Au+x+sNXM0cMniJYpOA9w@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Fri, 11 Nov 2016 16:03:02 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 11, 2016 at 5:10 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/10/2016 02:39 AM, Khem Raj wrote:
>>
>> This is converging the recipes for go from
>> meta-virtualization and oe-meta-go
>
>
> Wait a moment, why this should go to oe-core and not to meta-go? Is there
> something in oe-core itself that requires presence of go compiler?

Nothing thats enabled in OE-Core depends on go yet, however, thats not
always the reason
for something to be in OE-Core, if you look out, you will see there is
no single layer for golang ( I see atleast 5 )
support, each one of them is done differently, some are better than
others depending upon what you need,
This causes a lot of confusion for users who have golang needs.
 golang is a fast growing language being adopted in verticals where OE is used,
This would offer a consolidated place for golang in OE ecosystem.

