Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id DFC8260043
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 17:12:45 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id e67-v6so15942756vke.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 10:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LvbVVTQPezVbiDZ7RsOzmAgnViSY/wRp5N/chl5eYH0=;
	b=HHdB3c4vPEQL0J2hmMi+IJ8lWmL9q2AUnPXvBcKpLEJa8LLXLrnnNycKLx/GtMSCbx
	9DT54K6on7IZY6gsvOXgDovhlyjf9FkOb6w0gwOdnpd8z8Irqk9o6V23xdh0pJGzUasN
	iko7bVfgXu845hLNh3A43xafQ5KQ3/vs0s5av18EXYY1aHaBF2JWKgg3qGLRmeDjFMfg
	tch+xbBCtXxGqI+yjsERfnSEyY6YLF5gMWQf6jFkVi+vvQsD4B97x7Xi1ZLKtK5D4vcL
	quVLDedUm7qjnNqubVssM/YJG81kqj77lBoa4+yCeC+ScIE3MxWOiHdwN4SCT0s2OOtu
	BMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LvbVVTQPezVbiDZ7RsOzmAgnViSY/wRp5N/chl5eYH0=;
	b=WgQIzfoDKc932KnmNJAYIVRY0dtPC5VFDyavurIfarMUsLf3gBTe5xvgNuV2808QcF
	bOFatkyGG3Oz0QWLYqqFFBQTx+e3yNJfjtvstQe1KCcpM35YgOZdws94C5p4O69qbN2T
	+4l7zG1auktpCptiJB9U3IjjAJPZZG3QCxdvBopuKfAqhfBf8aW5isY1pja7hgwtJaS3
	gsqyJ1eYpaGYnSCAZcDasMt5sQIAT/UJIYQkp3D+tqKJFo0x9NGZvaCN4P5JIYvyJF6m
	rtWKufmnrJEcpUcTv3oevMxDpfUmkdGrP21qdLqh0LeIhoIBbG83I/LNqfd5VIzMbAfB
	hNCw==
X-Gm-Message-State: APt69E0obIM2OsvDFaPIeipZPQsCwAb7Gc9wfreXFt6tHVHpDF/SdbCW
	VlbhSmfPkdWNWyulheL/DoIGnRDQf8oSa4jgxyY=
X-Google-Smtp-Source: ADUXVKKPU/eZV6jQsVP+6OYIBZ8rdXABkG1D0Ox9h2Vlx3i1S21FUQQVP/Orq1niFB4EDPdxM1upRQqQ4lnDJO6vJOM=
X-Received: by 2002:a1f:5d85:: with SMTP id
	r127-v6mr1533252vkb.20.1527873166439; 
	Fri, 01 Jun 2018 10:12:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Fri, 1 Jun 2018 10:12:45 -0700 (PDT)
In-Reply-To: <1527865239-8221-1-git-send-email-akuster808@gmail.com>
References: <1527865239-8221-1-git-send-email-akuster808@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 1 Jun 2018 10:12:45 -0700
Message-ID: <CAJ86T=XwYWyFUAstvrVGfvjY3yS2JPvZXCFch9EyrONfByVYLg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] busybox: update to 1.28.4
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
X-List-Received-Date: Fri, 01 Jun 2018 17:12:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 1, 2018 at 8:00 AM, Armin Kuster <akuster808@gmail.com> wrote:
> Decided to update again.
>
> 1.28.3
> [v3]
> Update defconfig based on feedback

It looks like you've incorporated the contents of the config fragments
into the new defconfig. e.g. CONFIG_FEATURE_VOLUMEID_EXT (which should
only be enabled if mount-via-label.cfg is included in SRC_URI) will
now be enabled unconditionally, etc.

When you refresh the defconfig you should do so without any config
fragments enabled. The config fragments should then be reviewed
individually too.

> [v2]
> Add back busybox-udhcpc-no_deconfig.patch ti SRC_URI, missed earlier
>
> [v1]
> removed patches included in update:
> busybox/CVE-2011-5325.patch
> busybox/CVE-2017-15873.patch
> busybox/busybox-CVE-2017-16544.patch
>
> refactored busybox-udhcpc-no_deconfig.patch for this update
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>

