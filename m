Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+iahkuNnAuRa+mAoFrQ9OTsTk7bP5ytFE=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qr8Cx-0000Bj-CQ
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 14:48:27 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7AChrO7018609;
	Wed, 10 Aug 2011 07:43:54 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1312967980.6733.35.camel@phil-desktop>
Date: Wed, 10 Aug 2011 07:43:53 -0500
Message-Id: <1A4B195B-C80C-4E0B-9FC2-DBB3E1FC3E2E@kernel.crashing.org>
References: <24988974-E702-4404-BEB2-EB8B946BFC5E@kernel.crashing.org>
	<1312967980.6733.35.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Phil Blundell <philb@gnu.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: finding libgcc.a with meta-toolchain-sdk toolchain
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
X-List-Received-Date: Wed, 10 Aug 2011 12:48:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 10, 2011, at 4:19 AM, Phil Blundell wrote:

> On Tue, 2011-08-09 at 23:20 -0500, Kumar Gala wrote:
>> Trying to build something like u-boot w/the toolchain produced by =
meta-toolchain-sdk and get the following:
>>=20
>> $ powerpc-poky-linux-gnuspe-ld -g -Ttext 0x40000 -o hello_world -e =
hello_world hello_world.o libstubs.o -L. -lgcc
>> powerpc-poky-linux-gnuspe-ld: cannot find -lgcc
>>=20
>> [...]
>>=20
>> What do we need to tweak so we can find libgcc.a?
>=20
> The best/easiest fix is to link with gcc rather than calling ld
> directly.  You can use -nostartfiles to suppress crt1.o and the like.
> If you must invoke ld manually for whatever reason then you will have =
to
> use something like `$(CC) --print-libgcc-file-name` to obtain the path
> to libgcc.

While these are good suggestions, I still think the toolchain is broken =
as u-boot has been this way for sometime and numerous other cross =
toolchains work perfectly fine.

- k=


