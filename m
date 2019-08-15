Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 59A157F282
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 18:22:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 468ZYY2RYpz65;
	Thu, 15 Aug 2019 20:22:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565893345;
	bh=or+D2pXQ3yY2utFyxQuCWejOdmdlTkpyWoaKqguG8GQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B19QC5V/ChUC+T9JOiiek2xJTLBbKhNj6O4ErWrO6jo8SrEg0TwwcHod4Dsd2FQyY
	Vt3BupDrLb88fnp/iDqJ9soLvFZhyJzpNv3m59GpVuk/ubcOu5i9jLPb0JeX4BZA97
	u9y2mU2nduMLgilpNo90Sw10IsQqNbl7F501SO0KM6ESC/yPHE+zoMNcEzxXvII2rl
	1vF5qHDx7wjL9ilolbmukYjrfApy4EIZnbGxagPUgrMY2a3XL5zkJw8rkPgaOcbuu0
	TlUlce59V6omfcOVkUcQsftnpx/+o5eif1FTuD8Z/lYLr9qRWjINKvVJ2Lexcao2X/
	UTKkSygj72LrNXWWVtEI/AQyDb635kQ0M9h6DM38LzjvhJMceKCSZ+yTXSQoRinowz
	5poAVaanT497jnxoKuw+8xOwj7S2Y52r7sBw9VPf+yufW21V1+Dav/7H99tJdAw/tj
	5n8WET5O1yOSn0yKKVCrw+lyl61I49FH4RerVacB0lwVCzkMfzZ8XVfjHZpvMy4Exe
	lZvot+Os79WR3y1/cUfLbGzNUmEQqx2TvluOTuC6hzAActDsRajHc+vmFLF3lwY75G
	KBXS6aNZJ43YfZTktDzoChT0e8nclDgqMuBSbjQ3l1+No7Px8imsWhQa/EOFxm44tN
	9S/5lk7QBPq8sggHjYRWGJoY=
Date: Thu, 15 Aug 2019 21:22:22 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190815182222.GA15416@localhost>
References: <20190815071713.14503-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190815071713.14503-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-9: Upgrade to 9.2
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
X-List-Received-Date: Thu, 15 Aug 2019 18:22:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Aug 15, 2019 at 12:17:13AM -0700, Khem Raj wrote:
>...
>  create mode 100644 meta/recipes-devtools/gcc/gcc-9.2/0006-gcc-disable-MASK_RELAX_PIC_CALLS-bit.patch
>...

That would be a partial revert of a change in master.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


