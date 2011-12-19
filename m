Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RcVgW-0007H2-U2
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 06:22:49 +0100
Received: by vbbfc21 with SMTP id fc21so3842350vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 21:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=LSlC6WU2cBX+L8QPPbxNdeLSHiKHdXJnu68CsnQwpGA=;
	b=A+0Ss+KZ3JWfUm31Tga3F+kV5ma7QYdo+oAE1DAeSncTjFr9oTgivcbsxMKMPuTZx4
	SXwzYJsgkGWjyiX7g6rX6Hy212BAjOccRxJKIzvZIbsUVA9HyVyGvB+00pNmOA8pzzub
	s3NsO59QUu1yLQdHz7M/XNS28IFLZUtQHy1xg=
MIME-Version: 1.0
Received: by 10.52.36.112 with SMTP id p16mr10495459vdj.31.1324271745568; Sun,
	18 Dec 2011 21:15:45 -0800 (PST)
Received: by 10.52.89.99 with HTTP; Sun, 18 Dec 2011 21:15:45 -0800 (PST)
Date: Sun, 18 Dec 2011 21:15:45 -0800
Message-ID: <CAGDS+nkN7ZySZE7wNjX0Wmz1hS1h2j29oibD1__6nzKzy3BDfg@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Time for kernel26 MACHINE_FEATURES to go away?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Dec 2011 05:22:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

I was preparing a bsp layer today and discovered that my new machine
needed kernel26 in the MACHINE_FEATURES list or update-modules would
fail during a kernel build.

The kernel26 feature is only referenced in a few places in oe-core:

meta/conf/bitbake.conf:MACHINE_FEATURES ?= "kernel26"
meta/conf/machine/include/qemu.inc:MACHINE_FEATURES = "kernel26 apm
alsa pcmcia bluetooth irda usbgadget screen"
meta/recipes-kernel/update-modules/update-modules_1.0.bb:RDEPENDS_${PN}
= "${@base_contains("MACHINE_FEATURES", "kernel26",
"module-init-tools-depmod","modutils-depmod",d)} "

Perhaps it might be a good time to retire kernel26?

Steve


