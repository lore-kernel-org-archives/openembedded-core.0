Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3787E3A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 11:15:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45F4kG0Qj5z43;
	Thu, 30 May 2019 13:15:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559214918;
	bh=Uhzq2IomrMt7NYozuvb2ylbZjlLYUvLnSjHngHYvk2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AWEojOzX3TJD0hZqqslncZjjKHLu/EB9n32pUqXNoSOiVDbRLWQFkKGVnwtxOtR9M
	OfI61U5aZuGTWgegySpdVQdH3EKhHKuzaRbqoAdzsVG4rp6SVAdvz2Zo/YPaU2h1pU
	tCHC3pOPquVAD1mZC3LpDy6146G3+hFBSIT46o2t+2nCEDYshBv1zwc0uoDD1Yb/F9
	96BK7QIWL9YnJ5frCX+hfJSVY43nRiA3sfP3gOXiTsLbKNh+klNFwoIkDlgQFSLe53
	3E0CtD5ctQfm7Lhb6UQH6nkmGd7Pyh2YBQvt3WmMOW6vWA+QdbOwEjSixwKz6Oe7uE
	d+eo1femQ+wUvQCRyXvzrCFA5FJJP6xF1da1aZv9dMGwtpKXoSqSmg5aGfdVzohlf/
	LGXI37hIk/qtUb8CTwtvAnse7FDrZMqTOk/i921I/mrRwCdtF0eCwL0WC/2hdeCeba
	ujVJ/QvLF9uYaxtyOYyzyEOHadK9VOfqV2QvhDH5kIVRPsDX+h+5FugvySWSkqxeyR
	SQmVJV+rnPDHUGbXRBRmx+4zX37SBzTcX6vgmPaEvfF50J43zw+w357C+ps/fyVKSE
	rMVpF6LXVu430KBBUQPMaG+6upjhhL7Exc4IkVr2sqvtgld/ikXzpzsdy4tyZWH9OV
	o0wwRNnF9jvRavtMN5cHcTRE=
Date: Thu, 30 May 2019 14:15:15 +0300
From: Adrian Bunk <bunk@stusta.de>
To: changqing.li@windriver.com
Message-ID: <20190530111515.GB20599@localhost>
References: <1559194340-420777-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1559194340-420777-1-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2 V2] add rconflict for systemd/tiny-init
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
X-List-Received-Date: Thu, 30 May 2019 11:15:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 30, 2019 at 01:32:18PM +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> 
> Changqing Li (2):
>   tiny-init: add rconflicts
>   systemd: add rconflicts
>...

I wonder whether the conflicts between init systems could be handled with
    RCONFLICTS_${PN} = "${VIRTUAL-RUNTIME_init_manager}"

This would avoid the problem that all n init systems would need 
RCONFLICTS with all n-1 other init systems.

In my testing this seems to work with all supported package managers
(including the self-conflict not causing problems).

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


