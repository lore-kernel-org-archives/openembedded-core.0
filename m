Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RAnXN-0006tZ-1C
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 20:46:49 +0200
Received: (qmail invoked by alias); 03 Oct 2011 18:41:15 -0000
Received: from p5B0A2BEE.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.43.238]
	by mail.gmx.net (mp063) with SMTP; 03 Oct 2011 20:41:15 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18HAAA1ZoAH6GqNjY/5E33Lh11ADnenX0pjQKddGP
	RyYe1OcpSS/Qsj
From: Andreas =?utf-8?q?M=C3=BCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 3 Oct 2011 20:45:14 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-96.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201110031603.31007.schnitzeltony@gmx.de>
	<C4A96559-DE0F-4549-8A49-909A168B8A66@dominion.thruhere.net>
	<4E89D4F0.9080900@mlbassoc.com>
In-Reply-To: <4E89D4F0.9080900@mlbassoc.com>
MIME-Version: 1.0
Message-Id: <201110032045.14771.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: bitbake webkit-gtk fails with clean temp dir
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
X-List-Received-Date: Mon, 03 Oct 2011 18:46:49 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday, October 03, 2011 05:29:52 PM Gary Thomas wrote:
> >> NOTE: package webkit-gtk-1.5.1+svnr90727-r0: task do_compile: Failed
> >> ERROR: Task 7 (/home/Superandy/data/oe-core/sources/openembedded-core/=
meta/recipes-sato/webkit/webkit-gtk_svn.bb, do_compile) failed with exit co=
de '1'
> >>
> >> ideas what causes this?
> >
> > no idea, but I get the same error
> >
>=20
> It builds in Yocto/Poky so you might compare with those recipes.
Dit you pull [1] and rebuild webkit-gtk?
>=20
>=20
some investigation later: by diff'ing log files created by working environm=
ent with the current environment I fell over log.do_configure:=20

=2D-disable-dependency-tracking=20

was added in [1]. Tried manual bisecting by

git reset --hard 288343e30604b944dc18fd82172febd314d9c520

=C3=A9 voil=C3=A0: webkit-gtk builds again. Will send a patch with --enable=
=2Ddependency-tracking after testing...

Andreas

[1] http://cgit.openembedded.org/cgit.cgi/openembedded-core/commit/?id=3D97=
0e0ae610804638d00b0a6b85c6e2e895778e8e


