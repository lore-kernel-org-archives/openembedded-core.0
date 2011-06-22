Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZQ29-0005GL-GO
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 18:12:05 +0200
Received: by wyb34 with SMTP id 34so774117wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 09:08:31 -0700 (PDT)
Received: by 10.216.145.210 with SMTP id p60mr686269wej.89.1308758910007;
	Wed, 22 Jun 2011 09:08:30 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id t79sm393943weq.5.2011.06.22.09.08.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2011 09:08:29 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308758420.20015.82.camel@rex>
Date: Wed, 22 Jun 2011 18:08:23 +0200
Message-Id: <C48D1426-0755-45BC-B4E8-011677F3B11A@dominion.thruhere.net>
References: <cover.1308706692.git.raj.khem@gmail.com>
	<1308758420.20015.82.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH V2 0/2] Change gcc 4.6 recipes to use svn in SRC_URI
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
X-List-Received-Date: Wed, 22 Jun 2011 16:12:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 jun 2011, om 18:00 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-06-21 at 18:43 -0700, Khem Raj wrote:
>> changes since V1
>>=20
>> Separate out non gcc changes to a different pull request
>> Patches are not attached inline due to sheer size of them
>> as they might choke patchwork. The are only on the branch
>>=20
>> The following changes since commit =
78de64f58b98101f5be5778e9ecbdaae5ba32997:
>>=20
>>  binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64 =
(2011-06-21 17:58:06 -0700)
>>=20
>> are available in the git repository at:
>>  git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.6
>>  =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dk=
raj/gcc-4.6
>>=20
>> Khem Raj (2):
>>  gcc-4.6: Switch to using svn SRC_URI for recipe
>>  tcmode-default.inc: use 4.6 for GCCVERSION and SDKGCCVERSION
>=20
> I'm afraid I don't like having "gcc 4.6" being so publicly visible. =
Its
> fine for the recipe names but the PV itself really needs to be =
something
> like "4.6.2+svn".
>=20
> I say this as a person who'd have to deal with people claiming we're
> behind on gcc since we were on 4.6[.0] :/

There will always be people claiming nonsense about numbers :)=


