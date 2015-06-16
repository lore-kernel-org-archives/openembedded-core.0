Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3046860557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 18:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 537973156282;
	Tue, 16 Jun 2015 20:46:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id xQ5eKudMcX-0; Tue, 16 Jun 2015 20:46:37 +0200 (CEST)
Received: from [172.22.22.61] (55d44892.access.ecotel.net [85.212.72.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 98B323155608;
	Tue, 16 Jun 2015 20:46:37 +0200 (CEST)
Message-ID: <55806F0C.2080902@opendreambox.org>
Date: Tue, 16 Jun 2015 20:46:36 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
References: <1431553871-23972-1-git-send-email-bruno.bottazzini@intel.com>	
	<1431553871-23972-4-git-send-email-bruno.bottazzini@intel.com>	
	<5553D30E.9010201@opendreambox.org>	
	<1432041528.13734.8.camel@bottazzini-ThinkPad-T430>	
	<1433523167.26250.16.camel@bottazzini-ThinkPad-T430>
	<1434478275.2661.3.camel@bottazzini-ThinkPad-T430>
In-Reply-To: <1434478275.2661.3.camel@bottazzini-ThinkPad-T430>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V5 3/3] systemd: split modules into packages
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
X-List-Received-Date: Tue, 16 Jun 2015 18:46:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello Bruno,

On 16.06.2015 20:11, Bottazzini, Bruno wrote:
> Ping
> 
> On Sex, 2015-06-05 at 13:52 -0300, Bottazzini, Bruno wrote:
>> Ping.
>>
>> On Ter, 2015-05-19 at 10:18 -0300, Bottazzini, Bruno wrote:
>>> On Qui, 2015-05-14 at 00:41 +0200, Andreas Oberritter wrote:
>>>> Hello Bruno,
>>>>
>>>> On 13.05.2015 23:51, Bruno Bottazzini wrote:
>>>>> +########################################################################
>>>>> +# Aggregation of Split Packages
>>>>> +########################################################################
>>>>> +PACKAGES =+ "${PN}-services-base"
>>>>> +SUMMARY_${PN}-services-base = "Base services aggregation"
>>>>> +ALLOW_EMPTY_${PN}-services-base = "1"
>>>>> +RDEPENDS_${PN}-services-base = " \
>>>>
>>>> I think it would be better to use RRECOMMENDS, in order to support
>>>> BAD_RECOMMENDATIONS per image. This would also remove the need to use
>>>> bb.utils.contains, because unavailable recommended packages get ignored
>>>> by the package managers.
>>>
>>> I don't think if we should use RRECOMENDS. 
>>>
>>> There are some packages described in services-base that it is not on the
>>> default PACKAGECONFIG.
>>>
>>> With RRECOMENDS and with out bb.utils.contains, it will install all the
>>> packages that it is described on the recipe and this is not the behavior
>>> we are looking for.
>>>
>>>>
>>>> Besides that, I wonder whether ${PN}-services would be a better name,
>>>> because the -base suffix suggests that it contained only the most
>>>> important services.
>>>
>>> Sure, we can change it.
>>>

I guess your patch wasn't applied, because your last answer let expect a
follow-up patch.

There may be other reasons I don't know about (complexity for example).
Note that I'm not the maintainer of this recipe. I just shared my
thoughts as a user.

Regards,
Andreas

