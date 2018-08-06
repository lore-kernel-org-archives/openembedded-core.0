Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2CDF178ABE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 17:16:28 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id c15-v6so14727248qtp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 10:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r+5fMvB5P8HOUxJVQe5IlUa0t7FdMRY5qyDXMf8uT68=;
	b=THLQyL5EvpadY3tlN8JKDPxwAmxSIsVE0bR83NDBZuXEUBC4SExPV/CSfhlWYE1JI0
	jpfT5JLqdsLV4XDfvPBLFQ17QNTcwJuPbG1xl1MkdmLmhgSBfVvVDGX6WytdTEIdRiPJ
	lh9i6oUsq6p3c7Bv2eU3GZ4T3jfXPElG2+anpFfl19/DzEExUeV+WPx++6zlPvRiir27
	NULtpuZhYVsL99llNJpWK0x/tNwKpjfT1t/3vQaW5EL0EDsTTIpsXotTf7/+GLcIYrDI
	sHokRBWJvl1qgyEWY6aU7Yog5yJ6WS+Ty8iIwDULiyULcMRVIEQDL9OzWYUsbhZV7pDr
	oWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r+5fMvB5P8HOUxJVQe5IlUa0t7FdMRY5qyDXMf8uT68=;
	b=GSgKZUniab1F7w6cK7uSSZkraMOMapb0LKnSa9m58gUW3BRX0U76tsopEcyyMwbFAm
	9OLY6mMFSa84Kx64JvD9b9goMklQbw/he13ZmP96tsBnALelIbwWdRj7vTk0zJKarQKK
	MYdqV3uOrBa9lRsYQV/swjlU+iBGGybTtdK3JzX5ik7dHfUSELu1cj9byUGTBp3Vje3V
	9/0g7612F2wMXHABo7LRtTTN76GFDkIxbdx+Jb19PBLgLoevGhWwWW7vLjd+m/HmOT66
	kqQ34vjxnP+CqyG+8TDASOGalAMTzVcQ8lvYzsjiq81wteyzEu0Dm3puZ4Iw1Uri0hXU
	DLgQ==
X-Gm-Message-State: AOUpUlGMJs5E6SaSEPSr/MzWM6YYYm28t1OQfOg7q4vFyqDW0+UMap4+
	8fH8o23QFGbjWkZAtCjQ1A/FLLpu3YQitnl0Zls=
X-Google-Smtp-Source: AAOMgpeZR1ZogLYUQck32y7dCUDsVP20sa5B1wY68u0wWfKE4scF1udcpnuKbav3pn6TbWYYqzHZ5mp2I/tphaPnmiU=
X-Received: by 2002:a0c:9692:: with SMTP id
	a18-v6mr13912854qvd.16.1533575788903; 
	Mon, 06 Aug 2018 10:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20180805195531.14449-1-raj.khem@gmail.com>
	<CAJTo0LZxCmBsX3VE6Pg1pYGbp6ujyM4GASTqqcP-RZr_iMmFFA@mail.gmail.com>
In-Reply-To: <CAJTo0LZxCmBsX3VE6Pg1pYGbp6ujyM4GASTqqcP-RZr_iMmFFA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Aug 2018 10:16:02 -0700
Message-ID: <CAMKF1soeic9nsiZouB+kxV+7LgVcu6zMNE-JQDuvuYSK+jpJbQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] strace: Fix build with glibc 2.28
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
X-List-Received-Date: Mon, 06 Aug 2018 17:16:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 6, 2018 at 2:40 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On 5 August 2018 at 20:55, Khem Raj <raj.khem@gmail.com> wrote:
> > +++ b/meta/recipes-devtools/strace/strace/0001-tests-fix-build-with-fresh-glibc.patch
> > @@ -0,0 +1,41 @@
> > +From bba1b0085f2a2c83839647fee48628ee054aceb7 Mon Sep 17 00:00:00 2001
> > +From: "Dmitry V. Levin" <ldv@altlinux.org>
> > +Date: Sun, 15 Jul 2018 22:14:29 +0000
> > +Subject: [PATCH] tests: fix build with fresh glibc
> > +
> > +Workaround additional incompatibility between <sys/stat.h> and
> > +<asm/stat.h> introduced by glibc-2.27.9000-566-gfd70af4.
> > +
> > +* tests/xstatx.c (statx, statx_timestamp): Redefine before the inclusion
> > +of <sys/stat.h> to avoid conflicts between definitions provided by the
> > +linux kernel headers and the GNU libc.
> > +---
> > +Upstream-Status: Backport [https://gitlab.com/strace/strace/commit/3dbffb7]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Hopefully these patches don't last long but if you put the SOB/US
> above the scissors then devtool's refresh won't delete them.
>

depends on how quickly a new strace release is made available. I have pushed the
updated patch meanwhile

> Ross

