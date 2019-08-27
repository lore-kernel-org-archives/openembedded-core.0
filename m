Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id A0B317DD70
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 18:04:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Hxbm3jTxz3J;
	Tue, 27 Aug 2019 20:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566929092;
	bh=4YTk66JFetiYJ2A3/V+ifYaZZrR4V4RVYbbbs7hWEns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kw7BwT8bmNqggldi6jrP8F0pGs5FY14IiN/4IhMGuVXbu7PRfbXEA3bq75aqyAEJ7
	cEQBNdB5U2hxhFuL0q8fDqmXuhQQjU0PBhzce1Mz4NpfzF1HUOUP7FMfmS+lzNLAJy
	wRZo+gxytDfn92rd/HVuZjOh+NmHJlq/pRsXjxci/vzKg3HnKFgkHyAXvmmMsj10zm
	cA80iCXml1VjH13RPgdN21rd/z8dzuJmWIZvXNNNC8lCGj97kA6w6CbUc1LSM4Qi2i
	2tVOwDnOrOR3gqs493SLeownhBAPkeUx1D/cRbNsBzFmGeX8eMsYbPimnxWae9Q/nz
	64lBC2Wt5etZiQFLiBBqOERpVvs71d3nbJOZbatDo6nm2FPdjsjoDuQE/IT1eC/mKC
	AUGtcmHzOUE7TLKwFBqpwQMiP21/EqYWIycu1WkYx0ajIl+nk2G2S+DfF+TolRDqIe
	4BWIhSNfXD4AzOIfaKwYWbFkt6Xu2CH7dUg//EwiMF02ayJYNImdPGmuE7Sg4eKN2Z
	fHxDwMB6QRlyFv9fdi4sjCisq2OH+K7GYzoMpM3n4PSGrKH5HInFJJh/a/Db+r7BZz
	5aLrj7TRBme0U7urWmTf4CX8LGZRN5QuiXEtb4s1Jne5rtaX0cy3rF0zXFLRZOw5BV
	60LDZyT2v0D1Qopdjm86xaxs=
Date: Tue, 27 Aug 2019 21:04:49 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190827180449.GA29638@localhost>
References: <20190816194405.12751-1-wesley.lindauer@gmail.com>
	<20190816194405.12751-6-wesley.lindauer@gmail.com>
	<CAMKF1sruqPBcwobNNErkdHKAnP7zT8zda81O2FUP88u=5ZnmVg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sruqPBcwobNNErkdHKAnP7zT8zda81O2FUP88u=5ZnmVg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] xz: Remove GPLv3 license checksum
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
X-List-Received-Date: Tue, 27 Aug 2019 18:04:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Aug 16, 2019 at 01:50:14PM -0700, Khem Raj wrote:
> On Fri, Aug 16, 2019 at 12:46 PM Wes Lindauer <wesley.lindauer@gmail.com> wrote:
> >
> > Although xz has some files that are GPLv3 licensed, none of them get
> > packaged up, and therefore none of it ends up in the final rootfs. Since
> > there is no GPLv3 code in the final image, we don't want to include it
> > when we collect licenses, as that would give the incorrect impression
> > that the image contains GPLv3 code.
> 
> We will be distributing this in src packages though. Maybe these files
> should be deleted before the build even starts.

OE does licence tracking on binary packages, not on source packages.

There are recipes that build binary packages with different licences 
from the same sources.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


