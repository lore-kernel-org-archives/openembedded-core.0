Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1RkeQp-0003oa-Ps
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 17:20:15 +0100
Received: by wgbdt11 with SMTP id dt11so2784772wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 08:12:46 -0800 (PST)
Received: by 10.180.19.42 with SMTP id b10mr4332662wie.13.1326211966802;
	Tue, 10 Jan 2012 08:12:46 -0800 (PST)
Received: from [128.224.170.207] ([89.121.200.106])
	by mx.google.com with ESMTPS id g26sm57614860wbo.16.2012.01.10.08.12.46
	(version=SSLv3 cipher=OTHER); Tue, 10 Jan 2012 08:12:46 -0800 (PST)
Message-ID: <4F0C637E.8050704@gherzan.ro>
Date: Tue, 10 Jan 2012 18:12:46 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1326208678-17244-1-git-send-email-andrei@gherzan.ro>
	<CABcZANnzU_5LTeRV=UjPiUWn6rqnZS6RR_yhsUKE_C_ap-PZ9g@mail.gmail.com>
	<4F0C623B.7050209@gherzan.ro>
	<CABcZANmcdGtOa+K9=6Ei_vAF=BVQwa6BYAYTjpeEuCDcqPcPnQ@mail.gmail.com>
In-Reply-To: <CABcZANmcdGtOa+K9=6Ei_vAF=BVQwa6BYAYTjpeEuCDcqPcPnQ@mail.gmail.com>
Subject: Re: [PATCH] license.bbclass base.bbclass: support for 'or' operand in LICENSE and for SPDX license names
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jan 2012 16:20:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2012 06:10 PM, Chris Larson wrote:
> On Tue, Jan 10, 2012 at 9:07 AM, Andrei Gherzan<andrei@gherzan.ro>  wrote:
>> On 01/10/2012 05:34 PM, Chris Larson wrote:
>>> On Tue, Jan 10, 2012 at 8:17 AM, Andrei Gherzan<andrei@gherzan.ro>    wrote:
>>>> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>>>>
>>>> A new function was defined in license.bbclass in order to correctly
>>>> exclude packages where OE-Style licence naming
>>>> is used. In this way licenses as GPL-3, GPLv3, GPLv3.0 etc will be
>>>> excluded from a non-GPLv3 build. This function
>>>> takes into consideration if 'or' operand is used.
>>>> The function defined in license.bbclass is called in base.bbclass where
>>>> packages are excluded based on
>>>> INCOMPATIBLE_LICENSE variable.
>>>>
>>>> [YOCTO #1884]
>>>> [YOCTO #1844]
>>>>
>>>> Signed-off-by: Andrei Gherzan<andrei at gherzan.ro>
>>>
>>> Out of curiosity, why are we using regex for this when we already have
>>> license parsing in the oe.license module which can handle the OR case?
>>
>> I'm using regex only for excluding '+' characters from LICENSE. The rest of
>> the work is done in oe.license.
>> If X is defined as INCOMPATIBLE_LICENSE, X+ should be exluded as well.
> Ah, right, apparently I'm blind :) We should really think about a
> generic mechanism for handling + somehow. Hmm.
No worries. Anyway, you are right about the "+" mechanism but right now 
this is a fast and complete solution.

ag


