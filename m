Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 060C9737F4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 13:30:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 07 Jul 2015 06:30:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,423,1432623600"; d="scan'208";a="742175911"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2015 06:30:15 -0700
Message-ID: <559BD488.8090306@linux.intel.com>
Date: Tue, 07 Jul 2015 16:30:48 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>	<CAJ86T=XJeo31ntBEw16vCPuTyAwYvsij_Aoq=EKgRyhCnYyzOw@mail.gmail.com>	<1B56A49860EB2D45ADE3731B15C959FDB29591@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CAJTo0LZx5mPc+2_wmO8WfYs-s5smFuZYyAmYfZS4Bv+BoW7SEA@mail.gmail.com>
In-Reply-To: <CAJTo0LZx5mPc+2_wmO8WfYs-s5smFuZYyAmYfZS4Bv+BoW7SEA@mail.gmail.com>
Subject: Re: FW: [oe] [meta-oe][PATCH] parted_1.8.6.bb: add parted that not GPLv3
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
X-List-Received-Date: Tue, 07 Jul 2015 13:30:19 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2015 11:18 AM, Burton, Ross wrote:

>     Can non-GPLv3 parted be added into oe-core? I think not everybody
>     wants to use the GPLv3 version.
>
>
> There's a good argument for this, so send a tested patch and it can be
> reviewed.

How about renaming the recipe, so that it doesn't clash with the GPLv3 
version? For example, parted1_1.8.6.bb. Then it can be kept outside of 
oe-core.

Alex


