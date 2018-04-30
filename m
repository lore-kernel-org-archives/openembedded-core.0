Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 9F56D60939
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 17:42:44 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40ZX1c5211z1qwQ9;
	Mon, 30 Apr 2018 19:42:44 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40ZX1c4DVMz1qqxG;
	Mon, 30 Apr 2018 19:42:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id egmp9P8aLl7R; Mon, 30 Apr 2018 19:42:43 +0200 (CEST)
X-Auth-Info: JKp4s4SNzxd5wlyYutq1ArsRIQYXnfPZrADmUlKxvik=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 30 Apr 2018 19:42:43 +0200 (CEST)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	yamada.masahiro@socionext.com, mnhu@prevas.dk, raj.khem@gmail.com
References: <20180408230223.17260-1-marex@denx.de>
	<CAMKF1squXKSNhvmHj_p0Q-5cK3H-yKH1upwKXjvDCoindshUWA@mail.gmail.com>
	<bf9e9593-a395-8d53-faf8-ad6609aa5ba1@prevas.dk>
	<53904a8f-7ba2-7f09-4e93-a95a780f60c7@denx.de>
	<d89b39f665a14c63b0821c1ad600da72@SOC-EX01V.e01.socionext.com>
	<8cc34667-5bb3-9642-40e2-d56b28f56646@prevas.dk>
	<32a348ed6176434db8178d29d7e1f183@SOC-EX01V.e01.socionext.com>
	<5ca366ed-3108-4a56-caaf-06b4f136d259@denx.de>
	<627e0fde-f97f-5c49-bc1a-325e7baa9072@linux.intel.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <0802e876-fda0-d8d2-9dca-18ba8cbe073e@denx.de>
Date: Mon, 30 Apr 2018 19:25:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <627e0fde-f97f-5c49-bc1a-325e7baa9072@linux.intel.com>
Cc: otavio@ossystems.com.br, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Mon, 30 Apr 2018 17:42:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/30/2018 02:17 PM, Alexander Kanavin wrote:
> On 04/16/2018 11:40 AM, Marek Vasut wrote:
>>> Isn't it possible to solve your issue in the OE side?
>>>
>>
>> Can we NOT compile DTC alongside U-Boot somehow ? :)
>> That'd be the most desired solution IMO.
> 
> Yes please. Can you adjust the recipes and classes in oe-core, and
> remove the dtc recipe altogether?

Remove dtc recipe ? Not sure I understand what you're implying.

-- 
Best regards,
Marek Vasut

