Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8FBED6D494
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 20:33:56 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id u12so129798iop.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 13:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QROTjmAeXp16MiO0oDRZbBaTGfKnV5kcK7tow3lf7gI=;
	b=svXHp4BU0SS4mWOEmQIeFpTSav1AGqqmC1Rn+zlivt8IPQ2QEomnKycJJxHiLqDO3p
	D3sYnn3g7Xg/LjakNGQLXCMjWfUw4YBy/RtIrMmVP0+PXXnxljbrAiQuXoyCATfStslV
	I86zCIH/LVlSqWwqVSljxU1zo+NoqX/gXQtRNCHFm8OziJHpdhPdWWnq5jL+N7RNDPSd
	V7RAGyCAZAIV5i+eUhnzqz9EB4QdHjS4AWVRREfEm3JBpNcGMYPFK37Ft7wkXUnl5cE5
	NzPcRxNsCsyWRaoC9X+cedCyIxdEXukAGAUNgofShr8zsTm47j9RU2rEEZSWbYyL5bM2
	y33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QROTjmAeXp16MiO0oDRZbBaTGfKnV5kcK7tow3lf7gI=;
	b=X7mZ3guuUpX+o6vY0eWiIv430ue7ZVKhQXgmqmOn2Rp6XGIpY4/LPaljUFMBrOLme9
	cNTY5djOAePmyvy2LJ8Pg0oEA68Y/IA2+ykDuPG2b3jJ3wUAI1r8buriGD8cBBh1kxG5
	oFSYu3tra8OAgS/DLsvcP6U4sf1FsuDLz7bVZC289j7V/GPCuCOVLXLAAhPe0JeVimBX
	psEIj1cBcpCSG41NdzXupQa+z0QRGxlTUQ4fEn14bqtg1LfqQmfNWWU+UF+N0AXFMij+
	3WdHYMhp6s7Y7EADxWmPHeDC05Kq9lfgJ1fpSWUdmXjE0g4T/+H8dMi+whKwBfEn26tB
	EdkQ==
X-Gm-Message-State: APjAAAUsSVOMaH9HUHat8+VnSVEFzBY4MDEZfKUZj12V5Z45kkNLSHD/
	5d8UJbUMys/2uZkUyAZIcpbvZrBUelPB2MVvP6GKGDGN
X-Google-Smtp-Source: APXvYqzmp7tLgbXD6siGZXTjHIlrLr3ICEXxBVzTtUOElDfavV88dHolFNFH2qUN1muGxgz0ZCmPEVr+YqG1raj2BJE=
X-Received: by 2002:a6b:f909:: with SMTP id j9mr13589689iog.272.1555533237486; 
	Wed, 17 Apr 2019 13:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAJTo0LYTPzM_YPZJ4AH1uwbGE0vMRYqX-VFaS4cqsG3H9SHvUg@mail.gmail.com>
	<1555525297-26931-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1555525297-26931-1-git-send-email-mark.asselstine@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 17 Apr 2019 22:33:45 +0200
Message-ID: <CALbNGRS05HmvF2ka5GNBP4XP1cp+WpbxW1Ss4RzMp6ggBPzUEQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xfconf: fix 'Failed to get connection to xfconfd' during do_rootfs
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
X-List-Received-Date: Wed, 17 Apr 2019 20:33:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 17, 2019 at 8:22 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
Seems that there are configurations where it xfconf causes trouble
even at runtime (not only at headless builds) [1]

So adding a PACKAGECONFIG disabled by default is OK.

Could you please send this to meta-oe with

PACKAGECONFIG[gsettings-backend] =
"--enable-gsettings-backend,--disable-gsettings-backend,"

Thanks

Andreas
>
> Packages such as gdk-pixbuf can result in the following error during
> the rootfs construction:
>   CRITICAL **: 16:51:57.223: Failed to get connection to xfconfd: Cannot autolaunch D-Bus without X11 $DISPLAY
>
> This is hit during the postinst-intercepts/update_pixbuf_cache.
>
> Based on discussions upstream this appears to be an issue for xfconf
> and has an upstream update
>
> https://git.xfce.org/xfce/xfconf/commit?id=6f11cc65a2213f424728b5a0d25b1b63c19e773e
>
> Drawing from this change we can go ahead and use PACKAGECONFIG to
> emulate it.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>
> Guys,
>
> This is still broken in Yocto and I would like to see it fixed. I haven't
> dug into the issue as much as you two so I wanted to float this fix
> out there but hold back from calling it a proper fix. Please let
> me know what you think or feel free to take this, evaluate it and
> modify it into a full fledged fix.
>
> MarkA
>
>
>  meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> index 2667ff9..22a7bc1 100644
> --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> +++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> @@ -16,3 +16,5 @@ FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
>                  ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
>
>  FILES_${PN}-dev += "${libdir}/gio/modules/libxfconfgsettingsbackend.la"
> +
> +PACKAGECONFIG[gsettings-backend] = ",--disable-gsettings-backend,"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

