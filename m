Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 49EDA7D1E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 12:33:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46T1Wx2CJMz5c;
	Wed, 11 Sep 2019 14:33:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568205181;
	bh=MwqG3OHX1C0KlLkAud1/3Lszd/kBYJ5naQ5hZmBntEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rmqx5W1DYNrIIz6QlHBpIE692AZtZuE3Vvad1gx5Whvguz7qgtT2oIo8AzCxE6Y5W
	0AMJ02p4mrWLTW5yvcMwJdhrw+SnVSDqiAANOKu43hM64346MMXR1f0Ixz6u7334vy
	GD26z/nom/A9NpZkAi+EihR/6pNH6wB7WxPX3F3imI49ETJqLZZomzJ6Vty1FUQ27C
	eWiHTKN3KwHHtrjjcgCMRHnIL+fajwSLiOEWzV2tfWFqqt/I96huQ7ctjVZXfwZb0h
	gekmKG7y7gszdu288VT6n7F0L5T0sRsIajMUvWbNzt6Wr4PcBbzZ4CN6JTgaaLaMSm
	/+Yj77dR+rvm8rS96OrKXBh89wS5DcGp0dpQskYZRdRhKL1G6BEUuAtiQ+QdCEPmEp
	5FMHZRyRxtkjcNxk0/cARKI/Mxe+z4mxxSxWuaUjUd5tdaDWtRwP3pXSmh8ORQDk70
	aNeGtU2TyzmjgSUQnpqQcrkTKOCFkgtVle23Qc87yRsmEULcVTcfgwpGN1yei1xzAn
	HJkc2NWtxa7a6n8r2Tqwf/YOprfLNSU7B05cym5/jq4gK7d7G5Z/rbQZhPi6l9Id4C
	8MDHcIdvP5btqwxUuUDhwQCUhBfoffSlp28mX3DOwvDf9CNm98PluXYQzTm7u1trcK
	MpNkrOIvCEzj8kmRzXdL3uwM=
Date: Wed, 11 Sep 2019 15:32:58 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Message-ID: <20190911123258.GA27961@localhost>
References: <20190910214136.22971-1-Randy.MacLeod@windriver.com>
	<20190910214136.22971-4-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190910214136.22971-4-Randy.MacLeod@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [v2 4/4] valgrind: disable 256 ptests for aarch64
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
X-List-Received-Date: Wed, 11 Sep 2019 12:33:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Sep 10, 2019 at 05:41:36PM -0400, Randy MacLeod wrote:
> On qemuarm64 systems, about half of the valgrind tests fail and
> often result in defunct processes, eg:
>    root       819   818 25 00:12 pts/0    00:01:52 /usr/bin/valgrind --command-line-only=yes --memcheck:leak-check=no --tool=memcheck -q --track-origins=
>    root       861   420  0 00:13 pts/0    00:00:00 [sh] <defunct>
> Eventually these processes use so much memory that the
> out of memory killer runs.
> 
> Hide the tests that fail as a horrid work-around until the
> root cause has been resolved since this at least allows the
> ptest run to complete.
>...

I can reproduce this on hardware, and I have the bad feeling that noone
will work on resolving the root cause if this is workarounded in ptest.

IMHO this should instead be listed as M3 blocker,
similar to "strace ptest timeout".

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


