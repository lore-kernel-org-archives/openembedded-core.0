Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4379961B4F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 19:07:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48gTTl3Rp3z3w;
	Sun, 15 Mar 2020 20:07:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584299275;
	bh=oH8QcPxvyqMjv6fqt3FG2l5E2Ce6pjGJkjixLirxCvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rDmYaKFhzcXpPHJ5wjD7y/GmWdEHHVCllbt5OFnNxNIdAI6nKNk1wbk0vp743WrBg
	tuE/iQXwJHkIm/EgfhBLQ3s1D9X+4DYdSu47tSEpBYBhgsfykSy27yR2P5Luznfolw
	Kl5HN49XhpMSA2sIHcdwtbqmDIhv4+oCxTXRKohffMx+BnmOuU8T15zvv0TvjVhgZc
	G75xZ8gZzevoHrViDt3vtpyQ4owy/pXOMd6knrOry3UTD/QQbcVERfH7lRpHBAczzd
	gO84j2tBaoQnq9trYh7UVYmRIXm1wwMOKMy0eRU/2QsinHGkXPkgK26n1SOnlmsIXn
	6FZJ4g0vxM/KjnWiu8RoldB3TOxy9H96Fg+k/z1YXPgR2pjCwqpvtDqYv7Y9K+owoC
	BWAL1hqGKfyaeLO77+ltjhco+QF2UOC66VmjfAZm2XTfitzckbk4MlN/ilq22+dSRM
	UvAR29kc1gRWgx9QAJ5MLxRGUvW/avOBwW/RwxOSAXqMOjSUQVpP7+28jUs4Cbnh4g
	rzFXywJGIMuTmFLiWh8WwMpmtF32LBGYg+b9zjEEDfBCACjklE9wc0onbJnDsCtWxK
	icbhx9Zo/WJSw57rstWJcp3V531NIBm2zXogittrWtrYlQNFYo9PRcv4umK8cPSIo3
	cUp3w3vpSkrg7MRdLcnNJXmg=
Date: Sun, 15 Mar 2020 21:07:53 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20200315190753.GA14992@localhost>
References: <20200315181308.12792-1-bunk@stusta.de>
	<20200315181308.12792-3-bunk@stusta.de>
	<51a214de-d173-1dcd-061d-7e127487e364@gmail.com>
MIME-Version: 1.0
In-Reply-To: <51a214de-d173-1dcd-061d-7e127487e364@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [warrior][PATCH 3/3] gnupg: upgrade 2.2.16 -> 2.2.17
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
X-List-Received-Date: Sun, 15 Mar 2020 19:07:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Mar 15, 2020 at 11:56:09AM -0700, akuster808 wrote:
> 
> 
> On 3/15/20 11:13 AM, Adrian Bunk wrote:
> > From: Anuj Mittal <anuj.mittal@intel.com>
> >
> > Also fixes CVE-2019-13050. Announcement:
> >
> > https://lists.gnupg.org/pipermail/gnupg-announce/2019q3/000439.html
> >
> > (From OE-Core rev: c6e46323f0d62daf8bd424e642581fdcba920ef7)
> >
> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> 
> are these bug fix only updates?

Mostly just bugfixes, no major functionality changes.

Backporting only the bugfixes gives you a patch list like Debian stable:
https://sources.debian.org/src/gnupg2/2.2.12-1+deb10u1/debian/patches/series/

cu
Adrian

