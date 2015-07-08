Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 95C5E7391D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 12:43:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t68Ch0Ve000495
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Jul 2015 05:43:00 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (147.11.116.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Wed, 8 Jul 2015 05:42:59 -0700
Message-ID: <559D1AD2.3050305@windriver.com>
Date: Wed, 8 Jul 2015 07:42:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
	<CALT56yP2_bkOfesazULteWL73DuBKo-BMu0MPxHw-FUz79997g@mail.gmail.com>
In-Reply-To: <CALT56yP2_bkOfesazULteWL73DuBKo-BMu0MPxHw-FUz79997g@mail.gmail.com>
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
X-List-Received-Date: Wed, 08 Jul 2015 12:43:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 7/8/15 7:00 AM, Dmitry Eremin-Solenikov wrote:
> Hello,
> 
> 2015-07-01 17:02 GMT+03:00 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>:
>> Quite simple configuration (MIPS64 N32 image) fails to build (see below).
>> I have verified these patches in both single lib and in multilib cases.
>> Tri-lib images and SDK for MIPS build fine with these patches.
> 
> Any comments on this patchset? It would be nice to have N32 ubroken in
> the current
> master tree.

Sorry, I'm traveling right now and haven't had time to review this.  I should be
able to get back to the office and test it by the end of the week.

I visually reviewed the patches and I don't object to them going in -- but I'm
still not sure they are all correct.

--Mark

>>
>> Current situation:
>>
>> lumag@nexs:~/OE$ MACHINE=qemumips64n32 bitbake core-image-base
>> NOTE: Started PRServer with DBfile:
>> /home/lumag/OE/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 46391, PID:
>> 15895
>> Loading cache: 100%
>> |########################################################################################################################|
>> ETA:  00:00:00
>> Loaded 1302 entries from dependency cache.
>> NOTE: Resolving any missing task queue dependencies
>> ERROR: Nothing RPROVIDES 'binutils-cross-canadian-mips64' (but
>> /home/lumag/OE/sources/openembedded-core/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
>> RDEPENDS on or otherwise requires it)
>> NOTE: Runtime target 'binutils-cross-canadian-mips64' is unbuildable,
>> removing...
>> Missing or unbuildable dependency chain was: ['binutils-cross-canadian-mips64']
>> NOTE: Runtime target 'packagegroup-cross-canadian-qemumips64n32' is
>> unbuildable, removing...
>> Missing or unbuildable dependency chain was:
>> ['packagegroup-cross-canadian-qemumips64n32',
>> 'binutils-cross-canadian-mips64']
>> ERROR: Required build target 'core-image-base' has no buildable providers.
>> Missing or unbuildable dependency chain was: ['core-image-base',
>> 'packagegroup-cross-canadian-qemumips64n32',
>> 'binutils-cross-canadian-mips64']
>>
> 
> 
> 


