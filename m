Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 09D8876312
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 16:34:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jul 2015 09:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758540388"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 09:34:20 -0700
Message-ID: <55BA524A.1070904@linux.intel.com>
Date: Thu, 30 Jul 2015 19:35:22 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<86b43671f02c22f328e3801e0711a33731156ba8.1438262915.git.alexander.kanavin@linux.intel.com>
	<20150730143658.GK2457@jama> <55BA4399.2030302@linux.intel.com>
	<CAJTo0LajDS9QaEdczNG9OnpkQWj_B148+TSwKwNCxXLyk9xnjA@mail.gmail.com>
In-Reply-To: <CAJTo0LajDS9QaEdczNG9OnpkQWj_B148+TSwKwNCxXLyk9xnjA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 21/26] systemd: remove PV from the recipe
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
X-List-Received-Date: Thu, 30 Jul 2015 16:34:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2015 07:25 PM, Burton, Ross wrote:

> For the release tag I'd agree with you, but as 219 < 219-stable we can't
> just change this now (without adding an epoch, and adding epochs are evil).
>
> Does the RRS have a way of mapping a PV to something that can be used in
> the upstream comparison?

I just noticed that specifically systemd-stable repository does not have 
release tags for new versions at all, and just adds branches for newer 
versions:

http://cgit.freedesktop.org/systemd/systemd-stable/

RRS does not support branch names as indication of "new releases" (and 
it shouldn't IMO), so maybe this patch can be simply dropped, and 
systemd will not have automatic upstream-check.


Alex


