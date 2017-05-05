Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7FFBA77D77
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 09:16:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 May 2017 02:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,291,1491289200"; d="scan'208";a="1126763047"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 05 May 2017 02:16:07 -0700
To: Max Krummenacher <max.oss.09@gmail.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
	<20170503131153.1780-3-alexander.kanavin@linux.intel.com>
	<1493836892.2405.4.camel@gmail.com>
	<CAJTo0LZ3O5au502TRqVUZY_gCT4r_9X-2Jtk+_-3o=u5j2UASg@mail.gmail.com>
	<cf767fe3-3c98-f32b-d27c-3f63b924ab7f@linux.intel.com>
	<CAJTo0LYDLu5zPf1EKrJKS-Hw-C=MumF8QXej_+i958AyWqy4CA@mail.gmail.com>
	<1493941692.3022.18.camel@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <1bed7e63-2374-21b5-e090-e3b111086ae9@linux.intel.com>
Date: Fri, 5 May 2017 12:16:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493941692.3022.18.camel@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] libpng12: remove the recipe
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
X-List-Received-Date: Fri, 05 May 2017 09:16:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/05/2017 02:48 AM, Max Krummenacher wrote:
> My concern at the moment is that anything removed now from oe-core will also be removed
> in oe-core pyro in the foreseeable future but the fix or relocation in meta-xyz will
> take time.

I'm fairly sure these patches will not make it to pyro - they are for 
2.4 only. So everyone will have a few months to fix up their layers 
before 2.4 is out.

> Around the release of morty the same happened with libwnck3 which then made morty fail for
> anyone using libwnck3.

We probably should have a section in the release notes that lists 
removed recipes. There are more layers than meta-oe, obviously they 
can't be all fixed in sync with oe-core.

>> For what it's worth, glmark2 was fixed in 2014:
>> https://github.com/glmark2/glmark2/commit/499aa81a68fb4c8aac1c80f0d6a4cce05941c4cc
>>
>> glcompbench appears to be a fork of glmark, so the same fix should be
>> trivial to apply.
>
> I agree that the it is an easy fix for glmark2 and probably not that hard with glcompbench,
> nonetheless its sometimes nice to get a head start before things break.

I would rather remove glcompbench, as it was last updated in 2012 
upstream. If someone objects, they should step up and actually maintain 
the code and the recipe.

Generally, such fixes scale poorly in the absence of proper recipe 
maintainers: we are lucky there's just two recipes, but what if there 
was twenty?

Alex


