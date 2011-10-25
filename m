Received: from stoexhub02.domain01.net ([83.145.59.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RIaJD-0004GX-LW
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 08:16:23 +0200
Received: from localhost (85.231.30.150) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.83.0; Tue, 25 Oct 2011
	08:09:16 +0200
From: Anders Darander <anders@chargestorm.se>
Organization: ChargeStorm AB
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 25 Oct 2011 08:09:34 +0200
User-Agent: KMail/1.13.7 (Linux/3.0.0-2-amd64; KDE/4.6.5; x86_64; ; )
X-Accept-Language: sv, en, de
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
MIME-Version: 1.0
Message-ID: <201110250809.34347.anders@chargestorm.se>
X-GFI-SMTP-Submission: 1
Subject: Issue with RDEPENDS in module.bbclass for initramfs
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
X-List-Received-Date: Tue, 25 Oct 2011 06:16:23 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable


We have recently started investigating to make an even smaller build of
our local distro & machine. This smaller build should be run exclusively
from an initramfs, thus we have a need to redu=C4=87e the size of the rootfs
as much as possible. (Especially as we'd still like some "bigger"
tools/pieces in the initramfs).

However, our first attempt to create a small image turned our to be
larger than expected. After a first investigation, it turns out that our
external kernel modules have an RDEPENDS on kernel-image (this is from
module.bbclass). As we're creating an initramfs-based rootfs, this is
obviously not desired... Locally removeing that RDEPENDS reduces the
image as expected...

I understand that in the general distro case, there is a need to be able
to express a dependency on a certain kernel version. However, I really
don't think that bringing in the kernel-image is a good idea, not an
general embedded platforms at least. (On the x86 this is usually not a
problem, as you almost always have the kernel as a part of the rootfs
anyway).

Could we come up with another way of expressing this dependency? That
would definitely be valuable for the small-ish embedded systems.

Cheers,
Anders

=2D-=20
Anders Darander
ChargeStorm AB / eStorm AB


