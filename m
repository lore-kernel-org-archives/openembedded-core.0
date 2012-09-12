Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBnF7-0004oK-U9 for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 15:44:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CDVxeB020040;
	Wed, 12 Sep 2012 14:31:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19954-01; Wed, 12 Sep 2012 14:31:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CDVmft020034
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 12 Sep 2012 14:31:49 +0100
Message-ID: <1347456710.11710.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Wed, 12 Sep 2012 14:31:50 +0100
In-Reply-To: <1347455995-24565-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347455995-24565-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q8CDVxeB020040
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cml1.bbclass: fix kernel menuconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 13:44:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-12 at 15:19 +0200, Andreas M=C3=BCller wrote:
> At some host environments the menuconfig displayed wrong characters ang=
 turned
> unusable.
>=20
> Similar suggested in [1]
>=20
> [1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-August/=
027130.html
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta/classes/cml1.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> index 67f17ad..c773684 100644
> --- a/meta/classes/cml1.bbclass
> +++ b/meta/classes/cml1.bbclass
> @@ -9,7 +9,7 @@ addtask configure after do_unpack do_patch before do_co=
mpile
> =20
>  inherit terminal
> =20
> -OE_TERMINAL_EXPORTS +=3D "HOST_EXTRACFLAGS HOSTLDFLAGS HOST_LOADLIBES"
> +OE_TERMINAL_EXPORTS +=3D "HOST_EXTRACFLAGS HOST_LOADLIBES"
>  HOST_EXTRACFLAGS =3D "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
>  HOSTLDFLAGS =3D "${BUILD_LDFLAGS}"
>  HOST_LOADLIBES =3D "-lncurses"

This effectively just reverts the previous change. The real problem is
that ncurses-native is broken. Could we figure out how/why
ncurses-native is broken and fix the real problem rather than hacking
around it please?

FWIW I've been unable to reproduce this locally :(.

Cheers,

Richard



