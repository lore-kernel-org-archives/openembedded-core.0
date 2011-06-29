Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbqdT-00007Y-BH
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 11:00:47 +0200
Received: by wwi18 with SMTP id 18so850549wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 01:56:11 -0700 (PDT)
Received: by 10.227.43.9 with SMTP id u9mr458265wbe.74.1309337771614;
	Wed, 29 Jun 2011 01:56:11 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b13sm743225wbh.41.2011.06.29.01.56.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Jun 2011 01:56:10 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTi=3_0NHcyWydFjp7a3sBr00u-54YA@mail.gmail.com>
Date: Wed, 29 Jun 2011 10:56:08 +0200
Message-Id: <7848FD2A-860F-48C3-BE1D-739C6D9AB0A8@dominion.thruhere.net>
References: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>
	<AFF7B511-46CF-4CDF-96CA-763678BF57C7@dominion.thruhere.net>
	<BANLkTi=3_0NHcyWydFjp7a3sBr00u-54YA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Conflicting providers for ssh/sshd (dropbear and openssh)
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
X-List-Received-Date: Wed, 29 Jun 2011 09:00:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 jun 2011, om 10:50 heeft Anders Darander het volgende geschreven:

> On Wed, Jun 29, 2011 at 10:24, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> Op 29 jun 2011, om 00:41 heeft Khem Raj het volgende geschreven:
>>> If they are independent then may be the openssh recipe should be
>>> divided into openssh-ssh and openssh-rest so one can use openssh
>>> provided daemon or dropbear provided as they wish
>>=20
>> Dividing the openssl recipe would gain us little and the gains would =
be only for the power companies since you'd have to build openssh twice =
to get both sftp and ssh. The decrease in build time for only sftp is =
neglible.
>=20
> Hm, speaking against what I've often been advocating (reducing build
> time by factoring out dependenies etc)...
>=20
> I think the simplest and most straightforward solution is to just
> split the packaging into
> openssh-ssh and openssh-sftp, where openssh-sftp packages just what is
> needed for handling
> the sftp-server in cooperation with dropbear. It could possibly also
> include the sftp-client if
> desired/needed.

That's already the case now. The problem is the PROVIDES overlap since =
the Poky people decided a distro could only have one true ssh =
implementation instead of choosing it per image. So if your distro =
doesn't set the PREFERRED_PROVIDER_sshd you get those nagging messages =
during parsing that scare users and make consultants rich.

OE .dev isn't a lot better with the misguided DISTRO_SSH_DAEMON, but at =
least it doesn't show those nag messages.=


