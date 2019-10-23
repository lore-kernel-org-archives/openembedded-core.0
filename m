Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B38B46B076
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 10:52:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46ynJY4yv6z5w;
	Wed, 23 Oct 2019 12:52:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1571827949;
	bh=aSpHdZ2EoKDmhTKO8PCw/cuxy5V3rxsgiXjv7eGxxvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o57q8IBY1StCT1DQj4AB/gnv111FS04Yh11ciGp77QqMAfgZAXy9qhWHnGgI1TDug
	kDhNKwNxS4L8hwWEMY6wBbOQcDjB8E16A4MAU/lu2Vb7M0ii/UsVeMRAFCnLfHZMUd
	sbj5qu655juCYk4hI5OhfWA6FWKhn54mp+e3HE7fQ9zYASDWlaUjhlvxWXIwK2qLSi
	t+nhLadVLvCn3AEgJHoTmftGCnQOaKL7ckwPT8vmcuUEUJT0qxozBrr1g7kUA1uBl6
	2qQ3HGAMIY6iZWRd3mpY9pdzf25YLDCWjeq0TFzkwtxqHYZjSHDlfsFx7jjdOob40I
	8ylh30okR2e0Fl+XFIgB2GT2CmaehU3qZZEJuV00kweSeZfdBmYIwANmytDBgsWdIM
	2TSfD0z223qfDIgc7RBB5SAo3qLkc+LEDZAlPLhR5Z6tf8yNzb8BzgicBP307APR3G
	suuQBjFfLY8dTmDK9sDdKrrp7lF8LEXt+m6yt41Vvb8NKt4116nO1w/X8mX+gRuD4B
	/BsTODcfZxrFoEk/GMqVo1piy4H2N+JWYKSdH6PJpjpFV1YFs/9ybdnzGmZu+OV86Q
	6o+1cxzRRgrsD63ZEzJbj/25Q1ZJuQayOm0JxIoSrgCMWJ1v3Cqy+BD3SG39Arrzjf
	mTd4XBT1vh+qizpd+Ch1+m5A=
Date: Wed, 23 Oct 2019 13:52:27 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191023105227.GA12744@localhost>
References: <20191023103639.4847-1-bunk@stusta.de>
	<CANNYZj-6R9ykS22Rt8C9A90WXVrfX0ekc6HjCDi2JC51yQ53gQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-6R9ykS22Rt8C9A90WXVrfX0ekc6HjCDi2JC51yQ53gQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: Upgrade 3.7.4 -> 3.7.5
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
X-List-Received-Date: Wed, 23 Oct 2019 10:52:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Oct 23, 2019 at 12:40:33PM +0200, Alexander Kanavin wrote:
> Python 3.8.0 is now out, so we should upgrade directly to that version.

3.7.4 -> 3.7.5 is a straightforward upgrade on a stable branch.

3.7 -> 3.8 is an upgrade to a new stable branch with incompatible
changes that might break reverse dependencies.

No objection from me if anyone wants to do the upgrade to 3.8,
but until then we should follow the 3.7 releases.

> Alex

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


