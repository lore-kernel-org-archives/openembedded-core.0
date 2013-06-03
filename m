Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 482ED6A588
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 14:22:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r53EML6e026041
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Jun 2013 07:22:21 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 3 Jun 2013 07:22:20 -0700
Message-ID: <51ACA69C.2080303@windriver.com>
Date: Mon, 3 Jun 2013 09:22:20 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Philip Balister <philip@balister.org>
References: <cover.1369820334.git.hongxu.jia@windriver.com>
	<51A71980.30802@communistcode.co.uk>
	<51A74370.3030700@windriver.com> <51A74CFA.5090609@balister.org>
	<51A7751E.9060102@windriver.com>
	<1369930392.8846.58.camel@phil-desktop.brightsign>
	<51A77BD8.8020302@windriver.com> <51AC7C02.20907@balister.org>
In-Reply-To: <51AC7C02.20907@balister.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4]Add FUSE: File system in Userspace
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
X-List-Received-Date: Mon, 03 Jun 2013 14:22:22 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/13 6:20 AM, Philip Balister wrote:
> On 05/30/2013 12:18 PM, Mark Hatle wrote:
>> On 5/30/13 11:13 AM, Phil Blundell wrote:
>>> On Thu, 2013-05-30 at 10:49 -0500, Mark Hatle wrote:
>>>> It has 413 recipes (and 2 bbappends).  Of the 413, likely many of
>>>> those should
>>>> really be in one of the other meta-openembedded layers (or even other
>>>> project
>>>> layers).  But my customers are not willing to bring in 413 packages
>>>> just for '1'
>>>> package they might need out of the set.
>>>>
>>>> (Similarly, we don't just "bring in" meta-openembedded either.. we
>>>> break out the
>>>> layers so only the ones we're willing to support, and our customers
>>>> need are
>>>> provided to them.)  There is no such thing as an "unsupported"
>>>> package when you
>>>> are a commercial vendor.
>>>
>>> I'm not entirely sure what you mean by "bring in" in this context or
>>> what the underlying rationale for your reluctance is.  But some general
>>> comments:
>>
>> Support and testing.. if the recipe is there we have to support it, if
>> we don't ship it to our customers -- they are free to source it
>> themselves, but it's clear that we didn't test and don't support it.
>>
>> We provide it, customers expect us to support it.  We're not willing to
>> support meta-oe due to the number of recipes in it.  oe-core,
>> meta-yocto, meta-networking, meta-selinux, meta-webserver, and others we
>> do use, test and provide to our customer.
>
> Does this mean we should look at splitting meta-oe into more layers? Or
> is this issue unique to Wind River?

I think there is merit in looking at the contents of meta-oe over time and 
splitting them up into functional units.  However, at this point I don't have 
any direct suggestions as to what those units would be.

> At some point, the layer dependencies get out of hand.

Yes they do.  The number of layers and contents of them also have to be 
reevaluated over time.  What makes sense for one release may drastically change 
in the future and we have to be willing to adapt to the changing configurations. 
  I think for the most part the sublayers within meta-openembedded are at 
roughly the right level.  It's the general "meta-oe" that is the issue for us. 
(Too many things we're not willing to support.)

--Mark

> Philip
>
>>
>>> It's entirely possible to have a copy of meta-oe on hand and only
>>> include a subset of the recipes in the parse.  You can do that either by
>>> adding the layer and then BBMASKing out everything you don't want, or by
>>> not adding the layer as such but just admit individual recipes by adding
>>> them to BBFILES specifically.  Either of those approaches would avoid
>>> the risk of accidentally introducing dependencies on recipes from
>>> meta-oe without realising that this is what you are doing.
>>>
>>> Also, I think the toxicity of meta-oe nowadays is much less than it used
>>> to be (thanks mostly to excellent work by Paul in cleaning up
>>
>> I agree, it's significantly better now.  I do use meta-oe from time to
>> time on personal projects...
>>
>>> the .bbappends and overlapping recipes) and, as far as I know, the act
>>> of including meta-oe in your layer list no longer leads to the sort of
>>> random changes to recipe versions and behaviour that you might have
>>> gotten burned by in the past.  So if your previous experience is from
>>> some time ago then you might want to give it another try.
>>>
>>> p.
>>>
>>>
>>
>>


