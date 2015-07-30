Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E7AE875A60
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 12:06:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 30 Jul 2015 05:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758354959"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 05:05:37 -0700
Message-ID: <55BA134F.9010908@linux.intel.com>
Date: Thu, 30 Jul 2015 15:06:39 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>	<CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>	<CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
	<1436601450.3310.27.camel@linuxfoundation.org>
In-Reply-To: <1436601450.3310.27.camel@linuxfoundation.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Thu, 30 Jul 2015 12:06:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2015 10:57 AM, Richard Purdie wrote:

> This does touch on something I have wondered about for a while, which is
> whether the time has come to move the GPLv2 pieces to their own layer
> and possibly their own maintainership. Obviously there are pros and cons
> to doing that.
>
> Thoughts?

I'm all for that, which shouldn't be surprising :) The rationale is that 
we need to keep the scope and breadth of oe-core sane and manageable. 
The emphasis should be on having lesser amount of high quality, 
up-to-date recipes than vice versa.

That means a continuous lookout for possible things to remove. Qt4 is 
one such thing, old GPLv2 software is another.


Alex

