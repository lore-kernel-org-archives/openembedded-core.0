Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5AB6017E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 17:38:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA3Hc3LL012240
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Nov 2014 09:38:03 -0800 (PST)
Received: from msp-dhcp41.wrs.com (172.25.34.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 3 Nov 2014 09:38:02 -0800
Message-ID: <5457BD7A.9020806@windriver.com>
Date: Mon, 3 Nov 2014 11:38:02 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>	<1C408B9F-5383-488A-AE4C-E18D69800825@dominion.thruhere.net>	<CAJTo0LYOHMZCoGS342Wnh06LbJWUS1K_aDFfDWG4gxeFswm7EA@mail.gmail.com>	<A5FE6A94-E1CA-4E02-8B98-D018F14888F7@dominion.thruhere.net>	<CAJTo0LYm6rqFtJ5jTq=cTGnJDHrYaj7f94RmWR_Lh-LkKqKaiA@mail.gmail.com>	<07F08083-4EDE-4CC7-AAA7-53019C7978C0@dominion.thruhere.net>	<1415016627.5111.9.camel@ted>
	<9D7813D1-1BDC-4B46-BE6D-CF05049314E5@linaro.org>
In-Reply-To: <9D7813D1-1BDC-4B46-BE6D-CF05049314E5@linaro.org>
Subject: Re: [PATCH] libpng 1.6.13: fix build for aarch64
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
X-List-Received-Date: Mon, 03 Nov 2014 17:38:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/14, 9:24 AM, Koen Kooi wrote:
>
> Op 3 nov. 2014, om 13:10 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
>
>> On Mon, 2014-11-03 at 13:06 +0100, Koen Kooi wrote:
>>>> Op 3 nov. 2014, om 12:30 heeft Burton, Ross <ross.burton@intel.com> het volgende geschreven:
>>>>
>>>>
>>>> On 3 November 2014 11:27, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>>> Last night I was looking at my "post-1.7" tag and the number of aarch64 patches there.   Kai, did you continue work on that staging branch for all of the aarch64 patches that were being posted?
>>>>
>>>> What does that have to do with this patch?
>>>>
>>>> Kai was collecting patches that were sent to oe-core, and this may have been one of them.
>>>
>>> Is this some new requirement for OE-core patches?
>>
>> Its someone being helpful and trying to consolidate a topic branch and
>> test things before it gets merged.
>>
>> So its not a new requirement but it is helpful and appreciated.
>
> It's been over a month and libpng is still broken, so I refuse to classify this new process as 'helpful' or as 'appreciated' at this point.
>
> If this continues can the person doing such a branch reply to patches intended for it saying they will or won't be queued? And please run the patches without such a reply through the regular process. That would be both helpful and appreciated.

We've been attempting to aggregate what we (WR) can in:

  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=kangkai/qemuarm64

But as it's unofficial and we're simply trying to keep the patches we know of 
together..  you'll have to be patient.  The first order of business is getting a 
functional qemuarm64.. it's MOSTLY there, but we're having toolchain issues and 
other things that are simply higher priority for us.

As for libpng, we have a different version of the patch in that branch...  it 
was enough to get around the problem in question, but may not be the correct fix.

--Mark

> --
> Koen Kooi
> Builds and Baselines | Release Manager
> Linaro.org | Open source software for ARM SoCs
>
>
>


