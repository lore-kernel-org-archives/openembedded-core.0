Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SAdrj-0005nD-8R
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 09:59:27 +0100
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 57CA7A624C;
	Thu, 22 Mar 2012 09:50:29 +0100 (CET)
Date: Thu, 22 Mar 2012 09:50:27 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20120322095027.266684a8@eb-e6520>
In-Reply-To: <20120322084732.GD4010@jama.jama.net>
References: <20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B406@ORSMSX106.amr.corp.intel.com>
	<20120321203249.54411613@eb-e6520>
	<20120321194906.GC3659@jama.jama.net>
	<ADD6A3980E8C39419A432FF422031B4C0137B557@ORSMSX106.amr.corp.intel.com>
	<20120321220253.00c4f254@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B5A8@ORSMSX106.amr.corp.intel.com>
	<20120321223521.36e49bba@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B66D@ORSMSX106.amr.corp.intel.com>
	<20120321230514.1c170480@eb-e6520>
	<20120322084732.GD4010@jama.jama.net>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Thu, 22 Mar 2012 08:59:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Thu, 22 Mar 2012 09:47:33 +0100,
Martin Jansa <martin.jansa@gmail.com> a =E9crit :

> On Wed, Mar 21, 2012 at 11:05:14PM +0100, Eric B=E9nard wrote:
> > Le Wed, 21 Mar 2012 21:53:10 +0000,
> > "Kamble, Nitin A" <nitin.a.kamble@intel.com> a =E9crit :
> > >  If it is working for you, I don't understand why is it not working h=
ere.=20
> > >=20
> > it's not working _only_ for me, Martin also had success.
>=20
> Tested again this time with SDKMACHINE ?=3D "x86-64"
>=20
> and notice that for me it uses libz libpython2.7 from sdk.
>=20
I cleaned my tmp, removed the installed SDK and now I reproduce Nitin's
problem. So there is something strange here.

Eric


