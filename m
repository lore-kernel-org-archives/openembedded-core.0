Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC827E466
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 19:59:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45MRtH2Qv5z2C;
	Sun,  9 Jun 2019 21:59:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560110359;
	bh=b01zkDVzQU3cwx/bj6T6iIy7T/T1Pmczxgz5WGPwegI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YEFP6lu5FfS/cBAb8IsglRBvYG0roTSRIWH9+fy/CtJws18GIP41IBaFoAJic7DAr
	8Of81iEpN9LiVrPljqFcUY7E01gEcrYYFxHr8Tz/0i8yUKR38ksL2eFVsbdK5cdCA7
	4dwx9f1z4R7pUGnl4ugF+p+rn6xvNr2uKE9/lVHkSmjx7YJdMCDpjbh03UGRDrTHFp
	/c7qxQfLwEAf1tHj7YmfLwpbpowuezaWqD3O//r8IKC4wXOzw2Zkq+LEokuiPf50g3
	n08rcYanOl6xVPRPPusHzrPMIIAZ/FV0HPtzve3/5Tl2sG+j2DN75Wu8UocjexcdAs
	mGzILnnuVUVaCkYTl8wcU8q5+rZGZlM7E+T6RSsvnbPIuAxyZ1DPUITLbeR+xEjn3C
	qS6/UcZ2AeUXM3yaYkslK0d8bv0X124vJR7dsBBNscQ877a8t25IA9Yt2Njj1/j0ry
	cT0JqhGvXx8rn4PTOfUuszmqgOc5CoNmhkRjop3YfPemuBy88nxu+CYdUHFRjBmJiX
	9mnHoKTq3eyTHobOtvqrl1rQ6W6DlyiYJMpnCs0qRpNzfh3kSfdrNhCJTO+2kMrBBJ
	KvOzEuRhZXF36uH8P9/Omrqlfm9nyDD2ZUw8K8OZN2xOwJnttLrRjv76BT4UPuQWuJ
	kAr98tROSteYbMITKnKauMGQ=
Date: Sun, 9 Jun 2019 22:59:17 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alex Kiernan <alex.kiernan@gmail.com>
Message-ID: <20190609195917.GA9888@localhost>
References: <cover.1560091882.git.akuster808@gmail.com>
	<682c4119e95056d68513772261425bdc66e1fd2e.1560091882.git.akuster808@gmail.com>
	<CAO5Uq5Tmr66vMpn-FnKZerBVhN5uwoKvFuJ31v8x40bEFYf1oA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5Tmr66vMpn-FnKZerBVhN5uwoKvFuJ31v8x40bEFYf1oA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Warrior-next 24/27] openssl: Upgrade 1.1.1b -> 1.1.1c
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
X-List-Received-Date: Sun, 09 Jun 2019 19:59:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Jun 09, 2019 at 06:39:58PM +0100, Alex Kiernan wrote:
> On Sun, Jun 9, 2019 at 4:50 PM Armin Kuster <akuster808@gmail.com> wrote:
> >
> > From: Adrian Bunk <bunk@stusta.de>
> >
> > Backported patch removed.
> >
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> 
> I've just created:
> 
> https://github.com/openssl/openssl/issues/9119
> 
> Which appears to be a regression for DNS over TLS when systemd-resolve
> is built against openssl 1.1.1c.

Thanks for the information.

The only CVE fix in 1.1.1c is already in warrior,
so updating openssl in warrior is currently not urgent.

> Alex Kiernan

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


