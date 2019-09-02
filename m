Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C70F37D391
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2019 12:40:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46MV6G23wsz4V;
	Mon,  2 Sep 2019 14:40:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567428006;
	bh=RsgPKed7/3Hw8d/21fLkI68mTACiunOUIYxOc6Q7stE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DR8Dfc7nJ2IqHooSYYGD7hSD+2vovD1F42VE+JAifqcrl633fCsvZp/rtNgtWjQz8
	fh+8r6eLGxPFis0sf1PqwTlcIOszokzVXC0KoHJ4f/ci5Jqi2FPI4r7btUc3ZpeLJC
	puEDzCicOezlVRKtbo+RPtUAYzFecN4MbBKwDwANGc4ibFTvmuVFbmSmlQLPvoTa71
	BYKDBzvceT3Eq1EaFgf72cDZ3wJTguEsc0Z8p1meUihLR5z4kWvfBopcLShpYM3WEc
	CGmN2eF48Txo/q2eCBwboVCB/EzQLXmCkPHH5y0kRDcZOicoLhaeqvlct3gZbl0eG/
	WdcxSYc/kdS3peWYh4zfKNDXN8OOEM1exX7ToNme0im9oDXDYvHwykKn/1vQ1cz1eF
	zCl6G+RGP5umwwbURQi+YaP3zVMoKCUP4pmq3it1gu8llRgO2ecXgI6zS1mdrwsHZs
	Gq9YnOh+w+sjDLDgNlop160j2o54niJYBcILszGTh9idMvhg1K+qRcg+pebHIIg0qc
	Sq48O7KkeEuTYh5LxjgCrd4Yvmu2TfHrj9/Pq2L4ZHjMQYHDcmEqxYLM7olO1AouU9
	6/QC61oyxwksvwgnGb8WNMey2owrS9e1HD+GPicICaBn8eMqKtLWfX9QKCiFVu8eh5
	z4jo25BSdTfIRxJ2ykFjavZs=
Date: Mon, 2 Sep 2019 15:40:03 +0300
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20190902124003.GA8291@localhost>
References: <20190831211549.23729-1-akuster808@gmail.com>
	<20190901140542.GA11574@localhost>
	<9b09243d-86b7-b358-e0be-c41f8acbcd47@gmail.com>
MIME-Version: 1.0
In-Reply-To: <9b09243d-86b7-b358-e0be-c41f8acbcd47@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc-9.2: Security fix for CVE-2019-14250
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
X-List-Received-Date: Mon, 02 Sep 2019 12:40:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Sep 01, 2019 at 10:07:13AM -0700, akuster808 wrote:
> 
> 
> On 9/1/19 7:05 AM, Adrian Bunk wrote:
> > thud and zeus are providing 2 gcc versions each that need fixing.
> That is a true statement. What are you expecting?

The other versions also being fixed?

gcc-8 being fixed in warrior before it gets fixed in master would be
the wrong order, and would introduce a security regression in master.

The code should be nearly identical in warrior and master, so fixing
this also in gcc-8 in master should be trivial.

Fixing gcc-7 in thud would be a bonus.

> - armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


