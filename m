Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 041FB6C1F6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2019 12:31:37 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id g17so2259121wrr.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2019 05:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=lw85wHEZGFFFlvkDnja6f8j+M83LBi28/xcSGZlHa7Q=;
	b=YCAO5aDCKP0sdDB6gfExX8q4KI3gsHmDS2Mbzwbja4LtAU1SC+L0cyYOCyeU3Un1XL
	WCrTiU7161p3HYvoeVlGpL9ViiXYqzM2ufYNeC6sDfiZ84cdmLbXnB9TtJEo6x56KyVe
	YEkiYB1wDzxH0ycShwPdjTQypD8FtkGHFAPuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=lw85wHEZGFFFlvkDnja6f8j+M83LBi28/xcSGZlHa7Q=;
	b=W7kyCHKod99tl8HnyjjNtYP9tM3Ou1bHHbIcxlBY5uQ7Eb+ePd+NXJa1CbJxtpbylH
	szOoCoA5mvpz6uHh2556tChSK3BR74G+bHQSTM9bO9n89EfGGT0YHCs72kQW7fXWjIIJ
	djgVgSLC6tgyw5JCq1OMkIQ3ddsv4rotxcutD8yUEQoRmMLuMKt1Ekf/He9p6uMvvjjs
	NqqH/6t1LKs0Atpv7uw65g0vqPBfdJlb209McTV1N8qJSid4V9H4j3kB4ITZN2qWG1i4
	trSRaLkNy/1GY+IL0cl4bzyNe45jmaoqY8O0qCcCV2ymKyguo7ERFrlfkJ20Oh6bPAlr
	mX+Q==
X-Gm-Message-State: APjAAAU6Hor1gBL1cosMNszMYa0kMQyBuHB/FwO8QDUUZUPkl/Sjv20W
	RxMOfVWv1unUcSHo4OgC+TkO4A==
X-Google-Smtp-Source: APXvYqwkENbS9Mzchz8P69h0D1cHxy3NuR3TtifCO7t59+brz8MYkIqawLzrNC5stlAq61B/65LFCg==
X-Received: by 2002:a5d:4c86:: with SMTP id z6mr3624746wrs.330.1562416298696; 
	Sat, 06 Jul 2019 05:31:38 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g14sm11205102wro.11.2019.07.06.05.31.37
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 06 Jul 2019 05:31:38 -0700 (PDT)
Message-ID: <637f10ea8804f01bcde302ad0c418a362f257b69.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Adrian Bunk <bunk@stusta.de>, kai.kang@windriver.com
Date: Sat, 06 Jul 2019 13:31:36 +0100
In-Reply-To: <20190706095328.GA1877@localhost>
References: <20190704134520.16320-1-kai.kang@windriver.com>
	<20190704134520.16320-2-kai.kang@windriver.com>
	<20190706095328.GA1877@localhost>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] defaultsetup.conf: enable select init manager
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
X-List-Received-Date: Sat, 06 Jul 2019 12:31:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-07-06 at 12:53 +0300, Adrian Bunk wrote:
> On Thu, Jul 04, 2019 at 09:45:19PM +0800, kai.kang@windriver.com
> wrote:
> > From: Kai Kang <kai.kang@windriver.com>
> > 
> > Introduce a new variable INIT_MANAGER and create 3 init-manager-
> > *.inc
> > files to configure init manager settings. Available values of
> > INIT_MANAGER are sysvinit, systemd and mdev-busybox. 'sysvinit' is
> > set
> > by default for compatibility.
> > ...
> > --- a/meta/conf/distro/defaultsetup.conf
> > +++ b/meta/conf/distro/defaultsetup.conf
> > @@ -23,3 +23,6 @@ PACKAGE_CLASSES ?= "package_ipk"
> >  INHERIT_BLACKLIST = "blacklist"
> >  INHERIT_DISTRO ?= "debian devshell sstate license remove-libtool"
> >  INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}
> > ${INHERIT_BLACKLIST}"
> > +
> > +INIT_MANAGER ??= "sysvinit"
> > +require conf/distro/include/init-manager-${INIT_MANAGER}.inc
> > ...
> > --- /dev/null
> > +++ b/meta/conf/distro/include/init-manager-sysvinit.inc
> > @@ -0,0 +1,6 @@
> > +# Use sysvinit for system initialization
> > +DISTRO_FEATURES_append = " sysvinit"
> > +DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " systemd"
> > +VIRTUAL-RUNTIME_init_manager = "sysvinit"
> > +VIRTUAL-RUNTIME_initscripts = "initscripts"
> > +VIRTUAL-RUNTIME_login_manager = "busybox"
> 
> I am not sure whether this can be fixed better, but this does break 
> existing configurations that use a non-default init system.
> 
> I just ran into a build issue with
>   VIRTUAL-RUNTIME_init_manager = "systemd"
> since this now resulted in both sysvinit and systemd being attempted
> to 
> be installed to the image.
> 
> This was fixable in my configuration with
>   -VIRTUAL-RUNTIME_init_manager = "systemd"
>   +INIT_MANAGER = "systemd"
> 
> This at least needs to be properly documented as a breaking change.

This change also didn't quite work out for some of our selftests. I've
a patch in master-next which tried to improve things and that fixed the
selftests.

The only other way we could do this is to default INIT_MANAGER to say
"unset" and have an empty file for that. That will of course break my
patch and need the defaults adding back into the recipe. Unless we put
those defaults into the unset version.

Not sure quite what we should do here...

Cheers,

Richard



