Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BBDA27F666
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 19:49:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47JCvF4cXHzv;
	Wed, 20 Nov 2019 20:49:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574279369;
	bh=BF1myMFHBaCBIST6xBuTjfTkW/7sjJ3Q6sMzN4RZZyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YSTpRoiachu9P2XCzAnJQ48M/BwnFwHkfWhiC/z0TMyNB59xthW6rVxCi88dYcG0d
	7094g9NdCjTUq2QU33WdmoBWJTFJ7aOS4gnP4ziYzNOORBTaMTSxJnXcLjM7+L1HNa
	0rcgE2u47/Dr+FCWnAZ2z+le4stWxoj2XIVultNelB2vK8aYDgmJ7QBBHKUdTFc5qY
	Xp+Bxcfx5ITym5C6Ei694EHVpw5NVN+NoNeOVM74RX1h1OnlkEpVTaHN586mQ0HRcp
	jB6vQ7yXdpG8UIdiKGQJhGQC/vi2kKJRF9WmbmJ4HUXU75ny0SSrUEuPhjxev/Psic
	GYOUU3jIgWRQeRNWfqIbSz9oy8j3PbhK08gFAWpg24Ca3LJq8UcGBvlz8qIcV/d3ib
	VUbvTL6om+cugV5gW8mdCwW1nx9hDG+fVnE534snxgh0sbFN7i61kddTvpyH/1ZW3j
	FZOL6jQscxzYx5mcYG1ss8i4iRv3sTHfWtD9tPJjjVX78Lf6SIcXj5Bn+7aY2JmCtB
	Yj6FfRhHLZGNzwBjxUl3tU8zUS+yoOwPFC8ETtAGcbmIg3WAnuR3ZX8cVaXHbPBKto
	KfVORu41xomrxQDtcvzyWS7Bv8N5dfFSR0WbZIGU6X0V6AOXCO5Kxojd+gHJD1bwPo
	/caFBP/DAtRl6J6H510vGxtM=
Date: Wed, 20 Nov 2019 21:49:27 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191120194927.GA28030@localhost>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
	<20191120134455.125118-8-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191120134455.125118-8-alex.kanavin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 08/11] lrzsz: remove the recipe
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
X-List-Received-Date: Wed, 20 Nov 2019 19:49:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 20, 2019 at 02:44:52PM +0100, Alexander Kanavin wrote:
> This is 2019; last release of lrzsz was in 1998.

The protocols are not changing.

> Using serial lines for console work may have its uses,
> but for transferring files please set up proper networking.
>...

I've had several recent embedded experiences where this was impossible, 
and lrzsz was extremely useful.

cu
Adrian

