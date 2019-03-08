Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3E8567C61E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 10:50:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44G45v71SSz82;
	Fri,  8 Mar 2019 11:50:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1552042229;
	bh=QlBszLw/KIqFoN5+5vqfjF3XZDWXWMSXi/0XpWfdVhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AXC1MxVVo5+WGv2GW4XT7m3s6iXIfxPry35bw+GfLL98TwZFdBE6ctIQAsE96/NK7
	86qnx0bAAkEaia8TePgZoZh6lsDUQQ/jaUeTMkBK5CoKTjKbUxy1NbhwwqP5zvR0Dw
	07eiOkcWJJhYMBSct+POZgCmKIcTvuPCC2DMCKgIGXF17qLWArh0a75BN5MQGlVXBO
	5VlAkP90GqVb50s3IEiMfo8fa3jbOacvbGlVQHUX4MD5fwap3JGDxTrGY0abmBojcl
	xiiBkdAUTrkeDBjpJkaQ7E9WsjgeWb1oJxp286NmZfQ3VYV5YjEhFgysCK+n3w7TaA
	oT7F8bGVFRivOfwxihEExzBOfMe9YpJICZZG+RZN9h1Ao6c/BYfxIje2+s5tS0LNMe
	R2AxIr6XNrfl7fOfWzzxnfqtJzzmd6JECN6rq1/UlB8IEUxCDpNK+5+1iuliB1AOUd
	nGVz/IO6kIdjVKtmuglMqVUT/2wpzD/wlWFe+jkvOwj6w572M7A3yR8cXw5MeD0+yf
	ukAF4iSMSgGv8spX8KnBZihifquK+0bp6MUg9pITqQN1E2/h3g+lKCppNIhf3A5R6c
	lFRZj6WAVohf05y8dPriSis6HBtjsa81Lh5nIxyVNGP5x8GkWoWmisRyoucek9GFeL
	jjAsModoWLMSlcQUpqwXue2E=
Date: Fri, 8 Mar 2019 12:50:23 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190308105023.GA3056@localhost>
References: <20190307142709.12076-1-bunk@stusta.de>
	<CAMjhiJg_2+jdiJaiWHumQ2oXc80apXhJ3RaiGnsWM4_-2QOMRg@mail.gmail.com>
	<20190307151827.GA16556@localhost>
	<2dae498718e3aea65b65efe9fded89bcbbeae4bf.camel@andred.net>
	<87265d8970131474709a4589cdef7015fa72b87a.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <87265d8970131474709a4589cdef7015fa72b87a.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH] systemd: RDEPENDS on util-linux-umount
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
X-List-Received-Date: Fri, 08 Mar 2019 10:50:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 07, 2019 at 09:48:02PM +0000, Richard Purdie wrote:
> 
> Going from memory I think there were some responses saying we should
> probably add this patch regardless since we already needed util-linux-
> mount. I didn't think it was a huge issue since mount was already there
> and it seemed to solve some problems others were having.
> 
> I don't have a strong preference either way, we just need a general
> consensus about what to do...

The general problem seems to be that systemd upstream does not care much 
whether busybox versions of commands work with systemd.

This creates a conflict between upstream recommendations and aiming at a 
tiny system when using systemd.

The latter would require a continuous effort from someone at OE/Yocto to 
ensure that the runtime dependencies of systemd are small but working.

> Cheers,
> 
> Richard

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


