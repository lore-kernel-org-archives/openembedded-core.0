Return-Path: <moritz.fischer@ettus.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3667307A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 19:58:35 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id 1so172325163qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 11:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GklQ3MF8JnFJDZPgI7onLJZJMhmMQzJUCk0Pv0nKy7A=;
	b=w28J1bYC/1auc7Gr+KxvOp3xdECYIhUuGsULSwUJ3gK3cmDXd+pGihsDdVY3xr4t/v
	KUOjg4EOeQbw2PIHIN3q7586afgRiu9DGy9ZQJlKYjlnRdv8TvYNRQg2D9G+SnNAqgUV
	oKJvZLXiFytOruC1OW1eOtR9TC2c7UQqFm/rPQBw4iULaTgthbTro4srRDQ4k7410RM4
	aktQ5sgmHhMVhvLGI64MaOF/cNaL/Vze5ZPfYpaVHW5KQzU9N2+YM18IfYdXmZ+43qcW
	L8G8CgmCguLUZTGY1Dhd08fE81U/kqiknqyj/1KDvIS4IYQ+e2WYNPvDeICEolVcbbd2
	rXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GklQ3MF8JnFJDZPgI7onLJZJMhmMQzJUCk0Pv0nKy7A=;
	b=mhW9EW5nwmEUJS1H65WrHBRIG05K6oNfEbhn6tYboDnoeHYotX5h0bSZDEbAH6yqA1
	2ApSeAtpxj2m9NqeCNsod1R1ljpyIp6Upk0h1nfEWM7hWCKQ+x81gWLIIpxTQxexx/wA
	HyLRWsQBgCw4TLzuUsCS+rKAPdbAIw9tVTwGer6y7Vpq/fK67t7MtClWP7DbLwsrtDAH
	kPZhokqIerWD/JHw0XfT2slbhrSypbbckMR3gRSw3q8j978ugl5ZcB0ZUZ+v3Jmr568a
	vUVx95fBtCdB1el2HqGe1vT5EScLDs+9nm1ukFTpXAJQjqdnzF1F8ViC+rBvmyEUUxJN
	8s/A==
X-Gm-Message-State: AMke39mLCrVdmv0G9gsXwUUKIb0LvMMK6Y9n1L0jF69XDZPlRYFl6gL3LKm+TwRGqrviPMBJ2QEDHHD18kJzpdmJ
X-Received: by 10.233.216.68 with SMTP id u65mr16484514qkf.68.1488830316976;
	Mon, 06 Mar 2017 11:58:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.160.225 with HTTP; Mon, 6 Mar 2017 11:58:36 -0800 (PST)
In-Reply-To: <CAJTo0LbZ5Ld2QaSic-6cUJ-CwABC9A6F0Gm6y=N1RbECsL2SPQ@mail.gmail.com>
References: <1488644775-25405-1-git-send-email-moritz.fischer@ettus.com>
	<CAJTo0LbZ5Ld2QaSic-6cUJ-CwABC9A6F0Gm6y=N1RbECsL2SPQ@mail.gmail.com>
From: Moritz Fischer <moritz.fischer@ettus.com>
Date: Mon, 6 Mar 2017 20:58:36 +0100
Message-ID: <CAAtXAHeMJ-78DJRvOojxCLTmkg32piWVikCeUdGYgaVTHO-jAw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC/PATCH] boost: Fix issue with python-numpy
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
X-List-Received-Date: Mon, 06 Mar 2017 19:58:37 -0000
Content-Type: text/plain; charset=UTF-8

Ross,

On Mon, Mar 6, 2017 at 1:23 PM, Burton, Ross <ross.burton@intel.com> wrote:

> Making another option would definitely be desirable.

So would you apply the patch to remove it if not PACKAGECONFIG[numpy]?

Cheers,

Moritz

