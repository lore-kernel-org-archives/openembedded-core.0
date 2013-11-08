Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2B1236D614
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 15:59:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA8Fx3xF014030
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Nov 2013 07:59:03 -0800 (PST)
Received: from [0.0.0.0] (147.11.178.22) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 8 Nov 2013 07:59:02 -0800
Message-ID: <527D0A44.7020005@windriver.com>
Date: Fri, 8 Nov 2013 10:59:00 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1383923880.2345.4.camel@ted> <527D0624.3060407@windriver.com>
	<1383926139.2345.7.camel@ted>
In-Reply-To: <1383926139.2345.7.camel@ted>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Use hardlinks for do_populate_sysroot for speed
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
X-List-Received-Date: Fri, 08 Nov 2013 15:59:03 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-11-08 10:55 AM, Richard Purdie wrote:
> On Fri, 2013-11-08 at 10:41 -0500, Bruce Ashfield wrote:
>> On 13-11-08 10:18 AM, Richard Purdie wrote:
>>> The kernel tree is large and doesn't need to be copied. Override
>>> the default sysroot handling function to use a hardlink copying
>>> function in python.
>>>
>>> This commit also drops the copying of the /lib directory which
>>> just contains the kernel modules. We never use those in the sysroot
>>> so there is little point in carrying those around.
>>>
>>> For linux-yocto this takes the do_populate_sysroot time 24s -> 14s.
>>
>> Fantastic. One less thing for me to dig into later. I thought this
>> was already in place, so I'm pleasantly surprised that there was a
>> time savings to be found!
>
> I was somewhat surprised too.
>
> We still need to optimise what we install in do_install since that is
> where significant gains can still be made.

Agreed. I started some changes in that area right after ELC-e, I'll
try and get them out sooner rather than later.

Bruce

>
> Cheers,
>
> Richard
>


