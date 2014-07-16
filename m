Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3777027C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 10:02:46 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id hz20so468013lab.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 03:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=6Sg03Kv6XWFsuPMIXQM4lrPmPzLC+Ebomq01ycnNbhE=;
	b=HhCwUhUmaxlG25Ot5ok1z8yw+y72VHR0zEtbV0QXwTUmlGMeR8vePz4ox9umHREj0x
	S5shGTOJ+ceBrTZCbpFMcVrv3HM7R9PImMVahM78ODuaZBlxruTdVCXDo7+MBzUcP6aM
	4RZTSwg0MVWfJe8BjxQtOptI8lKK1xNJhPoWbUmvYVA/KWcuP60QR3wjDdNCAKZFfEi6
	51JnLWrfHdUZNvY563Ir4FIthxSM1vdWSH1psDFNOTlFNWeM1Gslk9GEi+BfpWq3qxSs
	M45IlQsd0+QLdKv4FzB87gjgyDGqooRohvbPD99W+dSEmZ1H+Raf0Eb09a3OwmIV7mHm
	1k/Q==
MIME-Version: 1.0
X-Received: by 10.112.63.65 with SMTP id e1mr2065433lbs.81.1405504967178; Wed,
	16 Jul 2014 03:02:47 -0700 (PDT)
Received: by 10.112.207.9 with HTTP; Wed, 16 Jul 2014 03:02:47 -0700 (PDT)
In-Reply-To: <CAAQYJAvV6166k+wVaSwJStNUdu5r9n+muGxL37hDz0jt+P32kw@mail.gmail.com>
References: <CAAQYJAvV6166k+wVaSwJStNUdu5r9n+muGxL37hDz0jt+P32kw@mail.gmail.com>
Date: Wed, 16 Jul 2014 12:02:47 +0200
Message-ID: <CAAQYJAvHQnCGc8pR0FRvhaLvSwRxDLpJK8jOT+p4Y1LeXSQGtw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Busybox: do not enable ENABLE_FEATURE_NON_POSIX_CP
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
X-List-Received-Date: Wed, 16 Jul 2014 10:02:54 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 16, 2014 at 11:35 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> Hi,
>
> I was hit by a strange issue while benchmarking: I was copying some
> large files to /dev/null and that was failing.
> In fact, busybox cp foo /dev/null (and even cat foo > /dev/null) are
> transforming the target in a regular file, with increasing size.At the
> end devtmpfs was full...
>
> After som eresearch I discovered that strange Busybox configuration option
> ENABLE_FEATURE_NON_POSIX_CP.
>
> Guess what? It is ENABLED in oe-core!
>
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-core/busybox/busybox/defconfig#n113
>
> Now, do we really want it enabled by default?
>
> Cheers
>
> Andrea
>
> P.S. I agree with  https://forum.openwrt.org/viewtopic.php?id=27235
> ""...ill-conceived feature""


I add the WONTIFX bug:
 http://lists.busybox.net/pipermail/busybox-cvs/2011-February/032161.html

It seems that cat should not have adverse effects, probably I tried
cat once /dev/null was already b0rked (unlinked) by the non-posix cp.

Regards

Andrea

