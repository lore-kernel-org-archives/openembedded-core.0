Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A905D7E2A9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 14:18:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 458F9H57b9z6p;
	Wed, 22 May 2019 16:18:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558534708;
	bh=cYdIGMyas4TWjZOgE0PJVkvJUMT35IZtYLMmeH+24Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RNSGm4lsTaffXQLDZt0dzzhw9fWUmxG76GYknCSlG4UqqMenVVPe3MjFGj/rljIHZ
	4RZiTB4spM5SRG+6kljI7VHldXQHhB69sqr3eyjc4rwX02mVB38Nap7MlxyJPbgDE1
	g9VkOWp0FVwNKQ16+Jc+txun8SHZhbdiF5CSqElA8W5pFalexYQho80KjPCYbDl2lO
	UZlPRNXturZmUlQJ3xk9esA76ZktJQqse3RS5QXQZg5kheGd9IXmmsdo9N1MUJzzTW
	tw6T+lpThGFk//saadXrnxswFSRrM4R7D887KMkwlSkJRLtiGMU71AKjJzRbu0txEi
	zY1jcIrw0O6yjsRGfLQCP535CRJxHPFQYuAc75xr3jvZNZj9SJt5jAEA+1QZihiZvZ
	gCJhDfAToqE+/31toTNeGPdzAWtXhsd1sMAQbIipS644baDueop+YcgQqYg04EiQEm
	UhDsl95F9NVxW1b+kfDWXnzBIGbz9lPGK/cyT3H/hG9+iuW9UalTFWG8ZNIHCWtaQr
	ZPqsscL44y1UklbVG5Q+4Jj7pwGsqHLPchXX+L84xdZXmcipQRHoeg1xsmguc8T9sY
	J8cbtMv2sBNE1ceogpEtTAUnMbCT0DsoIhdgvoEY5UKblAjXzSODkC/sp2FVISFJoS
	dbiulQ+TwS8UFgP7PHI2UW+Q=
Date: Wed, 22 May 2019 17:18:25 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190522141825.GA7379@localhost>
References: <cover.1558300553.git.just.another.mariano@gmail.com>
	<c7d776cebebd9bf2c28d43aad3fd911101283572.1558300553.git.just.another.mariano@gmail.com>
	<CA+chaQdu3hKa6ogM=9_iG1GS67YdrwoF=J2YWdh6RX3V1r7qbA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQdu3hKa6ogM=9_iG1GS67YdrwoF=J2YWdh6RX3V1r7qbA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] util-linux: Add missing ptest dependencies
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
X-List-Received-Date: Wed, 22 May 2019 14:18:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, May 22, 2019 at 01:03:37PM +0200, Martin Jansa wrote:
> This pulls bc to many images with busybox, causing busybox postinst to fail
> with:
> 
> update-alternatives: Error: not linking /usr/bin/bc to /bin/busybox.nosuid
> since /usr/bin/bc exists and is not a link

Are you enabling CONFIG_BC in your busybox config?
It is not enabled in meta/recipes-core/busybox/busybox/defconfig

> I'll check which busybox defconfig entry enables BC and send patch to use
> u-a for bc in ./meta/recipes-extended/bc/bc_1.07.1.bb
> 
> There already is:
> ALTERNATIVE_${PN} = "dc"
> ALTERNATIVE_PRIORITY = "100"
> but maybe dc is a typo.

bc and dc are two different binaries built from bc.

busybox used to only have dc, bc was added 6 months ago.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


