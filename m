Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F32E57C1AD
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Mar 2019 07:11:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44BHXH11tZz5p;
	Sat,  2 Mar 2019 08:11:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551510703;
	bh=WAHMQWljnRROyP4YI2rjMjqGWlL92oSvZObQb4IZrFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ku3LLfNvEU95M/YT4zzloIu/qrm5NeoVqvh2Eud+9rKsxvbuUgO+4aTN9H4AvALZU
	lwsU0SyoqcT2ZAbC3JWZNDHBVpmR0H8lOxD29nOAQgykAuPKT5K1ezM6gLa7ypmimi
	j8RA9O4BAeH3wAl9FidebxkMFsCUKvxAbk3hOu41MYyO0xNGJHDECQcr1YDCtahHBl
	y5R+dwO0QLgEJ29bbxs0pHBzP5gOiQBqlfLsgnBx6Z0qDuOWOUjtgJYEQWuw3w0qrM
	a2mfY/5gpWUBl7dFGtvwyoYXnJ/JLs3mxtx9IdB2JHGCmYWJN1HxetAaUdxKrq8ggx
	1c3S/hYTFnPcWwhN+QjmoyKrQMNjczhEfkmusHCRtRyVOz0DX0DK9sznKoyVIv7y1n
	uUPvZl7B55xCUvMAWl8T6g3a39aRs47APYCFtU5wdcwOjMZCQ9wwO+g7MxB3botzBo
	SCM24telB5+yVXVkIdXSwXPjwe1WmFUvWenRym/9OrAtrAIk48kWrBa+ZuJQN9fWo/
	fIYdThRCOKmxiWdBb5HDvYZ0Ti0n2EvFIwC3A7srt4AlPyeeAoRmlSW9yd8ExTjTEC
	3nSv0IVq1Pe3EFvjK3kkp1MtGTaijNHPOfLN+wYXTtFhFHVy6p8l2bkKX+6FkL5IoM
	estcxwjL/6yL5V4R29zr1Lqg=
Date: Sat, 2 Mar 2019 09:11:40 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20190302071140.GA2151@localhost>
References: <1551479212-28944-1-git-send-email-trini@konsulko.com>
MIME-Version: 1.0
In-Reply-To: <1551479212-28944-1-git-send-email-trini@konsulko.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Introduce packagegroup-core-base-utils
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
X-List-Received-Date: Sat, 02 Mar 2019 07:11:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Mar 01, 2019 at 05:26:48PM -0500, Tom Rini wrote:
>...
> - busybox provides "nslookup" which at this point in time is an
>   anachronism. bind stopped shipping "nslookup" prior to oe-core replacing
>   the old monolithic layer.  We do provide host and dig and such via
>   bind-utils.
>...

I'd say this is a bug in bind-utils.

nslookup was was at some point deprecated by bind upstream,
but it was undeprecated 15 years ago.

> Tom

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


