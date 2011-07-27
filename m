Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qm80u-00062o-1w
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 19:35:20 +0200
Received: by wyg30 with SMTP id 30so1334541wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 10:31:05 -0700 (PDT)
Received: by 10.227.134.136 with SMTP id j8mr6511542wbt.42.1311787865459;
	Wed, 27 Jul 2011 10:31:05 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fr7sm87190wbb.5.2011.07.27.10.31.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 10:31:04 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
Date: Wed, 27 Jul 2011 19:31:02 +0200
Message-Id: <03130D5D-C573-4B6D-949D-EA7EEB7A5A76@dominion.thruhere.net>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: do_rootfs broken, was: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Wed, 27 Jul 2011 17:35:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<snip patch>

It looks like PACKAGE_*_ARCHS is broken in the rootfs class:

cat =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-li=
nux-gnueabi/efl-nodm-image-1.0-r0/opkg.conf:
arch all 1
arch any 6
arch noarch 11
arch arm 16
arch beagleboard 21

But the one in the opkg config package is correct:

koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/deploy$ =
dpkg-deb -x ipk/beagleboard/opkg-config-base_1.0-r0_beagleboard.ipk tmp/
koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/deploy$ cat =
tmp/etc/opkg/arch.conf=20
arch all 1
arch any 6
arch noarch 11
arch arm 16
arch armv4 21
arch armv4t 26
arch armv5te 31
arch armv6 36
arch armv7 41
arch armv7a 46
arch beagleboard 51
koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/deploy$=20



