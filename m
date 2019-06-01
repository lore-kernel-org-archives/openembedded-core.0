Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9DAD77E66F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 16:00:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45GQyY1hCWz3y;
	Sat,  1 Jun 2019 18:00:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559404837;
	bh=weuFOflasKz4irhO1p2EEKwtEh2cpl4Yes5ZP8m/jzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQfFHA6tJ9d5vTrzKTaO+Ksp6htVqfotktNIiKSI3nA5Yb2+GKkgnGP5FsvqjV9Vb
	ta57nuo5OW5xGBk2lOBPi78Aw4dnEYxa1nH8mVF7S9QE0LjNCf5b/eW/DNKat9Iauh
	pb38JxjvMZuIf5i2D5Wpy4/uIBt6A6KTA1iPaK5ElnYk8oIiVEhtIuFBEWG1AeiAsw
	k366hxT7nlyquyBejwGUpz3lXBVwTDxJ3Vo+1/zW3gQHOWnkKG73vlD+SADq3HNPLc
	T1GTvZ9HkoRsyzJFfbwBrpJFLorPwq0Hv5LYOBroUmFuVessgp3xREx0n1fmEx7Hiw
	aD0/rbW6QYc1nG4gHkiJIKL6x33wtqmhbrnoGvOGBfETgL/RY3u6fouH6d7XOoxFop
	ZEyAFumJNIaxe2PPTc/KgvicDsZZC5+Fh+CdWtXDYhGNmSangod/ICzMA3gfPHDarw
	Bp8G2bET32ovXNQpQVL+Pc/w9BSMzekPV1W0Pp/6slGlqmhX+B+6d2VAo50MproyyG
	Pd/BV6P9NSCLdwzhAi0KO791qkAgjUOo1GxBJusSOeOdIrv3xguHw+KMT+HCKIVCO9
	1MRNxiaTK+vTeP+cS6+uXy/4+tWpkID9e4CrYjkmYOWrHjTbA7P6/0zNM0j/r8rbE3
	2DqioQdoeutCmTFk/sRZ9zIU=
Date: Sat, 1 Jun 2019 19:00:35 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190601160035.GA4549@localhost>
References: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
	<20190529141116.GC28892@localhost>
	<2722a848-cba6-e1f0-784b-799f1e4c787c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2722a848-cba6-e1f0-784b-799f1e4c787c@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH 0/9] Fixes for Thud
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
X-List-Received-Date: Sat, 01 Jun 2019 16:00:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Jun 01, 2019 at 08:45:38AM -0700, akuster808 wrote:
> 
> 
> On 5/29/19 7:11 AM, Adrian Bunk wrote:
> > On Wed, May 29, 2019 at 06:50:29AM -0700, Armin Kuster wrote:
> >> ..
> >> Mingli Yu (2):
> >>   nettle: fix ptest failure
> >> ...
> >> Richard Purdie (1):
> >>   Revert "nettle: fix ptest failure"
> >> ...
> > These should be dropped for obvious reasons.
> 
> its not obvious to me.  This helps in the QA process.  I am open to
> ptest fixes and other QA backports for the Stable Branches.
>...

One commit is a direct revert of the other commit.

> - armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


