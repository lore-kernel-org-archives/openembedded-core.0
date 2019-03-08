Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D38797CE79
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 14:48:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44G9NB56Z3z3h;
	Fri,  8 Mar 2019 15:48:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1552056491;
	bh=lq8cSCeIN3YKllcJGgyfc+V+y926Ra8IDE4lLRyFld4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pCFnpq308oK7RCIAMOhivxuca354wHsYxd+/TvKUESv+M2l/cTD7S5ODboAM4iZ6u
	8FfsAxJN+mX1uxswwIOWoqaukGNyyn+gjyQogUAW+ExAhzQn3bOmzwQpCsGME++taa
	C0ojQxenCgFWBW6mB5veK7BOdetwl78xmsHXn/aJpOw3kmPbP8XvhdY4VvFIBFfMwQ
	T8t+sTEKmTLBWdVkwn6sHLd3TwQSOL/LUlURJcQ3XQiMTZwlYjYlZROoqSsaTP7ePx
	rO2w+zoNKjIpNxmtVvKEbTThFWdCxdWnTWAh4BHTqWl10UM63yY5BiXvl06vc9lHod
	BTZ+5iYl9auJvrh0/yJ7cCxi3atJWviZPcqh5Ws6SlDlsZ4J0xd1z7VZCq+UFMVUMh
	atqHKHRMt4UfoOOIdjKSzFemPhC7C+lFfYR3VIQ5oOlNN8pJnvC+Su4N61HQuQGVkT
	QEKJqha6177CmZuIcR1eAqxlCRr0KajRnEYf9IPzrh5AJUsy6oURiuBXb/NMg5BFo6
	SmGWe1vBOq5qaDDzLoupKZo/rKhhZC+biu81nzGshBxqXWg9JGV4YIA+ABZR0NU5q/
	MHXI2iSPPXwknZxZlbicmQmGkab79UoHMshrkYJgdWJWa8yxLnp6SFllj1+yTjSZEY
	KF8BVRdiibzMvtywrZ8a/Ewo=
Date: Fri, 8 Mar 2019 16:48:08 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190308144808.GA22638@localhost>
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
	<ae97e09579b59253aec08f5b8118e739ec57c4de.1551889557.git.bruce.ashfield@gmail.com>
	<CAMKF1squopTO1P=cN2ky2pEeH_kGqkW-HxLj=nm4QsvBhv6Tqg@mail.gmail.com>
	<CAMKF1soy7Uh+kXRXgsya9+qwJxfjHpT0VW3+bBFCU76VoZ-YKw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soy7Uh+kXRXgsya9+qwJxfjHpT0VW3+bBFCU76VoZ-YKw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] linux-libc-headers: update to 5.x headers
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
X-List-Received-Date: Fri, 08 Mar 2019 14:48:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Mar 07, 2019 at 07:20:15AM -0800, Khem Raj wrote:
> another one I forgot
> https://errors.yoctoproject.org/Errors/Details/231924/

The two commits from
https://github.com/miniupnp/miniupnp/issues/346
should fix this (untested).

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


