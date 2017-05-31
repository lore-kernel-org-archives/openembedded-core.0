Return-Path: <dev@codyps.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 875EA60807
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 20:27:42 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id t26so21642123qtg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 13:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codyps.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TDJTw0GHpozRtK12luB1wbBVhxvzKqO30R9zR/XjToc=;
	b=JwDjzZDqDlwU2ysZJkyWY6Zi4lMrNWoCo4YHwfYuI0bm0fTO7KFmdxtXsYUlpsUC9Q
	BzrR8/GrnFQUgYHEVmpmKBCrO+bMTL+3WNgHsBhyscAepc6gfkTeU5BEBVL7d6sKjnjD
	iSBStK6RpQR45XDsM3sXrG8XiqUB3xIO1UAPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TDJTw0GHpozRtK12luB1wbBVhxvzKqO30R9zR/XjToc=;
	b=hp9V2Jm1fx5TeFfpFxZ/fTOCZZorBbGXX0KCkP/MyIvlcRxBgI1sf3sWb0K7BPp7CL
	sPCW4S1eC3iAkHA9xEL4Sj3Creps9Nvj0kZuQ4XXTWobCDQ0ZXM8g1KrQqn9sCHoaPRj
	pfqyLfxMtdJ5sV1xT60vF8gM/BtPtXIimzWtRvnjPT6PXHilbKU0TbUlOC1g3o+Gxkmr
	JfBnUwYaaXkAgAd1wk5lDxhaKGnKs6GauLlLWoJs9L26jFXUeOGqpB+aowxuMDjAAQva
	2ZJUtLvTBBGGqyH2RSzR+fdnxv0M6B5nLDLa9SHtafHlpsi5sgfnm2BoQVORYWTtU0GV
	7b4A==
X-Gm-Message-State: AODbwcDSmVD+2TQAOuIc/8YQlvMj+n8wenH3nanPTERsECT/POp10alD
	tpD/U6Pi3/mbRHgLRlPcg45Ggsv82/H/
X-Received: by 10.200.39.171 with SMTP id w40mr30698897qtw.87.1496262463448;
	Wed, 31 May 2017 13:27:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.189.168 with HTTP; Wed, 31 May 2017 13:27:43 -0700 (PDT)
X-Originating-IP: [72.74.84.52]
In-Reply-To: <d5baf3fb-75f5-d50c-e59b-07f3688a88d4@windriver.com>
References: <20170530211436.16397-1-dev@codyps.com>
	<CAPoQQ-1uznmcUSkXs3iLYyK-Bm8gDaT5de_Bi-jF4Su6+KjKvw@mail.gmail.com>
	<CADkTA4MoY27QPks7oJVP-tfs1+Yr1yY9StmXToNT5Rrs9mYJAA@mail.gmail.com>
	<CAPoQQ-00id+nBQ1_n=b=7RNrixOxPZb_5puOvCFmOspQB=O3rw@mail.gmail.com>
	<7bed8363-bd79-0233-3e91-1a74f26fca37@windriver.com>
	<CAPoQQ-3k3HBh97T855_qY4PtBy8Z2qTVuU_BawnBJsvcBCoe8A@mail.gmail.com>
	<d5baf3fb-75f5-d50c-e59b-07f3688a88d4@windriver.com>
From: Cody P Schafer <dev@codyps.com>
Date: Wed, 31 May 2017 16:27:43 -0400
Message-ID: <CAPoQQ-32FvReq9UQPKVYM0dL4LC=vg__GVvnVf3uSq8YwDQerg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu-export-rootfs: don't change RPC ports
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
X-List-Received-Date: Wed, 31 May 2017 20:27:43 -0000
Content-Type: text/plain; charset="UTF-8"

> RPC Ports are just the bindings into rpcbind.   The tcp/udp ports are the ones
> that typically conflict and why this was all done to begin with.

Ok, then it doesn't sound like that is a conflict or a "privileged
ports" issue, and it is safe to drop the custom rpc program numbers
("RPC Ports") from `unfsd`s arguments & the kernel parameters.

As I've noted, runqemu-export-rootfs does not register with rpcbind
(we pass the `-p` flag to `unfsd`).

Or is there something else system-wide which is keeping a list of rpc
program numbers?

