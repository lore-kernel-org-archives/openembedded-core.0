Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R8uLq-0005yR-KU for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 15:39:06 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SDdwjU006957; Wed, 28 Sep 2011 14:39:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nnP9MMS0N+Vp; Wed, 28 Sep 2011 14:39:58 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8SDdrmv006939
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Wed, 28 Sep 2011 14:39:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 14:33:28 +0100
In-Reply-To: <CAP9ODKqA7=3dCZVih09g_5Dv4fbOaonv7AEAoLmJquNV32vSAA@mail.gmail.com>
References: <20110911172241.GA3674@chargestorm.se>
	<D9F00ABD-04FA-4A75-BB1C-13B9BBDC4C54@dominion.thruhere.net>
	<4E79E3A9.8080804@eukrea.com>
	<201109281111.33193.paul.eggleton@linux.intel.com>
	<4E82F59B.7080808@eukrea.com>
	<CAP9ODKqA7=3dCZVih09g_5Dv4fbOaonv7AEAoLmJquNV32vSAA@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317216815.26109.255.camel@ted>
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	p8SDdwjU006957
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Wed, 28 Sep 2011 13:39:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2011-09-28 at 10:11 -0300, Otavio Salvador wrote:
> On Wed, Sep 28, 2011 at 07:23, Eric B=C3=A9nard <eric@eukrea.com> wrote=
:
> > I have the patch locally and I will (really) work on this tonight.
> > Sorry for the delay I've been overbusy since last wednesday.
>=20
> Now that this is going into master, I think we ought to update it
> directly instead of adding the newer version.

What we'll do is add the new version, someone will tell me when meta-oe
is updated and then we'll remove the old one.=20

There are a few other pieces I think need to transition out of OE-Core
at this point:

eglibc 2.12
gcc 4.5
gnome-vfs

so if we could move them over to meta-oe at the same time I think that
would be good. If the gcc 4.5 over there already is fine, we can just
remove the OE-Core version.=20

Any help in sorting this out would be appreciated as the patch backlog
and release are taking up a lot of my time atm.

Cheers,

Richard




