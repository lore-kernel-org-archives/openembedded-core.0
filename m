Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ScwuV-0008BX-6L for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 12:59:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q58Ami4Y014482;
	Fri, 8 Jun 2012 11:48:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13414-06; Fri,  8 Jun 2012 11:48:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q58AmYn7014476
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 8 Jun 2012 11:48:35 +0100
Message-ID: <1339152515.30460.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jun 2012 11:48:35 +0100
In-Reply-To: <cover.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q58Ami4Y014482
Cc: Joe Slater <jslater@windriver.com>, "Song.Li" <song.li@windriver.com>,
	Scott Garman <scott.a.garman@intel.com>
Subject: Re: [Consolidated Pull 00/22] Random pulls
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
X-List-Received-Date: Fri, 08 Jun 2012 10:59:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-06-07 at 16:37 -0700, Elizabeth Flanagan wrote:
> Richard,
>=20
> Here are the next batch of pull requests. I'm excluding Mark's rpm work
> as during testing it uncovered some bugs. We've also uncovered some iss=
ues=20
> with connman-gnome DEPENDS that I'll hopefully have a patch for in the =
morning
> that cause it to fail if the DEPENDS aren't met.

Thanks for putting this together :)

> Andreas M=C3=BCller (1):
>   systemtap: Unbreak build for systems with nss headers installed
>=20
> Christopher Larson (2):
>   task-core-basic: drop portmap
>   rpcbind: add and use startup script, move binaries
>=20
> Cristian Iorga (1):
>   telepathy-glib: update to 0.19.0
>=20
> Jesse Zhang (1):
>   beecrypt: disable java
>=20
> Joe Slater (2):
>   shared-mime-info: fix build race condition
>   gettext: install libgettextlib.a before removing it

These had missing Upstream-Status fields, I've fixed this time...

> Mark Hatle (2):
>   shadow-native: Disable nscd support
>   insane.bbclass: Make ldd exec_prefix error reporting easier to read
>=20
> Otavio Salvador (1):
>   openjade: autoreconf to fix building on newer host systems

I'm wondering if we can't autoreconf this ourselves. I've replied to the
patch asking the question.

> Robert P. J. Day (1):
>   README: Correct documentation URL in top-level README file
>=20
> Robert Yang (3):
>   apt-get 0.7.14: hangs at runtime
>   apt 0.7.14: do_compile failed with gcc 4.7
>   rootfs_rpm.bbclass: save rpmlib rather than remove it
>=20
> Ross Burton (3):
>   connman: respect the 3g feature and enable/disable ofono support
>   connman: Document the ACL-breaking sed
>   connman: upgrade to 1.0

I didn't take the patch Ross asked not to be included.

> Scott Garman (1):
>   runqemu-ifup: enable arp proxying
>=20
> Song.Li (1):
>   groff: Fix build on Fedora 17
>=20
> Tom Zanussi (2):
>   gnupg: add libusb to DEPENDS
>   gnupg: disable CCID driver
>=20
> Xiaofeng Yan (1):
>   archiver.bbclass: Reduce some duplication for function get_licenses

I took everything else.

Cheers,

Richard




