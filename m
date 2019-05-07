Return-Path: <prvs=023c109db=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id E98CD7D688
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1557221083; x=1588757083;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=SftKVx34N7qcDRv5v1XfYRWfZR8KMsFkRt8zKPbr/j8=;
	b=QKD3tzhr1JLvZqIwr1xJGtk+q1UncMKCcSgpa8bdAg/oBa0ajm6O9g38
	mQx3iQCtMJ1FLfRr7ylR4HvbgvveifXjVCwc64LyuAr/hlWRE3aFscPyK
	mMhH/sfvYcl4vDCaYqueF97weP19ZSfrE+wyQStPlinYDWjXYCFbiPQ/T
	aKrSPLYxxAMsR7Hw0bk+yHa4IcK1JhC0eghuJWCrCo6ZVwJ4o6GNP3l5Z
	AzF+zDVph9HG03CrAiXf02odfgIy23XxW94wRIAoUILtOQsV3AYMw55BD
	EGqwhVh+x1Dha3lSw7JpY9lEFxgDQs60K4weZzGByonI4y4usbb+/PsaW Q==;
IronPort-SDR: gP8GvR2qXzqj6hMY+50H5ME1TUTzkygFu1D5kEhgYeFYJk3H1KdHnuNuHIkrd09c+0u+AFdXSz
	kmowfalZn88UTBf9DWNVDppxH0tVShEKm7mgjqrn3ZHk70K+Uw5t8FTzVql24Zh+/m47IhHG0m
	22KRGKJtyazDoMm517VLCYqT7mlvZrfiL/7yvue3mi1R9YYymwcLsXradfcYUxJhDrbNrDTLaz
	RYHGE5xB/MSmg3RbXK/zHggcmKAfxD+Gc+3qG30zslTiK4166qRBGU9aoZ5LP0i/r143wYEWxC
	sBw=
X-IronPort-AV: E=Sophos;i="5.60,441,1549926000"; 
   d="scan'208";a="2125658"
To: Alex Kiernan <alex.kiernan@gmail.com>
References: <20190506074531.13459-1-richard.leitner@skidata.com>
	<CAO5Uq5RJtfyFNkCL=L1Vgrv9cJ+Fu+J90+ecapg3bEupa5hjUg@mail.gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <02708969-c94d-06f8-1a87-d3ee2239f6ad@skidata.com>
Date: Tue, 7 May 2019 11:24:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5RJtfyFNkCL=L1Vgrv9cJ+Fu+J90+ecapg3bEupa5hjUg@mail.gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [warrior][PATCH] uboot-sign: add support for different u-boot configurations
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
X-List-Received-Date: Tue, 07 May 2019 09:24:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/05/2019 11:14, Alex Kiernan wrote:
> On Mon, May 6, 2019 at 8:53 AM Richard Leitner
> <richard.leitner@skidata.com> wrote:
>>
>> From: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
>>
>> This is done by concatenating the DTB with the kernels public key
>> to all built u-boot binaries. Furthermore the installation of all
>> the binaries is required.
>>
>> Signed-off-by: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> 
> If this gets applied, please can we get:
> 
> https://patchwork.openembedded.org/patch/160510/
> 
> applied on top of it?
> 

ACK. Thanks for the catch, I missed there is a fix on top of this patch 
already.

regards;Richard.L

