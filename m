Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A128177294
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 00:03:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAD03CTP026204
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Nov 2015 16:03:12 -0800 (PST)
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 12 Nov 2015 16:03:11 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1447297446-18024-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LYVnvcYH2NZBtKtupO_bjnr9MKFWYRH5519q8+5xJdY3w@mail.gmail.com>
From: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <564528BD.2050705@windriver.com>
Date: Fri, 13 Nov 2015 08:03:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYVnvcYH2NZBtKtupO_bjnr9MKFWYRH5519q8+5xJdY3w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][v2] e2fsprogs: fix the ptest
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
X-List-Received-Date: Fri, 13 Nov 2015 00:03:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年11月12日 18:13, Burton, Ross wrote:
>
> On 12 November 2015 at 03:04, <rongqing.li@windriver.com
> <mailto:rongqing.li@windriver.com>> wrote:
>
>     +cache_inode.patch speeds up the making ext* filesystem, but it leads
>     +to the m_bigjournal ptest failure; In fact, when
>     ext2fs_extent_node_split
>     +is called, the cache goal should be reset
>     +
>     +the patch fixes the m_bigjournal ptest failure, and does not lost the
>     +speed.
>
>
> Please edit the patch, instead of patching a patch.

I did not patching a patch, I create a new patch

-Roy

>
> Ross

-- 
Best Reagrds,
Roy | RongQing Li

