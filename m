Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0169A7F7B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 11:13:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 478142146vzF2;
	Thu,  7 Nov 2019 12:13:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573125218;
	bh=mFw/+2d+1hVnbk45gX2ZC6zscrY/mCkdZNkVn9r86UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HP7xiuL/HXWXY8OaHdChgvTt7QIz1VKPljEq00hQUNpNPrdDx+h5XCEs8VbAk/kgh
	mKKZNn2oM7GPCA8P9rd/TDYW2h3ocKiFscQF5RuwDdoLlhRWwKGAedtmZGtg9dsEEL
	tStRTHtewd9BCxSW/AfSnaETd3AMik5rivrFrGp58KdOGHDxNale4vJHCqPx1ATqNK
	PqxxCsdy8AwJEvtGQxLi2VJ+IaC5PKAbKkF7hiVJBsiV/o1yU9/h5xCVbt3UCwpl6e
	ePbBGKOYO6iRFvolZRC+BbdwmO3KIlHPPHcJrpzdXdjKEFdXrJVITK8nbNzw8L6u7R
	jsuVZHNOgoiWdw7nNlOMyVPW+4Ifl+2V2vZx2OwDpjH28zMKUlW+uSFJj4cwAj+MCM
	ljCl/3jf+ePDEUSwtDKq/XQxdzk4xyH+vXX0HK7kCpknjYpIgXoFz0VYv2rK3U2UWa
	+acxqH9JGM3/gnaePYE4LI8pkjauJ5hX/oYFsRuXSlNPX3EYFj8l2Z3qoTTjdkivrV
	ekOm25CIvV4AEKwaelnQl46iDshO+4kEJEVLagJQjiGiDhYHaUGHCZNzL667gsU5bw
	NcFqn+26EOCa502pufSSRr9XsT8kUYnxGOvSxZqnEzBsyjgTbBA9/6WQdnGXHHT2kW
	ljlTIQTWtl7WDXXkox4gaPmg=
Date: Thu, 7 Nov 2019 13:13:32 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Message-ID: <20191107111332.GA23775@localhost>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
MIME-Version: 1.0
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH RFC CFH][sumo 00/47] CVE check backport
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
X-List-Received-Date: Thu, 07 Nov 2019 11:13:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 06, 2019 at 05:37:15PM +0200, Mikko Rapeli wrote:
> Hi,

Hi Mikko,

>...
> I use sumo and due to various reasons like BSP layers, binary
> compatibility, contracts etc can't update to newer release
> or to master branch. I suspect I'm not alone.

I might end up with similar reasons, but for warrior.
And might end up doing similar longer term updates for warrior.
(not yet 100% certain)

>...
> The tooling will expose that sumo is severely lacking in security
> patches, but the tooling is a start for anyone interested, like me,
> to fill the gaps and publish patches for bitbake recipes we care
> about.
>...

Thud is officially still community maintained, as long as this is true
the point could be made that everything that gets fixed in sumo should
also get fixed in thud.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


