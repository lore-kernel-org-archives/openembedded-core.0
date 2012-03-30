Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SDdpk-0006b4-Ng
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 17:33:49 +0200
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 464564B00E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 17:24:41 +0200 (CEST)
Date: Fri, 30 Mar 2012 17:24:40 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120330172440.54592fce@eb-e6520>
In-Reply-To: <1333120364.18082.77.camel@ted>
References: <20120329225332.0e8cc2f4@eb-e6520> <1333058593.18082.40.camel@ted>
	<20120330105006.00955b5d@eb-e6520> <1333120364.18082.77.camel@ted>
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
X-List-Received-Date: Fri, 30 Mar 2012 15:33:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Fri, 30 Mar 2012 16:12:44 +0100,
Richard Purdie <richard.purdie@linuxfoundation.org> a =E9crit :
> On Fri, 2012-03-30 at 10:50 +0200, Eric B=E9nard wrote:
> > the default configuration seems to fetch from source control systems
> > as I always see very long time to fetch gcc/eglibc/linux-yocto
> > (despite having a 2.2 MBytes/s downlink DSL line).
>=20
> If you're hitting the SCMs I can understand the frustration.
>=20
that's not a frustration, that's a feedback on the default
behaviour. But I agree with you that could be a frustration for someone
trying OE-core for the first time ;-)

> Try adding this to your configuration:
>=20
> PREMIRRORS =3D "\
> git://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n \
> svn://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n"
>=20
> and see if that helps the performance. It might be we consider making
> this the default for OE-Core although some people are nervous about
> doing this...
>=20
sure that will help : in my work setup I have my own mirrors configured
but here again, that's not what a new user will have and in that
case, I'm testing the plain default configuration to help finding bugs
or things to improve the release.

I think fetching from git or svn should not be the first thing to do in
recipes like gcc, eglibc, linux & co where we are based on a
stable released version : this doesn't bring real added value to the
user in OE context and this wastes bandwidth (a tbz2 kernel is around
75MB, a git one is around 600MB).

Eric


