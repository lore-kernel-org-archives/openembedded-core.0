Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R92oN-0007wM-Tx
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 00:41:07 +0200
Received: (qmail invoked by alias); 28 Sep 2011 22:35:40 -0000
Received: from p4FDF1957.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.25.87]
	by mail.gmx.net (mp026) with SMTP; 29 Sep 2011 00:35:40 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/JPksZSzfJjmsRPZgkW4Out8aHBvgxfC135k2CWS
	9XYaWEldfE0Jz9
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2011 00:39:33 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-96.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201109282319.08663.schnitzeltony@gmx.de>
	<F880B9A0-D329-43D1-80ED-C12732108908@dominion.thruhere.net>
In-Reply-To: <F880B9A0-D329-43D1-80ED-C12732108908@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201109290039.33723.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: oe-core lsb / oe-classic lsb_base
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
X-List-Received-Date: Wed, 28 Sep 2011 22:41:08 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday, September 29, 2011 12:32:55 AM Koen Kooi wrote:
>=20
> Op 28 sep. 2011 om 16:19 heeft Andreas M=FCller <schnitzeltony@gmx.de> he=
t volgende geschreven:
>=20
> > I am trying to get networkmanager ( included in meta-oe ) working. Sinc=
e the daemon does not start automatically, I try to start it manually by /e=
tc/init.d/Networkmanager start
>=20
> Stop using sysvinit and switch to systemd.=20
I know - but for debugging I would like to have since systemd autostart doe=
s not work and I do not see why..

So your suggestion: No public efforts for lsb?
>=20
>=20
>=20
>=20
> > That complaines about missing /lib/lsb/init-functions. OK - I add lsb t=
o RDEPEND in networkmanager but now manual start complains for missing func=
tion log_daemon_msg ( and will surely later complain about log_end_msg ). F=
urther investigations make me wonder:=20
> >=20
> > - *All* files found in /etc/core-lsb include the file /etc/init.d/funct=
ions which is not included on my image.
> > - scripts init-functions and included are sourced in oe-core. Do we wan=
t to maintain these scripts?
> > - isn't this a case for inherit allarch?
> >=20
> > I checked lsb_base in oe-classic: The sources are taken from debian and=
=20
> >=20
> > + /lib/lsb/init-functions contains my missing functions
> > - lsb_release is a python script
> >=20
> > So how about
> >=20
> > * reduce lsb down to lsb_release ( and rename recipe to lsb_release )
> > * add lsb_base from oe-classic
> >=20
> > OR
> >=20
> > combine both: Take oe-core lsb_release and oe-classic init-functions ( =
resulting version number? )
> >=20
> > What do you think?
> >=20
> > Andreas
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20


