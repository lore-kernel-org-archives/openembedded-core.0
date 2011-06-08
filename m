Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QUGsx-0003oK-Ez
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 13:25:19 +0200
Received: by wwb17 with SMTP id 17so353121wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jun 2011 04:21:58 -0700 (PDT)
Received: by 10.227.205.19 with SMTP id fo19mr2107063wbb.58.1307532117932;
	Wed, 08 Jun 2011 04:21:57 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fm14sm335064wbb.7.2011.06.08.04.21.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Jun 2011 04:21:57 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1307529994.git.kai.kang@windriver.com>
Date: Wed, 8 Jun 2011 13:21:55 +0200
Message-Id: <068A0948-F699-4B80-906A-2FD4C665DC29@dominion.thruhere.net>
References: <cover.1307529994.git.kai.kang@windriver.com>
To: Kang Kai <kai.kang@windriver.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"poky@yoctoproject.org Project" <poky@yoctoproject.org>
Subject: Re: [poky] [PATCH 0/2] ghostscript & libxml-simple-perl: fix compile failures
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
X-List-Received-Date: Wed, 08 Jun 2011 11:25:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Sounding like a broken record here, but these kind of patches need to =
get sent to the oe-core list, not the poky list.

Op 8 jun 2011, om 12:49 heeft Kang Kai het volgende geschreven:

> From: Kang Kai <kai.kang@windriver.com>
>=20
> Hi Saul,
>=20
> These 2 patches are fix for ghostscript and libxml-simple-perl.
> Update SRC_URI for ghostscript to avoid native package affected by =
build os.
> Fix libxml-simple-perl [Yocto 1132].
>=20
> Regards,
>=20
> The following changes since commit =
7f34cd1eb2a459709006ae985a14decd4d2152e6:
>=20
>  tzcode: Update to 2011g (2011-06-06 15:58:42 +0100)
>=20
> are available in the git repository at:
>  git://git.pokylinux.org/poky-contrib.git kangkai/bugfix
>  http://git.pokylinux.org/cgit.cgi//log/?h=3Dkangkai/bugfix
>=20
> Kang Kai (2):
>  ghostscript: update SRC_URI
>  libxml-simple-perl: update EXTRA_PERLFLAGS
>=20
> .../perl/libxml-simple-perl_2.18.bb                |    4 ++--
> .../ghostscript/ghostscript_9.02.bb                |    7 +++++--
> 2 files changed, 7 insertions(+), 4 deletions(-)
>=20
> --=20
> 1.7.5.1.300.gc565c
>=20
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky



