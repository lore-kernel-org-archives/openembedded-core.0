Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7547760AFA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 20:58:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48Q0zL6DBDz3l;
	Sat, 22 Feb 2020 21:58:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582405103;
	bh=m1+ZiQfVd7AoRLKp0CUG8BYzoM1XnsOfn8QBRA25jgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A9j1J1iW7Uub9GdUYB0LbHprWc1Qpm6te4dAYLHIjM+bvmfg/PXesD+e38fKNeMPY
	n7G9apABTfdwcCYqUAbSIFPv54LQ1ZyZbUbKp9auvp3Z9XT9UAquD9zEP5mctqDwSn
	dNzgTr+/V2+VcMS12UBQ7uMhR6jzM/KukB/bjUpsIqMoD0oErZBKTJdIlS/6l8dWDR
	Umi9YM/g/v1Z13g0Z16vgiaAtCRGN0hWGkm1bUf62B/1tXDcA2n2Rks38yXtcvvj/v
	Ls/ad6s02tWE+yxd5XLCecWhJlAu6DJ24acKk9nbs4SNMo1BGtuqC07XQS1+5B2AKj
	UGMOeqNkngLt+6ZVwtFUDlaUKl6UmBfdjB9glWQl8lNT9y7xWD0UKnMk4J9Ui7RM7Z
	ufra5e6bw8B5eGP/di7Rx1ZqRkLjEhESkbidiQnDJX1unZSrGV5wPtTpZCiGKrWTyY
	szEMxUGrQp4V4B8wHKZ5e8xAVUahIrRfgCOjMh5eT4faYV20bgi9xsh2kOZhKoixxI
	8XG+hWmjJAk8ex4tSOl41SReyzWCRkj6LhzZLATDMjWGSF7FmW+hGcI/+Q50NZKxKR
	pjYtLY/0XusPN/t76xn8psNeK5F616vgchYMtfNVX1MRQaoHWr5tMzsGJ/r4JRbKhN
	qSiseLB5l1IAfZzP/c/fu4tc=
Date: Sat, 22 Feb 2020 22:58:20 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20200222205820.GA9628@localhost>
References: <20200221205942.27168-1-bunk@stusta.de>
	<b0916411-11d3-d4f2-3d37-7a020a26375d@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b0916411-11d3-d4f2-3d37-7a020a26375d@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [zeus][PATCH] sqlite: fix numerous CVEs
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
X-List-Received-Date: Sat, 22 Feb 2020 20:58:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Feb 22, 2020 at 10:34:42AM -0800, akuster808 wrote:
> Adrian,
> 
> On 2/21/20 12:59 PM, Adrian Bunk wrote:
> > From: Ross Burton <ross.burton@intel.com>
> >
> > Fix the following CVEs:
> >
> > - CVE-2019-19244
> > - CVE-2019-19880
> > - CVE-2019-19923
> > - CVE-2019-19924
> > - CVE-2019-19925
> > - CVE-2019-19926
> > - CVE-2019-19959
> > - CVE-2019-20218
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> 
> Thanks for backporting these changes. One question. The master commit
> f3ebf3f8dd0b4d144db451a8fcb352762f7fbd75
> <https://git.openembedded.org/openembedded-core/commit/meta/recipes-support/sqlite?id=f3ebf3f8dd0b4d144db451a8fcb352762f7fbd75>
> has merge conflicts

The patches are new files, so merge conflicts are impossbile on them
(they might not apply, but git does not even know that they are patches).

> and there is no mention in the commit message that
> you made any changes to get them to apply.
> 
> Did you have to fixup any of the patches?

No.

> Master and Zeus have different versions of sqlite.

Yes, changing SRC_URI in the correct file was the trivial change needed.

> - armin

cu
Adrian

