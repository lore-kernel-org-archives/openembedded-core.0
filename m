Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 77E2A7F234
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 11:37:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45xyNT5VyLz4R;
	Mon, 29 Jul 2019 13:37:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564400266;
	bh=BMZx/37b7oDFCHoVaw7J82dWCW1+fbfBcWm1NtfwMNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dKcQwEDNn6ZUYR/zT4nccn436mf4T6QT6zaa+vTysHx1bGawaBvuCqILmVgI294vZ
	I+sp16im5t7jLUQI/5I+a572usDZDlJiTPjLQMPkps2p8cHZ1ZD3jupNMlLYW/BG5Y
	7BWv7hAdbtwiQ8YGbQHhueFtRiLHTsNXXMOipZTYVr325B1sINPZ/AA8u6ruHuX1nq
	cNo8nZStUgBW4bOykM4y4iFRPEUo/+b83QyVcXaX9PoOL/ysOX9yXar0TQ+nocOxpU
	rUAMbvgMcaIWw8oNZ800UIklFA80kl/N5xv7l8Ai3MM2C0qOqruuJvZS94mlFKVaI3
	v2qMf07iMXVRZH/OW8Rnqh8ClQfXKwxoKFV5xvZ5go5kUiYBvrAIYLuh7dhy8NtyC7
	wSgLZDuWlBtbmxXg8l5l9ewx368YkRQt1fWIgXRCu3BVvKPFl8vuSkKsvzxQWX76Kt
	0WT0DXD2aw9gFLt0NnA6WF0ogxfuDjDZRA3fGf4NFtcJtctLTGCdpGW4hFWPXdmCK9
	F066FHK4vShH13Wpb/23OA5gxXRjTPu89j3dV6m0qm1in2JEYX2iJKJXComQle/CTs
	LYPPQhE0H7q+u3s6RYEyjgOHr/uzuZUMMLtqxNQRCuNyVbOaMhrE/Z1xi4OQgDZ/6T
	3WbIVsg9Q9D/Mtw2j1nQ04jM=
Date: Mon, 29 Jul 2019 14:37:43 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <20190729113743.GA25395@localhost>
References: <20190726093443.40634-1-kai.kang@windriver.com>
	<20190726093443.40634-2-kai.kang@windriver.com>
	<CANNYZj--B16+q6PHBk7W9ESpGFs1gjGJwNYUGR-rc0yznYMJyw@mail.gmail.com>
	<d28df357-6fa3-2b25-1d94-2430276bf266@windriver.com>
MIME-Version: 1.0
In-Reply-To: <d28df357-6fa3-2b25-1d94-2430276bf266@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] epiphany: set imcompatible with tune mips
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
X-List-Received-Date: Mon, 29 Jul 2019 11:37:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Jul 27, 2019 at 09:23:01AM +0800, Kang Kai wrote:
> On 2019/7/26 下午6:09, Alexander Kanavin wrote:
> > Wait, does this mean that the line must be inserted into all of the
> > recipes that depend on webkitgtk (wihch is very awkward)? Shouldn't just
> > the webkitgtk recipe fix be enough?
> 
> Unfortunately, yes. But there is only one recipe epiphany in oe-core. I
> think it doesn't need to pay too much attention for mips arch too.

I just sent a patch to re-enable building webkitgtk on mips.

Any objection to that approach?

> Kai

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


