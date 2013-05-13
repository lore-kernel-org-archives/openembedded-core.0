Received: from mail-ve0-f176.google.com ([209.85.128.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UbvDf-0006Oa-9G
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 18:03:24 +0200
Received: by mail-ve0-f176.google.com with SMTP id c13so686044vea.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 08:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=YIiXIjRZt+VCTvCnOTLvDp1vLQio5zWKeNeIQpOXA1w=;
	b=LeLmOz4xugEDoJosvivtlcJ2dUju0A7izKbEDjIlsY2sWFbodPcHNhHjolZRmSk7w/
	UhfaJ5GHuIiOrOkNyXb0UOQ9DRnjAAlQ6QNH1UBj8F4ILtoyrBEzUU5U63t9e12yuAtf
	qiIq3HN0w3lqdyP2aLvyf8iLv3dUyPtIAMMN0VlU/MQ9LZZ76pPA6Eacn9gPSvKB/4xc
	8Pg5Lc8SdR5epRLNhhRo3/v2fwJNEAM/f7+AzagiMdZOWt39Ni3tjb6rihx4EAfnl56/
	W4r7lILfI+KG168Wc5mQR9F10zfS+yhfodBrcPvu562KZx13sJDaLMeGkuuDfZPArHKZ
	SK5w==
X-Received: by 10.58.207.97 with SMTP id lv1mr18908155vec.39.1368459913073;
	Mon, 13 May 2013 08:45:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Mon, 13 May 2013 08:44:52 -0700 (PDT)
In-Reply-To: <1368459699.6920.41.camel@phil-desktop.brightsign>
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
	<518A7B37.8050308@r-finger.com> <1368176725.11129.9.camel@ted>
	<518CD26F.3090901@r-finger.com> <1368185566.11129.28.camel@ted>
	<518D22CC.1040002@r-finger.com> <1368206371.11129.46.camel@ted>
	<CAP9ODKqGThBAjFkc1ViF9TJhW6z-xuVwwmDOa9mXg+h=TALJpw@mail.gmail.com>
	<518D5A7D.20606@windriver.com> <5190B2AE.9010102@r-finger.com>
	<1368459699.6920.41.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2013 16:44:52 +0100
Message-ID: <CAJTo0LYux+bLd2d9VPO10axc5ZtPnkk3+gHhonQAZ92r2q7m9g@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQmq58+NpzKn2DwNHloPfi6oGd1gSluQuPWcr5lr+B0A9wT2myMBG9nMktygyB2QwVCMClXL
Cc: openembedded-core@lists.openembedded.org
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 16:03:24 -0000
Content-Type: text/plain; charset=UTF-8

On 13 May 2013 16:41, Phil Blundell <pb@pbcl.net> wrote:
> It seems a bit hyperbolic to claim that testing clutter is impossible
> without GPU hardware (either real or emulated).  The majority of the
> code even in cogl, and virtually all the code in clutter itself, is
> mostly independent of the underlying GL implementation.  From the point
> of view of testing whether clutter basically "works" and is correctly
> built/packaged it seems as though this ought to be quite sufficient.
>
> Indeed, testing against Mesa is in some sense a benefit because you can
> exercise both the GL and GLES2 backends (and even GLES1 if you so
> desired) as well as all the windowing systems.

Well, the software renderer in Mesa that we're shipping doesn't work
with Clutter.  If we integrate llvm into oe-core then we can enable
llvmpipe which does actually work with Clutter.

Ross


