Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SDefE-0007Xh-0a
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 18:27:00 +0200
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 8943A4B0088
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 18:17:53 +0200 (CEST)
Date: Fri, 30 Mar 2012 18:17:52 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120330181752.080630b5@eb-e6520>
In-Reply-To: <1333123344.18082.94.camel@ted>
References: <20120329225332.0e8cc2f4@eb-e6520> <1333058593.18082.40.camel@ted>
	<20120330105006.00955b5d@eb-e6520> <1333120364.18082.77.camel@ted>
	<20120330172440.54592fce@eb-e6520> <1333123344.18082.94.camel@ted>
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
X-List-Received-Date: Fri, 30 Mar 2012 16:27:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Fri, 30 Mar 2012 17:02:24 +0100,
Richard Purdie <richard.purdie@linuxfoundation.org> a =E9crit :
> The linux-yocto kernel recipe heavily uses the SCM to do things so
> whilst it does have a higher download cost, it as adds value and is
> ultimately a maintainers choice too.
>=20
OK now that I've given a closer look at the linux-yocto recipes &
bbclass I understand better why you need it in that recipe and that
this recipe is heavily based on git's features.

> So whilst I hear what you're saying, I don't think we can change
> anything other than the PREMIRROR...
>=20
then maybe for the new users testing OE, having PREMIRRORs set in the
default configuration would be a great thing so that they don't believe
OE is a big slow beast just because they have to wait hours for git or
svn to fetch sources.

Eric


