Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D4D2731FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 08:19:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 12 Sep 2016 01:19:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,322,1470726000"; d="scan'208";a="1038630541"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.10.196])
	by fmsmga001.fm.intel.com with ESMTP; 12 Sep 2016 01:19:06 -0700
Message-ID: <1473668344.4627.1.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: bavery <brian.avery@intel.com>, openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 09:19:04 +0100
In-Reply-To: <aa9e2ec2a13162874be2386318dc7883676655c3.1473438968.git.brian.avery@intel.com>
References: <cover.1473438968.git.brian.avery@intel.com>
	<aa9e2ec2a13162874be2386318dc7883676655c3.1473438968.git.brian.avery@intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] qemurunner: print out the runqemu command
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
X-List-Received-Date: Mon, 12 Sep 2016 08:19:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-09-09 at 09:38 -0700, bavery wrote:
> This logs the launch command that was used for runqemu while running
> -c
> testimage.  This way, if I'd like to easily launch qemu manually in
> order to debug a failed test, I know what commmand was run to create
> the qemu instance.

I already have this in my runqemu output:

runqemu - INFO - Running
/home/joshuagl/Projects/poky/build/tmp/sysroots/x86_64-
linux/usr/bin/qemu-system-ppc -net
tap,vlan=0,ifname=tap0,script=no,downscript=no -net nic,model=pcnet  -
machine mac99 -cpu G4 -m 256 -drive file=/home/joshuagl/mess/35/core-
image-lsb-qemuppc-20160902090100.rootfs.ext4,if=virtio,format=raw  -
show-cursor -usb -usbdevice tablet -device virtio-rng-pci -kernel
/home/joshuagl/mess/35/vmlinux-qemuppc.bin -append 'root=/dev/vda rw
highres=off  mem=256M ip=192.168.7.2::192.168.7.1:255.255.255.0
console=ttyS0 console=tty'



