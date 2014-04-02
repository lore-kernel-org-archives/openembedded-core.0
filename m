Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id B9CD16FADF;
	Wed,  2 Apr 2014 17:13:48 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id rl12so550853iec.36
	for <multiple recipients>; Wed, 02 Apr 2014 10:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=f58g0FaIwl1tQtQ2hGc8TfhPJNICDg/XUfgsiHDsr9g=;
	b=ku0xwbvgRjHury2PGTAe61RRBH2ZJ0Q2O6M1KCd1x9JxqmrXRLdKl+noiC330OhA1R
	GC2sG0lPzCsWKCYndrHV4zySp2B+85a8ZdWrWnE/0T4k7Kka4SsofHH/7NwwG6ffbOmn
	QVPNglg5FzpYbdyQHUa5ukWMB7ni7TXqTR6sYL8rgHZNNXE1d26Z9vTYgNSKj2lWon+Z
	g91rmh5Pnz6bexK7BGJcZN1RYrbkzN/febJgmUPLOUaqmENxXkzL43WVokhOL7pBDLWm
	ZbqshruC7TzAyJkIacLgGBChiYXxBSq9WOlKctlUkFXzQJumFwGZ9+H9D2ygCPShnKDY
	4pSA==
X-Received: by 10.50.49.109 with SMTP id t13mr2994703ign.2.1396458829868; Wed,
	02 Apr 2014 10:13:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Wed, 2 Apr 2014 10:13:18 -0700 (PDT)
In-Reply-To: <CANyK_8fC4kkDgqovwuTx5kN0Y2hcyDT7HStii4hxz_CN3D=atA@mail.gmail.com>
References: <CAMKF1soKZqqmQUVCQnUqS1GV1FO5KictTO+=up=d7Jw3+QhXMw@mail.gmail.com>
	<CAJTo0LYF0VNwy7=rhmr7U_=tXwJtPOax3AKttn66q3qD_QXd2w@mail.gmail.com>
	<CANyK_8deVKbC6xOUQHubvphfwQCQefHGWCt7Mp1QM4DUVXja5g@mail.gmail.com>
	<CAMKF1sqPB+QCvPHHcxsU+ExBmNWg9jPXajkAR_FdKpJ76-x9dg@mail.gmail.com>
	<CANyK_8er+2sjvU1csLOEpZ06qCL4h+bP2ecUYYGzyiEw0kXzQw@mail.gmail.com>
	<CAMKF1spno7Np8FXr3JXw3_W72+vRkchzZ8J5X+3e4RCFY+6nLg@mail.gmail.com>
	<CANyK_8f_V247P1UWaeG-7YwBq4MrHQ=+69NOgW8LUZ4_Xgx2qA@mail.gmail.com>
	<CAP9ODKp-+31rJmK6uY1QA6nvG4hDuNT79JVeeivY5XeOCu2etw@mail.gmail.com>
	<CAMKF1sqOCs_OYkZU2ng9FmViPyJx1AjdViSquZWzbgFT=XZdoA@mail.gmail.com>
	<CANyK_8fC4kkDgqovwuTx5kN0Y2hcyDT7HStii4hxz_CN3D=atA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Apr 2014 10:13:18 -0700
Message-ID: <CAMKF1sorF5M0oxq9gaZEDeV5Td2pydEE0zZjqJdM8n0hyGbuyQ@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] initial support for musl libc with OE/Yocto Project
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
X-List-Received-Date: Wed, 02 Apr 2014 17:13:55 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 2, 2014 at 10:03 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
> You've fixed util-linux in a different way to me, I added qsort_r to
> musl

this won't fly in musl community.

whereas you've removed it's use from util-linux. I'm not bothered
> which one we use if both work. We do now have 4 people looking at
> util-linux fixes: Me, you and Robert Yang (as util-linux-native
> doesn't build on Centos 5.10 due to the same qsort_r usage) here in
> oe-core and Karel Zak from upstream (as they want to fix it for their
> next release). I think we need to pick one fix (probably yours if it's
> tested and working in another distro) and get it applied to oe-core
> master.

yes, I think not using qsort_r is common solution for all these issues.

>
> Your latest commit "glibc-2.0: Fix build issues that arise on musl"
> should say glib not glibc. Other than that, your glib fix is better
> than mine (I did add <string.h> but didn't add the
> '--with-libiconv=gnu' option, instead I set musl as the provider of
> virtual/libiconv).

in order to build a lot of software we would need some sort of iconv
implementation
letting musl to provide it is probably ok too but I wanted  to take
the tested path to get
to an image to build and then we have a known baseline and we could
experiment more.

