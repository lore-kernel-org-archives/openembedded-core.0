Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18PxEluL+xV8LXLQUGU90jxPFDAmEHCtqE=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoUVe-0007JG-1p
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 08:00:50 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p735uSYe031356
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 00:56:29 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Wed, 3 Aug 2011 00:56:29 -0500
Message-Id: <7243E238-0352-4F5F-A675-D7CB99DFB726@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: ldconfig-native needs to be baselib aware?
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
X-List-Received-Date: Wed, 03 Aug 2011 06:00:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

If I have 'baselib=3D/lib64' w/ppc64 I get:

ldconfig -r =
/local/home/galak/git/poky/build-p5020-64/tmp/work/p5020_ds-poky-linux/cor=
e-image-minimal-1.0-r0/rootfs -c new -v
./ldconfig: Can't stat /usr/lib: No such file or directory
/lib:

Seems that is an issue, also not sure how this is suppose to work in a =
mutilib scenario.

- k=


