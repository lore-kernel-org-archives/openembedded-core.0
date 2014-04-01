Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 958616E3DE;
	Tue,  1 Apr 2014 08:53:33 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hu19so9582967vcb.1
	for <multiple recipients>; Tue, 01 Apr 2014 01:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Z4wO7NYEYV1q4k5pZTlKeeJKUCBw7J85jRMLGBPmUH0=;
	b=lbE4IAHPZH8R5yCk4UHDa4zMhRXcMnjod3PvgACnN9LGFcBcNSubH7KABUYp1mVdrS
	sp62LZoD7jmH+D7340W96ntfbdnqIYp6PtldK47AUFkJrgYE3RfvS/GPJmqy9y7ocowe
	weJvPaEiRt2hrmQp9Tf0HSFddV/NVqe1iG6GDygPtXJehRVd1wwSlMCf77a1XJL4ycWf
	YznRr7fOGXKwVQJPfdloIYzyqDfsbWnoIvITxw/tg9pkY4ZZ8/kFJVilEZIbOYCAb5Q8
	Cmhu0elG+EwxqamIWw11ly62fegRPXFSAZAxGk2K+bVcSJl7N/x4SQvPIfD57PA//2Go
	uB6A==
MIME-Version: 1.0
X-Received: by 10.220.92.135 with SMTP id r7mr27583478vcm.11.1396342414962;
	Tue, 01 Apr 2014 01:53:34 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Tue, 1 Apr 2014 01:53:34 -0700 (PDT)
In-Reply-To: <20140329225432.GA2428@jama>
References: <20140329225432.GA2428@jama>
Date: Tue, 1 Apr 2014 10:53:34 +0200
Message-ID: <CALbNGRRRiOo1Ysm9mP2fRmQ+_AWMHiug1FuQ1z9L4741sj-8fg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2014-03-29
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
X-List-Received-Date: Tue, 01 Apr 2014 08:53:34 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 29, 2014 at 11:54 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2014-03-29 ==
>
> === common (23) ===
>     * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb, do_compile
>     * meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb, do_configure
>     * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, do_compile
>     * meta-openembedded/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb, do_configure
>     * meta-openembedded/meta-networking/recipes-protocols/quagga/quagga_0.99.21.bb, do_compile
>     * meta-openembedded/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_install
>     * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb, do_configure
>     * meta-openembedded/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb, do_configure
>     * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-support/asio/asio_1.4.1.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb, do_install
>     * meta-openembedded/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb, do_configure
>     * meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, do_configure
>     * meta-openembedded/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb, do_configure
>     * meta-openembedded/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb, do_configure
>     * meta-openembedded/meta-xfce/recipes-panel-plugins/closebutton/xfce4-closebutton-plugin_git.bb, do_configure
>     * meta-openembedded/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb, do_configure
>     * meta-openembedded/meta-xfce/recipes-xfce/xfwm4/xfwm4_git.bb, do_configure
>
Patches for xfce-receipes should go out today...

Andreas

