Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6063660603
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 21:40:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4NLeJNL008005
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 May 2018 14:40:19 -0700 (PDT)
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 May 2018 14:40:18 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <20180519162102.GL19965@denix.org>
	<CAMKF1srt3AbRBgdBZp2ya-VkWm1K6r8eywFbqr3nMFe7EqNuFw@mail.gmail.com>
	<20180519193341.GM19965@denix.org>
	<CAMKF1sqfpZhKJKjFoouGhpRbZEfJBqXJxmqunepAx2weVsQEnA@mail.gmail.com>
	<20180520005742.GN19965@denix.org>
	<e718c04f-fbe8-4235-aae7-1c2a335498b4@gmail.com>
	<e4c12866-e26b-c7b0-e70a-e0c4c6ebefb3@windriver.com>
	<CAJ86T=WdrLA322wwwSNhCJ1f=rKsr3pnzE5t1p3Kn2t4wmgP1A@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <0893459e-7525-8f5c-47d5-b0b8fc749de4@windriver.com>
Date: Wed, 23 May 2018 17:40:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WdrLA322wwwSNhCJ1f=rKsr3pnzE5t1p3Kn2t4wmgP1A@mail.gmail.com>
X-Originating-IP: [172.25.44.2]
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: GCC 9 Drops Support For Older ARM Microarchitecture Versions
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
X-List-Received-Date: Wed, 23 May 2018 21:40:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Add Bruce.

On 05/23/2018 05:01 PM, Andre McCurdy wrote:
> Presumably that name was chosen just to avoid a clash with the qemuarm
> machine name used in oe-core?

That seems likely.

Here's an early commit lo from the repo made by Bruce that
shows the output of /proc/cpuinfo:

commit 3f23b7954861bc55f8c10ebbe9934fbd052d2a6d
Author: Bruce Ashfield <bruce.ashfield@windriver.com>
Date:   Thu May 17 14:24:28 2012 -0400

     wr-bsps: add qemuarma9

     This is the out-of-tree port of the CoreTile Express A9x4 platform,
     running under qemu.

     root@qemuarma9:~# cat /proc/cpuinfo
     Processor       : ARMv7 Processor rev 0 (v7l)
     processor       : 0
     BogoMIPS        : 498.89

     Features        : swp half thumb fastmult vfp edsp neon vfpv3 tls
     CPU implementer : 0x41
     CPU architecture: 7
     CPU variant     : 0x0
     CPU part        : 0xc09
     CPU revision    : 0

     Hardware        : ARM-Versatile Express
     Revision        : 0000
     Serial          : 0000000000000000

     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>


Again, I'm not an arm man so maybe this is old hat to toolchain and
BSP people. I'm just trying to suggest a tested short-cut.

> 
> If/when we update the CPU used in the oe-core qemu ARM machine, I vote
> we continue to just call it "qemuarm".

That would surprise me as a user of qemuarm so my vote is to change the
name unless there's precedent to support your vote.

-- 
# Randy MacLeod
# Wind River Linux

