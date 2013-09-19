Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2F79160664
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 13:41:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 19 Sep 2013 06:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,936,1371106800"; d="scan'208";a="398123833"
Received: from sorvi.fi.intel.com (HELO [10.237.72.152]) ([10.237.72.152])
	by fmsmga001.fm.intel.com with ESMTP; 19 Sep 2013 06:41:41 -0700
Message-ID: <523AFF14.10400@linux.intel.com>
Date: Thu, 19 Sep 2013 16:41:40 +0300
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Muhammad Shakeel <muhammad_shakeel@mentor.com>
References: <1379595133-5812-1-git-send-email-muhammad_shakeel@mentor.com>
	<1379596189.18603.115.camel@ted> <523AF9CB.5040600@mentor.com>
In-Reply-To: <523AF9CB.5040600@mentor.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: Upgrade to v1.18
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
X-List-Received-Date: Thu, 19 Sep 2013 13:41:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 19.09.2013 16:19, Muhammad Shakeel wrote:
> On 09/19/2013 06:09 PM, Richard Purdie wrote:
>> On Thu, 2013-09-19 at 17:52 +0500, Shakeel, Muhammad wrote:
>>> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>>>
>>> -This release contains a few important bugfixes in addition
>>> to a few new features.
>> So it fixes some old bugs and potentially adds new ones? I can't make a
>> good risk assessment on that information, sorry. Are you asking for this
>> in 1.5 or 1.6?
>>
> I was having issues running connman 1.17 on my platform. Connman 1.18
> worked for me.
> If it can go in 1.5, it will be great. Otherwise it should definitely go
> in 1.6.

ConnMan 1.18 release notes can be found here
https://connman.net/blogs/patrik/2013/connman-118

I would recommend taking it. Biggest issue fixed in 1.18 was the 
iptables support which did not work in ARM based devices.


This patch could perhaps split to two pieces, first one removing 
obsolete options and second one updating the version.


Cheers,
Jukka


