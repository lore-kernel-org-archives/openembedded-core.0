Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX197Bb+LLg8nIjUpMB+2d/bk7ywuhQhBjOI=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QkHKh-0005wc-4X
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 17:08:07 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6MF3wo9018855
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 10:03:59 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <a10de4cf8b424ee95c8e283e75d486be5b3b8eac.1311345613.git.richard.purdie@linuxfoundation.org>
Date: Fri, 22 Jul 2011 10:03:58 -0500
Message-Id: <6FB5127C-35E2-42F7-9763-65BF73085B1E@kernel.crashing.org>
References: <aeea22da699b276a97ca1a17e3c53176c9afd9de.1311345613.git.richard.purdie@linuxfoundation.org>
	<a10de4cf8b424ee95c8e283e75d486be5b3b8eac.1311345613.git.richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/3] conf/machine/tune: Overhaul tune include file variables
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
X-List-Received-Date: Fri, 22 Jul 2011 15:08:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 22, 2011, at 9:49 AM, Richard Purdie wrote:

> There is currently consideradble confusion over how the tune files =
operate
> and how these interact with the rest of the build system. This =
update/overhaul
> changes things so the tune files are primarily resonsible for setting:
>=20
> TUNE_ARCH - What was formerly set as TARGET_ARCH and is the value that
> represents the architecture we're targetting.
>=20
> TUNE_PKGARCH - The value that represents the tune confuration that =
this set
> of tune parameters results in.
>=20
> This allows the significant improvement that the core can now always =
determine
> the target architecture value, even when TARGET_ARCH needs to be reset =
to
> something different and likewise, there is one package architecture =
variable
> the core can reference allowing simplification of the =
BASE_PACKAGE_ARCH, PACKAGE_ARCH
> and FEED_ARCH variables.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---

Can you give an example of how this will work for multilib?

- k=


