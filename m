Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5A9B67C86A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 08:13:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46TWjr0yQNz5c;
	Thu, 12 Sep 2019 10:13:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568276000;
	bh=mbpsZ2pWLYckoYVnToMXic3XwHfV+vxuXQ7qjkZOL80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+pVY5d9nNTpUrFQGusjFa4hyPsGE3qbMJlHf8oWmMyUMUFEnvYT7hQaIcDFUM6uA
	bNK65PkIRQXxmiX46aHqNu1ZP24WLQiV3m2+7R8BFXvg71iDWcqaOfVEDPLJDrnI+S
	9Osrn/y/HQyzU6VKqK1ajPRQhs1qcichhpxAYBe1NK6EobEpeCFj5B0gOHxIzWko1z
	3RA0RknCT39EVuKWPx4C+C17ql9LZhMj1PQ9xB7LiEUtx9kYTih0YsuE7j2z81nw0P
	3Q1tcZv4d9frEbWg//oiUFaJvV6yLrbOa16dou30WOFQ9pRDJq3rlmhdjP2ST1Tf94
	Qo3+dWkRgVXC6WSqP6FgCwxScbeUmU40TKZ1HLgO5Ka679l2i2avb3rDQGoUG7FPdh
	t2h581940eK2S878r5DCP9vx/RLZUmTFfiwMCJrrUnvtB3Y9M/XL8GFPoGTmt5+5/O
	YeaenGHB1kAbFZv+4hTckenQjuKmwvPOqCG6nBcPjp+2VC5JbSv/kSiDy5l/kavq5R
	rEgBNPziWNDYw9M/F+QLMBt/FUcqxA8v2r8ikFp+8CxpqZFGl0sUblRg7zJG67ltRM
	yO+r21Aj5c5wBxthXo11FCh5OiyiUofxHia4uCRvd36PZrMoaxfqV2n70S32i6flfE
	L5Ay2bSbdVEufcnFWQsWRz5M=
Date: Thu, 12 Sep 2019 11:13:17 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20190912081317.GA5021@localhost>
References: <20190910214136.22971-1-Randy.MacLeod@windriver.com>
	<20190910214136.22971-4-Randy.MacLeod@windriver.com>
	<20190911123258.GA27961@localhost>
	<f87d660d-9c05-dfdd-ced2-88cfc9a38a4f@windriver.com>
	<20190911140016.GB27961@localhost>
	<d2af200a-7865-1c18-fa3d-2842032450a5@windriver.com>
MIME-Version: 1.0
In-Reply-To: <d2af200a-7865-1c18-fa3d-2842032450a5@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [v2 4/4] valgrind: disable 256 ptests for aarch64
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
X-List-Received-Date: Thu, 12 Sep 2019 08:13:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Sep 11, 2019 at 02:01:00PM -0400, Randy MacLeod wrote:
> On 9/11/19 10:00 AM, Adrian Bunk wrote:
>...
> > It would be good if you could also open a bug, so that people can see
> > that there is a problem with this package on an important architecture.
> 
> Done:
> 
> many valgrind tests fail for arm64
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13520

Thanks!

> ../Randy

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


