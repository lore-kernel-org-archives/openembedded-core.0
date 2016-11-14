Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 52546607F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 16:42:34 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id g23so108567903wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 08:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+zoajNigYbGynhtqtyNyR5tJmQMtV+pk0kHxVHFJQ90=;
	b=jPwFlWtoEbAteQoUkuaZiHJBD0UmMkRvNXKD/X5k3EKD64i4zFzejR3HE/VwwLqxep
	6SbKXqlMHQFk0RZrPB/Emezy9YS6WOVBJE3tNyMyFGAzL/HIzNHsad/kqbZajUWdfTGS
	4lNWtwD8ph2kObkc6N+MfLgZdG04AQemV0xk+XEr5cwZnliaZZwLjmjfmdFcpeHnOnDI
	zqhOuExZ0/W8ahAUsy+a3nLNcqVjkvttDVzsCfDv5zRyLflxrd3GxaJNDJz5fXagfmH2
	JwKhqMU1rfLEMXCjWR9hDPh6/+Dgi5twcSMjC8KzoQHJxItGnMinAzcHNNj3sgqLL9J6
	DYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+zoajNigYbGynhtqtyNyR5tJmQMtV+pk0kHxVHFJQ90=;
	b=ERfgujHUtal3iq3lGKdnZsxk6QUSN0EWR2+0dwmsprk/+kyQX6s9+NJ23iKfXDpV8W
	mvjAkwUjOg/ZGHZMluiXbiahn3ZhxwwxL9861bAzZNIvIsZf2faEBrHj3Q9xOYjLAZHT
	PQDdOv3ctxHXfbAf9l+EdiAUZL1yvXP1VXZvN69LP1l3ZNeKuK9Lw0VpZq0LpsezedLv
	r7GZyF6reqSbaEdyMV1s/YP3uWqk9X6a05TdAbzU15Mqp7i/J8uvxzBJFH0ixc9JFJmg
	1Lf7mZw3Bw9bNeT97ieObmCrjXk0ts1mBCGYmOb3wC2HSdYBfzXGa9bkAG/4nQErH7cm
	FyQw==
X-Gm-Message-State: ABUngvfDG6SqvOMrFpLCxTxBqxGm+o6itL9nN/WniAHU2T7qnRud4XBPm96bjS1w27R3GVGuYeVq2nZoi45W+g==
X-Received: by 10.194.41.163 with SMTP id g3mr19402485wjl.162.1479141755861;
	Mon, 14 Nov 2016 08:42:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Mon, 14 Nov 2016 08:42:15 -0800 (PST)
In-Reply-To: <95b4383a-727c-a022-9a9a-5398c7dabf36@topic.nl>
References: <95b4383a-727c-a022-9a9a-5398c7dabf36@topic.nl>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Mon, 14 Nov 2016 17:42:15 +0100
Message-ID: <CAD4b0_+uUXSEhBPx9-Pde5qNn43yP1fniL8gt9R5qwLh_7PxUg@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Creating 'wic' image
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
X-List-Received-Date: Mon, 14 Nov 2016 16:42:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 14, 2016 at 4:23 PM, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> In order to make life easier for people, I was looking into creating images
> with the "wic" tool.
>
> There's just one big piece of documentation lacking: What's the format it
> wants my rootfs and boot files?
> http://www.yoctoproject.org/docs/2.2/mega-manual/mega-manual.html

I agree that wic is not exactly user-friendly, even after going through
the documentation.

There is no 'special 'format for rootfs or boot files. All that wic does
is assemble a disk image with partitions specified in kickstart file.
Partitions are created by source plugins (scripts/lib/wic/plugins/source
in poky tree).

Currently, you'll find the following files there (I'll comment on the
ones I use[d]):

- bootimg-efi.py

- bootimg-partition.py

  Creates a partition of given --fstype and populates it with files
  listed in IMAGE_BOOT_FILES. The files must exist in DEPLOY_DIR_IMAGE.
  For instance, you can use this plugin to prepare a boot partition for
  BeagleBone Black, copying over MLO and u-boot.img. Alternatively you
  could also prepare a boot partition for Raspberry Pi, copying over
  Broadcom files and kernel image. See
  https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#var-IMAGE_BOOT_FILES
  https://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/tree/conf/machine/include/rpi-base.inc#n55
  https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto-bsp/conf/machine/beaglebone.conf#n42

- bootimg-pcbios.py

- fsimage.py

  This one can be used if you happen to have a filesystem image ready.
  We actually use it in Mender because currently, wic lacks the ability
  to specify a fixed size of a partition (a patch series adding that was
  posted).

  The way it works, you are assumed to have a file system image ready
  upfront and then just specify it like this in kickstart:

    part / --source fsimage --sourceparams=file=<path> --ondisk
mmcblk0 --label primary

- isoimage-isohybrid.py

  For all I know, this one requires syslinux.

- rawcopy.py

  rawcopy puts a verbatim copy of a file inside the disk image,
  basically covers a use case when, for instance, you need to place a
  bootloader at a specific offset. Minor quirks:
  - you are not able to explicitly specify offset, hence commonly used
    with --align,
  - it's usually undesirable to have a partition table entry for this
    partition, hence often used with --no-table

- rootfs_pcbios_ext.py

- rootfs.py

  Creates a partition image with contents of rootfs of a particular
  image (if -e was used) or some directory (not necessarily the actualy
  rootfs). The file system to use is determined by --fstype.

>
> Basically I want an SD card with a FAT boot partition and an ext4 rootfs,
> and "sdimage-bootpart" is pretty close to that.

The 'sdimage-bootpart' image is actually used by beaglebone (as defined
in meta-yocto-bsp). Machine config sets this:

  WKS_FILE = "sdimage-bootpart.wks"

See
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto-bsp/conf/machine/beaglebone.conf#n21
for reference


>
> Without "wic", I build a tar of the rootfs and copy the boot files using a
> bit of shell scripting.
>
> Adding "wic" to IMAGE_FSTYPES just results in an error that I should set
> WKS_FILE but I have no clue as to what file that should point to.

>
> Running wic manually just results in more missing variables that I can't
> find what to specify in them...

Another thing that is not obvious is that wic will not cause bitbake to
build native tools that may be required when building in image. The user
is expected to figure out by themselves.

https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto-bsp/conf/machine/beaglebone.conf#n23


Hope that helps.

Cheers,
-- 
Maciej Borzecki
RnDity

