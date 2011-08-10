Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18/s23XmiwD/os1vgpn1RLDAHqMZgIJAz0=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qr0LM-0006O1-Oi
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 06:24:37 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7A4K7gY025397
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 23:20:07 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Tue, 9 Aug 2011 23:20:08 -0500
Message-Id: <24988974-E702-4404-BEB2-EB8B946BFC5E@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: finding libgcc.a with meta-toolchain-sdk toolchain
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
X-List-Received-Date: Wed, 10 Aug 2011 04:24:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Trying to build something like u-boot w/the toolchain produced by =
meta-toolchain-sdk and get the following:

$ powerpc-poky-linux-gnuspe-ld -g -Ttext 0x40000 -o hello_world -e =
hello_world hello_world.o libstubs.o -L. -lgcc
powerpc-poky-linux-gnuspe-ld: cannot find -lgcc

If I take on a --verbose I get:
attempt to open ./libgcc.so failed
attempt to open ./libgcc.a failed
attempt to open =
/opt/poky/1.0+snapshot/sysroots/powerpc-poky-linux-gnuspe/usr/local/lib/li=
bgcc.so failed
attempt to open =
/opt/poky/1.0+snapshot/sysroots/powerpc-poky-linux-gnuspe/usr/local/lib/li=
bgcc.a failed
attempt to open =
/opt/poky/1.0+snapshot/sysroots/powerpc-poky-linux-gnuspe/lib/libgcc.so =
failed
attempt to open =
/opt/poky/1.0+snapshot/sysroots/powerpc-poky-linux-gnuspe/lib/libgcc.a =
failed
attempt to open =
/opt/poky/1.0+snapshot/sysroots/powerpc-poky-linux-gnuspe/usr/lib/libgcc.s=
o failed
attempt to open =
/opt/poky/1.0+snapshot/sysroots/powerpc-poky-linux-gnuspe/usr/lib/libgcc.a=
 failed

What do we need to tweak so we can find libgcc.a?

- k=


