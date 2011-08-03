Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QoUtf-0007hf-Sr
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 08:25:40 +0200
Received: by wyg30 with SMTP id 30so371541wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2011 23:21:17 -0700 (PDT)
Received: by 10.227.198.15 with SMTP id em15mr8543483wbb.3.1312352477795;
	Tue, 02 Aug 2011 23:21:17 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ff6sm405594wbb.15.2011.08.02.23.21.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 02 Aug 2011 23:21:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAGiJk9e01+q-P51iknAFut7jWgSP4NrzLoNDKAjM-wC+=7U+4w@mail.gmail.com>
Date: Wed, 3 Aug 2011 08:21:11 +0200
Message-Id: <726E23E7-68EA-42E8-86B4-0147FCB827FB@dominion.thruhere.net>
References: <CAGiJk9dWLc6TqMRfG4nqfgHbBHnRVb3V7b_QQwH9UPjip1aNeg@mail.gmail.com>
	<CAGiJk9e01+q-P51iknAFut7jWgSP4NrzLoNDKAjM-wC+=7U+4w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: Error running QEMU with oe-core / angstrom console-image, hwclock: can't open '/dev/misc/rtc' : No such file or directory
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
X-List-Received-Date: Wed, 03 Aug 2011 06:25:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 aug. 2011, om 08:18 heeft Samuel Stirtzel het volgende geschreven:

> Hi,
> well I never thought this would work out, but after adding "-o rw" to
> the -append parameters the system started and the login prompt
> appeared.
>=20
> So this problem is solved, for completenes I append my used command
> line to start qemu:
>=20
> qemu-system-arm -M versatilepb -m 128 -kernel
> /var/oe-core/tmp-eglibc/deploy/images/qemuarm/zImage-qemuarm.bin -hda
> =
/var/oe-core/tmp-eglibc/deploy/images/qemuarm/console-image-qemuarm.ext2
> -append "root=3D/dev/sda -o rw"

FWIW, this is what I use:

qemu-system-arm -M versatilepb -m 256M -kernel zImage --append =
'root=3D/dev/sda rw console=3Dtty0 raid=3Dnoautodetect' =
Angstrom-efl-nodm-image-eglibc-ipk-v2011.07-core-qemuarm.rootfs.ext3

Since I'm on OSX I build qemu myself and don't use the wrapper scripts.

regards,

Koen=


