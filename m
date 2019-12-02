Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BF4877F7A3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 22:55:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47RgSG1cxzz4R;
	Mon,  2 Dec 2019 23:55:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575327326;
	bh=ZLdRM4wxQSgjnzWLerQXoE23HQhpvF0gc+xwcW1AVpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t4sTd9V17T79pvQQasFjlJNlLcrUBKehHcFz7zrDkThH/jyvPxHwmtn36nKxR+/NW
	SZuSsvtZrooocmbDDXM9jkV5gyBTqhwV9yV7WqtCA9PfVFKxQtZ0nvuxqLfQr9Np7t
	aCwGh3Bn/4o0tHszuWtzko1/Pf8jq5NN51Z6VubdCnLx1tIjyhqWucBUZi4yJ7qLsP
	Fu0UQA0lk/m6gQ6Hp214GlPUeoIjsXSlrN6FT5J8kQlFeeAGZLVAT0gb9cqv2BX+Kk
	WtltRZbA6SLKesYqqGjFj8LUjtshFsj9knIwO7qU3IWZxwSezYoAmHB4BfvS312ov1
	FJBeyxCaxhMT7yj2LnhaWkV8PSs8i+T1uA6DKJEnb2UbC0b3OBcVU44o1FtEhsSejY
	MS08PBfiya4cf47pxb68eS3CbvfzFlZVHWm88w9+Q35ok6YJeZLA+HMe/lbVfMQ4PB
	96bKk5weV6rnnZ7S+MGv94Cnod5bNnZGv0+O12/3FXto+72PCVAEixsexhpvCH5Oy/
	rYxaz49lgSBePxiBtJo9PMeYDvIy9un0R3vf8x80DP40BfmN5bgHHolpF6QbdQz5L3
	1GR/C1KoY5tPYIsk3gVvbfqeA4gowBqZfG96qbg9X4UBBzdoGLtY5EloLLvtNVr5JW
	WvBvmfYAfaQkeFILhZKBYVRI=
Date: Tue, 3 Dec 2019 00:55:23 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191202225523.GA26056@localhost>
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<20191129131152.128311-2-alex.kanavin@gmail.com>
	<33182b29-de6e-f918-2915-df016b854e81@intel.com>
	<20191202151051.GC1581@localhost>
	<CANNYZj-VDVRB4qQDRG9+uHk0+QSm4d+Af-U2DNyb8QjyAj+o=w@mail.gmail.com>
	<CAMKF1soeGLC48o0nsn=hZ2p89L43edF3SKuqXUP18-U=1=g99g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soeGLC48o0nsn=hZ2p89L43edF3SKuqXUP18-U=1=g99g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/15] libdnf: upgrade 0.28.1 -> 0.38.1
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
X-List-Received-Date: Mon, 02 Dec 2019 22:55:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Dec 02, 2019 at 02:44:47PM -0800, Khem Raj wrote:
> On Mon, Dec 2, 2019 at 7:25 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > It's using -std=c++11. I'm not sure if switching to gnu flavour would have made a difference with gcc 4.8 provided in centos 7 and gcc 4.9 from Debian 8 - is it worth trying? Newer gcc versions don't complain and build this without error while still using -std=c++11.
> >
> > I'm leaning towards taking out the dnf/libdnf updates until these distros are retired from the supported distro list.
> 
> try adding #include <atomic> in libdnf/dnf-context.cpp

Same failure.

cu
Adrian

