Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB32700F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 12:05:17 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 23 Aug 2016 05:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,565,1464678000"; d="scan'208";a="159778342"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by fmsmga004.fm.intel.com with ESMTP; 23 Aug 2016 05:05:18 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1471499308-1666-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
	<CAJTo0LZy-mx4K=eSJdNRq12JVDzGwW+Oe0uf40YRZAmyWVJsZQ@mail.gmail.com>
	<56847BB1-DCA8-446D-9418-2D42098A7073@gmail.com>
	<CAJTo0LZJRJFC71=xEa_EQUiOTZNWR8QPGtnJvSWqqGLqM_QjcQ@mail.gmail.com>
	<8b30fc2d-26ea-03bd-58ea-cdbf00e74b36@linux.intel.com>
	<020C25BC-315C-4ED3-8268-DB7CC4C0A52A@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <61613289-16aa-4b3d-19d3-8a8efcc3be94@linux.intel.com>
Date: Tue, 23 Aug 2016 15:04:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <020C25BC-315C-4ED3-8268-DB7CC4C0A52A@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gdk-pixbuf: 2.34.0 -> 2.35.3
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
X-List-Received-Date: Tue, 23 Aug 2016 12:05:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2016 07:52 PM, Khem Raj wrote:
>

>>> It does:  http://recipes.yoctoproject.org/rrs/recipedetail/451/ says
>>> up-to-date as we have 2.34.0 despite there being 2.35.3.
>>>
>>> These upgrades have been done without reference to the tooling we've got.
>>
>> Also the recipe itself inherits upstream-version-is-even class - that means odd versions are development snapshots and should be ignored.
>
> good point, will this class give me some sort of parsing error, if I try to update to odd version ?

Not at the moment, but if you can suggest how this could be done, I'll 
add it (perhaps as a warning though).

Alex


