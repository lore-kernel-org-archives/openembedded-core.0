Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 623A46D13F;
	Mon, 21 Oct 2013 08:58:44 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id eh20so260049lab.25
	for <multiple recipients>; Mon, 21 Oct 2013 01:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+dWKHLiIw3600Eva1/iZwh0nrrJGc6euxhf5homChiI=;
	b=ZAqBM32/iQEEGZBrB01Ewa2q9kQAP3XC9Vp7ljFKY55fYB6eo1LR73TR+oQOoqkXqJ
	ToXvFr3ISCgCM0s6NV+4VcOkaiaOLnBFZObhE/8X0qtHHkPmLxlcPKaIyebZW+mcfx0N
	Sv58An03+QHzfVBCwbN+BWFF/MNdIDcg6JUawpyNuyTStptAk7rdSTKOAZ7Ip0Aj7ZaE
	aQwZnaXYsNTsYNd94csoBO85iCmvCATQnelXn3mokrg+fB7PrSPEMRGdLDT23YEu4f9K
	qH3p26oDjDlcmHY07XGILPyYHY2CrbyaftUwo4YxDSjksEHiXE+fZ18KxNlkx+0C6hL1
	zfTg==
MIME-Version: 1.0
X-Received: by 10.152.44.133 with SMTP id e5mr339565lam.58.1382345925517; Mon,
	21 Oct 2013 01:58:45 -0700 (PDT)
Received: by 10.112.52.74 with HTTP; Mon, 21 Oct 2013 01:58:45 -0700 (PDT)
In-Reply-To: <20131020194345.GB3709@jama>
References: <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama> <20130622181656.GK14021@jama>
	<20130725162341.GA3280@jama> <20130808225419.GB17945@jama>
	<20130811114403.GG17945@jama> <20130917123058.GC7313@jama>
	<20131020194345.GB3709@jama>
Date: Mon, 21 Oct 2013 10:58:45 +0200
Message-ID: <CAAQYJAvrTQUXHeaNcMQyE88WAF1ZySq6y+hCJD3Kpob9dOkhSg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world
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
X-List-Received-Date: Mon, 21 Oct 2013 08:58:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

<cut>
> qemux86* common (5):
> meta-openembedded/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb, do_rootfs
</cut>

Hi Martin, thanks for taking care of all those builds.
About this new do_rootfs failure [1], it seems related to update-rc.d
/postinst code.

As you already know, for this image we don't want any initscript nor
package manager cruft but now and then some change in oe-core opens
unwanted doors...

I'll investigate what's happening: seems strange it only fails on x86*.

Cheers
Andrea


[1]
ERROR: Function failed: do_rootfs (log file is located at
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/temp/log.do_rootfs.23292)
ERROR: Logfile of failure stored in:
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/temp/log.do_rootfs.23292
Log data follows:
| DEBUG: Executing python function rootfs_process_ignore
| DEBUG: Python function rootfs_process_ignore finished
| DEBUG: Executing python function rootfs_runtime_mapping
| DEBUG: Python function rootfs_runtime_mapping finished
| DEBUG: Executing shell function do_rootfs
| Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/ipk/Packages.
| Updated list of available packages in
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/lists/oe.
| Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/ipk/all/Packages.
| Updated list of available packages in
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/lists/oe-all.
| Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/ipk/i586/Packages.
| Updated list of available packages in
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/lists/oe-i586.
| Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/ipk/qemux86/Packages.
| Updated list of available packages in
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/lists/oe-qemux86.
| Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/ipk/Packages.
| Updated list of available packages in
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/lists/oe.
| Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/ipk/all/Packages.
| Updated list of available packages in
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/lists/oe-all.
| Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/ipk/i586/Packages.
| Updated list of available packages in
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/lists/oe-i586.
| Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/ipk/qemux86/Packages.
| Updated list of available packages in
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/lists/oe-qemux86.
| Installing kexec-klibc (2.0.2-r0.16) to root...
| Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/ipk/i586/kexec-klibc_2.0.2-r0.16_i586.ipk.
| Installing run-postinsts (1.0-r9.26) to root...
| Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/ipk/i586/run-postinsts_1.0-r9.26_i586.ipk.
| Installing update-rc.d (0.7-r5.37) to root...
| Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/ipk/all/update-rc.d_0.7-r5.37_all.ipk.
| Installing ubiattach-klibc (1.5.0-r0.28) to root...
| Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/ipk/i586/ubiattach-klibc_1.5.0-r0.28_i586.ipk.
| Installing kexecboot-klibc (0.6-r0.2) to root...
| Downloading file:/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/deploy/ipk/qemux86/kexecboot-klibc_0.6-r0.2_qemux86.ipk.
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/info/run-postinsts.postinst:
8: /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs//var/lib/opkg/info/run-postinsts.postinst:
/etc/init.d/run-postinsts: not found
| update-rc.d: /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs/etc/init.d/run-postinsts
exists during rc.d purge (continuing)
|  Removing any system startup links for run-postinsts ...
|  Adding system startup for
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/rootfs/etc/init.d/run-postinsts.
| Configuring kexecboot-klibc.
| Configuring ubiattach-klibc.
| Configuring kexec-klibc.
| Configuring update-rc.d.
| Configuring run-postinsts.
| Building from feeds activated!
| Running intercept scripts:
| log_check: Using
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/temp/log.do_rootfs.23292
as logfile
| Logfile is clean
| makedevs: No entry for root in search list
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_rootfs (log file is located at
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemux86-oe-linux/initramfs-kexecboot-klibc-image/1.0-r0/temp/log.do_rootfs.23292)
NOTE: recipe initramfs-kexecboot-klibc-image-1.0-r0: task do_rootfs: Failed
ERROR: Task 25930
(/home/jenkins/oe/shr-core-branches/shr-core/meta-openembedded/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb,
do_rootfs) failed with exit code '1'

