Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 84973731DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 10:00:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Sep 2016 03:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,333,1470726000"; d="scan'208";a="1029771101"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by orsmga001.jf.intel.com with ESMTP; 14 Sep 2016 03:00:34 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <3230301C09DEF9499B442BBE162C5E48ABE3BA3B@SESTOEX04.enea.se>
	<37af20ca-62f9-7308-0b97-6ba6c46dafb1@linux.intel.com>
	<1473846188.7207.57.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <fd30a088-4a2f-9e4b-1289-d5bababdc3e2@linux.intel.com>
Date: Wed, 14 Sep 2016 12:58:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473846188.7207.57.camel@linuxfoundation.org>
Subject: Re: CVE-2016-3116: dropbear: X11 forwarding input not validated properly
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
X-List-Received-Date: Wed, 14 Sep 2016 10:00:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/14/2016 12:43 PM, Richard Purdie wrote:

>> That said, I vote for updating to the version that comes with the
>> fix.
>> Backporting fixes should not be the default in the stable yocto
>> releases; we should trust the upstream more.
>
> Taking that argument to the extreme, we should update all versions in
> the "stable" release to the latest to ensure we get all the fixes. At
> that point, it becomes no different to master and its not the
> definition of "stable" which most people want to use.

But I'm not making this argument at all. What I'm saying, is that master 
branch and stable branches are two different extremes with their own 
problems (one is moving too fast, the other is conservative to a fault), 
and we should try to find a sensible middle ground between them.

> In this case, its a question of what else changed in dropbear between
> these versions. Were there a ton of new features or was it just
> bugfixes? How much risk of other problems is there?

In this case, the only difference between 2015.71 and 2016.72 is indeed 
the CVE fix commit:
https://secure.ucc.asn.au/hg/dropbear/graph

(you need to scroll down some to see it in the graph).

Alex

