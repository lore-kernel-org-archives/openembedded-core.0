Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B94007E02A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 21:43:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 455MGs1rhKz63;
	Fri, 17 May 2019 23:43:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558129397;
	bh=NE8zTw33nFM/VGILko3UXPFIkcXbaob88nbqta8+TYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABbl/NLNo+/4PW1OuZtKmyLb78MdPlxsRafKIlltUX9MuFjFP1s0fbR7vYz3VKmiX
	Xmm+Lap38UUlW7r7xjCy92ytdZwnl1KvJn4nXxYYYuGQzaT557DSccjxZGHyFYFKFR
	O+QNKHHH/KD4y7iGIwo+Xe5gRBhyLsj0jga4qNfK/GCphyOZJY+kLLqVXFRoopOEZY
	znDxGC7VBD7VyC2nN7IMjTG85QPHdXKEe5WOpqi3YZTqFhkFIoam9eUj/XHvF+/iMH
	tLbZLBPzKDzbjzcOVGAlaiw7bcV6gPNLFUINk0fklf7WffRX1mB2ZM26AKIZQJxZEb
	IGlOuiof+EiByXaj1UIZT0HkicUZkiGjdkjEvDzmHHYzCPgDS9epqfycPAxsX27UYg
	+czJ0Si/xrtyrgUSg96birZ42KTY4UEVzuvuRwmFX4cpsiZvIHxs/q05v/NzBS6JFG
	MgzEvKiz1iLvb9CbPAZolOv2ssLmuqzeCXsTWId/kK+wG9orPw1itypJQrniyZfeZN
	7RQeh9DbpS5+DLZLBnDDaIJKzoGTxx7GlGYWEYopCIpJHuA1DkCsMEYTbm2AhQRUoC
	LzxaHWdDLfTpl0wF/sSB3vft73IEikshe4yNwgdI7VnOOfEtW90J0jl9w9q6wj+/xu
	glVQeHD2joEz/2ZZIoiZr88A=
Date: Sat, 18 May 2019 00:43:15 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190517214315.GB1047@localhost>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
	<20190517181151.44001-33-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190517181151.44001-33-alex.kanavin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 33/37] gst-examples: upgrade to latest revision
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
X-List-Received-Date: Fri, 17 May 2019 21:43:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, May 17, 2019 at 08:11:47PM +0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-multimedia/gstreamer/gst-examples_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_git.bb b/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
> index 75ac9b75c13..e572ec8db8d 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-examples_git.bb
> @@ -8,7 +8,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gst-examples.git;protocol=http
>             file://0001-Make-player-examples-installable.patch \
>             file://gst-player.desktop"
>  
> -SRCREV = "2b3fc175c252cd5a537e4b2864b572a8372473d6"
> +SRCREV = "3f51023aca06d28ccfb1d5383d99ca7fbfb287c8"
>  PV = "0.0.1+git${SRCPV}"
>  UPSTREAM_CHECK_COMMITS = "1"

Upstream git contains a tagged 1.16.0 release.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


