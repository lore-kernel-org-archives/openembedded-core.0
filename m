Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id A7F9377241
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 11:05:03 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3sSRhY4r6mz3hjQg;
	Mon,  5 Sep 2016 13:05:01 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3sSRhY4PNszvkX5;
	Mon,  5 Sep 2016 13:05:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id azxvYqzZIGeh; Mon,  5 Sep 2016 13:05:00 +0200 (CEST)
X-Auth-Info: RzrmrTdl3TEDDlhvetonyv0JIgPjXXgYkt4KYql2LW4=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon,  5 Sep 2016 13:05:00 +0200 (CEST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20160904162130.13313-1-marex@denx.de>
	<1473024487.20226.3.camel@linuxfoundation.org>
	<9f3a5dfd-8303-b6d0-cd5e-07f2aac7c588@denx.de>
	<1473027091.20226.4.camel@linuxfoundation.org>
	<252ea4f7-871c-60a5-0a2f-f59a5d35683e@denx.de>
	<00e9ef55-2e08-5c92-0a5a-32e9ce1f61fa@denx.de>
	<1473073354.20226.9.camel@linuxfoundation.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <1fbc36ad-f031-9f85-7861-1ba302273ace@denx.de>
Date: Mon, 5 Sep 2016 13:04:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473073354.20226.9.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/2] u-boot: Factor out common bits
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
X-List-Received-Date: Mon, 05 Sep 2016 11:05:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 09/05/2016 01:02 PM, Richard Purdie wrote:
> On Mon, 2016-09-05 at 00:33 +0200, Marek Vasut wrote:
>> On 09/05/2016 12:23 AM, Marek Vasut wrote:
>>> On 09/05/2016 12:11 AM, Richard Purdie wrote:
>>>> On Sun, 2016-09-04 at 23:49 +0200, Marek Vasut wrote:
>>>>> On 09/04/2016 11:28 PM, Richard Purdie wrote:
>>>>>> On Sun, 2016-09-04 at 18:21 +0200, Marek Vasut wrote:
>>>>> Yes, except when new version of U-Boot comes out and we want to
>>>>> perform
>>>>> update of the u-boot{,mkimage,fw-utils} recipes, with this
>>>>> current
>>>>> patch
>>>>> as is, we'd only have to rename these recipes and change the
>>>>> version
>>>>> in
>>>>> u-boot-common.inc . With your proposal, we'd have to not only
>>>>> rename
>>>>> the
>>>>> recipes and tweak u-boot-common.inc, but also edit their
>>>>> content and
>>>>> change the "require u-boot-common_20yy.mm.inc" bit, which adds
>>>>> some
>>>>> toil.
>>>> Unless its:
>>>>
>>>> require u-boot-common_${PV}.inc
>>>>
>>>> since it should be able to extract PV from the filename...
>>> Ah right, thanks :)
>>>
>>> I'll rebuild/retest and send a V2 .
>>>
>> I was a bit hasty, the u-boot.inc includes u-boot-common.inc without
>> having PV set. Any idea how to deal with that ?
> 
> Just put includes in the versioned files rather than from u-boot.inc?

Wouldn't that break some BSPs ? I factored out code from the u-boot.inc
afterall.

Thanks!

-- 
Best regards,
Marek Vasut

