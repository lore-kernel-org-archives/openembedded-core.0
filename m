Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/pOKFbf8QJFYUmQHAfGREP+an8Ye9y2Dw=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qy6QA-00080W-MN
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 20:18:55 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7TIE1rr032684
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 13:14:02 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <38213ee7d596d7f68544e0513a13d08b7439aece.1314563914.git.paul.eggleton@linux.intel.com>
Date: Mon, 29 Aug 2011 13:14:02 -0500
Message-Id: <6A276FB3-183D-444F-8AC1-0EC514CB389D@kernel.crashing.org>
References: <cover.1314563914.git.paul.eggleton@linux.intel.com>
	<38213ee7d596d7f68544e0513a13d08b7439aece.1314563914.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] binutils: update to 2.21.1a
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
X-List-Received-Date: Mon, 29 Aug 2011 18:18:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 28, 2011, at 3:39 PM, Paul Eggleton wrote:

> 2.21.1 has disappeared upstream. There is no ChangeLog information for
> 2.21.1a, however diff reports only the addition of some cpu/opc files =
in
> cgen/ subdirectory; the source code is otherwise identical.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> ....21.1.bb =3D> binutils-cross-canadian_2.21.1a.bb} |    0
> ...s-cross_2.21.1.bb =3D> binutils-cross_2.21.1a.bb} |    0
> ...ssdk_2.21.1.bb =3D> binutils-crosssdk_2.21.1a.bb} |    0
> .../{binutils_2.21.1.bb =3D> binutils_2.21.1a.bb}    |    9 ++++++---
> 4 files changed, 6 insertions(+), 3 deletions(-)
> rename =
meta/recipes-devtools/binutils/{binutils-cross-canadian_2.21.1.bb =3D> =
binutils-cross-canadian_2.21.1a.bb} (100%)
> rename meta/recipes-devtools/binutils/{binutils-cross_2.21.1.bb =3D> =
binutils-cross_2.21.1a.bb} (100%)
> rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.21.1.bb =3D> =
binutils-crosssdk_2.21.1a.bb} (100%)
> rename meta/recipes-devtools/binutils/{binutils_2.21.1.bb =3D> =
binutils_2.21.1a.bb} (85%)

Don't we need to update:

meta/conf/distro/include/tcmode-default.inc

and possibly:

meta/conf/distro/include/distro_tracking_fields.inc

- k=


