Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 82D0671975
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 17:50:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA3Ho66t013920
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 3 Nov 2017 10:50:07 -0700
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 3 Nov 2017 10:50:06 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Catalin Enache
	<catalin.enache@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <1509553729-22718-1-git-send-email-catalin.enache@windriver.com>
	<1ce6fd9f-8a06-e64e-990a-295da4c17481@linux.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <6f9d2a40-5b5b-65b7-2f71-4b93712a749e@windriver.com>
Date: Fri, 3 Nov 2017 13:50:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1ce6fd9f-8a06-e64e-990a-295da4c17481@linux.intel.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [PATCH] libxfont: CVE-2017-13720, CVE-2017-13722
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
X-List-Received-Date: Fri, 03 Nov 2017 17:50:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-11-01 01:07 PM, Alexander Kanavin wrote:
> On 11/01/2017 06:28 PM, Catalin Enache wrote:
>> In the PatternMatch function in fontfile/fontdir.c in libXfont through 
>> 1.5.2
>> and 2.x before 2.0.2, an attacker with access to an X connection can 
>> cause
>> a buffer over-read during pattern matching of fonts, leading to 
>> information
>> disclosure or a crash (denial of service). This occurs because '\0'
>> characters are incorrectly skipped in situations involving ? characters.
>>
>> In the pcfGetProperties function in bitmap/pcfread.c in libXfont 
>> through 1.5.2
>> and 2.x before 2.0.2, a missing boundary check (for PCF files) could 
>> be used
>> by local attackers authenticated to an Xserver for a buffer over-read, 
>> for
>> information disclosure or a crash of the X server.
> 
> If both 1.x and 2.x are vulnerable, you should update them both (not 
> just 1.x). 

Sure but 2.x isn't in morty, see below.

> Also, it's better to update to a version that is not 
> vulnerable, rather than backport patches.
> 
> Alex

Alex,

Catalin works on the WR sustaining team so his mandate is to take care
of released products where updating isn't typically permitted.
Now that oe-core-2.2 is out, we'll be sending patches for rocko as
well but we're in a transition time for a while so bear with us please.
If master and rocko have the same code, then of course we Catalin would
target master and arrange to have the commit backported.

Catalin,

Please tag your commits if they are strictly for the morty
branch using something like:
    [OE-core][morty][PATCH] foo: the bar should be zinged
    [OE-core][PATCH][morty] foo: the bar should be zinged

as per:
    https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance

Thanks,
-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

