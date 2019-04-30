Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id B5B4A7DB8F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 11:53:09 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id x6so2039047uaq.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 04:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dvzS7m7tvD2ASBdOBCBWjRjhDsSgwDuM8ml08wT0gSk=;
	b=YfnuvUtHd/jUZmAN9DkxYlsf6/VSX4rgS5Z0/DRgEuZ6VF7R6xxvu7kpZm7wq5fr2Y
	7TIDpRFgytKMhSc3P6IraSaX5xTZlkIbuUPsF7lJncnI5Ww62JBDyMZ+0bsUKZ7trhos
	lsKz3v89fbM+ivJqg/zD0hjXGfXhZEMCz9U3EES0iOLGTpI7dMbITazrfY84sltyc4UE
	h9Az63K9NFqW/knPFMnDy9JApkWu1krbQ8qP0QFSs7LtbCaLwlrJc1Qv0dhYFZWMIrI5
	sC4Y2CmmP13rVhGangpu9xLeo870vvQShcv71Hc37105zUPRHbrsTiI6k6frCCyBoJ2v
	gp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dvzS7m7tvD2ASBdOBCBWjRjhDsSgwDuM8ml08wT0gSk=;
	b=dK9+5VW6QK8OygpwLo5rTHwJvk1HdqcMOZiS88wPyYBZIB0PVh6mfGBMuMGUdq9dzg
	KwGZ4/jNvipQX9z4LFLa16OQoQKQIX0WQwe78450svjnPOMZer5H2JpCmDW0thgP1XVk
	UsU9XqtaCsXAwmIXuKkBzJaDisMi3M9x6UhiOUC8qi/kDvmoTp/anKJf4a7AHDYDPuMi
	f59s5LwqM3RfZWHcf/tt6xLm509hVPxlSuOfnW+oBBEa91wyS7YF9SRUGrXKd0OszXVj
	rF8HjRd9sA3y2nWTcPCmXiLuooCt//EEj/vVleEWTdjhU3PNJGAModdJgXqRPZ65A6my
	iXpw==
X-Gm-Message-State: APjAAAVE9QS4BAkovlzPGFECm+754oO7kbWjnJHe2gPg1dE5Q1/kpeh5
	45KtWRk+Ki03IfzCGzTFomNyCT0T3yZ5Nu8CfDw=
X-Google-Smtp-Source: APXvYqw+clj4ayAYww7pfD2KKElHN7XY+Wsx85YG+RxlYqhSf0LughR+brqhv0zUDFQ/3fmY5Zzz/SJioXRa50Gis5c=
X-Received: by 2002:ab0:7298:: with SMTP id w24mr32949668uao.119.1556625190531;
	Tue, 30 Apr 2019 04:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190429144325.63744-1-alex.kiernan@gmail.com>
	<546ea9e32e2fb9ffa97aae5fbd328f653a1949b5.camel@linuxfoundation.org>
	<CAO5Uq5RRn7vCwxWvFyZR=OGc_VgnvcckOysqGCFtzbWkszqzsw@mail.gmail.com>
In-Reply-To: <CAO5Uq5RRn7vCwxWvFyZR=OGc_VgnvcckOysqGCFtzbWkszqzsw@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 30 Apr 2019 12:52:59 +0100
Message-ID: <CAO5Uq5TYifkzZm43kScmm+uBa8vxvsZWR+A-jCSfL6C5ryB7tg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 0/6] Fix systemd service enables/move towards "stateless" configuration
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
X-List-Received-Date: Tue, 30 Apr 2019 11:53:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 30, 2019 at 12:45 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Tue, Apr 30, 2019 at 11:59 AM <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2019-04-29 at 15:43 +0100, Alex Kiernan wrote:
> > > This is largely Jonas Bonn <jonas@norrbonn.se> patchset to move
> > > towards a
> > > "stateless" configuration:
> > >
> > >   These patches make some modifications to systemd with the long-term
> > > goal
> > >   of being able to run OE in systemd's "stateless" configuration.
> > >   "Stateless" boils down to building an image with empty /etc and
> > > /var
> > >   directories so that volatile (tmpfs) filesystems can be mounted
> > > there;
> > >   this requires that the system subsequently be able to populate
> > > these
> > >   directories dynamically, which systemd mostly takes care of if
> > > things are
> > >   done right.
> > >
> > >   In these patches:
> > >   i)   Don't include machine-id in writable images so that systemd
> > > can run
> > >        its first-boot machinery
> > >   ii)  Move systemd configuration files out of /etc
> > >   iii) Allow systemd to dynamically enable services and populate
> > >        /etc/systemd/system via the presets mechanism
> > >
> > >   There's a long way to go to get to a working "stateless"
> > > configuration.
> > >   Getting to a "volatile" system (just empty /var) should be easier
> > > and I'll
> > >   post patches moving things in that direction shortly.
> > >
> > > As a result of the systemd 242 upgrade, which includes 01d2041e41f4
> > > ("meson: stop creating enablement symlinks in /etc during
> > > installation"), services such as systemd-networkd are no longer
> > > enabled
> > > in images.
> > >
> > > This patch set fixes this problem in addition to satisfying the goal
> > > of
> > > moving towards "stateless" configurations.
> > >
> > > The issue with respect to image testing during CI was caused by
> > > systemd-time-wait-sync.service being enabled due to the lack of a
> > > default preset policy:
> > >
> > > https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
> > >
> > > We include a default policy of "enable nothing" which matches that
> > > used
> > > by (at least) Arch and Fedora.
> > >
> > > Changes in v5:
> > > - rebased for systemd 242
> > > - install default preset distribution policy of "enable nothing"
> > >
> > > Changes in v4:
> > > - add patch to make systemd-firstboot a non-default option to systemd
> > > to
> > >   prevent unexpected prompts at runtime
> > >
> > > Changes in v3:
> > > - parameterize preset-file installation location (as suggested in
> > > patch
> > >   review)
> > >
> > > Changes in v2:
> > > - address patchtest warnings:
> > >   - include sign-offs on patches
> > >   - include License-Update tag on patch that makes licensing change
> > > - dropped patch implementing brute-force removal of unit files
> > > installed
> > >   by systemd into /etc
> > > - reworked the systemd-conf patch to restore the installation of the
> > >   base systemd configuration files
> > >
> > > Jonas Bonn (6):
> > >   systemd: don't build firstboot by default
> > >   systemd: do not create machine-id
> > >   systemd-conf: simplify creation of machine-specific configuration
> > >   systemd: create preset files instead of installing in image
> > >   systemd-systemctl-native: simplify and support preset-all
> > >   rootfs-postcommands: call preset-all for read-only-rootfs
> >
> > I think this is close but in one of our test configurations it appears
> > the ssh server isn't starting:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/548
> >
> > (the stdio log shows the configuration its building for step 6 and
> > step6c shows it failing to ssh into the image)
> >
> > I reran it and the same error happened twice so it is consistent.
> >
>
> I'll have a look - thanks for throwing it through!
>

Bother... I've seen that before:

  DISTRO_FEATURES_append = ' systemd'
  VIRTUAL-RUNTIME_init_manager = 'sysvinit'

I fell over it myself when I was first getting the image tests
working, then completely forgot about it...

Unrelated to this error (but relevant for the patch set) - do we have
a test that runs for read-only rootfs?

-- 
Alex Kiernan

