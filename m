Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id BB05A6BBEA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 19:47:27 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id m62so3741724ith.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 11:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=abLELzvpt35yuuDrPY9P1rwInXsA4vKVA2oZ9QUplQA=;
	b=CLFu/EvTzM5qGNYtbK+ybNPb/+zf44HczSZirbSUDlID6TZ52lBvgfXPxVdbAMHcDP
	RA9em3dP2iF/SM8o7UGqx8uEBI1CJJrTUBNE/MKzlMO2vdlZpT48XmwqGMyEcJBnZ3lz
	3Zt7J4KiLNix7XAisZ6LLsWjMwdK6RtRhMSSZIrNaeD3W9SXNeYy0dWlG6KMn0N26hDQ
	t4QZMFbgbA2YSEVa+zXcVtnmThykJOYqtegV+czXi1lu3GizjUaOBj1q9pBi75L/ipw4
	iePKooTEDuP7+PqJpFbqyC2PEhQzu6x7eAxsR68I43ivwVFuYcLnxvajHAvakFw2VKNi
	ECYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=abLELzvpt35yuuDrPY9P1rwInXsA4vKVA2oZ9QUplQA=;
	b=BYsYEM3sDCyiHmcfWYny9LBMmz6ZSopeqQqc6gSF9/bfcWJwYUDuf3UfMp+s3HPLFm
	pBdgv7PC2fkv1YF+kzMVZPqA4mmGHd17dgO8PQRB0ZISf9o7fTV+T13RLsWllGzi6Nx4
	Jk43slFVxh05N6Hwr4l1PcOciebfuLbJEgiQFCJEg9jWkT4bJlhyadIkpxC0YmSa8uiq
	Ww/fl5L46M81vUBLd1TYm4nvqwdMwww7yLOG3OB8xKnaNuOQ5+aXRYmS2wYOOFJe2wVd
	zG2KSzzfx70BXDngaxoHSHS2xWTnkQk6z8IlnVfVFiUF66H2Q67DEmyFBMIhG6Bvcwic
	d5og==
X-Gm-Message-State: AA+aEWYHTdgsD0qeZHSQj/iEYLEGWMbBNG5UmXKjgSsInzvGq+Lp33ol
	lAwcs1wwI264adMKJxHriTblDGxRdM3M90SP8cyxrg==
X-Google-Smtp-Source: AFSGD/Wb8KIT5U0wg5JGgspKBTr9v7dr5N+GSJMwnQW1KfrF8Wm1onMUar6fH540Fu+lHzcm1iGI8tAuA766GHAUca0=
X-Received: by 2002:a24:c601:: with SMTP id j1mr15732itg.130.1545335248642;
	Thu, 20 Dec 2018 11:47:28 -0800 (PST)
MIME-Version: 1.0
References: <20181220001545.12618-1-richard.purdie@linuxfoundation.org>
	<CAJTo0LZ=Q8EuXqh0s79poWhw0gcrVRouJLyaF0OxgadWqFejMA@mail.gmail.com>
	<d796d8b521000f3fce1b514cedebe1476c57df1c.camel@linuxfoundation.org>
	<CAJTo0LYTwZ-srE+zO-Y2vnW_FhhoH-kPMDSLP78zkd=qbSHGNw@mail.gmail.com>
	<d9129255-2d1d-3b13-de3f-6dd0f299448b@windriver.com>
In-Reply-To: <d9129255-2d1d-3b13-de3f-6dd0f299448b@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 19:47:15 +0000
Message-ID: <CAJTo0LYOThmh62hpUrJxE=w9H4DRhPDnDpuG8Ybwxjm_qqRtNA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] glibc: Remove site_config and glibc-initial
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
X-List-Received-Date: Thu, 20 Dec 2018 19:47:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Dec 2018 at 18:02, Mark Hatle <mark.hatle@windriver.com> wrote:
> We also still want a way that manual definitions can be setup on a global basis
> for a given architecture.  (We do want these limited for the most part, since
> maintenance is overlooked -- but we've certainly seen cases in the past where
> configure works like this:  Yes, No, Cross -- where cross defines 'No' and never
> checks.   This functions, but ends up in a significantly less optimized
> situation, and these are incredibly difficult to identify.  [Using QEMU isn't an
> option, as QEMU doesn't know -all- potential architectures...]

These are absolutely not going away, and I've even got a patch locally
that can make autoconf throw a warning if it uses a hard-coded guess
when its cross-compiling.  The output is shocking...

eg this is why our Python wasn't actually capable of doing floating
point math properly: it was using runtime tests to determine bit
order, and fell back to "don't know", and floating emulation in
software.  I fixed this upstream to just look at bit order in a
binary, so the test is faster and works in cross.

Since the early days of siteconfig though a lot has changed in
autoconf.  It can do sizeof() without running, for a start.  It's a
lot faster in general, so I really do think that the usefulness of
siteconfig is really limited, especially considering how fragile it is
if you actually use it.

Ross

