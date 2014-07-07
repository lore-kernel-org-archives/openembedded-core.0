Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23E9F70386
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 09:58:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s679wKOS024125
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Jul 2014 02:58:21 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 7 Jul 2014 02:58:20 -0700
Message-ID: <53BA6F3B.8030206@windriver.com>
Date: Mon, 7 Jul 2014 17:58:19 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1403922753-33481-1-git-send-email-liezhi.yang@windriver.com>	
	<53BA697F.8060604@windriver.com> <1404726856.1458.12.camel@ted>
In-Reply-To: <1404726856.1458.12.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH V2] base.bbclass: show git summary in BUILDCFG_HEADER
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
X-List-Received-Date: Mon, 07 Jul 2014 09:58:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/07/2014 05:54 PM, Richard Purdie wrote:
> On Mon, 2014-07-07 at 17:33 +0800, Robert Yang wrote:
>> On 06/28/2014 10:32 AM, Robert Yang wrote:
>>> It was:
>>> meta
>>> meta-yocto
>>> meta-yocto-bsp    = "master:3a054dc27067efaae9150b465298d9c45d728f85"
>>>
>>> Now:
>>> meta
>>> meta-yocto
>>> meta-yocto-bsp    = "master:3a054dc base.bbclass: show git summary in BUILDCFG_HEADER"
>>
>> Any objections on this patch, please ? Or I will send a regular patch.
>
> Being able to find the full sha1 can be useful and is something I use
> periodical but I also understand why you want more information here.

Thanks, let's drop the patch since the full sha1 is useful.

// Robert

>
> So I have mixed feelings on it...
>
> Cheers,
>
> Richard
>
>
>

