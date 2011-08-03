Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+OvWLzzns+6YXh6ihrVt4zr23RTjIbuBI=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoUBa-0006ax-KS
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 07:40:07 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p735ZjRu021398
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 00:35:45 -0500
From: Kumar Gala <galak@kernel.crashing.org>
Date: Wed, 3 Aug 2011 00:35:45 -0500
Message-Id: <BC707063-0722-4F72-A066-4E811125354B@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: prelink issue with ppc64?
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
X-List-Received-Date: Wed, 03 Aug 2011 05:40:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

If prelink gets a chance to properly run I get a rootfs that does:

/sbin/init: relocation error: /lib64/libc.so.6: symbol _rtld_global_ro, =
version GLIBC_PRIVATE not defined in file ld64.so.1 with link time =
reference

if 'baselib' is set to /lib we get:

=
/local/home/galak/git/poky/build-p5020/tmp/sysroots/x86_64-linux/usr/sbin/=
prelink: /sbin/init.sysvinit: Using /lib/ld64.so.1, not /lib64/ld64.so.1 =
as dynamic linker

if 'baselib' is set to /lib64 we get:

Assigned virtual address space slots for libraries:
/lib64/ld64.so.1                                             =
00000080f4910000-00000080f49473d0
/lib64/libc.so.6                                             =
00000080f4950000-00000080f4afe090
/lib64/libdl.so.2                                            =
00000080f4b10000-00000080f4b23520
/lib64/libcrypt.so.1                                         =
00000080f4b10000-00000080f4b57708
/lib64/libutil.so.1                                          =
00000080f4b10000-00000080f4b234a0
Would prelink /lib64/ld-2.13.so
Would prelink /lib64/libc-2.13.so

Not sure what prelink is doing but it seems to breaking things.  Any =
ideas?

---

I'm also concerned that we use /etc/prelink.conf when invoking prelink.

- k=


