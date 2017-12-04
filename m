Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F732786B5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 19:22:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vB4JMpt5013315
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Dec 2017 11:22:51 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 4 Dec 2017 11:22:50 -0800
To: <openembedded-core@lists.openembedded.org>
References: <20171201155024.3002-1-olofjn@axis.com>
	<20171201155024.3002-6-olofjn@axis.com>
	<7bb6a35d-19ac-1b50-46c1-e0395a0fee61@windriver.com>
	<20171201211328.enhdinuar24niey7@axis.com>
	<20171204100028.d4nljjgntdlrcccg@axis.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <7c32a38a-bd10-0a0c-8544-44f5bc9122df@windriver.com>
Date: Mon, 4 Dec 2017 13:22:50 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171204100028.d4nljjgntdlrcccg@axis.com>
Subject: Re: [PATCH 5/5] lib/oe/package.py: is_elf: Make it less prone to false positives
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
X-List-Received-Date: Mon, 04 Dec 2017 19:22:50 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/4/17 4:00 AM, Olof Johansson wrote:
> On 17-12-01 22:13 +0100, Olof Johansson wrote:
>> On 17-12-01 11:43 -0600, Mark Hatle wrote:
>>> The original implementation did not include the ',' options because different
>>> versions of file (as well as different architectures) would return different
>>> strings.
>>>
>>> They all contains the same information, but order and inclusion of ',' changed
>>> regularly.
>>>
>>> So I would caution that for this to check out a wide variety of host systems and
>>> architectures would need to be verified.  (It's very possible that all modern
>>> systems now conform to a single standard...)
>>
>> I was a little bit worried about this, thanks, this is useful
>> feedback. Perhaps dropping the "," while still retaining the
>> whitespace delimitation could be enough, and still work with a
>> variety of file implementations?
> 
> Reading more about this, I was wrong in calling it GNU file, I
> don't know where I got that from. It actually seems to be only
> one prevalent implementation, one written by Ian Darwin [0]:

I'm thinking back to RHEL 4-ish era, Ubuntu, Debian, Arch, Gentoo, etc.  We were
getting a mix/match of different results depending on the age of the 'file'
application being used, and even the magic file associated with it.

All of the information was present, but the order of certain elements changed
from arch to arch, and as I mentioned before the ',' bit was not always present.

It's possible that all modern file based systems are now using the same sources
and magic, but it was definitely not true in the past.

--Mark

>> Who's using it?
>>
>>    Most known BSD distributions (FreeBSD, NetBSD, Darwin/Mac OS X, etc)
>>    Every known Linux distribution
> 
> Could you elaborate on the portability issues you've seen?
> 
> 
> 0: http://www.darwinsys.com/file/
> 


