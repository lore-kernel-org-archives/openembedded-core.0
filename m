Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF8674197;
	Mon, 31 Aug 2015 13:32:42 +0000 (UTC)
Received: by igboj15 with SMTP id oj15so26175973igb.1;
	Mon, 31 Aug 2015 06:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=rbAlKAGCTqOTjNNbco22Iiw31X9G7MRBDRUnFaFY1iQ=;
	b=BQ2BcLrNglgzkxNkN4gEkL27jNJB3r6fzsTmu1ejcGEiQpjNl7jPQwxiebRwnNOua9
	vvW6/NHcHx3B5YdZlcmUBY3UlW0xMOTpheVkZ07LdI3GsQTBaC4Yf7NJ2WOkyeTJSFux
	BDUaO4ZLTzoNSTDRbcbPTOqg6QFK/CX+ELGfIUF28zlOYKjkpqOsz/1RFAw3btoX1CFY
	0/ClfPSi3jGvTvW3w0+CoLXFB7DSNNyOi0BrxSqanlbncqbLM8FGAPwAt89ePmxHt6rf
	AINxvk5xjA0YuPwSybfv7u/GTINDoiZt8IxOW4ItUAwLV2okF0vM+nkx07KVI0aW2hDE
	13Sw==
MIME-Version: 1.0
X-Received: by 10.50.142.33 with SMTP id rt1mr7235126igb.52.1441027962581;
	Mon, 31 Aug 2015 06:32:42 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Mon, 31 Aug 2015 06:32:42 -0700 (PDT)
In-Reply-To: <20150831125632.GA2465@jama>
References: <20150831125632.GA2465@jama>
Date: Mon, 31 Aug 2015 15:32:42 +0200
Message-ID: <CALbNGRTScmFfjhAU+PY3Y5ZKdpk0vK9f67Kdq+7BYvPdnVv-Fg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2015-08-30
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
X-List-Received-Date: Mon, 31 Aug 2015 13:32:45 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 2:56 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> == Failed tasks 2015-08-30 ==
>
> INFO: jenkins-job.sh-1.3.1 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20150830_101221.log
>
> === common (16) ===
>     * /meta-openembedded/meta-efl/recipes-efl/efl/epdf_svn.bb, do_compile
>     * /meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb, do_fetch
>     * /meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb, do_compile
^ patch sent
>     * /meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb, do_compile
^ patch sent
>     * /meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb, do_compile
>     * /meta-openembedded/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb, do_compile
>     * /meta-openembedded/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb, do_fetch
^ how did this return to world?
>     * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb, do_compile
>     * /meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.2.1.bb, do_compile
>     * /meta-openembedded/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb, do_patch
>     * /meta-openembedded/meta-oe/recipes-support/gd/gd_2.1.1.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb, do_compile
>     * /meta-openembedded/meta-python/recipes-devtools/python/python-pyopenssl_0.15.1.bb, do_populate_sysroot
>     * /meta-openembedded/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.2.4.bb, do_compile
^ patch sent
>     * /meta-openembedded/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-icon-theme_4.4.3.bb, do_populate_sysroot
^ patch sent
>     * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.bb, do_compile
>

Regards

Andreas

