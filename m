Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id A3D7C7DC12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 13:28:22 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id v84so7935124oif.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 06:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zAfMcFpPrFVz002pa10ncUlEGJtPYdA8Kz6ye6tiUDo=;
	b=HMraNkDwgrYqCtB7xb7lf1LFzyHDA8N2vo7NYW59ZNM8zKea381GMXbMSGTCf9iqzs
	YLUbQtpcYQWIDnOxzLaIoYJypiXp41JxgLiPfkasuASsXNQM8LVquGcsxpE2+CbzeKWg
	rxuTorr+vNUgqm3YfM+lgcv/mTjvEdfpcdJz9/KPJ5Q1xe7cb2Ce6EQJn+IPkdLzd2JA
	KgIgO5rVxEU8I7t9HUwhekZXCTbWiBGyd+6BPVkMpVl87/BdiV2gcUePnnmGUqY0ZS0W
	ch/2+pvGoeiQHBtIZ3OXD8l6v4UPgKfUs7GKHHDAAVr9HYO0JGT/WhO2plEGXMwGcp0R
	xHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zAfMcFpPrFVz002pa10ncUlEGJtPYdA8Kz6ye6tiUDo=;
	b=OvY1l87tdodcoQ3XVAhyCdIAjevYM86CLdFd8F9gciy8ClRWoeRUSrl31WztD1SVMq
	GT7afGRk+Y84zw5WzqCQsAbOMKEEIn3wAJRfgPKrPJXD8v7rB9vh7m+R5UJF30umHZvC
	kK7z0AQbkYxIPH5+Bk6uqbGvas5MU5LN0Jjdgaw/bH+KHwOnWpxXxxItm3Wr66/oqh0Z
	NrAiyrTVcIFc7+u9fLP6V9n5csZNtcGeEjcqwbn5ZpGqIyJd2DZgmUG+yXmWwOKciQ4z
	QNO4ATpcJMwuyO/grjh3/BXBTNC8nr4qJl0s05z4TG/y5aXsQk+hyYxsIOysT37vv3sF
	p6ng==
X-Gm-Message-State: APjAAAWxrnMQuH+6AVIWz8z9hKCO8oRr5V7MHGENBneF823U24EadXmC
	6w2CU5lheU9CEZxIMJlUz8SiPQgJq6PHL89NOYk=
X-Google-Smtp-Source: APXvYqwwn/mYaW/YRcRImlSePihd8aGHLKNGGwI1a4ej4vD7gOQAOvKwrVougGx8ujiS3SV9c0x8pd4uCCjUzyrZaNs=
X-Received: by 2002:aca:ac94:: with SMTP id v142mr9934743oie.135.1555075703623;
	Fri, 12 Apr 2019 06:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAJE9sGkSBxjwAr2yr2NQy=k78yvOGY1hpEKDhE4acmxsCLZdxg@mail.gmail.com>
In-Reply-To: <CAJE9sGkSBxjwAr2yr2NQy=k78yvOGY1hpEKDhE4acmxsCLZdxg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 12 Apr 2019 15:28:12 +0200
Message-ID: <CANNYZj-iGf+6ypT=Vx8y-KhVY0d3uQzfnnvo8VuMFVW-7jnpyA@mail.gmail.com>
To: Alan Kozlay <alan.kozlay@ves-solutions.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: xserver-xorg.inc and sysconfdir setting
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
X-List-Received-Date: Fri, 12 Apr 2019 13:28:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Apr 2019 at 15:23, Alan Kozlay <alan.kozlay@ves-solutions.com> wrote:
>
> Maintainers,
>
> I needed Xorg to run as non-root from a non-console user on a machine which needed the intel chipset drivers.
>
> Eventually, I made a bbappend for xserver-xorg and added "--enable-suid-wrapper" to EXTRA_OECONF.
>
> This was supposed to allow me to provide an /etc/X11/Xwrapper.config in which I could let Xorg know that the user is not a "console" user (not a logged-in user).  But my Xwrapper.config was ignored.
>
> Upon strace of Xorg, I found that Xorg was looking for the existence of such a config file in /etc/X11/X11/Xwrapper.config.  This is because the xserver-xorg.inc file adds "--sysconfdir=/etc/X11" to EXTRA_OECONF.
>
> Xorg source code already appends "/X11/" to ${sysconfdir} when looking for this file.
> I wonder what other files Xorg might be not finding because of that setting.
> I wonder why sysconfdir was set, at all.

There is 'git blame' and other facilities for looking through commit
history to find answers to such questions. Also, patches to address
issues are welcome.

Alex

