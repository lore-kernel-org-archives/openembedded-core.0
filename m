Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 302F07C873
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 18:18:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46k4Bl16hsz2C;
	Wed,  2 Oct 2019 20:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570040303;
	bh=sFBFoyRTSBtOm4ckQVuGsXw2KqwbnMTUlQqhKrtr1xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K6Qk1JNcD6UajhWtX4O1fH1qY2imcHtonlble7c33vM/biBfHsND00Cif9bAvP3mj
	FoEScjnCfGT3jngySJZOd9yakAuHijIV44KKkavLqkXy58ieL+h7Pd1I/6fYQova9F
	/6GDdwHWA9TY94exusyFs+YRu7sBVLjtDP7Sc4b48iVRxAgvJcRCX0v2kiBnNkyWx6
	NGiFOiLeMVXoZhKOaKWba2t6FNoxHYmJtWtaawU4I+ylEVJByoqjqAT2tA9N2jOL0P
	joIgRYcufw3UhxtMHKsFpiiZVdCp82DEItwmWgRvRFAuP4Fx5nldx75pi0MaOWmic4
	xQSKxCDa1Bbd4Rn/Kpb+4el3orQSlpcYGhDmyI2F9fmaFeMFq3CQWVCO4IjPCtIX9e
	yXRQ7Q0QtXi/GS10H70PXv6m7enJHjzcYHI2k7nUhx4dnnXOOg9BhWr96G98oxXQJH
	ivbgdAIAoHT+53F6l1z12LIDQCOPnRPoKFKki/HdVVDOf8rwkMq1Vw8vdAcLnZv815
	EyykX39vpS7Goq0rGuJctFcRvgwfbWftHYwUTtCJyFOgRuFZ8TmXx/xt+DnADd3Hgn
	ER4AtrZz2t/j5DowHsLJu3jBPft/GDAXuXv9Nak2GWeBixLsedo/J0DWKDlg9n4iwu
	7FbJqYmgq3JnuQ5K/UywrrwQ=
Date: Wed, 2 Oct 2019 21:18:21 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191002181821.GB14877@localhost>
References: <20191002120027.109242-1-alex.kanavin@gmail.com>
	<20191002120027.109242-2-alex.kanavin@gmail.com>
	<20191002175152.GA14877@localhost>
	<CANNYZj89n07FE7UEo5DdwCs_q2xUePEh_MZgwZ=uYX1hyRqDnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj89n07FE7UEo5DdwCs_q2xUePEh_MZgwZ=uYX1hyRqDnA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ethtool, libcap: fix upstream version check
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
X-List-Received-Date: Wed, 02 Oct 2019 18:18:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Oct 02, 2019 at 08:08:08PM +0200, Alexander Kanavin wrote:
> On Wed, 2 Oct 2019 at 19:51, Adrian Bunk <bunk@stusta.de> wrote:
> 
> > Works for me without your patch:
> 
> I am not sure what this may mean; but for me the patch definitely solves
> the problem.

It means that even without your patch devtool is able to tell me that 
there is a new upstream version of ethtool available.

I was originally wondering whether there is a problem that also affects 
other users of KERNELORG_MIRROR, and was then surprised that it worked 
for me without the change the way I tried.

How are you reproducing the problem?

> Alex

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


