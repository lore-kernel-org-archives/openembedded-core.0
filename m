Return-Path: <anders@openpuma.org>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8A52671B26
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 16:45:12 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id b126so697367548oia.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 08:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=openpuma-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=JK4V0hXnN2YZ954Cmkh1QXzfoburYsLXClkR1OfWKHc=;
	b=MdCStTRwLJK3OnkSWWhihsqzadNo7a62IFHWU2njFwp9Onku8Fh2wK75DzWJkdtdyn
	17vdDuk9Rry6ycqIe7mCPjgVavEblQbNLv0uFkTAzbVUZnHEA3O7qjw9zTWSYZcgP3TV
	xHHMe2JXmqK/csNF4PLJYRevFso+ZrfOYiSuS86w+e6Ib9+d048bB/edxxm/ior8EYL8
	mVLExawOqFx0Wp+qePszXgbLRwwVSXna8kkLScSQoljNj61642fgsxaF9bEo0DhSaOiE
	7PZ0TgkDZ5hCaOjnByv1QKEAeWR7LHM+TNylEGCRvI/ubmE8MrITEWywlWB8Y62EJh7N
	UcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=JK4V0hXnN2YZ954Cmkh1QXzfoburYsLXClkR1OfWKHc=;
	b=PKC+1F89dekh9QER7QanQImwvh/jlR0YaIqWZ6j9BVqVk5KcYz9OiU5pnWL1MjIc+9
	wPyC172fvMZUQuqVZN7z32TAK8dPM68A5mAl9Rx9Do0L5bKFi+MgpPrFKxa33g0g0WkJ
	R6tW6TK5BUKvjEZ7TuqccsDoD5ZtLSja0KqPnzoHy+umkR9NkFYb6FZXK1W3NWS42Kpc
	B3IzGoxn+HUvvOZA0G9rHrOsQDmogPGXzkPS4svjF4u5vlPCEyHbFjo93aY2PE+8ba7u
	hAYwA3w82jhaEJtQ0+gVVVhU+5SF6AWo/DGDCHVi69uxj1z5seeZ0j3DK0X7gb3vveLX
	nRSA==
X-Gm-Message-State: AIkVDXL2PXI5mMYkYYVZ3VtsAZavcs/XjRvmNt9sq2berU6ENDnLmvtdCRt3XpLh2EiC9JCf0aQrW4G4ykURBA==
X-Received: by 10.202.181.70 with SMTP id e67mr37599639oif.3.1483980312885;
	Mon, 09 Jan 2017 08:45:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.79.80 with HTTP; Mon, 9 Jan 2017 08:45:12 -0800 (PST)
X-Originating-IP: [172.88.176.4]
In-Reply-To: <CAKTo2Enih-V=anW13QCVkeq_F+BM=COeOyHzasBum=GSt-SsyA@mail.gmail.com>
References: <CAKTo2Em1Lcs19L0M=WpGOJv3aQkQLJuetFsgm6nq_0sVix1X3A@mail.gmail.com>
	<CAKTo2Enih-V=anW13QCVkeq_F+BM=COeOyHzasBum=GSt-SsyA@mail.gmail.com>
From: Anders Oleson <anders@openpuma.org>
Date: Mon, 9 Jan 2017 08:45:12 -0800
Message-ID: <CAKTo2En-3AoLW6oPRcZq7TrZ_DfYbJO8XD6D07S0D2NOh4vXYg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: bug with dpkg-native and sstate-cache mirrors
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
X-List-Received-Date: Mon, 09 Jan 2017 16:45:13 -0000
Content-Type: text/plain; charset=UTF-8

Bump. Can anyone comment on this? Does this sound like a bug? Right forum?

On Tue, Dec 20, 2016 at 7:45 PM, Anders Oleson <anders@openpuma.org> wrote:
> Should I open a bug report for this?
> Does this make sense and does it sound like a problem?
> Are you interested in a patch or fixes? I see some activity with dpkg,
> so I know there's a maintainer out there?
>
> On Fri, Dec 16, 2016 at 11:31 AM, Anders Oleson <anders@openpuma.org> wrote:
>> I originally posted this here:
>> https://lists.yoctoproject.org/pipermail/yocto/2016-December/033542.html.
>> Apologies, I did not know to report OE core issues here.
>>
>> Also, following Jussi's advice I started reading the submission
>> guidelines and I posted the patch to dpkg itself to their list to see
>> if it was something that could be upstreamed. Led to a good discussion
>> here: https://lists.debian.org/debian-dpkg/2016/12/msg00013.html.
>> While this was an expedient way to fix my problem, it probably isn't
>> the best way forward as a real change to dpkg. They have offered to
>> look at submissions to fix what I think is the true root cause - the
>> non-override-able, hard-coded CONFIGDIR.
>>
>> Problem description:
>> 1. user "joe" clones the build repo, ex. poky from Yocto and builds
>> everything, ex. core-system-minimal completely clean build from
>> scratch. The local.conf is set to use package_deb for our system.
>> 2. "joe" is the build master and then publishes the resultant
>> "sstate-cache" in a shared directory to be used as a mirror for the
>> other users. Makes the sstate-cache-mirror directory read-only, etc.
>> 3. "joe" deletes the build directory creates a new one and tests the
>> build in a new directory which works fine and runs quickly using the
>> sstate-cache-mirror.
>> 3. user "bob" clones a similar revision and builds using the
>> SSTATE_MIRROR pointing at the mirror.
>> 4. During "do_rootfs" dpkg (dpkg-native) fails with the message:
>> dpkg: error: error opening configuration directory
>> '/home/net/joe/work/sysgen-mrp/build/tmp/sysroots/x86_64-linux/etc/dpkg/dpkg.cfg.d':
>> Permission denied
>> E: Sub-process dpkg returned an error code (2)
>>
>> What happened is that in dpkg-native, the CONFIGDIR is compiled in and
>> hard-coded to the failing path. dpkg does not currently have a way to
>> override this at runtime in the same way as --instdir and --admindir.
>> So dpkg is still looking for config files user "joes" directory which
>> may:
>> - have wrong permissions
>> - be missing or parent dirs missing
>> - contain malicious garbage because "joe" wants to screw with "bob" :)
>> - any/all of the above (we had a combination)
>>
>> Normally /etc/dpkg/dpkg.d is empty for the native sysroot, so our
>> quick fix was to modify dpkg to just ignore ANY error reading that
>> directory and pretend it was empty (which for Yocto builds it was
>> anyway). This was preferable to removing the whole package from the
>> SSTATE_MIRROR to force rebuilds in each work directory. See the patch
>> I posted to the Yocto list linked above. Debian dpkg developers don't
>> want to remove those checks and that seems advisable.
>>
>> So that leaves two options that I can see (is there an easier/better fix?):
>> - we can carry a patch to dpkg-native similar to what I posted. For
>> Yocto/OE it probably is good enough, at least if we limit it to
>> dpkg-native
>> - add something like a --configdir command line switch to dpkg so that
>> we can point it toward the proper sysroot rather than use the compiled
>> in default
>>
>> I'd actually prefer the second option because, for one thing, it would
>> eliminate the baked in paths that contain user names, etc. I'd suggest
>> that if we pass in --configdir we should configure/compile dpkg-native
>> with the default paths pointing to neutral, constant, invalid paths to
>> avoid leaking build specific information into sstate and to catch
>> errors.
>>
>> Does this sound like I'm on the right track or like something that
>> could be included? I'd like to fix this so that it doesn't sneak up on
>> someone else.
>>
>> I'm willing to take a hack at it and test it in the scenario where
>> this bit us. It would involve steps:
>> 1. develop a patch to dpkg to add the option
>> 2. develop a patch for OE to change the configure for dpkg-native
>> 3. a patch for OE to pass --configdir to dpkg in all the right places.
>> I could use help to insure I find them all.
>>
>> Thanks,
>>
>> Anders
>>
>> error log below:
>> ----------------------
>> ERROR: system-image-1.0-r0 do_rootfs: Unable to install packages.
>> Command '/home/local/MrProductName/mrp-system/build/tmp/sysroots/x86_64-linux/usr/bin/apt-get
>>  install --force-yes --allow-unauthenticated bash run-postinsts
>> packagegroup-core-eclipse-debug mrp-ofp dosfstools apt e2fsprogs dpkg
>> packagegroup-core-boot' returned 100:
>> Reading package lists...
>> Building dependency tree...
>> The following extra packages will be installed:
>>   base-files base-passwd busybox busybox-hwclock busybox-syslog busybox-udhcpc
>>   ca-certificates debianutils debianutils-run-parts e2fsprogs-badblocks
>>   e2fsprogs-e2fsck e2fsprogs-mke2fs eudev gdbserver init-ifupdown initscripts
>>   initscripts-functions kernel-4.4.26-yocto-standard kernel-module-uvesafb
>>   libblkid1 libbz2-1 libc6 libc6-thread-db libcom-err2 libcrypto1.0.0 libcurl4
>>   libe2p2 libext2fs2 libgcc1 libgmp10 libgnutls30 libidn11 libkmod2 liblzma5
>>   libperl5 libss2 libssl1.0.0 libstdc++6 libtinfo5 libuuid1 libz1
>>   modutils-initscripts ncurses-terminfo-base netbase nettle
>>   openssh-sftp-server openssl-conf perl sysvinit sysvinit-inittab
>>   sysvinit-pidof tcf-agent udev-cache update-alternatives-opkg update-rc.d
>>   v86d xz
>> Suggested packages:
>>   ncurses-terminfo
>> The following NEW packages will be installed:
>>   apt mrp-ofp base-files base-passwd bash busybox busybox-hwclock
>>   busybox-syslog busybox-udhcpc ca-certificates debianutils
>>   debianutils-run-parts dosfstools dpkg e2fsprogs e2fsprogs-badblocks
>>   e2fsprogs-e2fsck e2fsprogs-mke2fs eudev gdbserver init-ifupdown initscripts
>>   initscripts-functions kernel-4.4.26-yocto-standard kernel-module-uvesafb
>>   libblkid1 libbz2-1 libc6 libc6-thread-db libcom-err2 libcrypto1.0.0 libcurl4
>>   libe2p2 libext2fs2 libgcc1 libgmp10 libgnutls30 libidn11 libkmod2 liblzma5
>>   libperl5 libss2 libssl1.0.0 libstdc++6 libtinfo5 libuuid1 libz1
>>   modutils-initscripts ncurses-terminfo-base netbase nettle
>>   openssh-sftp-server openssl-conf packagegroup-core-boot
>>   packagegroup-core-eclipse-debug perl run-postinsts sysvinit sysvinit-inittab
>>   sysvinit-pidof tcf-agent udev-cache update-alternatives-opkg update-rc.d
>>   v86d xz
>> 0 upgraded, 66 newly installed, 0 to remove and 0 not upgraded.
>> Need to get 0 B/7850 kB of archives.
>> After this operation, 0 B of additional disk space will be used.
>> WARNING: The following packages cannot be authenticated!
>>   libc6 libgcc1 libstdc++6 liblzma5 libz1 libgmp10 nettle libidn11 libgnutls30
>>   libcurl4 update-alternatives-opkg libtinfo5 base-files bash run-postinsts
>>   libperl5 perl xz libbz2-1 dpkg debianutils-run-parts debianutils apt mrp-ofp
>>   base-passwd busybox busybox-hwclock busybox-syslog busybox-udhcpc
>>   ca-certificates dosfstools libcom-err2 libss2 libuuid1 libblkid1 libe2p2
>>   libext2fs2 e2fsprogs-badblocks e2fsprogs e2fsprogs-e2fsck e2fsprogs-mke2fs
>>   libkmod2 eudev gdbserver netbase init-ifupdown initscripts-functions
>>   initscripts kernel-4.4.26-yocto-standard kernel-module-uvesafb
>>   libc6-thread-db libcrypto1.0.0 libssl1.0.0 modutils-initscripts
>>   ncurses-terminfo-base openssh-sftp-server openssl-conf v86d sysvinit-pidof
>>   sysvinit-inittab sysvinit packagegroup-core-boot tcf-agent
>>   packagegroup-core-eclipse-debug udev-cache update-rc.d
>> Authentication warning overridden.
>> dpkg: error: error opening configuration directory
>> '/home/net/joe/work/sysgen-mrp/build/tmp/sysroots/x86_64-linux/etc/dpkg/dpkg.cfg.d':
>> Permission denied
>> E: Sub-process dpkg returned an error code (2)
>>
>> ERROR: system-image-1.0-r0 do_rootfs: Function failed: do_rootfs
>> ERROR: Logfile of failure stored in:
>> /home/local/MrProductName/mrp-system/build/tmp/work/qemux86-hbdc-linux/system-image/1.0-r0/temp/log.do_rootfs.31848
>> ERROR: Task 9 (/home/local/MrProductName/mrp-system/poky/../meta-system/recipes-core/images/system-image.bb,
>> do_rootfs) failed with exit code '1'

