Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1UdPdp-0004yz-Gy
	for Openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 20:44:34 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4HIQEqg024858
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 17 May 2013 11:26:14 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.88]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.02.0342.003;
	Fri, 17 May 2013 11:26:14 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Yi Qingliang <niqingliang2003@gmail.com>
Thread-Topic: [OE-core] qt keyboard problem
Thread-Index: AQHOUTU/QwV9GD/l4UmrvhQctCU0cpkIB5SQgAD7OYCAALHFIA==
Date: Fri, 17 May 2013 18:26:13 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF8436FC9D3A@ALA-MBA.corp.ad.wrs.com>
References: <3388285.jCfN1Lj2u9@yiqingliang-pc>
	<007BD92917A2324FA403BCF9A464CF8436FC944F@ALA-MBA.corp.ad.wrs.com>
	<1475581.xrrjhtfao2@yiqingliang-pc>
In-Reply-To: <1475581.xrrjhtfao2@yiqingliang-pc>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.152.80]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: qt keyboard problem
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
X-List-Received-Date: Fri, 17 May 2013 18:44:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Yi Qingliang [mailto:niqingliang2003@gmail.com]
> Sent: Thursday, May 16, 2013 5:46 PM
> To: Slater, Joseph
> Cc: openembedded-core@lists.openembedded.org oe-core layer
> Subject: Re: [OE-core] qt keyboard problem
>=20
> On Thursday, May 16, 2013 04:51:04 PM Slater, Joseph wrote:
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org
> > > [mailto:openembedded-core- bounces@lists.openembedded.org] On Behalf =
Of
> > > Yi Qingliang
> > > Sent: Tuesday, May 14, 2013 11:19 PM
> > > To: openembedded-core@lists.openembedded.org oe-core layer
> > > Subject: [OE-core] qt keyboard problem
> > >
> > > Hello, all.
> > >
> > > I'm running qt application on yocto's qt image. cpu is s3c2442, like
> > > mini2440.
> > >
> > > the problem is:
> > >
> > > key event issued by pressing gpio-key eat by 'getty' (from busybox),
> > > my application can't receive input event,
> > > if I remove respawn 'getty' for tty1 in /etc/inittab, everything ok.
> >
> > This could be the same thing I have seen in a slightly different contex=
t.
> > If so, you can keep the getty's attached to VT's.  Just move the line i=
n
> > inittab that starts runlevel 5 to the very end of inittab.  As long as =
the
> > getty's start first, you'll be okay.
>=20
> you mean: move 'id:5:initdefault:' as the last line of the file, right?

No, the line is "l5:5:wait:/etc/init.d/rc 5".

Joe


>=20
>=20
>=20
>=20
>=20
>=20
>=20
> # /etc/inittab: init(8) configuration.
> # $Id: inittab,v 1.91 2002/01/25 13:35:21 miquels Exp $
>=20
> # The default runlevel.
> id:5:initdefault:
>=20
> # Boot-time system configuration/initialization script.
> # This is run first except when booting in emergency (-b) mode.
> si::sysinit:/etc/init.d/rcS
>=20
> # What to do in single-user mode.
> ~~:S:wait:/sbin/sulogin
>=20
> # /etc/init.d executes the S and K scripts upon change
> # of runlevel.
> #
> # Runlevel 0 is halt.
> # Runlevel 1 is single-user.
> # Runlevels 2-5 are multi-user.
> # Runlevel 6 is reboot.
>=20
> l0:0:wait:/etc/init.d/rc 0
> l1:1:wait:/etc/init.d/rc 1
> l2:2:wait:/etc/init.d/rc 2
> l3:3:wait:/etc/init.d/rc 3
> l4:4:wait:/etc/init.d/rc 4
> l5:5:wait:/etc/init.d/rc 5
> l6:6:wait:/etc/init.d/rc 6
> # Normally not reached, but fallthrough in case of emergency.
> z6:6:respawn:/sbin/sulogin
> S:2345:respawn:/sbin/getty 115200 ttySAC0
> # /sbin/getty invocations for the runlevels.
> #
> # The "id" field MUST be the same as the last
> # characters of the device (after "tty").
> #
> # Format:
> #  <id>:<runlevels>:<action>:<process>
> #
>=20
> 1:2345:respawn:/sbin/getty 38400 tty1
>=20
>=20
>=20
> >
> > Joe
> >
> > > any idea?
> > >
> > >
> > > --
> > > Nanjing Jilong
> > > Yi Qingliang
> > > niqingliang2003@gmail.com
> > >
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> --
> Nanjing Jilong
> Yi Qingliang
> niqingliang2003@gmail.com


