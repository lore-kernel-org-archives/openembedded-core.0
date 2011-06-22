Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QZNGO-0008W3-QJ
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 15:14:37 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Jun 2011 06:11:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,406,1304319600"; d="scan'208";a="18269797"
Received: from kyu3-desk.ccr.corp.intel.com (HELO [10.238.154.176])
	([10.238.154.176])
	by orsmga001.jf.intel.com with ESMTP; 22 Jun 2011 06:11:00 -0700
Message-ID: <4E01E9E3.9090202@intel.com>
Date: Wed, 22 Jun 2011 21:10:59 +0800
From: Yu Ke <ke.yu@intel.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <33AB447FBD802F4E932063B962385B3554AE4989@shsmsx501.ccr.corp.intel.com>	<201106171842.49291.paul.eggleton@intel.com>
	<BANLkTinEe9RWC+mBf24OnggqaGfR-O8g5Q@mail.gmail.com>
In-Reply-To: <BANLkTinEe9RWC+mBf24OnggqaGfR-O8g5Q@mail.gmail.com>
Cc: Chris Larson <clarson@kergoth.com>, paul.eggleton@intel.com
Subject: Re: [PATCH] RFC - combo layer repo tool
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
X-List-Received-Date: Wed, 22 Jun 2011 13:14:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

on 2011-6-19 6:47, Chris Larson wrote:
> On Fri, Jun 17, 2011 at 10:42 AM, Paul Eggleton<paul.eggleton@intel.com>  wrote:
>> Hi Ke,
>>
>> Great work. Here's my review so far:
>>
>> On Monday 13 June 2011 14:15:04 Yu, Ke wrote:
>>> --- /dev/null
>>> +++ b/scripts/combo-layer-hook-default.sh
>>> @@ -0,0 +1,14 @@
>>> +#!/bin/sh
>
> First thought on starting to read the patch: why are we home rolling a
> parser when the format is clearly ini style, which the ConfigParser
> module parses just fine?

Paul, Chris,

Thanks a lot for your valuable comment. I've sent out the V2 RFC patch, 
and has all your comments included. Please review.

Regards
Ke


