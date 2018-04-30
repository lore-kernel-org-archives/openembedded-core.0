Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id D90836058D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 23:30:34 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40Zgky0Xvkz1qtdw;
	Tue,  1 May 2018 01:30:34 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40Zgky00zMz1qqxG;
	Tue,  1 May 2018 01:30:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id bgV2UGLqLL7o; Tue,  1 May 2018 01:30:33 +0200 (CEST)
X-Auth-Info: SKGgLSfu14m/5oEwi2JvnQqFJTwzk5aJGb/Ku2XXl2s=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  1 May 2018 01:30:32 +0200 (CEST)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Tom Rini <trini@konsulko.com>
References: <bf9e9593-a395-8d53-faf8-ad6609aa5ba1@prevas.dk>
	<53904a8f-7ba2-7f09-4e93-a95a780f60c7@denx.de>
	<d89b39f665a14c63b0821c1ad600da72@SOC-EX01V.e01.socionext.com>
	<8cc34667-5bb3-9642-40e2-d56b28f56646@prevas.dk>
	<32a348ed6176434db8178d29d7e1f183@SOC-EX01V.e01.socionext.com>
	<5ca366ed-3108-4a56-caaf-06b4f136d259@denx.de>
	<627e0fde-f97f-5c49-bc1a-325e7baa9072@linux.intel.com>
	<0802e876-fda0-d8d2-9dca-18ba8cbe073e@denx.de>
	<f6d2cd6a-4206-3a2c-1854-4ff12bd35df7@linux.intel.com>
	<CAP9ODKqTV4g2ze+zw9KPqkiQ_LUQ7NTfWUzN-xvKvwE64Qkisg@mail.gmail.com>
	<20180430202522.GK31362@bill-the-cat.ec.rr.com>
	<CAP9ODKrSENfuyMmvuyFMaAXfsr-Dd8dzM1X1pRp5m_5ys_3x2Q@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <91b044f5-b110-8a74-31cd-bbbd2176f57e@denx.de>
Date: Tue, 1 May 2018 01:30:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrSENfuyMmvuyFMaAXfsr-Dd8dzM1X1pRp5m_5ys_3x2Q@mail.gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 30 Apr 2018 23:30:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/30/2018 10:29 PM, Otavio Salvador wrote:
> On Mon, Apr 30, 2018 at 5:25 PM Tom Rini <trini@konsulko.com> wrote:
> 
>> On Mon, Apr 30, 2018 at 07:57:18PM +0000, Otavio Salvador wrote:
>>> On Mon, Apr 30, 2018 at 4:53 PM Alexander Kanavin <
>>> alexander.kanavin@linux.intel.com> wrote:
>>>
>>>> On 04/30/2018 08:25 PM, Marek Vasut wrote:
>>>>>>>> Isn't it possible to solve your issue in the OE side?
>>>>>>>>
>>>>>>>
>>>>>>> Can we NOT compile DTC alongside U-Boot somehow ? :)
>>>>>>> That'd be the most desired solution IMO.
>>>>>>
>>>>>> Yes please. Can you adjust the recipes and classes in oe-core, and
>>>>>> remove the dtc recipe altogether?
>>>>>
>>>>> Remove dtc recipe ? Not sure I understand what you're implying.
>>>
>>>> If u-boot bundles dtc in its source tree, can we use that, and remove
>>>> the external dtc recipe?
>>>
>>> We shouldn't. The point in use the recipes inside OE-Core is because our
>>> bugfixes, patches and etc are used everywhere. If we use the bundled
> copy
>>> how we'd fix a host issue for example? Duplicate patches?
> 
>> What do you do for the kernel here?
> 
> We use our dtc-native. As we do for all other recipes (but few exceptions)

Yeah, we should use the DTC from OE , not the DTC from U-Boot.

-- 
Best regards,
Marek Vasut

