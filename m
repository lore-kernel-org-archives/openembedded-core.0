Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D00CA75998
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 05:35:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5F5ZSdl021586
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 14 Jun 2015 22:35:28 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 14 Jun 2015 22:35:27 -0700
Message-ID: <557E641E.5040300@windriver.com>
Date: Mon, 15 Jun 2015 13:35:26 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
References: <cover.1433842738.git.liezhi.yang@windriver.com>
	<7189f3ea9eb20d08f73abf3af4715a43f73740c0.1433842738.git.liezhi.yang@windriver.com>
	<557A4FDF.7060304@windriver.com>
	<1557617.mLfaxnFia7@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LZ1eNH8KScAf=3bJbGGVFV=OCU5GXodPp8=LMVc34pAJQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZ1eNH8KScAf=3bJbGGVFV=OCU5GXodPp8=LMVc34pAJQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/12] libav: 9.18 -> 11.4
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
X-List-Received-Date: Mon, 15 Jun 2015 05:35:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/12/2015 07:11 PM, Burton, Ross wrote:
>
> On 12 June 2015 at 09:40, Paul Eggleton <paul.eggleton@linux.intel.com
> <mailto:paul.eggleton@linux.intel.com>> wrote:
>
>     I didn't talk to Richard about it but I think there may have been some
>     discussion on this list about the possibility of 9->10->11 breaking API
>     compatibility with applications. Did you do testing with recipes in meta-
>     oe/meta-multimedia that depend upon libav?
>
>
> Yes, that's exactly why I didn't merge it into MUT: more research needed as this
> upgrade was proposed by Kai a few weeks back and there was a discussion there.
>
> I wasn't rejecting the upgrade, just needed a good look and didn't get around to
> it yet.  The big question is upgrade path: does everything in oe-core still
> build, and is there a sufficient amount of recipes outside of oe-core using
> libav 9 that we should keep it around?

I've tested all oe-core's related recipes with set commercial license flags,
but didn't test the recipes outside of oe-core, I will test the recipes in
meta-oe/meta-multimedia.

// Robert

>
> Ross

