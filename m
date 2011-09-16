Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4bdh-0000kA-9C for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 18:51:45 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GGqeDX031171 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 17:52:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aEyKXgSErLZk
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 17:52:40 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GGqabC031162
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 17:52:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 17:46:24 +0100
In-Reply-To: <1316177670.3510.31.camel@phil-desktop>
References: <20110911172241.GA3674@chargestorm.se>
	<4E7246EB.2070607@eukrea.com>
	<CAP9ODKqCc3zAuwBoL7Yiet0GKuJKFymZMtStkpwAq88b=ZGibw@mail.gmail.com>
	<201109161212.19780.paul.eggleton@linux.intel.com>
	<4E733F7D.6090109@eukrea.com> <1316177670.3510.31.camel@phil-desktop>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316191592.20858.38.camel@ted>
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	p8GGqeDX031171
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
X-List-Received-Date: Fri, 16 Sep 2011 16:51:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-09-16 at 13:54 +0100, Phil Blundell wrote:
> On Fri, 2011-09-16 at 14:22 +0200, Eric B=C3=A9nard wrote:
> > I don't understand why oe-core's development has to be stopped by yoc=
to's=20
> > releases process but I may not have found the right page on the wiki=20
> > explaining all the details : may you please give me some links concer=
ning this=20
> > policy ?
>=20
> It does seem a little bit strange, yes.  If it's just a short period
> then I don't think there should be any real problem with granting yocto
> a short freeze in oe-core so that they can do their branching. =20
>=20
> Of course, this isn't going to scale very well if every user of oe-core
> starts asking for a development freeze so that they can cut their own
> release branches, and it isn't totally obvious to me that yocto couldn'=
t
> just as easily have branched from some semi-arbitrary point and then
> cherry-picked or reverted a few changes to get to where they wanted. =20
>=20
> Possibly the intent is to make a standalone release of oe-core itself o=
n
> the back of whatever yocto ends up shipping, I dunno.  That seems like
> it might be a reasonable enough way to get a version of OE-core that
> other people can build on without having to repeat all the QA and
> release engineering work that yocto are presumably doing for themselves.

That is exactly what the thought is and its hoped that it will benefit
users. Having some changes of pace and focus (bugfix vs features) to the
development cycle will hopefully be a significant benefit although I
appreciate it will take some getting used to since we've never done it
before. Its only once every six months and only for a few weeks so I
don't think it should be too disruptive...

Cheers,

Richard






