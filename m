Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C96407DE96
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 20:01:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44znRV3V5Pz4q;
	Wed,  8 May 2019 22:01:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557345686;
	bh=GGFeUG9vpvHpMDgB6Cqfq4jFh05k0AySpWviBTTNkQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PMw2jmsslmbn+yqNYBtCWoViebZZmgx+zOtMQ1dst+j3k6Npyw/Wd3fGRNtSllwg2
	/fhhsnJEBTL1Jg/MemKcKeAz/YFrf7ToXi07s38PuawUF+BP7Hqdc/A6//NxUqvKPt
	QgWkqeGqLoUO/5Ky7lIFheIalM6cHO58HsAruxhgHEAVtRUqPoHe70I3T3AcJoK9nL
	+jRQjIn0w7DNx/fI3ek6/+q4yQq+sKl7PvIQHNAaSC7Cqfgz1PKZDMFSgRfBbc1aDe
	s6rkanm1HrduWNxwnwEcPIPNGMBlA0FzKSoWTBmlAWAaJTCucIM+268DtTx9U9KdCd
	/GoA4Vx/EdclEwbFpylyiy+RvD+Aqg3CdJxQJlR9W2EmyHEZAkMt1Bx2dO8wSeW4jB
	JtfCzS7KAi5Iuect3QB8uE36v2SnPMozCUQsb61KYdV8G+tyhP5B/nNcWj1fQfNB39
	4wS3lf6TNYC0yMhEp+4wNcd66WF9fawiCI09OkPFn09oHG67y9j9lOPUfDDNGdNQBA
	u7UB6dreS+OFHQJi9m6Wrtg8iE12QsCtN40Pc9cON18ULqzNeUtgJ95UMuLJ8vxB77
	vBM4qug88VdZTWlRS2l4QSCDx83kKC9Z+Ua+S6A0YPAi0m3ln6tIkKYIiGF7AmIzql
	i9zoGxynaltycXOgEw544DVg=
Date: Wed, 8 May 2019 23:01:24 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190508200124.GB18736@localhost>
References: <20190507131151.31070-8-bunk@stusta.de>
	<CANNYZj92pV-EiG8Af2cvhtNUScBBR8-wE96kzRJFQzYKMhrPgg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj92pV-EiG8Af2cvhtNUScBBR8-wE96kzRJFQzYKMhrPgg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sysstat: inherit upstream-version-is-even
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
X-List-Received-Date: Wed, 08 May 2019 20:01:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 07, 2019 at 03:54:38PM +0200, Alexander Kanavin wrote:
> You need to remove UPSTREAM_CHECK_REGEX from the recipe at the same time.

Thanks, I'll send a v2.

> Alex

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


