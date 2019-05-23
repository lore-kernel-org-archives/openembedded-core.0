Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D37A37E452
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 16:06:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 458vX103gJz4f;
	Thu, 23 May 2019 18:06:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558627617;
	bh=cOISFFhThM+H9gNZBtK/bRuG+EgmPYWiMxAKv8sApwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NmmkWlBLF2yaeoE0rfZdZ6klciojf/nIRJCvDPFy0HYh2RR+BHjSaIQM6NwMmv/YL
	qktuRtwS2NCyH0rxsQ/GA3Inp8toFMJSTciqdwJLZxJkQQ/p62vjCU0Ii12d4iXGhC
	/qzj+Q3/nHfobCkrnAt6DBcB3BLnxuzO0x3gDWEXV9A51ERa3D+kvITm0fefJ6yQx5
	Ta+NgIU9YhKHdVIGRym9WQ5Q4SMZJ8wnUQRs9nh48wpc2UKYrcwUwSRe3iWHK7aLnr
	+JyIQcqK+l/fPbcDlVbtNrAiOEqZkG2lgjnKHYjZf4TLP+H8b1fnLcj4gxIPXdPyGj
	n12zGyjgZbtd0xVVCQ4rCyJfJdKSavvgBtoO4QN8L7cCI5I2q54hkW822CfAz0nrZk
	BupDTEQkB1W6w0V/MsA2ZTtCSLp2wR5l8/8l7oH2Z9WJa1dCopmZbRjU0FbS1wHjDE
	V/5ZJoKs1+L2zofGuII1f4d+1fDTVxy2G8fLH6udDTj6fwjZBFV7CAJonIHxyMN3Ot
	MyVLySQrMDbG0L49TBrm6hY8nItoEH3Jz0gS2YyttAbY5bKaGHres43GRz4wmttnl1
	HTsVM0FKxcJHb382yBbxhz/02BBNSPNVifNdz57A6Q9v2WHSY8ET/P0UDnZOs6ismD
	7anVjYxbrLNSNEViSDuKFwdc=
Date: Thu, 23 May 2019 19:06:54 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190523160654.GC3348@localhost>
References: <20190523145819.23329-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190523145819.23329-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "musl: Add TEMP_FAILURE_RETRY from glibc"
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
X-List-Received-Date: Thu, 23 May 2019 16:06:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 23, 2019 at 07:58:19AM -0700, Khem Raj wrote:
>...
> Secondly, musl and glibc are under different licenses and importing
> code from one to other could taint it.
>...

How many LOC are considered the legal limit in OE for that?

Many of the musl support patches (e.g. [1]) contain more LOC from glibc 
headers,[2] so if these are considered a problem there might be more
legal review ahead.

cu
Adrian

[1] meta/recipes-extended/pam/libpam/0001-Add-support-for-defining-missing-funcitonality.patch
[2] https://sourceware.org/git/?p=glibc.git;a=blame;f=string/string.h;hb=0a54e4010fe0085cd36deaff9442a7e88de3270d#l131

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


