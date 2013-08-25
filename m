Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE5D6010E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 19:10:01 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id bg4so2595691pad.32
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 12:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=O2JMkRl2Zj1mP4kUaR+1UDzqbZqSyyoscOvsV4yED+k=;
	b=LoM80fPPCKgYltluSCtocrtyCSaaL8FmHGx5PuHPjE6um7YV4lRRkahwPDT1dIiC9Q
	oZOLUC7mVpk4cS2vVe2fnFlUQ5GHWckHHOHsFW4eUeJg1HKH1o/biblh2wpauAdNxH2Y
	Vo0ASxj6GTlhuPORcJA9zjF5NEZTJ4abRyH4YIZLedq7QnoUk6vdB/gGPX4l67mv1mNp
	qV7zwR5i9esvRQ5cRAFMFSmtvugFgt+peS5IpKH+DCXvHnmu06zUOUiq46qGDv+HyyKi
	M6v5TYXR0+4IygcymKnFcNEmU5zPBrbAPb6QxifZk+/p+ynSYYASPMt8axrmj/bVHP/x
	XQgg==
X-Received: by 10.68.183.131 with SMTP id em3mr11380687pbc.56.1377457801989;
	Sun, 25 Aug 2013 12:10:01 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id
	bb1sm13343219pbc.10.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 25 Aug 2013 12:10:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
Date: Sun, 25 Aug 2013 23:09:55 +0400
Message-Id: <4AC41A5E-073D-4973-82BD-F94A8B168F34@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
	<092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Bruce Ashfield <bruce.ashfield@windriver.com>
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
X-List-Received-Date: Sun, 25 Aug 2013 19:10:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Bruce,
                   I noticed that you've committed the changes for =
qemuarma9 KMACHINE configuration to the linux-yocto kernel.

=
http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.8/tree/meta/cfg/ke=
rnel-cache/bsp?h=3Dmeta

I adapted the qemuarm.conf configuration and booted it up, but nothing =
shows up in the QEMU window, I just get a black screen.

Has qemu with the qemuarma9 configuration been successfully built and =
tested before?

This is how my qemuarm.conf looks like, locally at the moment:

#@TYPE: Machine
#@NAME: qemuarmhf
#@DESCRIPTION: Machine configuration for QEMU ARM Cortex A9 hard float.

# Specify the default tune.
DEFAULTTUNE =3D "armv7a-neon"

require conf/machine/include/qemu.inc
require conf/machine/include/tune-cortexa9.inc

# Specify the machine name used by the kernel.
KMACHINE_qemuarm =3D "qemuarma9"

# Specify the kernel image type.
KERNEL_IMAGETYPE =3D "zImage"

# Specify the serial console parameters.
SERIAL_CONSOLE =3D "115200 ttyAMA0"


Elvis Dowson=

