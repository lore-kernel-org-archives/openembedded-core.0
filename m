Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4DCED60F57;
	Tue, 11 Feb 2020 14:13:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48H4Wd1T48z3s;
	Tue, 11 Feb 2020 15:13:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1581430429;
	bh=Wtds0xW1CFu8rkdKhtyFmShM+QKG1hekFRWp1C/0ngM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tBReJNqD4wQmr9SaqSxr36j5XktKaZjKi0QmsmDyyeLWElwBNmDUmgCRw8gr4rXKy
	leqSCV0RdesyK/d7/TwnYanj8OoXp3cpwlkusq1scqN24tDMGLgYzKZINeAP3fNEpQ
	ZwEaCUkr0GEFFxtJrw4WpA9xREUNJEXlXp0eyYO9qs1ByZOMkelUiDu25deXXDdG5M
	Rm6uLQ8fOn6wkXy998to3Qk6Uvf0D34/lQXkUm4+72umme73xrGXbKgZH71orPWZmM
	tp+BCac1YPC2Jn3cEp/NoSqBerVZmkXTq5UzZGrfYO4aReEL+lhGXNBQM3uKnGpIRR
	gwQgs6kxkgPw8wulCDtvhhxHALojQQ46mG/hUCaZw9JYrMBgo+O4MPDataRwloa///
	Mrzj3GOkX049VytqmdGY3VZg1Zmd14kVfdPsugv0+TygxqU1O+cEcv0HYnltpu1/tM
	JnhqzcBiB6epjTjlCITWF74QqLwCqLaliRVMxEZsDDN7bADdlNqCn8cUEx3D4of8ab
	4r+F5ELrtYHDnC4t0M3mgQf3YFcR+EBSj1wPisrWVbNVNbZg/ceBHnkiOEeB7GrH9u
	5jHkdxRgrxC0f88CvPfY4LG1eG0nCW8L0A0+GwQDLwmkhJIRBpf9mPGMaC1/zrIx2+
	hvxLuAdcx8G9pFd5985V1ST4=
Date: Tue, 11 Feb 2020 16:13:47 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200211141347.GB3234@localhost>
References: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
	<20200211135323.GA3234@localhost>
	<CANNYZj_ExXVJJMS3g6Ga2xNc9AgspEhcMBQgmQGaQXmkcUYvPQ@mail.gmail.com>
	<CANNYZj_v9=Ys-NXqHWXY42dZqT95+LxcRUqSRKcyy6pMz-Y01g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_v9=Ys-NXqHWXY42dZqT95+LxcRUqSRKcyy6pMz-Y01g@mail.gmail.com>
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
X-List-Received-Date: Tue, 11 Feb 2020 14:13:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Feb 11, 2020 at 03:01:20PM +0100, Alexander Kanavin wrote:
> Specifically (sorry for the rapid-followup), I think the main value
> proposition of core is integration and testing of various language
> toolchains and core libraries. UIs in embedded space can mean pretty much
> anything, and so I'd leave that to specialised layers.

That's actually quite different from your original email.

Your original email raised the problem that X might start to bitrot
after the end of support for RHEL 8 in the year 2029 (sic).

What functionality should be in core for users/demo/QA/...
is not strictly related to X versus Wayland.

> Alex

cu
Adrian

