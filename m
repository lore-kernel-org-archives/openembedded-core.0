Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Pv7u6-0007Ur-Rl
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 13:45:14 +0100
Received: by wwe15 with SMTP id 15so1128311wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 04:43:46 -0800 (PST)
Received: by 10.227.145.17 with SMTP id b17mr859939wbv.152.1299156226037;
	Thu, 03 Mar 2011 04:43:46 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id f52sm554104wes.35.2011.03.03.04.43.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2011 04:43:45 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1299154021.26736.12912.camel@rex>
Date: Thu, 3 Mar 2011 13:43:44 +0100
Message-Id: <7326E7D2-6055-4628-A992-B868095A677C@dominion.thruhere.net>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
	<1299135167-18330-7-git-send-email-raj.khem@gmail.com>
	<1299154021.26736.12912.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: [PATCHv3 6/6] rpm: Fix linking error encountered in rpm-native
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
X-List-Received-Date: Thu, 03 Mar 2011 12:45:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mrt 2011, om 13:07 heeft Richard Purdie het volgende geschreven:

> Hi Khem,
>=20
> On Wed, 2011-03-02 at 22:52 -0800, Khem Raj wrote:
>> * This patch passes the correct LDFLAGS to account for
>>  additional dependencies of librpmio on libbeecrypt and libsyck
>>  and hence fixes the build error.
>=20
> This change is fine in itself but I'm going to be a little critical =
here
> since we're just getting going and I want to start as we mean to go =
on.
>=20
> Could you add a description of the problem and why the fix is needed =
to
> the patch header please, also adding your name and a date.
>=20
> The reason why is so in six months time, someone looking at this can
> work out a) why the patch is needed, b) Who wrote it so they have some
> idea where it came from and who to talk to if they have a question and
> c) How long the issue has been around for.
>=20
> I appreciate some of this info can be got through the SCM but I've yet
> to see a good reason for not including it directly in the patch =
header.

I have customers that make tarball snapshots of OE without the .git, so =
please put a lot of info in patch headers.

regards,

Koen=


