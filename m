Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 09F1A74F5F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 18:08:24 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id ay10-v6so6426741plb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 11:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IFu7u9Axi+WqgxzZHSkbIgs6J7D0pJI2NdKfacyLEpE=;
	b=iA46T6hw/3FVwHsz+awusOqskHDPtwQC26IKkli9548dx++d/dVNAatgTrATmK6Ttz
	JvxkBx/GU5HK92Ifp0NLVOTicJDQq/H5tf22SBuoRittKQYR1NvReA48qkkE/Gin+X3K
	DAwF5mACcu3L7rA15M1er254AzFORZ9Ux6ic0TOf+B36c5P1mXvpiVUEyCIcfTIEMl+q
	SBCnW9lr5QMawoIr9jO9bPj2jPdc703KksUOKZceD9ME852f658GHZc4b/wOWVZDzFJQ
	Oe3kiWIDqp9fZkvaW6dUPqDTg7GncrlBjB5YItayxABkn3mpPhdbSofSzvz7tintAatP
	rxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IFu7u9Axi+WqgxzZHSkbIgs6J7D0pJI2NdKfacyLEpE=;
	b=bmovVmrqxNarADRPAmJa1zRjdjMCdfc5aaMMMtn9+kSGYr27vN7q91+HvyEWW8OVAN
	JRkglV47AaXW6f5Jcheve8TJay8U/59F9s3aisUUd8aUyKiwBvsoue59OKf9GwyxWIZs
	pbIkOfNCaHlTV2yhITjVajyeshvtgAt7g+E1tRr6O6oSWi0+ylAkAPaxxvtzVYYjci7Y
	kBAdupHYA2HIyzmDsRZkjNKZkMcMh7r9el6+OgQ37ccj8hGy1xwCttXJ4nYOXfiXfWAf
	vDaRBuKAvXcOQlAtxldIZPYcIjnMPuUxQb8U9nOytuJb4Uojn2+opaRqusY+Xn/1gMzk
	bLTw==
X-Gm-Message-State: ALKqPwfpU7AR1nGe2L3SQNHLn+3WqYcZac69WDJjUL4er41HLJKBLAiT
	LjpoWuOraDMgFSD6mZiorbu9mMwJIbxoYaQKkVc=
X-Google-Smtp-Source: AB8JxZqvrNuFA7zt4GEpAq11G3YYVOg7Y1IXHqtv5Ys4mExdfQl2da0wBSY0+i+i6K7fJZO1+HD47dqESOs2r56nvzg=
X-Received: by 2002:a17:902:14d:: with SMTP id
	71-v6mr14277364plb.275.1526753305910; 
	Sat, 19 May 2018 11:08:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Sat, 19 May 2018 11:07:55
	-0700 (PDT)
In-Reply-To: <20180519162102.GL19965@denix.org>
References: <20180519162102.GL19965@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 May 2018 11:07:55 -0700
Message-ID: <CAMKF1srt3AbRBgdBZp2ya-VkWm1K6r8eywFbqr3nMFe7EqNuFw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: GCC 9 Drops Support For Older ARM Microarchitecture Versions
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
X-List-Received-Date: Sat, 19 May 2018 18:08:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, May 19, 2018 at 9:21 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> https://www.phoronix.com/scan.php?page=news_item&px=GCC-9-Dropping-Older-ARM
>
> Particularly, ARMv5 and ARMv5E are being dropped (but T and TE variants
> remain)
>
> Are there any concerns from OE community perspective?

From yocto project perspctive qemuarm which is emulating arm926ejs
with default tune armv5te is used.
so we are right at the trailing edge and wont be affected. However, I
know there were OE users who had
devices using other armv5 or v4 variants

I have been suggesting to switch qemuarm to use armv7 based board
emulator for few years now.
may be this is the time to make that call for next YP release.

>
> At least for binutils we needed this patch even for armv5te:
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
>

this patch technically required to support one of OEs available tune
values. namely armv5e, we should be
able to drop it.


> Any other way this change will affect us? Thanks.
>
> --
> Denys
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

