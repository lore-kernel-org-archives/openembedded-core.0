Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E25E46BFA6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 04:40:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8A4euId023318
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Sep 2013 21:40:56 -0700 (PDT)
Received: from [128.224.22.38] (128.224.22.38) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 9 Sep 2013 21:40:55 -0700
Message-ID: <522EA2D6.7030805@windriver.com>
Date: Tue, 10 Sep 2013 00:40:54 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: jhuang0 <jackie.huang@windriver.com>
References: <1378721444-22545-1-git-send-email-jackie.huang@windriver.com>
	<1378722078.6940.124.camel@phil-desktop.brightsign>
	<522DA232.70900@windriver.com>
In-Reply-To: <522DA232.70900@windriver.com>
X-Originating-IP: [128.224.22.38]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pulseaudio: avoid gcc ICE by omitting code TEMPORARILY
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
X-List-Received-Date: Tue, 10 Sep 2013 04:40:55 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-09-09 06:25 AM, jhuang0 wrote:
>
>
> On 9/9/2013 6:21 PM, Phil Blundell wrote:
>> On Mon, 2013-09-09 at 18:10 +0800, jackie.huang@windriver.com wrote:
>>> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>>>
>>> It's a FYI patch for anyone who might be having the same problem.
>>>
>>> pulseaudio-4.0 causes an internal compiler error. Temporarily
>>> avoid the build error be omitting the code that makes the
>>> compiler fail until the compiler ICE is addressed.
>>
>> Please mention the GCC bug number for this ice so that it's easy to
>> establish when it has indeed been addressed.
>
> Sorry, I don't have the bug number.
>
> Randy,
>
> Do you have one for this?

Not yet.

In fact I can't reproduce it using just oe-core so
I think my report via Jackie is a false alarm.
Sorry about that.

// Randy
>
> Thanks,
> Jackie
>
>>
>> p.
>>
>>
>>
>>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

