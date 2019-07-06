Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2C86BE2A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2019 10:01:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45gnKq3FQwz6b;
	Sat,  6 Jul 2019 12:01:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562407279;
	bh=bQzS/AIWAiJRRVX853SeAV0u10O3iEkyBzHw+bDjkFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eQ50qA27K7+dra7f/+7ufkw8V7YomICoIJJai91ixfy2kVJKpgx0nN/oBZb10S5+K
	EaMhx2AW1Ny1B6SLH9da1LzQ5JBGVG6Pjyc4ed1+Az7HbP8E/sh/z1CXSToefb5aUA
	R6EFMcJjx0j8Xr5dtSw+HsHE8/fU2tAH7GnyCvmPMKthRXR1RZh+WGwszpmlKuplVe
	BNJOIAd37YQKA+XLKGi9cFOeRtKxbeCv4s77vQx/HQgmLv75c66Wr/Yl1zRy/isT4I
	80/9FXwPfQ4M2rjYzXgvTb0ISyynPGIYAGxVHcVndA2nNUpHBic9T8yOdjjyRr9ZF7
	sMklmEezCGtJa3EIHbFM2T1OGbodxAlvrPyvliDrlE0dtVAYIjYFsT2cDzciyu0vdq
	rqLtPEY5maHFAliuw8x+E4i9rdG46wrVHmZ/4ddsfEKfF3JWpkPI0Cq8re8IevJ0IM
	he7ryRlB2szSj8y+eg8pxjeMX2zpXM6OEYtAhrOU1E4os0fElpzFznhcxdOeHeQB1y
	V62P6gxvePHIV6dHTWLAE++EU1UM1GUXPFm1Y4zJjfoI/zuNjZVsYKvJDaJHfIRD0y
	ic/ebU90m/pUwYu6iIrQ418e7ADiZvQmR3XTnNDN2SD84/1UyPiLmwNHDDKChNz3Rt
	sov60UroInr+L3MRipbRqh3M=
Date: Sat, 6 Jul 2019 13:01:17 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20190706100117.GB1877@localhost>
References: <20190705162018.28251-1-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190705162018.28251-1-ross.burton@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/4] alsa-utils: disable tools using GTK+2
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
X-List-Received-Date: Sat, 06 Jul 2019 10:01:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

I was independently looking at GTK+2 removal recently,
and had the same changes in my list.

cu
Adrian

BTW: There is a typo in the README.LSB change.

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


