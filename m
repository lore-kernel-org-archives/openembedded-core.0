Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 07A267E553
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 08:41:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46ykNz4r9Wz5w;
	Wed, 23 Oct 2019 10:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1571820068;
	bh=2cLmvOLuTGKhXWdxxWGTWx5U2kmEIv4s9/68V0BTicQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhgCJA6Ewvi7Gtd+IjFVUlowx7G1QJ+RPa3CNDDUONLIQfI4zaNmapdmV3ITCYXKF
	Wn7MzvKeN7WIPYuMs6FFz6Cw+3dIVr/6HZytjgnJE5w8Kg7TKeVhKm8PhAEOIQ0CG8
	7Nslp45S0z46ulmmHcRT6N699J4QWw0xSXBaSMcEFkY4htBsrjtEXjafPRR9bKZltg
	58zS8VIixi9Tk6zY9xtOrPTEQxe/GCGta8o54DCL4vapwXbxCX7m9SUhxvEhlGlGrL
	RpKD0M+ISghvsJztwkYpAAZizMwsPWaTxv/WAbMOzCRlUFOjE1J+UCxUkALDzoPuqW
	PsTiq8ntRKgAGwdmFcUq4rVfv7l94Yh2Z3qgi1SsgHeZGm15UeCs0uvS0oLae7LOaz
	XHehUFy98YqmbWr28sCTB7WhwmKp5zsMLODHvwj7gZNuWJ/d5Kr7ASn7A04oJinkvJ
	0XgX8nMHEzmM8usRP36rj3+SS0TB4XOwJF5UPKCFwjlQ5wMyJwe83eTfhO/+iGNgcA
	soSFJgcYJpyNha2FBScZXp1FPfOzfjwMAgunBWRwKftX3ccA+A9+KVSAo27bu1xhSb
	OsHlo9hEwTvxtu6uUlDFoKpokCk0KJ6rMi8P+D8N/faJcupL6nZ/v43wPRi9DNtWbU
	TJl4A22AQIS0XD5S/wevHiAs=
Date: Wed, 23 Oct 2019 11:41:05 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20191023084104.GA4655@localhost>
References: <1571325700-5138-1-git-send-email-akuster808@gmail.com>
	<20191017184222.GN17412@denix.org>
	<2e2b16b4-fff6-b84c-1f48-0e020a0f3629@gmail.com>
MIME-Version: 1.0
In-Reply-To: <2e2b16b4-fff6-b84c-1f48-0e020a0f3629@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH] Revert "OpkgPM: use --add-ignore-recommends to process BAD_RECOMMENDATIONS"
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
X-List-Received-Date: Wed, 23 Oct 2019 08:41:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Oct 17, 2019 at 12:21:11PM -0700, akuster808 wrote:
> On 10/17/19 11:42 AM, Denys Dmytriyenko wrote:
> > Thank you for this revert! I've been pulling my hair out past couple days 
> > figuring out why BAD_RECOMMENDATIONS stopped working for us. This fixed it.
> 
> What I find curious is that the offending commit has been in thud since
> July 29th and we are just now hearing about issues.
>...

The "Yocto is not a distribution, it is a tool to build distributions"
adds a layer between Yocto upstream and users that results in users
usually using old Yocto releases.

How large is actually the fraction of users who are creating their own 
distributions based on Yocto releases taken directly from upstream?

I would suspect most users are using 3rd party distributions provided by 
hardware vendors or companies like Wind River.

This adds quite a delay between a change being released in a Yocto 
stable release, and users actually using it.

When the distribution they are using is based on a thud release, new 
Yocto releases from that branch will only reach them when/if their 
distribution provider has updated and validated this change and made
a new release of the distribution.

Related, many of the Yocto user questions in various places tend to be 
for 2-3 year old Yocto releases. Often these sound like people just 
starting a new project with a distibution based on an old Yocto release.

> - armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


