Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8C7F374A35
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 17:21:44 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id i20so9229183otl.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 09:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t7+1decM+J+o3LnCSAkLfk9rzhQmSRMUa0kffScY9nw=;
	b=GmxP3N20dcd2utB/1Q93dZwQekx/CBbQ/eAC9QYEiz3q8UWwllEhMntBJ/LoyDBev5
	9IXEqOMz4OejNb5PE6hpYBoegwMlX3AUdp3lJ3u+wOyXBBUlwrl9lmLntDinLYJhJrB2
	qF3mwZ7R5IoLJAZ2y1ZT9g2JCJD4wlhtdK09rGigXiExSOgT/jywJMYBkg5QI0hKrzKF
	wCFMiHq3hESgQt4ASoqTwGsqqYT5+hIQhO4BqopeChKN06/MVbcNsTyzQWPRlcvsjylA
	zEmsJgMF9CQZR/PN/UoigJgWqgAEBDA/BfkXCSlxrCfB/loNKhcGMG1Wr9NbQwmgek1K
	QRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t7+1decM+J+o3LnCSAkLfk9rzhQmSRMUa0kffScY9nw=;
	b=gZfZsWVO9eS/FjLB/zvtx1u949UofOGMMtETVrcBVR3xRvAnwnL1XFbQ6QFxYDavvH
	x+QTk14Kooa8cO7dNAwhSWot6pRSPC4z9xc2qZk+QJUGvMxsfm0RUbuZ/uEtKrCuXNNJ
	TWY2s2fdANY8Q4OBuq8al2X9HJFxdXQSsxCq2BbYXIYaxOMWW+R6f6wcdepmqyWdIoPC
	nRy7wKJx9utzrTmqM1ys4O8b8LG9l/i6b3IFrkOFd4OwBI/UMDSWpxXz5hHVQmVeY3LX
	0mf1eSVOgL7d1rJY78/OSEvbR31+Pfz+OfGqwdFuFQ2V4rNwrSrKJ9KH18dMRsz22soq
	dVGw==
X-Gm-Message-State: AJcUukfC+vNA0a6rf5AytZXCNy/aGKcJZVo3r1yS0bhaxxEhYifUr2g/
	3vbvfnPaqHSM901EoUCIffAFM4X93iJWb5HMItM=
X-Google-Smtp-Source: ALg8bN5YSzX+soQfP2V5go9d+L24x9hFlLn2Y6Bmx5b0Fa8yR2ZTCnPjENmNaXSB/vuRpmm5zVCC2RoPOd6mPZyWiWc=
X-Received: by 2002:a9d:66f:: with SMTP id 102mr8861934otn.293.1548436905419; 
	Fri, 25 Jan 2019 09:21:45 -0800 (PST)
MIME-Version: 1.0
References: <20190123161744.45763-1-alex.kanavin@gmail.com>
	<20190123161744.45763-4-alex.kanavin@gmail.com>
	<a7f352fbd50d0236a1623114364bb8bb4cb22eb1.camel@linuxfoundation.org>
	<CAJdd5Gbc3vb4YHioijMBXm5Y_w_aiVmi3Kz7_G6mi-BaJWLmzg@mail.gmail.com>
	<CANNYZj_3RJ5Hno-fCwMBccgYrTRSgLb6LZc6rGOovZ_9AD6FTA@mail.gmail.com>
	<c207a65d9262320feaf5d32ee7d906beee506102.camel@gmail.com>
	<12e06882b3c8cf4e17e0e6663dc8fa50c770d46a.camel@linuxfoundation.org>
	<CANNYZj92Q=4HN+exKycMR5tnn+LjAbMEzqAx3B3dkxHjpQsixA@mail.gmail.com>
	<d4217cbab239eee91390d3c1929cbf7856e71bdb.camel@gmail.com>
In-Reply-To: <d4217cbab239eee91390d3c1929cbf7856e71bdb.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Jan 2019 18:21:33 +0100
Message-ID: <CANNYZj_aRRUpj9BrCLgy9VDaoKGTnvBwUYKKm0zs5ePfpqam7A@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/10] lib/oe/package_manager: turn postinst_intercept warnings into failures for nativesdk
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
X-List-Received-Date: Fri, 25 Jan 2019 17:21:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Jan 2019 at 17:33, Joshua Watt <jpewhacker@gmail.com> wrote:

> I probably should have been a little more specific: I was thinking that
> POSTINST_INTERCEPT_${PN} = "0" would prevent the creation of the
> scripts at packaging time, not try and suppress them at rootfs creation
> time. The idea would be to add that to relevant recipes with a
> appropriate override in a .bbappend in meta-mingw. I'm not familiar
> enough with multilib; is there a an appropriate override that could be
> use there?
>
> I think this would also have the advantage that mingw32 specific logic
> in package_manager.py could be removed; we'll just suppress the
> postinst intercept scripts in meta-mingw and any that aren't will
> generate the typical failure warning.

The problem with multilib case is that the same target package is used
for populating the target sysroot in the nativesdk, and for populating
the target image rootfs. In the former case, postinst_intercept should
be suppressed, in the latter, it should not. But we won't know that
until populating the sdk, or creating the image. I still think that
changing the warnings to notes should not be harmful; the scripts all
create caches of some kind, which are generally unneeded at build
time. Or we would run into issues with plain yocto builds already, as
we don't create those caches either.

Alex

Alex

