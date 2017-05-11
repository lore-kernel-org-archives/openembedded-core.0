Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 00DC360269
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 07:42:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 11 May 2017 00:42:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,323,1491289200"; d="scan'208";a="1146514767"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2017 00:42:58 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<2037301.7Ncc1v2UnL@peggleto-mobl.ger.corp.intel.com>
	<242ad7f7-4e04-7cac-fd3d-6fabd9b43c65@linux.intel.com>
	<4437292.ZnTzh3sVdu@peggleto-mobl.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <328c7bab-3f03-32e8-d878-fb36772118a9@linux.intel.com>
Date: Thu, 11 May 2017 10:43:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <4437292.ZnTzh3sVdu@peggleto-mobl.ger.corp.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Thu, 11 May 2017 07:43:00 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2017 11:15 PM, Paul Eggleton wrote:
> If that works then great! By all means let's test it and endorse it. At the
> moment we barely even acknowledge it's existence - it's not even in the layer
> index (though that is generally up to the layer maintainer, we can certainly
> encourage them to submit it.)

Yes, should definitely be tried out. I have only looked at the contents 
of the layer, and the overview part of the documentation, so I might 
have a bit rosier picture of it :)

I'm not sure how much attention Qt wants to draw to it - they probably 
want to lure people into commercial support contracts instead. However, 
the layer *is* licensed under GPLv3, and it pulls all code from public 
repos. And I can also imagine they could be quite happy to have Qt 
designated the official reference UI in YP.

> You and I might understand that, but someone coming to the project fresh
> won't, mainly because we've never officially stated that anywhere. The only
> mention of anything like it is in fact the opposite - in the development
> manual we state "The Yocto Project ... also features the Sato reference User
> Interface, which is optimized for stylus-driven, low-resolution screens.".
> Granted, that statement is probably as old as Sato itself, but I think it
> speaks to how organised our messaging is on this topic.

Yes, in 2017 this statement should be changed to reflect reality.

Alex


