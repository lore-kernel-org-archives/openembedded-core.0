Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 70CE375D1F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 13:55:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jul 2015 06:55:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,423,1432623600"; d="scan'208";a="757575481"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga002.fm.intel.com with ESMTP; 07 Jul 2015 06:55:05 -0700
Message-ID: <559BDA5C.6060905@linux.intel.com>
Date: Tue, 07 Jul 2015 16:55:40 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1436147494-44348-1-git-send-email-leimaohui@cn.fujitsu.com>
	<CAJ86T=XJeo31ntBEw16vCPuTyAwYvsij_Aoq=EKgRyhCnYyzOw@mail.gmail.com>
	<1B56A49860EB2D45ADE3731B15C959FDB29591@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CAJTo0LZx5mPc+2_wmO8WfYs-s5smFuZYyAmYfZS4Bv+BoW7SEA@mail.gmail.com>
	<559BD488.8090306@linux.intel.com>
	<CAJTo0LY5fEmX8Of5d2prJ01fHvf7LV170qTz+r1kd0vtkGgesQ@mail.gmail.com>
In-Reply-To: <CAJTo0LY5fEmX8Of5d2prJ01fHvf7LV170qTz+r1kd0vtkGgesQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 07 Jul 2015 13:55:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2015 04:38 PM, Burton, Ross wrote:

>     How about renaming the recipe, so that it doesn't clash with the
>     GPLv3 version? For example, parted1_1.8.6.bb
>     <http://parted1_1.8.6.bb>. Then it can be kept outside of oe-core.
>
>
> As they're just version variations that would be overly complex.
> Dropping it in oe-core as it's a non-v3 alternative doesn't seem to be a
> problem to me (as there's plenty of precedent for that already).

My problem is that parted 1.8.6 was released in 2007, and the recipe 
already carries eight patches with it (and none of them has any 
information about their origin).

Who's going to provide ongoing maintenance for all that? I would like 
Lei to establish himself as the maintainer (through the maintainers.inc 
file).

Regards,
Alex

