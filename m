Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id D5F2E608DD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 21:15:24 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z8so18466373ioh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 13:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cta1IyNCvqffWAiwPFjV7/JOhqls5bsmFUCJlw4sWG8=;
	b=dMK6EFh73c/j2xCgEXmufz9jUsyUwR+kSQ+11PdulhTB4+yi9kh+ERt94jNeHhc54m
	Fch2gqDNFDxMJMOxCE32sEK6kbwBwbhL5UoSVqbDmkNzpahNEBd66iCB5HigQdFH48MO
	KDC1cpLcxCzuLDoP6vYsHGugstrkSDhEQs708h2RYGgmN56zSzr/yR22yTxYHH5yhzCE
	sRboYgKXGKQRf4BuszyFxZtW6RDQ2q1vTHw0JJpb6nAg3LXKuSEogno+zmA/psGmbRLH
	sy0/rl9h+Z3ZHwjmrPXQ6FnZ6roSirtflIBoX2ZHVmHrQbwibouPNle0ZYuoYoVUC0bc
	6lEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cta1IyNCvqffWAiwPFjV7/JOhqls5bsmFUCJlw4sWG8=;
	b=ewg16yyqfrTnMcr75E6ej3kY1lkT6clIw9AxLBseXv47RzyL1+JF8l46er7oKQwE8s
	PWUCbtouRxV2pxtWMU6lmXKTkE3ofTXHHb1nDqDOgAyVc7CQSA6+gvcaoA1fijFCURTS
	Rx/HPNjPZdbKOn9fzTjE8mO4LYSJBbpSTJFMYAc22nxw5xLwnWaQNdL1ZLeCSUjYsZ+x
	gepOlPTv1fy/ECuOZjzDH6tMprAUFATeXJ5g7YI1fjFW8/IR1BOoIDLSE5GS64/w0KPq
	JafdzBH83D1AwJMfR6mAv+bub1G9FSy+I742K3aw7bHdaIsUI9pJnw9RmAD4LFbyAofg
	6guA==
X-Gm-Message-State: APjAAAWC2mYuo6VctDiVUE7FnFR9JEfIdHGIy0D5Qg9Ue/X85G3WSZ8+
	44pbbhR08ccmvc59KX7Doa5rjZhJfHpUUhfEkkY=
X-Google-Smtp-Source: APXvYqwOdbSuGqRpXwloJD4Gzp/VW2bfvkQTa2ASNzFXC7E5634tQ2JeRDsGNPr6RUUXg7heaUqsQOykMz92+S9UvP8=
X-Received: by 2002:a05:6602:2815:: with SMTP id
	d21mr19822925ioe.217.1580764525742; 
	Mon, 03 Feb 2020 13:15:25 -0800 (PST)
MIME-Version: 1.0
References: <20200127231306.46105-1-alex.kiernan@gmail.com>
	<b672e48f8e33b9ea75b9772321f2db0951b38942.camel@linuxfoundation.org>
	<CAO5Uq5SGEmZCDvfMN=d=q_m40OohtLozOHBmRji8snYj4MZEeg@mail.gmail.com>
	<CAO5Uq5SG16CTCdNT1O7DgGc2Y4qUXrDU8VU1f9ox_WCL0a1kgg@mail.gmail.com>
	<CAO5Uq5THBhHjkOH+r-yP3Y3nJF2KdVetoffmd2Cvy0LzSKzD+g@mail.gmail.com>
	<EAC0C485-76C4-441F-B123-C3407E1D247E@gmail.com>
In-Reply-To: <EAC0C485-76C4-441F-B123-C3407E1D247E@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 3 Feb 2020 21:15:14 +0000
Message-ID: <CAO5Uq5SHnUkyzXrmAQA6O1HQ0uWp=koiOK7grYUKtXPi4KK08Q@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Upgrade 243.2 -> 243.4-latest
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
X-List-Received-Date: Mon, 03 Feb 2020 21:15:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 3, 2020 at 8:51 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Since move to 243 latest needs further work, how about moving straight to 244?
>
> Alex
>

Having realised it was local to OE-Core, it was easy to find the problem.

The upstream change that I guessed at before is what's caused the
behaviour change:

commit 53d8feeb2334c396dcfa7106c78ce1791fb5d0c4
Author: Michal Suchanek <msuchanek@suse.de>
Date:   Mon Nov 4 21:23:15 2019 +0100

    libblkid: open device in nonblock mode.

    When autoclose is set (kernel default but many distributions reverse the
    setting) opening a CD-rom device causes the tray to close.

    The function of blkid is to report the current state of the device and
    not to change it. Hence it should use O_NONBLOCK when opening the
    device to avoid closing a CD-rom tray.

    blkid is used liberally in scripts so it can potentially interfere with
    the user operating the CD-rom hardware.

Which causes a blizzard of "ide-cd: hdc: tray open" when you have our
local changes:

commit 90dcf2574daca8e7bf35074c46a2729a82acfe8b (HEAD -> devtool, tag:
devtool-patched, devtool-no-overrides)
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Thu Feb 21 16:38:38 2019 +0800

    rules: watch metadata changes in ide devices

    Formatting IDE storage does not trigger "change" uevents. As a result
    clients using udev API don't get any updates afterwards and get outdated
    information about the device.
    ...
    root@qemux86-64:~# mkfs.ext4 -F /dev/hda1
    Creating filesystem with 262144 4k blocks and 65536 inodes
    Filesystem UUID: 98791eb2-2bf3-47ad-b4d8-4cf7e914eee2

    root@qemux86-64:~# ls /dev/disk/by-uuid/98791eb2-2bf3-47ad-b4d8-4cf7e914eee2
    ls: cannot access
'/dev/disk/by-uuid/98791eb2-2bf3-47ad-b4d8-4cf7e914eee2': No such file
or directory
    ...
    Include hd* in a match for watch option assignment.

    Upstream-Status: Denied

    qemu by default emulates IDE and the linux-yocto kernel(s) use
    CONFIG_IDE instead of the more modern libsata, so disks appear as
    /dev/hd*. A similar patch rejected by upstream because CONFIG_IDE
    is deprecated.

    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
    [rebased for systemd 241]
    Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
    [rebased for systemd 243]
    Signed-off-by: Scott Murray <scott.murray@konsulko.com>

    %% original patch: 0005-rules-watch-metadata-changes-in-ide-devices.patch

commit 2c49075af99308c25fbfd17ce4f28243cba3e4ec
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Thu Feb 21 16:28:21 2019 +0800

    rules: whitelist hd* devices

    qemu by default emulates IDE and the linux-yocto kernel(s) use
    CONFIG_IDE instead of the more modern libsata, so disks appear as
    /dev/hd*. Patch rejected upstream because CONFIG_IDE is deprecated.

    Upstream-Status: Denied [https://github.com/systemd/systemd/pull/1276]

    Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    [rebased for systemd 241]
    Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
    [rebased for systemd 243]
    Signed-off-by: Scott Murray <scott.murray@konsulko.com>

    %% original patch: 0004-rules-whitelist-hd-devices.patch

Short of dropping the the local changes, which (from reading the
commit messages) seem to be mostly there to fix up issues with qemu,
I'm not sure what else to do. I can't see upstream wanting to change
the commit they merged as they already rejected these ones.

Reading backwards we seem to have been carrying these two local changes since:

commit 5702a19f1c91f9d091a15ad30e73f946c5f9fd31
Author: Patrick Ohly <patrick.ohly@intel.com>
Date:   Mon Sep 21 16:30:10 2015 +0200

    systemd: apply persistent storage udev rules also for /dev/hd*

    This fixes booting with initramfs and root=UUID on machines with IDE
    disks, like "runqemu hdddirect", and kernels which still use the
    deprecated CONFIG_IDE.

    v2: Rebased against current master-next.

    (From OE-Core rev: 3d27dfb7e78b8e17b76fcc1d8f8e2b29ca26b0df)

> > On 3 Feb 2020, at 21.26, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> >> On Mon, Feb 3, 2020 at 7:55 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >>
> >> Hi Richard
> >>
> >>> On Mon, Feb 3, 2020 at 2:13 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >>>
> >>> On Mon, Feb 3, 2020 at 10:26 AM Richard Purdie
> >>> <richard.purdie@linuxfoundation.org> wrote:
> >>>>
> >>>>> On Mon, 2020-01-27 at 23:13 +0000, Alex Kiernan wrote:
> >>>>> Update to latest on the 243 stable branch. This includes (amongst other
> >>>>> fixes) seccomp filter changes which fix failures with glibc 2.31, e.g.
> >>>>>
> >>>>>  systemd-journald[543]: Assertion 'clock_gettime(map_clock_id(clock_id), &ts) == 0' failed at src/basic/time-util.c:55, function now(). Aborting.
> >>>>>
> >>>>> Rebase 0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> >>>>>
> >>>>> Drop 0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch,
> >>>>> fixed in 5c0224c7bf3c ("Handle d_type == DT_UNKNOWN correctly").
> >>>>>
> >>>>> Drop 0001-seccomp-more-comprehensive-protection-against-libsec.patch,
> >>>>> fixed in 70e8c1978a9a ("seccomp: real syscall numbers are >= 0").
> >>>>
> >>>> Unfortunately something in this causes:
> >>>>
> >>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/412
> >>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/413
> >>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/1545
> >>>>
> >>>
> >>> That's disappointing...
> >>>
> >>
> >> I'm failing to reproduce this - am I right in thinking the error I
> >> should be looking for is this one:
> >>
> >> [ 3.997360] ide-cd: hdc: tray open
> >> [ 3.999321] print_req_error: I/O error, dev hdc, sector 8388592 flags 80700
> >>
> >> or some variation on it?
> >>
> >> I've got testimage running across a number of the images I think are
> >> the ones that are being run and I can't get any of them to fail.
> >>
> >
> > Scratch that... it looks like one of the local changes is necessary to
> > cause this - I'd foolishly reused an external source tree rather than
> > just letting devtool deal with it.
> >
> > --
> > Alex Kiernan
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Alex Kiernan

