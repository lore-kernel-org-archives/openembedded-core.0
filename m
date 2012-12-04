Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tfvuh-00088Y-89 for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:04:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB4GnegC009132;
	Tue, 4 Dec 2012 16:49:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08149-09; Tue,  4 Dec 2012 16:49:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB4GnXSj009126
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 4 Dec 2012 16:49:34 GMT
Message-ID: <1354639762.25268.54.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
Date: Tue, 04 Dec 2012 16:49:22 +0000
In-Reply-To: <20121129155210.GC25784@sestofb10.enea.se>
References: <1353600120-22967-1-git-send-email-bjst@enea.com>
	<1353600120-22967-2-git-send-email-bjst@enea.com>
	<1353707361.21863.4.camel@ted>
	<20121129155210.GC25784@sestofb10.enea.se>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	qB4GnegC009132
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
X-List-Received-Date: Tue, 04 Dec 2012 17:04:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-29 at 16:52 +0100, Bj=C3=B6rn Stenberg wrote:
> Richard Purdie wrote:
> > >  meta/classes/image.bbclass                         |    6 ++-
> > >  meta/classes/packagegroup.bbclass                  |    2 +-
> > >  meta/conf/bitbake.conf                             |   15 ++++++++=
-
> >=20
> > Whilst we're in bootstrapping mode for this work, how about we make
> > these changes a "ptest.bbclass" file which we'd inherit in the recipe=
s
> > where we've got ptest enabled?
>=20
> Having looked into it a bit, I'm not sure I understand how you mean.
>
> First, I don't quite see how this would be done in an elegant way for
> the in-function changes in image.bbclass and packagegroup.bbclass.=20

Those are pretty non-invasive so I think we can just add these pieces in
directly as you have them now.

> And the lines added to bitbake.conf were put there because they mirror
> other complementary packages like -dbg and -dev. Is it really a good
> idea to invent a new way of doing this for -ptest packages?

This isn't a "new way". We can easily put these in a .bbclass for now.
Pretty much every package has a -dev and -dbg package but for now, the
number of packages which will have ptest is limited. Its a waste of
build time having the -ptest metadata being processed for every package,
its also confusing.

So I think my proposal stands, lets put the pieces from bitbake.conf
into a bbclass file for now, the other pieces can merge into the core
code. As and when we have more than say 60% of the metadata with ptest
we can think about making -ptest packages the default.

Cheers,

Richard
>=20




