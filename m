Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id C2F487C803
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 09:25:36 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id i15so4345226vsd.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 01:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3eRdSk+FacZWz1MAqSPFMR5DdIulPwF0WUQ1AVnYP4I=;
	b=dnKkhMoYG4FoVjdHbIufzEy9GBlBgdIJ3nW/L3e4izirzp8Lk1BBVlqyupxppZsXG6
	ibCbq2QV+HKMhNqjZGLEMFkFFIUDJP9bOudp68SlKvJqt+/Cq74Zoa4/cQtKbc7g1+ex
	hTa4HWCeEWBrE+/gwl0NSuSTVK/7HkC5lQhT1CGi4XNE9/sVABy6yItt2jDhrHrPCvt0
	FDr5qksv9T4AjxefWzEUi6x476JCFy1xMGkVr9Xw6qPWTSZHaJ7VlyF1A1phbcVqZ87h
	QP8sm8vL2M+M2rhs4xSMV/DPnwCbMzjTlAKO6R1i9+/9yG9KbA635GG5xE1QbZvjUlWZ
	9lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3eRdSk+FacZWz1MAqSPFMR5DdIulPwF0WUQ1AVnYP4I=;
	b=jRgiqokwhDUI1XvzzpBEO4QlFe5sBQp8ujjTkQ5ghTOUkUWf2ZOdDAeGespuYzLpV/
	Vm5QWGHrOgRHz0p17vRrQKl7dydZ3QkBcdw1rOhO76qwe6dBxrDXlfRoFStOsPSkQnzQ
	ST9yvyoRZIfp2s+zqIrIuHBnDbXkmgmFCLIbcjjhNSTd9hOBPa31Na/58cs3bKTiKkTX
	IJ3OalkEKmhsOBJ0wb+KLCfS5w/2APbryXgWrF+cyXKMSkp6N82q7JUIvEB45ZOo16Pg
	7/ZYekEOwMtctFvSNSPEL2tQUjzBve9rJUn+snR5tqqDb5QUsoV6WdfGsR5uo12+rIJ5
	hdxA==
X-Gm-Message-State: AHQUAuZmKocCjMBLT0con1p/nUKUpM55rbOmKyQ6VyBYXSNqfLV+d1vb
	oGFvIT+0HEjvqL17UCNVNtt/lBEk1X5o1q16XTPQUvaWJftCuA==
X-Google-Smtp-Source: AHgI3IaDZmHgkwTuX56oMdMU2ovkVFpaiaHvxo3yAA3IO7dPVSXZwPM14fxIc/c85YESUR6VlfZH6TRJzeNujvLBwKw=
X-Received: by 2002:a67:f90e:: with SMTP id t14mr750673vsq.181.1550309137542; 
	Sat, 16 Feb 2019 01:25:37 -0800 (PST)
MIME-Version: 1.0
References: <1550178589-15839-1-git-send-email-alex.kiernan@gmail.com>
	<76d71f8af98a4ebe6154ff5b7ebb59ccf989408b.camel@linuxfoundation.org>
In-Reply-To: <76d71f8af98a4ebe6154ff5b7ebb59ccf989408b.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 16 Feb 2019 09:25:26 +0000
Message-ID: <CAO5Uq5R=cFd3h4QLmF_b=5iJORG2C2Zo3BXwtDL2MkR+PfucCA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bmap-tools: update from 3.4 to 3.5
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
X-List-Received-Date: Sat, 16 Feb 2019 09:25:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 15, 2019 at 11:16 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-02-14 at 21:09 +0000, Alex Kiernan wrote:
> > bmap-tools 3.5 was released August 2018 but has no release tarball,
> > so
> > switch to using the git fetcher. Also pull in the fix for
> > StopIteration
> > being transformed into RuntimeError for Python 3.7.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>
> Unfortunately this triggers a selftest failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/236
>
> (ignore the virtgl piece, that is something else)
>
> oe-selftest -r wic.Wic2.test_bmap_short
> and
> oe-selftest -r wic.Wic2.test_bmap_long
>
> should reproduce. Might be as simple as a missing RDEPENDS.
>

Looks like it's gained a dependency on six. And thanks for the
reproducing steps - I've never got to grips with that stuff before.

That said I'm struggling to get the tests to actually pass. I've added
in python3-six to RDEPENDS, but it still fails with
`ModuleNotFoundError: No module named 'six'`?

-- 
Alex Kiernan

