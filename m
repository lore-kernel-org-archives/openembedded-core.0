Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id B7A146C149
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 May 2019 15:15:40 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id r23so1653500vsq.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 May 2019 08:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xgh8A+sO6yJpw1KdnA0ovPw9GhhDUkt6F+5nDIbNe4E=;
	b=hpoQD/fA0ZCtyUiUwFRowlLDi1hLIaqQ+LwgJYzSdt0SU4wN0iDtrk15KxYRJ3clYB
	It5DhtA8RkPY5YaenPdNNxeIZqr+bTAYimQpIg7BqBnlIT7uqHSaODdGV0wtjhs8PDg3
	5ZvsVilCeHHruXB+fy2MSDSqM7GA6a9KYTrmSvySEQb0stCb9QiIeJzvxfRkUhm+n9VK
	paj7vz1Ti5sgHNnHR3C82z4A+Repno6iR/rDQS3xoUsREz0KSulbD91gekWWxr1NdAqB
	gxrS5yEd3q63yHj/7gw7haFRGVQRkAyaf/aPZ2WOmx729oSY2mcKuBhx5ui+z3ZSziX/
	YAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xgh8A+sO6yJpw1KdnA0ovPw9GhhDUkt6F+5nDIbNe4E=;
	b=QEyNhp02u4MhkauSgrFUd3OU4pSu0bmTtACcjjuB7qx34uX6ZkvbuiB0EafvQiO+Up
	/WvzCMS563K+A7TAeo/NsTtHoBSa7bVftm04udNYjW//OQg+P3GpM1i6gkyJdUG0IjNb
	R1o2/FXeIX2Qp3QzJWfSLFKIFTM0nxBgrDiEA9uauqgl0byfhlEH3SKW2hvOimHuVHdm
	OX1UQmEveR6XcTGnqdamK6qkekdauB8Nafjb7e1fTpXU/lfuvs3NzeKfLLeRnaXnHmkk
	liVZMlaxjj2CHvcNN5rSG/kMzErw8uzMfLotWWwrMQmmxG8hHB5Sr4L3Z7rvv3lrBt/w
	5yHA==
X-Gm-Message-State: APjAAAXLbqAGQqUa48wtTInqcXK/zkbx4TMpmJULFS3psAwETZwbUZSZ
	ffF12Oq4uhIy2DlXC04ckFRj2i9GXSyyHNpnVJ4=
X-Google-Smtp-Source: APXvYqwF/M8p+vHDNViPW0hJcDDZ/pbIlBGM/z3JhrnIZ2ZFo4jF6Lwfu3ABe1YMNuVAhGdexoRe9PRM6D5GOAhgSe0=
X-Received: by 2002:a67:7b94:: with SMTP id w142mr5959562vsc.149.1556896541549;
	Fri, 03 May 2019 08:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190502210944.62696-1-alex.kiernan@gmail.com>
	<CAO5Uq5RVB77ZMRvAwneGQ5KYSyPL_m-vhSf3YuQz4oN0VYqW3w@mail.gmail.com>
	<34d317a2-7fc4-fddd-f0c4-0d8f6b25e9df@norrbonn.se>
In-Reply-To: <34d317a2-7fc4-fddd-f0c4-0d8f6b25e9df@norrbonn.se>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 3 May 2019 16:15:30 +0100
Message-ID: <CAO5Uq5RbEFSktN+3TnnxHMMFZ1NGndA5TPFNfUpe4VZpiBqhkA@mail.gmail.com>
To: Jonas Bonn <jonas@norrbonn.se>, Chen Qi <Qi.Chen@windriver.com>, 
	peter.kjellerstedt@axis.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6 0/6] systemd stateless configuration
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
X-List-Received-Date: Fri, 03 May 2019 15:15:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 3, 2019 at 1:54 PM Jonas Bonn <jonas@norrbonn.se> wrote:
>
> Hi Alex,
>
> On 03/05/2019 10:37, Alex Kiernan wrote:
> > On Thu, May 2, 2019 at 10:10 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >>
> >>
> >> This patch set is largely Jonas Bonn's to move towards a "stateless"
> >> configuration:
> >>
> >>    These patches make some modifications to systemd with the long-term goal
> >>    of being able to run OE in systemd's "stateless" configuration.
> >>    "Stateless" boils down to building an image with empty /etc and /var
> >>    directories so that volatile (tmpfs) filesystems can be mounted there;
> >>    this requires that the system subsequently be able to populate these
> >>    directories dynamically, which systemd mostly takes care of if things are
> >>    done right.
> >>
> >>    In these patches:
> >>    i)   Don't include machine-id in writable images so that systemd can run
> >>         its first-boot machinery
> >>    ii)  Move systemd configuration files out of /etc
> >>    iii) Allow systemd to dynamically enable services and populate
> >>         /etc/systemd/system via the presets mechanism
> >>
> >>    There's a long way to go to get to a working "stateless" configuration.
> >>    Getting to a "volatile" system (just empty /var) should be easier and I'll
> >>    post patches moving things in that direction shortly.
> >>
> >> However as a result of the systemd 242 upgrade, which includes 01d2041e41f4
> >> ("meson: stop creating enablement symlinks in /etc during installation"),
> >> services such as systemd-networkd are no longer enabled in images.
> >>
> >> This patch set fixes this problem in addition to satisfying the goal of
> >> moving towards "stateless" configurations.
> >>
> >> The issue with respect to image testing during CI was caused by
> >> systemd-time-wait-sync.service being enabled due to the lack of a default
> >> preset policy:
> >>
> >> https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
> >>
> >> Changes in v6:
> >> - switch configuration to simple overrides in /usr/lib/systemd/*.conf.d
> >> - make systemd RRECOMMENDS rather than RDEPENDS on systemd-conf
> >> - don't exit in postinst as when that executes we're actually a
> >>    concatenation of all fragments
> >> - validate SYSTEMD_AUTO_ENABLE is `enable` or `disable`
> >> - rewrite systemctl-native in Python
> >> - moved systemctl preset-all to IMAGE_PREPROCESS so it runs after ROOTFS,
> >>    run for all images, not just read-only
> >>
> >> Changes in v5:
> >> - rebased for systemd 242
> >> - install default preset distribution policy of "enable nothing"
> >>
> >> Alex Kiernan (3):
> >>    systemd-conf: simplify creation of machine-specific configuration
> >>    systemctl-native: Rewrite in Python supporting preset-all and mask
> >>    image: call systemctl preset-all for images
> >>
> >> Jonas Bonn (3):
> >>    systemd: don't build firstboot by default
> >>    systemd: do not create machine-id
> >>    systemd: create preset files instead of installing in image
> >>
> >>   meta/classes/image.bbclass                    |   9 +-
> >>   meta/classes/rootfs-postcommands.bbclass      |   6 +
> >>   meta/classes/systemd.bbclass                  |  41 +-
> >>   .../systemd/systemd-conf/journald.conf        |   3 +
> >>   .../systemd/systemd-conf/logind.conf          |   2 +
> >>   .../systemd/systemd-conf/system.conf          |   2 +
> >>   .../systemd/systemd-conf/system.conf-qemuall  |   3 +
> >>   meta/recipes-core/systemd/systemd-conf_242.bb |  61 +--
> >>   .../systemd/systemd-systemctl/systemctl       | 476 ++++++++++--------
> >>   .../systemd/systemd/99-default.preset         |   1 +
> >>   meta/recipes-core/systemd/systemd_242.bb      |  26 +-
> >>   11 files changed, 360 insertions(+), 270 deletions(-)
> >>   create mode 100644 meta/recipes-core/systemd/systemd-conf/journald.conf
> >>   create mode 100644 meta/recipes-core/systemd/systemd-conf/logind.conf
> >>   create mode 100644 meta/recipes-core/systemd/systemd-conf/system.conf
> >>   create mode 100644 meta/recipes-core/systemd/systemd-conf/system.conf-qemuall
> >>   create mode 100644 meta/recipes-core/systemd/systemd/99-default.preset
> >>
> >
> > Sigh...
> >
> > this still has issues - if you boot with `ro` on the kernel command
> > line and without an initramfs, then / is read-only when systemd starts
> > and it basically refuses to do anything:
> >
> > [    7.222134] systemd[1]: No hostname configured.
> > [    7.227266] systemd[1]: Set hostname to <localhost>.
> > [    7.232622] systemd[1]: System cannot boot: Missing /etc/machine-id
> > and /etc is mounted read-only.
> > [    7.241750] systemd[1]: Booting up is supported only when:
> > [    7.247362] systemd[1]: 1) /etc/machine-id exists and is populated.
> > [    7.253752] systemd[1]: 2) /etc/machine-id exists and is empty.
> > [    7.259757] systemd[1]: 3) /etc/machine-id is missing and /etc is writable.
> >
> > Note this has nothing to do with read-only-rootfs, this is just a
> > regular boot... that said a bunch of things that were broken now work,
> > so it's progress!
> >
> > I'm leaning towards having systemctl-native touch /etc/machine-id when
> > it runs, unless you explicitly ask for stateless in DISTRO_FEATURES...
> > patches to follow.
>
> The paradigm that systemd follows is that /etc is _always_ writable.
> The read-only rootfs that OE produces with a read-only /etc is
> pathological from systemd's point of view (as is your 'ro' kernel
> parameter example).  The way to handle this is to:
>
> i) mount a tmpfs over /etc
> ii) move the contents of /etc to /usr/share/factory/etc at buildtime and
> have tmpfiles.d snippets that take care of populating /etc at runtime
>
> I have a set of patches that does this, but it's all pretty fragile at
> this point in time.  It scans /etc at buildtime, moves files and links
> to factory/{var,etc}, sets up tmpfiles.d snippets for files and
> directories.  Doing this, however, somewhat requires for things that
> _can_ be set up at runtime to be so; what remains in /etc should only be
> stuff that doesn't set itself up at runtime _yet_.  For this reason, I'm
> inclined to say that you _don't_ want to leave the /etc/systemd/system
> nor /etc/machine-id files in the image.
>

I think the problem we're going to bump into is that `ro` getting
passed in on the kernel command line I get from U-Boot and whilst
OSTree gives me enough levers to make that per-boot, I know in our
legacy world (and so lots of other peoples worlds), doing that kind of
change isn't a goer... so whatever we do I think we're going to need
lots of options. Obviously I'm relying on systemd doing a rw remount
of / early in the boot.

I think setting /etc/machine-id blank and populating the
wants/requires (and all the aliases/also stuff...) or doing none of it
are valid options, but what I did with half of it is wrong :|

About to send out a patch set which follow's Chen's suggestion way
back of adding a 'stateless' DISTRO_FEATURE which controls this and
gets you all or nothing, which I think should fix anyone who's
currently broken, but at the same time give us a lever which we can
play with to get an actual stateless build. Persistent mutable /etc
(in fact mutable anything) is the bane of my life, so I'm interested
in making it work... unfortunately there's still quite a lot of gaps!

--
Alex Kiernan

