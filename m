Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 69EF96FA6C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 05:00:03 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id tp5so10206268ieb.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 22:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DWFOCcpcKjb4kOWklIbbOE27LUe0dA0FomspuH4DU9w=;
	b=YYZ4tPnzPaPghHzQlYt/o/CTPomI4djYnCOUiteNmTlltjQk1dcq1nBoOl3QMLQr5v
	gkJNz8uDqDY5L50013hn4UHzIpIBKJx0pTX4jOqetgQFLHbVOxSE08scwpsDsVkp6EFX
	cy+zuxwpRKpWG+AEU/CxwgqK1k/8eyUkUhIBcLX0/+i5Lh10WCo9lnxCvEIOwLYzVC99
	tZf0+z8tWlIDg55FM62dPP862UJtw0sdQd3zAwWpxud0uy8WshlFf355V7Hh95iUDIXC
	lO4AbFSeA3DS0OEp96tff7b8ELAyoCqgQCFYrqGfBSgiHlgMBJwCay5ZsMDj9BktzBD9
	Y1bw==
X-Received: by 10.50.43.170 with SMTP id x10mr6765037igl.20.1396414804292;
	Tue, 01 Apr 2014 22:00:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Tue, 1 Apr 2014 21:59:34 -0700 (PDT)
In-Reply-To: <20140401101153.GA6306@mcrowe.com>
References: <1396343775-18753-1-git-send-email-mac@mcrowe.com>
	<1396344719.14790.94.camel@ted> <20140401101153.GA6306@mcrowe.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Apr 2014 21:59:34 -0700
Message-ID: <CAMKF1soedDRPPiJTLnqi9SjGHhLwTrZ3cMx3EJV+TXSDqabOiQ@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake-native: Depend on ncurses-native too
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
X-List-Received-Date: Wed, 02 Apr 2014 05:00:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 1, 2014 at 3:11 AM, Mike Crowe <mac@mcrowe.com> wrote:
> It seems to be possible to disable building the "CursesDialog" component to
> remove the need for ncurses but I couldn't immediately see how to do that
> for a bootstrap build.
>
> The non-native cmake recipe depends on ncurses even though it passes
> -DBUILD_CursesDialog=0.

you need to disable it completely in CMakefile.txt, just that define
does not suffice you might try something like
http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-util/cmake/files/cmake-2.8.10-libform.patch?diff_format=f&view=markup

