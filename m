Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SZ015-0007VX-1h
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 15:29:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 May 2012 06:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="148577844"
Received: from unknown (HELO helios.localnet) ([10.252.120.22])
	by azsmga001.ch.intel.com with ESMTP; 28 May 2012 06:19:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Mon, 28 May 2012 14:19:26 +0100
Message-ID: <1887160.WQ6ARfi1jf@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <1338143382-5982-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338143382-5982-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory.bbclass: add pkg_pre/postinst/rm contents
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
X-List-Received-Date: Mon, 28 May 2012 13:29:47 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Sunday 27 May 2012 20:29:42 Andreas M=FCller wrote:
> A use-case would have been [1].
>=20
> The following tests were performed:
> * image from scratch with old buildhistory contents
> * image from scratch with buildhistory contents from scratch
> * decrement a PR for a test recipe and check if the message
>   'ERROR: Package version for xy went backwards' is displayed.
>=20
> [1] http://patches.openembedded.org/patch/28841/

FWIW I hadn't forgotten about this feature request, although I hadn't g=
ot=20
around to implementing it yet.

I haven't tested your patch but if I read it correctly you are writing =
the=20
scripts out underneath the "value =3D" lines in the package data file. =
My concern=20
with doing this is that it makes those files more difficult to parse. I=
 had=20
thought that the way to do it would be to write these scripts to separa=
te files=20
(e.g. latest.pkg_prerm, latest.pkg_postrm etc.). Would that be OK?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


