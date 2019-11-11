Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 559667F7D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 09:50:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47BR284Lgwz3r;
	Mon, 11 Nov 2019 10:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573465824;
	bh=faXVI4VV5frTvHZ3jd84uYxjJ1PBV1g5mH82bJ+Buf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=scYmJLgMoDKTbnOkB96LNEkrSEZ1yEIdCnZ2pBlmSEFtCA1MjNGN8WbsQGjdRf/Dr
	K618Jr/SYrxmj+ohm5x/8y/SEFl7w3kW9uwgxGlslBliAQkLfn5ZruP4/YP663GP3F
	T9ASwRSVmfCrtC3zed6xkLjRxa2b8ixpn0zMQ08DPqrH0pj/eNKHn1gvNNdI1xjuK4
	0U4RA0Uf35c/joQ5O3u/VTSbVxLqo6vaj9AOGyhgHWwjsOt2LwqI53RVC8YsMArC9D
	Whp2t8FKRBF/b8Q7c8R7Z+81M5lRYzdZM4vs2UQYXrAtEpP73Ij5aop4KZ0UBu5VMO
	8MaaitNzUMD5wClvCz9JuEzMCZAUNY1gLhBgXTv5/Y5ZT/eCW/QHJc9f8m8DQGPZ9z
	9W4DbZjxG7gn9B+oDklficbWQSKI0oBhDRE42P1NKzcR/o6p4npJ/RmhhYPJox782m
	dRUKdofmJFNR6UwULH5wCN7FTbW0OnVwUlX9E1BcfP4xn3WzgxtfaZDJSqw4Dvjurr
	FpthyPyW4Sg8Yni1qvsFZOxcNFwFoKicJ7CXG7JdV4gVv+OC8Fn+P9FXH+SZhWm07d
	8NOgaQeJPI86sp5GvH9fHUB0KMqpIEb6vqBidwR99hWHThBzo111O5sjL1WAFHVruR
	+BfrWN+rBmS6aFDut1GTMmw0=
Date: Mon, 11 Nov 2019 11:50:21 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20191111095021.GA28797@localhost>
References: <20191105214448.2511-10-bunk@stusta.de>
	<78c2bf06-7a51-5e3a-7794-443afe1a7caf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <78c2bf06-7a51-5e3a-7794-443afe1a7caf@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [warrior][PATCH] python3: Upgrade 3.7.4 -> 3.7.5
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
X-List-Received-Date: Mon, 11 Nov 2019 09:50:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Nov 10, 2019 at 03:58:56PM -0800, akuster808 wrote:
> 
> 
> On 11/5/19 1:44 PM, Adrian Bunk wrote:
> > 3.7.5 also includes the fixes for CVE-2019-16056 and CVE-2019-16935.
> 
> I see a patch is being updated. Reason not noted in commit message.

That's just trivial context change.

> Also, do you have any issue if I backport the other py3 bugfixes in zeus?

I was aiming at a minimal change, but nothing of the other changes 
strikes me as wrong or very risky.

> - Armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


