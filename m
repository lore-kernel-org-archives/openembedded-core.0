Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9031573204
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 12:42:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 19 Aug 2016 05:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,544,1464678000"; d="scan'208";a="750925392"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2016 05:42:21 -0700
To: openembedded-core@lists.openembedded.org
References: <1471499308-1666-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
	<CAJTo0LZy-mx4K=eSJdNRq12JVDzGwW+Oe0uf40YRZAmyWVJsZQ@mail.gmail.com>
	<56847BB1-DCA8-446D-9418-2D42098A7073@gmail.com>
	<CAJTo0LZJRJFC71=xEa_EQUiOTZNWR8QPGtnJvSWqqGLqM_QjcQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8b30fc2d-26ea-03bd-58ea-cdbf00e74b36@linux.intel.com>
Date: Fri, 19 Aug 2016 15:41:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZJRJFC71=xEa_EQUiOTZNWR8QPGtnJvSWqqGLqM_QjcQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 19 Aug 2016 12:42:36 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/18/2016 09:11 PM, Burton, Ross wrote:
>
> On 18 August 2016 at 18:58, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>
>     perhaps recipe updater script should account for such presets ?
>
>
> It does:  http://recipes.yoctoproject.org/rrs/recipedetail/451/ says
> up-to-date as we have 2.34.0 despite there being 2.35.3.
>
> These upgrades have been done without reference to the tooling we've got.

Also the recipe itself inherits upstream-version-is-even class - that 
means odd versions are development snapshots and should be ignored.

Alex


