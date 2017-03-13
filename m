Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id CDFA57302E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 13:36:29 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id z15so41612868lfd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 06:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=tIa4K2/lqbjRqylqH2V9jnxk2Qgj4jYW1F999CACed4=;
	b=DZIc9b3rwyQRjoZqfSpzgO6L37EvlXvT5E2PfI2/W9BuB4+qgrmnhcPf7gRkegH0iH
	bYb5y1orjT5yOFrzyeWD+HW8kDzcREm9vF4jEd4/cAUFjWejuanbaEfZB7YRf/zIXtfs
	LfhbgYMktTjQbhaQdbrCs3zOcFBmq8Um6ucze+PNBrKFnZ6kAUT8+T5YXNhIpcUWnVx+
	IzcTJku60VNy9ouHnkWc3Jrb3hRYyvNHxke6HDCNaIGju7/LcrcB5xXrfiKN6YmWJc7Q
	nZIzNHoIxD+RzpCtfIJl1sZnIwhU5ZQ8weXcCpCHaBhIOKGNWWXGIcTjLO3FCeuSKe+y
	EI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=tIa4K2/lqbjRqylqH2V9jnxk2Qgj4jYW1F999CACed4=;
	b=tz8gewSwIXDYhk048ImAY/9xtyM6IwerBstViiIrmuinLExTNOIQSFOriJZg43ft8u
	QfVLrBzlkz3XkjyY8zzf44vtwBu/ooSViYq2GgHdDLc/3Ehr5KnPwBTUa9Ewa37hCUER
	VsFOBdUEr0YSuAqQCgx8jidFIDQHrjiq1JHvBPxWEV725J5T74rLat1g2p6SeTMla/9S
	9dsExPrS854oqOKUIRZy2yqHskA1fVprJyydVuGp6djp23vFHnwnREi7D/AVUNS9+QYk
	mrtHaaR9iGM6LNeYl0jef6w7VIUZXYn4qoyE6BUZNnVBp/SnjXc4zZ9kleX3hGdTpCo5
	hjgg==
X-Gm-Message-State: AFeK/H0l3+W/uBWmnSYFU18m0KVQ297pz8YibSXVVpneJsh6xepzGOmpZWDc1DrD8e3fuw==
X-Received: by 10.46.22.66 with SMTP id 2mr3799960ljw.120.1489412190353;
	Mon, 13 Mar 2017 06:36:30 -0700 (PDT)
Received: from [10.25.0.177] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	x64sm3647822lfd.15.2017.03.13.06.36.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 06:36:29 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20170303231811.27812-1-raj.khem@gmail.com>
	<CAGgRHJrrmcvv6CkO+fH++85YD+SxzrsrPeVCdP+MgsgP_iP23w@mail.gmail.com>
	<20170308221933.GA8506@haswell>
	<a1284fc5-f4e3-75a9-6832-893fedef7b30@mender.io>
	<CAMKF1sq5DUzTfUBTovp5RyjmWyzcCRJbitRf1sZCO3mZgRNC5w@mail.gmail.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <797c9cb6-a50b-968d-005e-ecccfbf57791@mender.io>
Date: Mon, 13 Mar 2017 14:36:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq5DUzTfUBTovp5RyjmWyzcCRJbitRf1sZCO3mZgRNC5w@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V7] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Mon, 13 Mar 2017 13:36:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 09/03/17 08:27, Khem Raj wrote:
> On Wed, Mar 8, 2017 at 11:03 PM, Kristian Amlie
> <kristian.amlie@mender.io> wrote:
>> On 08/03/17 23:19, Khem Raj wrote:
>>>> ...
>>>> For the following go-1.4 recipes:
>>>>
>>>> I wouldn't recommend fixing go-native at version 1.4, which is now
>>>> postiviely ancient.
>>>> Instead, add go1.4.3's SRC_URI into the go-native recipe, loading it
>>>> in the right place so
>>>> that make.bash finds it.  This way, you can have all the go toolchain
>>>> recipes build at the
>>>> same version.  The go team only supports go1.4 for bootstrapping the
>>>> compiler build now
>>>> anyway, IIRC.
>>>
>>> since we do not use go-native for anything other than bootstrapping
>>> right now, thats why it is there. there is no intent of providing a
>>> go-native version for general consumption
>>
>> Just FYI, in Mender we use the latest go-native, provided by
>> github.com/mem/oe-meta-go, to compile some build tools. The layer has a
>> separate go-bootstrap recipe, which is locked to 1.4, for the purpose of
>> creating go-native and go-cross.
> 
> Thanks for info. we should add it here as well.

What work is going on in this regard right now? We will need this fixed
rather soon, since currently it conflicts with the existing, external layer.

I could take a look at this myself, but I'm no Go toolchain expert, more
on the consumption side, so my solution may not be the optimal one.

-- 
Kristian

