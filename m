Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7895D607BF;
	Mon,  5 May 2014 01:05:12 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id uq10so1631109igb.14
	for <multiple recipients>; Sun, 04 May 2014 18:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=dajaEGF45y0Lrb/wtA15AQHmbK2dxQxyayCovu7wnIA=;
	b=mSDGj0vN6L6hfTL+BrG/vG4nnRlhCZrgrTqycxjPXIGccztc4nstiZqECAJrwr5zOq
	mtvCamrTJwfDwgro/LWhY+GTZ1CS8JfSP0ymbZv4VRoMmrrkzxwXX/BWOT1rMshePwzc
	hENQkjC4+C6s9NhRhHYz9ZXdGGxrRvUEbvDeCh61HLU/6fADdyogE8yK1fCv0xZ4Vbxw
	FtH9SkV4v/zhO8qE0Qo/LYDq/icxLzTZI0NW+VfaXot9Yzs6WKJtrTurEewdjs44ddHp
	PUp3Yq2UHxbSwuCEvuqtC2pjSaSr04c1NW3CQ9ZlGnqCoYAapFHUWHjhM9nUokT/AlrZ
	c31w==
X-Received: by 10.50.49.109 with SMTP id t13mr20141418ign.2.1399251913915;
	Sun, 04 May 2014 18:05:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Sun, 4 May 2014 18:04:43 -0700 (PDT)
In-Reply-To: <20140505010411.GJ2486@jama>
References: <20140504111629.5E32A504E8@opal.openembedded.org>
	<20140504145024.GD2486@jama>
	<CAMKF1sqAEB77eo6dQzkZgqqk1CQkWoa_YFP4y_ZNwteJoRz7KA@mail.gmail.com>
	<20140505010411.GJ2486@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 May 2014 18:04:43 -0700
Message-ID: <CAMKF1spnBSmGovXvruu9T-ij5jefL-Mi9Q=R03_-oF115smP-w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Khem Raj : lttng-modules_2.3.3.bb: Fix build on ARM/gcc-4.9
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
X-List-Received-Date: Mon, 05 May 2014 01:05:17 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 4, 2014 at 6:04 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I'm already testing it with daisy build to fix one world build issue, if
> that works, can we drop 4.9 from commit message?

OK, will do it in next rebase

