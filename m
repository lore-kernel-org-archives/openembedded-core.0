Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3EBC56BE1F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 19:01:24 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id up15so839692pbc.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 12:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=EnaYK0hVgqjlFH5ME3AYB43R8vDDaa1Sdx4Fvasp1UA=;
	b=MPDs3KKm6quK98VDkQzB/MLmB7Z5toCz1g6FgNBMlHBMGSWpJ54hEx7TxuC/OBp8Ki
	+mv3GArCz4Y1WRLcQah9+uDkaN2oPP07qdjgH/lykskoe0wrT5uicbNIYRpWsX5j+fgm
	i1bHgfLdbO0nicCsni2gRBonNjXulE0Wi5NASo1vkXf6XINipSBz7mEpwkGR8YyUjkib
	xqJ2BHvELXAJ+RLYYhhDSB1ln0lE3TB9sGi0pJEdjcWu2NfeKVfNPI28/wuH6BbBXtWB
	hC5BiRfbQJrWYEPgCOYQtqpJ9k3ZIzX62EezAVcvzSCaG40oogEC61+WBlFCQ4wpD9NW
	Ynig==
X-Received: by 10.66.250.47 with SMTP id yz15mr6095642pac.154.1377802884727;
	Thu, 29 Aug 2013 12:01:24 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id
	tg7sm36939199pbc.36.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 12:01:23 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <20130829115339.a5c5c4a29245e5c988b774ab8f895ac5.53f04ab59e.wbe@email15.secureserver.net>
Date: Thu, 29 Aug 2013 23:01:16 +0400
Message-Id: <A259F4C4-2C7F-4835-961E-3F2EEF8F0FD6@gmail.com>
References: <20130829115339.a5c5c4a29245e5c988b774ab8f895ac5.53f04ab59e.wbe@email15.secureserver.net>
To: <rewitt@declaratino.com>
X-Mailer: Apple Mail (2.1498)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Thu, 29 Aug 2013 19:01:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Aug 29, 2013, at 10:53 PM, <rewitt@declaratino.com> wrote:

> I actually set up a build to get a vexpress-a15 booting in qemu with
> neon support. However, I didn't use the yocto kernel and just pointed at
> my own defconfig and kernel version 3.10.7. If it would be helpful for
> you, I could put my changes up on github.
> 
> The weirdest thing was if I just used the defconfig that is in the
> kernel for vexpress it wouldn't boot, I had to tweak it a bit.

This is the thing, I was using this as an excuse to learn linux-yocto
kernel. I actually put off using linux-yocto for a while, and tended
to use the official linux kernel, or vendor specific kernels (Xilinx,
TI Arago, Freescale, etc) for actual target devices.

If you could share your defconfig, I'll try it with the standard
linux kernel.

I'm doing this to get the process of using Yocto to build a representative
QEMU emulator, and then using LaunchPad and Soyuz locally to
build Ubuntu on a virtual machine, rather than just re-use the official
Ubuntu binary packages. This way, I have more control over the 
toolchain, and options, rather than use the existing armel or armhf
machine configurations supplied by Debian/Ubuntu.

Best regards,

Elvis Dowson

