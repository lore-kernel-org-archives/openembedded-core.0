Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SFL58-0000pe-4p
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 09:56:42 +0200
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 16E814B01CD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2012 09:47:29 +0200 (CEST)
Date: Wed, 4 Apr 2012 09:47:28 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120404094728.01c3ba51@eb-e6520>
In-Reply-To: <CAGiJk9f_=5pVUurpPT4pO3qPZC=bOn2Qg_1iaaE=A5g+0cG1Vw@mail.gmail.com>
References: <loom.20120404T082801-1@post.gmane.org>
	<20120404091834.367f9617@eb-e6520>
	<CAGiJk9f_=5pVUurpPT4pO3qPZC=bOn2Qg_1iaaE=A5g+0cG1Vw@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: How to rebuilt the package after modified the source code in open embedded bitbake ...
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
X-List-Received-Date: Wed, 04 Apr 2012 07:56:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Wed, 4 Apr 2012 09:21:02 +0200,
Samuel Stirtzel <s.stirtzel@googlemail.com> a =E9crit :

> 2012/4/4 Eric B=E9nard <eric@eukrea.com>:
> > Hi Surenda,
> >
> > Le Wed, 4 Apr 2012 06:34:39 +0000 (UTC),
> > surendra dhobale <surendra.dhobalelinux@gmail.com> a =E9crit :
> >> =A0I am working with the open embedded environment.
> >>
> >> I have added one u-boot package in that. First time by default the com=
pilation
> >> done successfully using the bitbake. But Now i made some changes in th=
e source
> >> .
> >>
> >> Now i have to built the same package with neglecting the fetch() stage.
> >> and rebuilt it means need to compilation.
> >>
> >> Is any commands for that...
> >> Can please anyone explain me in deatails about that. I am newbie in th=
e open
> >> embedded.
> >>
> > bitbake u-boot -c cleansstate
> > bitbake u-boot
> >
> > Eric
>=20
> Hi,
> please note this will delete local changes (in thework directory) to
> the sourcecode!
>=20
> If you only want to compile again you can use
>=20
> bitbake -c compile -f u-boot
> and then "bitbake u-boot" to build the other tasks.
>=20
oops, I read his message to fast and didn't notice the "i made some
changes in the source code , which is created in the Temp work
directory".

For this kind of work, I prefer to do :
bitbake u-boot -c configure
copy the source from workdir to a directory outside OE
then change to this dir and
git init
git add .
git commit -m init
then you can hack it outside OE (and compile it using a meta-toolchain
for example)
and in the end you can easily produce a patch using git that you
integrate back into OE.

Eric


