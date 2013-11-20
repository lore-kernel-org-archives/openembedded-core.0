Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by mail.openembedded.org (Postfix) with ESMTP id 571A56D9AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 15:52:39 +0000 (UTC)
Received: by mail-vb0-f47.google.com with SMTP id x11so2898142vbb.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 07:52:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KnN3XoQgPXxbav0JjvyNb9NX6aDJUE49N53Rqbhzx58=;
	b=iD1MKe9YdGLiBEfT1AlI1KN23jE72zzuT1RTocQBnlgl6z+Js1UPG3b5h3G5gSMOuZ
	INubexWvlH0emQDtAhMzcz0j8eHu001rfeCods8rKZUNoBgb7tA0ewWHdP7YeB/U4JJD
	6yQQFBLjTR4opCYNjXP0wAGooDzjMp/kz9LvrVeesQf/3ZRwv25fUIATR/gOqSiR0V3o
	6Zy0FmH1hznBfNh2NTkvAyLARA5R6DkoSu0b3nkvGoRNUG8y++ImnIbceQ8k/fOAZN8h
	2s60IaVGDl3QNAGy1Tm2A088z9It2f4hJVXFxZPHL/6+NpAs820c9e785Emvgr8brYI2
	TUsw==
X-Gm-Message-State: ALoCoQngW3pFsUnWw1cLH6ikLmddny7cZPnz5qGAXKTxwAsGxt/aqfPUPYr4ODd85NCQVlGkAoL2
X-Received: by 10.220.174.200 with SMTP id u8mr984610vcz.6.1384962760459; Wed,
	20 Nov 2013 07:52:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 20 Nov 2013 07:52:20 -0800 (PST)
In-Reply-To: <20131120122126.GM3708@jama>
References: <20131120122126.GM3708@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Nov 2013 15:52:20 +0000
Message-ID: <CAJTo0LbddOTBfon=xp4WByGCzB9aiNxH+jD2KiGxJcjBfdUAfg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks Wed Nov 20
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
X-List-Received-Date: Wed, 20 Nov 2013 15:52:40 -0000
Content-Type: text/plain; charset=UTF-8

On 20 November 2013 12:21, Martin Jansa <martin.jansa@gmail.com> wrote:
>     * openembedded-core/meta/recipes-graphics/wayland/weston_1.3.0.bb, do_patch

This is a patch in your branch that isn't in oe-core.

>     * openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb, do_fetch

For anyone who isn't aware the upstream repository was deleted and the
best available clone (git.debian.org) has just had catastrophic disk
failure.

Ross

