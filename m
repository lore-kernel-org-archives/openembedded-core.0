Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 777D0731A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 02:26:16 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id b67so44649640qgb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 18:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rQJ++4SkEp9tviqgjerjh+Ara+qUqqVCztMW3gzSkLg=;
	b=Z/fEIyzILYbh1mYlwAIZb6QuFWRUewrYoPjsNpquy/YadBqnEmc11Y9SSB46qNJmJs
	M/PfzUPzUBSdowSXTgB+14WHzWhznWNghe15xeK9iROwEJ/iyIn/i8wnf4WUMrVdJixw
	T/SxYbUYchPphY7zcxVq4HMwma8qaRy/KpxjiO4B34pGqI1Ut07D3HjGJ09MKa+TvluL
	lgaKNAYJ6SCEQllyh3cXeC82l2x+EomVttzyiTAJNEJuQgnGMCKy9+4AA+Kx40qqPhcJ
	r4PHU7hs4+0n+LXrwWx4je+qVyZOaOm8QDp6BS15CGeSe3bw/VDFW0IZl9NeOvoxMJGj
	pkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rQJ++4SkEp9tviqgjerjh+Ara+qUqqVCztMW3gzSkLg=;
	b=OG3AhGlVNENuNP0D5pFzcAngugxUDhe95YiYn04th4NST0OuGjEUwSE3DQM5sS68z+
	AVhW+86HXbWxMPKWYkPzpNpI+2+nkPsOi7dRgYoahNz+kgCgr5W5XaCT7T3jEr0oXKTS
	d5sPq3/83/GmOH8aAKXshSKa2H8S+OhbIvLN/ow8TK8B7KWWuHIG+pGiyp39DY33QdLs
	ddX+CmBcfDxCWs1EQ5mZQv0AOwR8y9PS2/l9XrtvD6gO2dJWkYwCop9BLuE4Jmf0fUzM
	ss6JJBWSu2ooqBEkA/OSqCh+V9RhZCX1WUlN4iCFJYcJ6C9AO1oBdwi8lIBgHOvvhOMS
	Xd0Q==
X-Gm-Message-State: AG10YOQuAWLSacxDh+jhnJqwmrAB3AB+MvUOWA2ZramPt+J8SdQwdgzSdigi9q6ne/zqr1fUxyZbME+QcLlXVA==
X-Received: by 10.140.238.8 with SMTP id j8mr37177142qhc.76.1454984776672;
	Mon, 08 Feb 2016 18:26:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 8 Feb 2016 18:25:47 -0800 (PST)
In-Reply-To: <56B922B3.9070604@gmail.com>
References: <56B922B3.9070604@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Feb 2016 18:25:47 -0800
Message-ID: <CAMKF1soeyQwt+jDkiLWxgh+7BqnbABHa7f=iFyEmZf8O-BBBYw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: noticeably longer build (link?) times with binutils 2.26
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
X-List-Received-Date: Tue, 09 Feb 2016 02:26:18 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 8, 2016 at 3:20 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> This is more of a "FYI", but I've noticed that the build time of my chromium
> recipe has gone from ~45 minutes to ~2h15m when the only thing that changes
> is to move openembedded-core from the commit just before upgrading binutils
> to version 2.26 ([fd75637] native.bbclass: Set CXXFLAGS from BUILD_CXXFLAGS
> not BUILD_CFLAGS) to the one immediately after ([86ade2c] binutils: Upgrade
> to 2.26).

Is it using gold linker ? if not can you try both bfd and gold

>
> Oddly enough I don't see this same behaviour when building, for example,
> core-image-minimal, so I have no idea what makes chromium so special and,
> therefore, whether other recipes might be similarly affected.
>
> Also, it seems as though a lot of the added time is coming from the linking
> stage, but I don't have (or know how to get) hard numbers for that. Is there
> a way to get build times for each task within one recipe?
>
> I've repeated this test 6 times (build just before binutils-2.26, build just
> after binutils-2.26) and the results are always within a couple minutes of
> each other. So I doubt this is some random occurrence.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

