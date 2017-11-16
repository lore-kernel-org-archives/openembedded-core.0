Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9042D78643
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 13:14:39 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vAGDEaU0007687
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 16 Nov 2017 13:14:37 GMT
Message-ID: <1510838076.3952.166.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
Date: Thu, 16 Nov 2017 13:14:36 +0000
In-Reply-To: <CAJTo0LZX253PH2xBQOANZ5rJ35wvDGKO7We2s-XBJjZy594GPA@mail.gmail.com>
References: <1510594546-27018-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAP9ODKquk8Cf-chkGCRTpPurE+ABQZgzgAs=3M4hp0qV5NMWug@mail.gmail.com>
	<CAJTo0LaNR-YLyCX=wHTS42XimeJrfhCWwCmm-hKCwNRkJ1KFmQ@mail.gmail.com>
	<CAP9ODKow3s0rXMmkVYM5b5jsgG-70GnXZkHMK1WxaFSUTA-c2A@mail.gmail.com>
	<CAJTo0LYfAYZruf=9WYFqD2ae2==LdTGwayFeXPxtQ7ROPm-T2w@mail.gmail.com>
	<CAP9ODKqxjDsS34yZ1G0h1wRvZ2QGfOD2rr=+2DG1KGuwcePmTQ@mail.gmail.com>
	<CAJTo0LZX253PH2xBQOANZ5rJ35wvDGKO7We2s-XBJjZy594GPA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu.inc: Drop rng-tools
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
X-List-Received-Date: Thu, 16 Nov 2017 13:14:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-11-16 at 13:11 +0000, Burton, Ross wrote:
> On 15 November 2017 at 19:59, Otavio Salvador <otavio.salvador@ossyst
> ems.com.br> wrote:
> > > Are you enabling the virtio-rng driver so qemu can bridge the
> > host entropy
> > > into the guest?
> > 
> > I am not. Do you have an example of command line for it?
>  https://wiki.qemu.org/Features/VirtIORNG talks about qemu's support
> and what to turn on there (the default qemu machines enable that).
> 
> http://elixir.free-electrons.com/linux/latest/source/drivers/char/hw_
> random/Kconfig documents HW_RANDOM_VIRTIO and says at the top that
> the devices feed into the kernel pool.

Just to add, for qemuarm:

machine/qemuarm.conf:QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet -device virtio-rng-pci"

the key piece being virtio-rng-pci on the commandline.

Cheers,

Richard

