Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QUfj2-0006Re-FL
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 15:56:44 +0200
Received: by wwb17 with SMTP id 17so1431982wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jun 2011 06:53:24 -0700 (PDT)
Received: by 10.216.209.212 with SMTP id s62mr809453weo.67.1307627604185;
	Thu, 09 Jun 2011 06:53:24 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id c51sm858825wek.23.2011.06.09.06.53.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2011 06:53:22 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1307625339.15712.155.camel@rex>
Date: Thu, 9 Jun 2011 15:53:19 +0200
Message-Id: <76185F2A-C89D-4698-BA21-CC823343B1BE@dominion.thruhere.net>
References: <cover.1307523829.git.dongxiao.xu@intel.com>
	<3cb0d7f134013f8dcd664429b7efda396d12790e.1307523829.git.dongxiao.xu@intel.com>
	<1307525772.2529.4777.camel@phil-desktop>
	<1307547318.15712.109.camel@rex>
	<1307618044.2529.4810.camel@phil-desktop>
	<1307618944.15712.150.camel@rex>
	<1307619798.2529.4844.camel@phil-desktop>
	<1307625339.15712.155.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Thu, 09 Jun 2011 13:56:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 jun 2011, om 15:15 heeft Richard Purdie het volgende geschreven:

> On Thu, 2011-06-09 at 12:43 +0100, Phil Blundell wrote:
>> On Thu, 2011-06-09 at 12:29 +0100, Richard Purdie wrote:
>>> As you can see, eglibc do_package takes about 14 minutes which is =
about
>>> 14% of our build time. That is a long time to block pretty much all
>>> packaging activity, particularly if you have access to something =
with
>>> several cores. When it does complete, even on my 4 core system you =
see a
>>> "stampeding herd" of packaging happening on the build charts =
suggesting
>>> a backlog does build up.
>>=20
>> Yeah, I can imagine that a backlog of packaging activity does build =
up.
>> The thing I'm not entirely clear on is whether this is actually =
causing
>> some threads to get starved of work (and hence the total build time =
to
>> be longer than it needs to be) or whether we're really just shifting
>> things around in the timeline without making much/any difference to =
the
>> overall build duration.
>=20
> It will certainly be a net win on large core systems which I know of
> people running builds on as task starvation happens there. Last time I
> tested this on a 4 core I think we saw a couple of minutes improvement
> in build time so it appears beneficial there too.
>=20
>>  (I'm not familiar enough with bitbake's
>> scheduler to know whether it will schedule tasks as early as =
possible,
>> or as late as possible, or something else.)
>=20
> Roughly speaking, the default scheduler runs tasks with the most =
things
> depending upon them first. This means it will fill any "spare" threads
> with lower priority tasks such as packaging.
>=20
>> Just as a matter of interest, are you using qemu-based locale =
generation
>> or the cross localedef for your measurement?  14 minutes does sound =
like
>> an awfully long time and I wonder whether there is anything we could =
do
>> in absolute terms to just speed that process up.
>=20
> I'm using cross localedef. Its faster than with qemu but still slow. =
I'm
> very open to suggestions on how to speed it up as it does take an age.

Does cross localegen obey parallel make or does it only do a single =
locale at a time?

regards,

Koen=


