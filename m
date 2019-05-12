Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0CED76C23A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 19:20:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 452DLV33Tkz7P;
	Sun, 12 May 2019 21:20:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557688834;
	bh=q82Pi7dHF24vwngf+ttHbEQ8LsOwPs9Z0ytdEnikv/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOCqk/2lH31/nUC+yOLyYMlVlnxIaw2cGK5e+mboVcJK35a+ew2RiaCiCNxiNgNEz
	V/ILl8aZhDQHPMKNLhBcgVmq/VetgtCdyh+0ZrV0WGF64pb/Rn2p78yrgcTZ/GlCp1
	v8eus/MQZyknJNmu+ORhKutby48ghgU1xFYV0ZoOcr7ZZXhKM0kAsGceq68vnok8dA
	SV0sQtgmMOAxy8jwFgHz7G+qs2sWvO8Cv4mE5vmOaaJ1QwjMoGpnTqxs/WUHtNEJID
	VGTrslw5RyCTpcVbru8lBqJt1ZaAz1zK2skrADTi4H3/bB5F56V41gC6K/SM8S0+t6
	rSd+ncnUweP8umdrPadQJ9OkJ74deH3APd2TbudX0JYVceWFz1FR11hd8CucQ/GD8N
	klvkT71P891z1YEjB+ULwLZRhw7LwTXDzvrmGEJhRXaAj7a7yljxYtH6jSnLfm4e9k
	CiM0LAmGzdYqXUfDARfJ95iAHBHhu8+wwGJD2dn0fw2Cnhc1bIdBiAdSFPdVzhEp1e
	QnTuWMnGua/oiPslLt46zZVWJEwWLVn5c1a0qA4HOjUoxsiZBCwWOjt4Yvlo6FE3Oh
	ZHkj3pfn2W2iDEiRRbBDCtE9fmp0I2L3tQ9sCiDizjWe2ELqOQZx/ay2BJkns/BTc7
	IxT+QzKdicttHvlrhzmwJj/E=
Date: Sun, 12 May 2019 22:20:26 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20190512192026.GA27955@localhost>
References: <cover.1557628550.git.hongxu.jia@windriver.com>
	<ac6a82d6fb67ec8369434852cdcfba495966061b.1557628550.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <ac6a82d6fb67ec8369434852cdcfba495966061b.1557628550.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 08/10] groff: upgrade 1.22.3 -> 1.22.4
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
X-List-Received-Date: Sun, 12 May 2019 19:20:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, May 12, 2019 at 04:16:28PM +0800, Hongxu Jia wrote:
>..
> --- /dev/null
> +++ b/meta/recipes-extended/groff/files/0001-support-musl.patch
> @@ -0,0 +1,46 @@
> +From f73df5196c35ef9c4531e4b6b26800c41954fd77 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Sat, 11 May 2019 20:00:29 +0800
> +Subject: [PATCH] support musl
> +
> +...
> +|./lib/math.h:2877:1: error: 'int signbit(float)' conflicts with a previous declaration
> +| _GL_MATH_CXX_REAL_FLOATING_DECL_2 (signbit)
> +| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +|In file included from recipe-sysroot/usr/include/c++/8.3.0/math.h:36,
> +|                 from ./lib/math.h:27,
> +|                 from ./src/include/driver.h:27,
> +|                 from src/devices/grodvi/dvi.cpp:20:
> +|recipe-sysroot/usr/include/c++/8.3.0/cmath:661:3: note: previous declaration 'constexpr bool std::signbit(float)'
> +|   signbit(float __x)
> +|   ^~~~~~~
> +...
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + lib/math.in.h | 2 ++
> + 1 file changed, 2 insertions(+)
>...

The upstream fix seems to be different, the signbit.m4 part of
http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commit;h=453ff940449bbbde9ec00f0bbf82a359c5598fc7

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


