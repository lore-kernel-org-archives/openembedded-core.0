Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 185F66D3A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 23:36:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Nov 2013 15:32:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="434209529"
Received: from unknown (HELO [10.255.15.132]) ([10.255.15.132])
	by orsmga002.jf.intel.com with ESMTP; 12 Nov 2013 15:36:14 -0800
Message-ID: <5282BB6D.1040506@linux.intel.com>
Date: Tue, 12 Nov 2013 15:36:13 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1383954150-59537-1-git-send-email-kirgene@gmail.com>	
	<5282AEB6.3060706@linux.intel.com>
	<1384300388.3828.36.camel@x121e.pbcl.net>
In-Reply-To: <1384300388.3828.36.camel@x121e.pbcl.net>
Cc: Yevhen Kyriukha <kirgene@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] curl: build with c-ares library support.
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
X-List-Received-Date: Tue, 12 Nov 2013 23:36:18 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2013 03:53 PM, Phil Blundell wrote:
> On Tue, 2013-11-12 at 14:41 -0800, Saul Wold wrote:
>> Additionally, if adding this to oe-core, it needs to be in it's own
>> patch crediting the orignal author / layer, I found a 1.10 version in
>> the meta-webos-ports, is this where it came from?
>
> There is a c-ares recipe in oe-classic which looks quite similar to this
> one and I suspect that's probably where it came from (though perhaps
> indirectly).
>
> But, configuring curl to use c-ares support is not as trivial a change
> as it might appear and there is a significant chance that it will cause
> unforeseen (and probably unwanted) effects for at least some people.
> Adding a PACKAGECONFIG option for it which defaults to off would
> obviously be fine, and changing the default to be the libcurl internal
> threaded resolver (which would probably fix the original complaint as
> well, and doesn't require any extra recipes) might also be fine, but
> enabling c-ares by default is not something that should be done
> capriciously.
>
This is why I wanted to understand the orignal failure, so using 
PACKAGECONFIG sounds reasonable, I think we have had a case in the past 
where we even allowed for a non-default PACKAGECONFIG point outside of 
oe-core (I can't remember which one it was now).

Sau!

> p.
>
>
>
>

