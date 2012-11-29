Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <bjst@sestofb10.enea.se>) id 1Te6d9-00057y-5Z
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 17:06:29 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Thu, 29 Nov 2012 16:52:10 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id AE458290C60;
	Thu, 29 Nov 2012 16:52:10 +0100 (CET)
Date: Thu, 29 Nov 2012 16:52:10 +0100
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121129155210.GC25784@sestofb10.enea.se>
References: <1353600120-22967-1-git-send-email-bjst@enea.com>
	<1353600120-22967-2-git-send-email-bjst@enea.com>
	<1353707361.21863.4.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1353707361.21863.4.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] Add a new distro feature "ptest".
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
X-List-Received-Date: Thu, 29 Nov 2012 16:06:30 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> >  meta/classes/image.bbclass                         |    6 ++-
> >  meta/classes/packagegroup.bbclass                  |    2 +-
> >  meta/conf/bitbake.conf                             |   15 ++++++++-
>=20
> Whilst we're in bootstrapping mode for this work, how about we make
> these changes a "ptest.bbclass" file which we'd inherit in the recipes
> where we've got ptest enabled?

Having looked into it a bit, I'm not sure I understand how you mean.

First, I don't quite see how this would be done in an elegant way for the i=
n-function changes in image.bbclass and packagegroup.bbclass.=20

And the lines added to bitbake.conf were put there because they mirror othe=
r complementary packages like -dbg and -dev. Is it really a good idea to in=
vent a new way of doing this for -ptest packages?

--=20
Bj=F6rn


