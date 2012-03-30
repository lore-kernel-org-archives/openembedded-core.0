Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SDgp4-00010S-03
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 20:45:18 +0200
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 5673CA621A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 20:36:10 +0200 (CEST)
Date: Fri, 30 Mar 2012 20:36:09 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120330203609.69e8151d@eb-e6520>
In-Reply-To: <CADkTA4MULo7zgZH9MoDJyzvPvkebBT_pmP-C1==pprTZ0YirVw@mail.gmail.com>
References: <20120329225332.0e8cc2f4@eb-e6520> <1333058593.18082.40.camel@ted>
	<20120330105006.00955b5d@eb-e6520> <1333120364.18082.77.camel@ted>
	<20120330172440.54592fce@eb-e6520> <1333123344.18082.94.camel@ted>
	<20120330181752.080630b5@eb-e6520>
	<CADkTA4MULo7zgZH9MoDJyzvPvkebBT_pmP-C1==pprTZ0YirVw@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: Fetch time optimization (svn : gcc/eglibc - git : linux-yocto)
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
X-List-Received-Date: Fri, 30 Mar 2012 18:45:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Fri, 30 Mar 2012 13:33:05 -0400,
Bruce Ashfield <bruce.ashfield@gmail.com> a =E9crit :
> There are alternatives that I'm going to be exploring going forward,
> just nothing
> that we can bring in during the stabilization cycle. The recipes manipula=
te git
> and use it to construct what you build, they don't absolutely require a f=
ull
> git history, so there are some potential savings to be had.
>=20
> It just obviously limits flexibility if a derived recipe wants to merge b=
ranches
> and histories to construct what is built. So having a simple/shallow hist=
ory for
> basic builds while not breaking more complex cases probably hits the sweet
> spot.
>=20
OK in the end all the slow download problems I met while testing oe-core
& qemuarm from scratch were due to a problem on the server hosting
yocto's git and mirror services (so setting PREMIRROR to use
yocto's mirror didn't improve the situation).
Now that this problem is fixed on the yocto server, the time to download
linux-yocto kernel went from 90-120 minutes down to 20-30 minutes
which seems more reasonnable !
So there was really a problem but I was not looking in the right
direction to fix it :-(

Eric


