Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.5131.1626942148831957780
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 01:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id BF01EFF806;
	Thu, 22 Jul 2021 08:22:26 +0000 (UTC)
Date: Thu, 22 Jul 2021 10:22:26 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] binutils: Upgrade to 2.37 branch
Message-ID: <YPkqwl0OiCwPtuer@piout.net>
References: <20210721021108.1082410-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210721021108.1082410-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On 20/07/2021 19:11:08-0700, Khem Raj wrote:
> This izOs next/latest release branch for binutils
> Drop backports and CVE fixes which already are applied upstream
> 
> bfd_stdint.h has been removed in favor of using stdint.h
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> V2: Fixes SDK builds for mingw and glew build with GLES
> 

This didn't apply properly, I fixed it up, can you check
https://git.openembedded.org/openembedded-core-contrib/commit/?h=abelloni/master-next&id=efb06e3e03c750944bfa40314dae70c054bdaed4

It built fine and I have another build going right now.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
