Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C13D75F7C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 15:47:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6KFlE40025934
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Jul 2015 08:47:14 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Mon, 20 Jul 2015 08:47:13 -0700
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
	<CALT56yP2_bkOfesazULteWL73DuBKo-BMu0MPxHw-FUz79997g@mail.gmail.com>
	<559D1AD2.3050305@windriver.com>
	<CALT56yMhBodVKpG9Pe8zzUcHiwanmxn8pUEqdJUU14-ry6DBvg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55AD1800.20706@windriver.com>
Date: Mon, 20 Jul 2015 10:47:12 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CALT56yMhBodVKpG9Pe8zzUcHiwanmxn8pUEqdJUU14-ry6DBvg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Fix builds for MIPS64 N32
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
X-List-Received-Date: Mon, 20 Jul 2015 15:47:18 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Between customer escalations, other work and vacation.. I didn't happen.

I've started testing it this morning and should have results tomorrow.. (US time).

--Mark

On 7/20/15 7:11 AM, Dmitry Eremin-Solenikov wrote:
> 2015-07-08 15:42 GMT+03:00 Mark Hatle <mark.hatle@windriver.com>:
>> On 7/8/15 7:00 AM, Dmitry Eremin-Solenikov wrote:
>>> Hello,
>>>
>>> 2015-07-01 17:02 GMT+03:00 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>:
>>>> Quite simple configuration (MIPS64 N32 image) fails to build (see below).
>>>> I have verified these patches in both single lib and in multilib cases.
>>>> Tri-lib images and SDK for MIPS build fine with these patches.
>>>
>>> Any comments on this patchset? It would be nice to have N32 ubroken in
>>> the current
>>> master tree.
>>
>> Sorry, I'm traveling right now and haven't had time to review this.  I should be
>> able to get back to the office and test it by the end of the week.
>>
>> I visually reviewed the patches and I don't object to them going in -- but I'm
>> still not sure they are all correct.
> 
> Re-ping. I'd like to receive a confirmation from you (and thus get the
> patches merged)
> or to discuss, what seems wrong to you.
> 
>>
>> --Mark
>>
>>>>
>>>> Current situation:
>>>>
>>>> lumag@nexs:~/OE$ MACHINE=qemumips64n32 bitbake core-image-base
>>>> NOTE: Started PRServer with DBfile:
>>>> /home/lumag/OE/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 46391, PID:
>>>> 15895
>>>> Loading cache: 100%
>>>> |########################################################################################################################|
>>>> ETA:  00:00:00
>>>> Loaded 1302 entries from dependency cache.
>>>> NOTE: Resolving any missing task queue dependencies
>>>> ERROR: Nothing RPROVIDES 'binutils-cross-canadian-mips64' (but
>>>> /home/lumag/OE/sources/openembedded-core/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
>>>> RDEPENDS on or otherwise requires it)
>>>> NOTE: Runtime target 'binutils-cross-canadian-mips64' is unbuildable,
>>>> removing...
>>>> Missing or unbuildable dependency chain was: ['binutils-cross-canadian-mips64']
>>>> NOTE: Runtime target 'packagegroup-cross-canadian-qemumips64n32' is
>>>> unbuildable, removing...
>>>> Missing or unbuildable dependency chain was:
>>>> ['packagegroup-cross-canadian-qemumips64n32',
>>>> 'binutils-cross-canadian-mips64']
>>>> ERROR: Required build target 'core-image-base' has no buildable providers.
>>>> Missing or unbuildable dependency chain was: ['core-image-base',
>>>> 'packagegroup-cross-canadian-qemumips64n32',
>>>> 'binutils-cross-canadian-mips64']
>>>>
>>>
>>>
>>>
>>
> 
> 
> 


