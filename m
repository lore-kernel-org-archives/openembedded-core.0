Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/sTOqdFa3G8ypO41XK7jO2J/nMaKoAlfA=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmJhW-0006pN-1m
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 08:04:06 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6S5PlWu025853
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 00:25:48 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <1311759058.2344.344.camel@rex>
Date: Thu, 28 Jul 2011 00:25:47 -0500
Message-Id: <CCDC209E-514C-425B-A60E-EC7D704E244A@kernel.crashing.org>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<969FA904-0086-42FA-B605-07B74FB728B4@kernel.crashing.org>
	<1311688752.2344.238.camel@rex>
	<627CF4AB-F07D-4285-B31C-3C5631270420@kernel.crashing.org>
	<1311697113.2344.268.camel@rex>
	<7B0836D8-31B6-407E-848E-FED9C5BFE78A@kernel.crashing.org>
	<1311720776.2344.319.camel@rex>
	<9A300C7A-E352-4566-AB92-88DF3CF743D7@kernel.crashing.org>
	<1311755778.2344.325.camel@rex>
	<704B147D-6F12-4534-9C34-01AE69290717@dominion.thruhere.net>
	<1311759058.2344.344.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Add basic PowerPC core tune config (bug?)
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
X-List-Received-Date: Thu, 28 Jul 2011 06:04:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

For some reason when I get to do_rootfs for core-image-sato when using =
rpms I run into an issue in that:

${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}

Isn't expanding or taking the assignment in =
meta/conf/machine/include/tune-ppcFOO.inc but just using what it found =
in meta/conf/bitbake.conf

the tune-ppcFOO.inc looks like:

DEFAULTTUNE ?=3D "ppce5500"

require conf/machine/include/powerpc/arch-powerpc64.inc

TUNEVALID[ppce5500] =3D "Enable ppce5500 specific processor =
optimizations"
TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", =
"-mcpu=3De5500", "", d)}"
TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", =
"ppce5500", "", d)}"

AVAILTUNES +=3D "ppce5500"
TUNE_FEATURES_tune-ppce5500 =3D "m64 hard-fpu ppce5500"
PACKAGE_EXTRA_ARCHS_tune-ppce5500 =3D "powerpc64 ppce5500"

any ideas?

- k=


