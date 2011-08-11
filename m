Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18YhF323jdZohC8WMvJErk7A8+TBbHdOK4=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QrQTH-0003WC-MI
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 10:18:32 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7B8Duqv010589;
	Thu, 11 Aug 2011 03:13:57 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1312949543-29183-1-git-send-email-galak@kernel.crashing.org>
Date: Thu, 11 Aug 2011 03:13:56 -0500
Message-Id: <3D70373A-131A-4FED-A1F3-DF55B943544B@kernel.crashing.org>
References: <1312949543-29183-1-git-send-email-galak@kernel.crashing.org>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: move --enable-target-optspace workaround to just gcc-4.5.1
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
X-List-Received-Date: Thu, 11 Aug 2011 08:18:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 9, 2011, at 11:12 PM, Kumar Gala wrote:

> For ppc we disable '--enable-target-optspace' because of a bug in gcc
> 4.5.x.  gcc 4.6.x fixes this issue so no need to do this.
>=20
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
> meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    8 ++++++++
> meta/recipes-devtools/gcc/gcc-4.6.inc              |    2 +-
> meta/recipes-devtools/gcc/gcc-configure-common.inc |    7 +------
> 3 files changed, 10 insertions(+), 7 deletions(-)

Khem,

When I drop to do this I see the following:

| =
/local/home/galak/git/poky-gcc-opt/build/tmp/sysroots/x86_64-linux/usr/lib=
/ppc603e-poky-linux.gcc-cross-intermediate/gcc/powerpc-poky-linux/4.6.1/cr=
tend.o: In function `__do_global_ctors_aux':
| crtstuff.c:(.text+0xc): undefined reference to `_savegpr_31'

I noticed some gcc bug about 4.5.x that you where on, but not sure why =
we same issue on 4.6 as it has the patch you reference about this issue.

I don't quite understand what it was the patch was doing that you =
referenced so I'm a bit stuck at this point.

- k=


