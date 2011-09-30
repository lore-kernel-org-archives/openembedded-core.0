Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9gUW-000750-9U for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 19:03:16 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UH4BbN032298 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 18:04:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oRAeTLJ6-Hvn
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 18:04:11 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UH47Cx032282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 18:04:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2011 17:57:41 +0100
In-Reply-To: <cover.1317400021.git.paul.eggleton@linux.intel.com>
References: <cover.1317400021.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317401867.12332.216.camel@ted>
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	p8UH4BbN032298
Subject: Re: [PATCH 0/7] Qt4 upgrade/fixes
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
X-List-Received-Date: Fri, 30 Sep 2011 17:03:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-09-30 at 17:33 +0100, Paul Eggleton wrote:
> This is a pull request for Eric B=C3=A9nard's qt4_upgrade branch, inclu=
ding
> an update of Qt to 4.7.4 (preserving 4.7.3 until other layers such as
> meta-oe, meta-yocto etc. can sync up) as well as several important bug
> fixes.
>=20
> The patches look good; if was to be really picky though I would say tha=
t
> the two demo/doc patches in the series ought to be merged into one patc=
h,
> and there are a few typos in the commit messages. I'm also relying on
> others to review the correctness of the armv6-vfp no-neon patch as I ha=
ve
> no knowledge of this area.
>=20
>=20
> The following changes since commit c54c1280fc0d06a53e23339c3913ec88eead=
13d9:
>=20
>   base.bbclass: Drop unneeded dependency (2011-09-30 11:34:44 +0100)
>=20
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/qt4_upgrad=
e
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?=
h=3Dpaule/qt4_upgrade
>=20
> Denis Carikli (3):
>   qt4.inc: remove the optional documentation package from the demo's
>     RRECOMMENDS
>   qt4(embedded and x11): disable neon for armv6-vfp
>   qt4.inc: package qtdemo's docs in a separate package
>=20
> Eric B=C3=A9nard (3):
>   qt4e-demo-image: improve image
>   qt4: fix generated sdk
>   qt4: update to latest version 4.7.4
>=20
> Otavio Salvador (1):
>   qt4: fix translation support

Thanks Paul. I fixed the typos and queued this on master-next.

Cheers,

Richard



