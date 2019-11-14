Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 622DA6C4D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 12:51:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47DLvD16CkzT3;
	Thu, 14 Nov 2019 13:51:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573735864;
	bh=CnhmMH8LAqY1SvEiKvDm5ReVKsmlhdHuDXeCGiLTNCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XY7uoVRyf9iXwWpsYMmN3n+ZxnPC3X7s+lGGyOz6RTzfWn8YB3osJDBeixB0+P8HF
	UOOi+TsB6ZyMkN8f1ScCimuh52nQPlFbRR4EO353nWHiSgF2CdZRbcHUlPP7HC2Mf2
	ClWnE3uj12eIVu88ZCs2ikoBn5sclF5aDIDTnaPUvHg3N1Atb86uuJebEH3fWM1Go+
	mAfrk8UmWyr9N9Jo4ee+aK1LyvEUK1t/4ai/Zwy7FClrzHaM4P3KjudpxH0YdGyjum
	3OK3vcgjfxwVZhLszSizbBdmqCp+IbVpFVH65tycVJAZeEOdmXdgZ00coilfuAa1gc
	q+foknYc2q65OJF/2SJLsSgYtCmA8rb7sH1g+1oY7fsChSS5GElH7BYQHQUCato8xj
	VEbeY97wqsMnB2YkyV9EAxGWnrFBEzPWQ84+CUNvzcGskozu0pmL+eNXRXxV1BDDmK
	JO1H0/+xpabEPihwVpRH7r7ezYunwheyqQYt5foc25m/NmQD70fIsK4adB7OT9SK6r
	kFnjne17ac5tQiuU0vc7MMJWLpP8S6xLfOIA1Fxonly06Lm4IqRXBMumBqSFs0HHvN
	rxTViHBQFVj/x7bPkBljR4eT7kJrCr/jpoR1TilHRsOCf1isX4aP9Pt7hre2knJf0v
	ggv07bz+78W4chSLJ1uoBKT8=
Date: Thu, 14 Nov 2019 14:51:01 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20191114125101.GB13971@localhost>
References: <20191113081914.28778-1-bunk@stusta.de>
	<02d2657c-0beb-eeb1-ca00-3add30515f9c@intel.com>
MIME-Version: 1.0
In-Reply-To: <02d2657c-0beb-eeb1-ca00-3add30515f9c@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: Whitelist CVE-2019-6470
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
X-List-Received-Date: Thu, 14 Nov 2019 12:51:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Nov 14, 2019 at 12:04:40PM +0000, Ross Burton wrote:
> On 13/11/2019 08:19, Adrian Bunk wrote:
> > +# Affects: Builds of dhcpd versions prior to version 4.4.1 when using BIND versions 9.11.2 or later
> > +CVE_CHECK_WHITELIST += "CVE-2019-6470"
> 
> Can you be a bit more explicit about why this is whitelisted?

Something like
  BIND >= 9.11.2 need dhcpd >= 4.4.1, don't report it here since
  dhcpd is already recent enough.
?

> Ross

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


