Return-Path: <ross.burton@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7576A731AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 09:24:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2019 01:24:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,224,1571727600"; d="scan'208";a="205095570"
Received: from unknown (HELO blackadder.local) ([10.252.49.82])
	by fmsmga007.fm.intel.com with ESMTP; 21 Nov 2019 01:24:35 -0800
To: Adrian Bunk <bunk@stusta.de>, Alexander Kanavin <alex.kanavin@gmail.com>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
	<20191120134455.125118-8-alex.kanavin@gmail.com>
	<20191120194927.GA28030@localhost>
	<CANNYZj_g1kDJ5CSbKg4DEaATCiyPPT=2GuYEsUyHr+7ZpH8EkQ@mail.gmail.com>
	<20191120213844.ome6ota74rmgosy3@pbcl.net>
	<CANNYZj9uAs5wQPya6R9q3gfSQm_Xyu9xViGBxOQ2COKKbcYeWg@mail.gmail.com>
	<20191120223207.6cuuklpgrzuhqug3@pbcl.net>
	<CANNYZj93tJxTsCwS3cg3J=0WB--A0Af26Y=nO9fOdfNb9okRYg@mail.gmail.com>
	<20191120231812.GB3962@localhost>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <238a39c7-b794-aaa0-1da6-4b585078f447@intel.com>
Date: Thu, 21 Nov 2019 09:24:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191120231812.GB3962@localhost>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] lrzsz: remove the recipe
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
X-List-Received-Date: Thu, 21 Nov 2019 09:24:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 20/11/2019 23:18, Adrian Bunk wrote:
> On Wed, Nov 20, 2019 at 11:56:38PM +0100, Alexander Kanavin wrote:
>> On Wed, 20 Nov 2019 at 23:32, Phil Blundell <pb@pbcl.net> wrote:
>>
>>> However, I think the point still stands that the commit message needs to
>>> provide a better description of why the package is being removed.  If you
>>> think it represents an ongoing maintenance headache that's already bad and
>>> only going to get worse, and this now outweighs its usefulness, let's just
>>> say that.  Not all old software is problematic, and not all problematic
>>> software is old; the fact that the last release was 20 years ago is an
>>> interesting fact but in isolation that doesn't represent a problem.
>>> Indeed, compared to some other packages in oe-core, eight patches in
>>> total over a 20-year period doesn't seem like that bad of an average.
>>>
>>
>> Fair enough, I wrote a hasty commit message. Mistakes happen.
>>
>> Can I say what my problem is? Here goes: so far, no one in this discussion
>> offered actual help with the actual issue. If you need this or that
>> functionality from Yocto, please try to place help ahead of complaints and
>> criticism.
> 
> No, your problem is your way of communication.
> 
> It is a very unfriendly way of communication to request help in the form
> patch aiming at immediate removal.

Hopefully everyone has calmed down overnight and we can continue this 
discussion politely?

Yes, Alex's commit message should have spelt out that both:
1) there are doubts anyone is actually using zmodem still (he did this)
2) the source is positively ancient and building it on modern linux is 
getting harder over time (this was implied by being in a series that 
upgraded gettext and fixed other recipes, instead of being spelt out).

So, if zmodem is still a useful feature to have in core, then is anyone 
willing to step up and either:
1) maintain the recipe.  I'd love someone who uses lrzsz to put a fork 
up on github, integrate all of our patches, and start maintaining it. 
Maybe then other distributions who still ship it will join in too.
2) provide an alternative.

Ross

