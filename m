Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BCBAB7845D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 09:01:57 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5G91ubY025668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 16 Jun 2017 10:01:57 +0100
Message-ID: <1497603716.24449.10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Jun 2017 10:01:56 +0100
In-Reply-To: <CAMKF1soDPfSjL15dk-NB3_Hsh_rhY-VbULfeH6E32_HN5a5u-g@mail.gmail.com>
References: <1497447757-30951-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1497447757-30951-3-git-send-email-richard.purdie@linuxfoundation.org>
	<CAMKF1soDPfSjL15dk-NB3_Hsh_rhY-VbULfeH6E32_HN5a5u-g@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 16 Jun 2017 10:01:57 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] package_ipk: Parallelise ipk creation
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
X-List-Received-Date: Fri, 16 Jun 2017 09:01:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-06-15 at 19:28 -0700, Khem Raj wrote:
> On Wed, Jun 14, 2017 at 6:42 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> on a 44 core system, this patch bails out like below. Once I revert
> this it works all fine.
> 
> ERROR: westeros-wpe-image-1.0-r0 do_rootfs: Unable to install
> packages. Command
> '/mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-musleabi/westeros-
> wpe-image/1.0-r0/recipe-sysroot-native/usr/bin/opkg
> --volatile-cache -f /mnt/a/oe/build/tmp
> /work/raspberrypi3-bec-linux-musleabi/westeros-wpe-image/1.0-
> r0/opkg.conf
> -t /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-musleabi/westeros-
> wpe-image/1.0-r0/temp/ipktemp/
> -o /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-musleabi/west
> eros-wpe-image/1.0-r0/rootfs  --force_postinstall
> --prefer-arch-to-version   install 96boards-tools kernel-modules opkg
> packagegroup-core-boot packagegroup-core-ssh-openssh
> packagegroup-ml-wpe packagegroup-westeros psplash-raspberrypi run
> -postinsts runit runit-serialgetty' returned 255:
> Collected errors:
>  * opkg_prepare_url_for_install: Couldn't find anything to satisfy
> '96boards-tools'.
>  * rm_r: Failed to open dir
> /mnt/a/oe/build/tmp/work/raspberrypi3-bec-linux-musleabi/westeros-
> wpe-image/1.0-r0/temp/ipktemp//opkg-J9PI7V:
> No such file or directory.
> 
> ERROR: westeros-wpe-image-1.0-r0 do_rootfs: Function failed:
> do_rootfs

FWIW this was actually from the package_ipk Source: change. I've
reproduced it, and revised that patch.

Cheers,

Richard


