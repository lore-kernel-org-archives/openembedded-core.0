Return-Path: <martin@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id B345A7EF45
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 14:43:57 +0000 (UTC)
Received: from [192.168.8.20] (unknown [85.184.140.241])
	by first.geanix.com (Postfix) with ESMTPSA id B9D6B173E;
	Wed, 10 Jul 2019 14:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1562769836; bh=nprJrO89Bqf288lYRhEenPKJMChdaAONr07MMqsPXcw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=gnQMvzseAHfV6l5YgEfAbxIAHzkjXPNJiTZ86tc6ZdlLvksxlwhFUsyUgwqK4S+wi
	ueF1y45frRCzlGJb5DHqozf1HvUufCmSuG2vazP2m63Jsj14gZnwAfjcLvlvIkTHQn
	nqA1lGFT2EOq82bdH7cWndJSmgIQ0I7jpqIO7hBTgrno5XkGjrQdCacja8xmChaEn4
	mHkGK4xqxvF6ECqfuobkPYe9Gs8rHge9DFLm/kVAJpa1E61q0OAYZZb7zVRUjN+r7h
	dN4OSKQuCDGjMlMpfVwpewNobm36qtgHCYBMDGe2DaBkf9WT270RnrdW/FbZvORimr
	4xuEM3IumWBqA==
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Ross Burton <ross.burton@intel.com>
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
	<895d9d6d6e611652f3e144561811868b1df15cf6.1559220004.git.bruce.ashfield@gmail.com>
	<df9ca430-ee2a-5428-2528-28604e1b5bce@geanix.com>
	<CADkTA4OpSXaKOvWO7uQr-ydpN5-jEwwQsvFUw9f26w_xLWyj5A@mail.gmail.com>
	<6bfc6569a78a2a12f6172a7323f9fb1a6149a6b0.camel@linuxfoundation.org>
	<ff3ad9df5905fed05c2a328e1fc541b29fd7e101.camel@linuxfoundation.org>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <09090d81-2a91-d434-88b2-33f95ba0d9d4@geanix.com>
Date: Wed, 10 Jul 2019 16:43:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ff3ad9df5905fed05c2a328e1fc541b29fd7e101.camel@linuxfoundation.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on 8945dcc0271d
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/9] linux-yocto-dev: bump to v5.2-rc
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
X-List-Received-Date: Wed, 10 Jul 2019 14:43:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit

On 10/07/2019 16.28, Richard Purdie wrote:
> On Wed, 2019-07-10 at 15:27 +0100, richard.purdie@linuxfoundation.org
> wrote:
>> On Wed, 2019-07-10 at 10:21 -0400, Bruce Ashfield wrote:
>>> On Wed, Jul 10, 2019 at 10:15 AM Martin Hundebøll <
>>> martin@geanix.com>
>>>
>>>
>>> Nope, I haven't seen that. But then again, all my machines have
>>> realpath available.
>>>
>>> As you hinted, building all of coreutils as a dependency for the
>>> kernel is a bit heavy. We could make
>>> realpath a host requirement,  or otherwise, split out realpath (but
>>> you'd still need to build coreutils, so
>>> that really doesn't help).
>>>
>>> I'd lean towards just making it a host requirement .. but I'm sure
>>> Richard can advise better than me
>>> on the pro's and con's of the options.
>>
>> realpath is in the standard HOSTTOOLS in bitbake.conf so its already
>> required?
> 
> http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/conf/bitbake.conf?id=12e1a0de18fc05e68be8e6f1688c1499e37b076b

Now I see; I am building on thud...

Armin, can you backport commit 12e1a0de18fc05e68be8e6f1688c1499e37b076b 
to active branches?

Thanks,
Martin

