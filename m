Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D58AF7D71B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 14:34:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44z2DC124Nz5l;
	Tue,  7 May 2019 16:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557239643;
	bh=jIlxo4XDZuzw5vd6GGLEdqxgE3T81YTNAZkPb+qtDmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IrFXVE2bbFVFci2OTlrLZ6CaNgMyrkTcupWdrsQPnqNxzhFI875Ft5in0oUUDuipD
	wsBN2p0rAS49+0yuyjtn5/BKJJAivj2sNtoIoYAgyd4wt1DZpDAPa6lFqxuuBlZKI8
	vRkxvch35Q1/9HFywu6BVIS7zoHd9hHbpAuKbKabyqM5iWFEwLj6cfH0GzG2gExdXJ
	ZmaXohUbMLKa8F03vUVrPDet76K7eYGCr7cpW3qaEPYzVAT6R8Thf4LoxUEGjJa7AV
	Zyvf0WZmvHUSeRSVTQ7TstkeFJI5Tv6IMYVyyH2hWzbrtM54/A2nCwY3tDAzVllBYE
	KZciVDKidk7M6QyURW8b3MTOCO+Bic00VZ9GJP/4bzjrYYuYMj6u9YDGm1Myf73H8p
	Ltdf8Eka5+NItbLWtFOmV7uoQvbPob4+mGHVsmc3gvf2/NxY1L4lxxtowuuJpoZJDY
	5HYdUq67e05TvcOkMnWk7VXfDko6j6Ik4r0a0or8aLx0ZKLr4jLCqK0nbDjhTb4Q56
	+GbcfTJ+8WyEGQ0DdQF9zW5WwUfpcsxq09ivbe8RqhN6BjCGasraPB19HEVcMbOuOU
	G/l8RlEiLbv/ajOguCtjvy5KD4wAc2o5yDRZyJdbLBKLLWkSRIacuerC6qACuQiOlT
	yhz9bO1UFTdfrOf6juN6RYhE=
Date: Tue, 7 May 2019 17:34:01 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190507143401.GA11291@localhost>
References: <20190507131151.31070-12-bunk@stusta.de>
	<d4fea73f-27ae-48a8-a71c-97d43e17c01c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d4fea73f-27ae-48a8-a71c-97d43e17c01c@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng-modules: upgrade 2.10.8 -> 2.10.9
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
X-List-Received-Date: Tue, 07 May 2019 14:34:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 07, 2019 at 07:15:23AM -0700, akuster808 wrote:
> 
> 
> On 5/7/19 6:11 AM, Adrian Bunk wrote:
> > Remove the backported patches.
> >
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  ...nguish-between-kernel_siginfo-and-si.patch | 133 -------
> >  ...-signal-Remove-SEND_SIG_FORCED-v4.20.patch |  67 ----
> >  ...reserved-cluster-count-when-removing.patch | 149 --------
> >  ...x-timer-instrumentation-for-RHEL-7.6.patch |  32 --
> >  ...argument-from-access_ok-function-v5..patch | 204 -----------
> >  ...ter-values-with-task-tk_pid-and-rpc_.patch | 186 ----------
> >  ...ify-defining-common-RPC-trace-events.patch | 183 ----------
> >  ...-fsid-metadata_fsid-fields-from-btrf.patch | 341 ------------------
> >  ...p-mempool-Remove-logically-dead-code.patch |  46 ---
> >  ...ules_2.10.8.bb => lttng-modules_2.10.9.bb} |  13 +-
> >  10 files changed, 2 insertions(+), 1352 deletions(-)
> >  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-signal-Distinguish-between-kernel_siginfo-and-si.patch
> >  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-signal-Remove-SEND_SIG_FORCED-v4.20.patch
> >  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-ext4-adjust-reserved-cluster-count-when-removing.patch
> >  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-timer-instrumentation-for-RHEL-7.6.patch
> >  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-Fix-Remove-type-argument-from-access_ok-function-v5..patch
> >  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-Fix-Replace-pointer-values-with-task-tk_pid-and-rpc_.patch
> >  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-Fix-SUNRPC-Simplify-defining-common-RPC-trace-events.patch
> >  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-Fix-btrfs-Remove-fsid-metadata_fsid-fields-from-btrf.patch
> >  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-Cleanup-tp-mempool-Remove-logically-dead-code.patch
> >  rename meta/recipes-kernel/lttng/{lttng-modules_2.10.8.bb => lttng-modules_2.10.9.bb} (61%)
> 
> Does this fix the ptest issues?
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13255

2.10.8 -> 2.10.9 are 10 commits (plus one to set the version),
and the only one we didn't already have is
  http://git.lttng.org/?p=lttng-modules.git;a=commit;h=2d16de12b197aed57212826187bcb0ab24ad071e 

Seems unlikely to be related to this bug.

> - armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


