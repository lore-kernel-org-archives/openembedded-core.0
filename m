Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 12FD460CAC;
	Tue, 11 Feb 2020 15:02:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48H5bV2l34z3s;
	Tue, 11 Feb 2020 16:02:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1581433334;
	bh=l18lgfx6HjFeHXztD2FiB7qLHrF6GRVHF1+AqAuG7Pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hgpAA3PVKIh75WKYD1Hnmt2ECt9Kfc4W+L7S8gfyo4g1Euyq99KpBWvbqVbgvKlJT
	HjHmqCdORTFaUiHIrki//nthm1BFGQ2gk24iS71P7cIDfr6sZo/hD+rlsPBt2lyCnB
	sSQugUXvDHKpY9QgKYvwaAD5MTX3EEx9GMk2W9+pRxUYeB5eJYpKuWpymXZhrPzG7R
	PvaOOqNub+2Rip25n3qO94JWVWQ2uZRMA7YGPv35Jjex6QZuTi6/MKEYgjdm/S1Ylb
	yN7SIRBatAA1WCicjJfaj81HgnPM91gJHnuO3fO1AUkwE0ocxmCOs37F2VdMsgPrEn
	j9/3fBm2tWaUD8GyklqmtIxlSSBYpXMoMcKy5lo22I6E9Vp2ga3KxG3verPGv6n5dr
	e+/yVLnq1FSkkDZWgrt6LmxOY61y1nHHBj/u4WJUT2rFleJ0kN+EMwU0/oIJQUQGDJ
	s7iRflKq5gxdVudUbEx4H7Z8H1wCboyql66M4L3SMZWIPe4ekTmV9S1ELuHQJxK1TN
	qY2UHxts7DHxl4TZucCD0eYWC84ScunTQdjyAq4Zr9aUZSJVZ5E59VI5rKmIQkmupo
	DQm9WQF3xIiiIQSn1TjU8HM94uzhkFUaso78Uk1wJBeLIio9e6+ad892orI5mH1pFl
	qKOQ0yrufQhaJn9f66Sp3nkA=
Date: Tue, 11 Feb 2020 17:02:12 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200211150212.GC3234@localhost>
References: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
	<20200211135323.GA3234@localhost>
	<CANNYZj_ExXVJJMS3g6Ga2xNc9AgspEhcMBQgmQGaQXmkcUYvPQ@mail.gmail.com>
	<CANNYZj_v9=Ys-NXqHWXY42dZqT95+LxcRUqSRKcyy6pMz-Y01g@mail.gmail.com>
	<20200211141347.GB3234@localhost>
	<CANNYZj_2WVWrWDbL1tsUeqVQ_OPHnzebA=6fobRD9e==UybAhA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_2WVWrWDbL1tsUeqVQ_OPHnzebA=6fobRD9e==UybAhA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Future of sato and X in oe-core
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
X-List-Received-Date: Tue, 11 Feb 2020 15:02:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Feb 11, 2020 at 03:35:03PM +0100, Alexander Kanavin wrote:
> X might and likely will start to bitrot sooner for those not using RHEL 8
> and its very conservative and never changing software stack. I can imagine
> Red Hat has no interest in supporting it on Fedora going forward for
> instance, they'll just make Xwayland work, and rip the standalone server
> and its drivers and libraries out.

There are plenty of other users big and small left, and most of the
hardware support already moved to the kernel.

Stale and stable is not necessarily bad for users, and X will not
suddenly stop working.

> Oe-core will have X for as long as the burden of fixing build errors and
> runtime issues with custom patches is not too painful.

If this is true, then let's revisit this topic in 10 years.

And the solution would then likely be to switch from matchbox/sato
to some desktop environment that supports wayland.

> The point I am
> trying to make is that I am not convinced oe-core needs a 'real' ui at all,
> and opinion to the contrary should justify the need.

The point I am trying to make is that this is a different discussion.

And any "no UI in oe-core" decision would not have to wait until the 
point in the distant future when X might no longer be supportable.

> Alex

cu
Adrian

