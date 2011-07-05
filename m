Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qe5qT-0005i1-Tk
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 15:39:21 +0200
Received: by wwi18 with SMTP id 18so5033596wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 06:35:32 -0700 (PDT)
Received: by 10.227.167.129 with SMTP id q1mr6312894wby.101.1309872932709;
	Tue, 05 Jul 2011 06:35:32 -0700 (PDT)
Received: from [10.75.16.17] ([192.91.60.189])
	by mx.google.com with ESMTPS id c17sm5309411wbh.63.2011.07.05.06.35.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 06:35:31 -0700 (PDT)
References: <cover.1309503004.git.sgw@linux.intel.com>
	<1309871862.20015.702.camel@rex>
In-Reply-To: <1309871862.20015.702.camel@rex>
Mime-Version: 1.0 (iPhone Mail 8J2)
Message-Id: <D1CCEDA1-5C8C-43E6-A1A2-3A43C0D44819@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8J2)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 5 Jul 2011 14:35:25 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Updated [PATCH 0/4] SRC_URI Check Updates with Beagleboard updates
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
X-List-Received-Date: Tue, 05 Jul 2011 13:39:22 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

I just noticed that xload sets the PV wrong in the recipe

Op 5 jul. 2011 om 14:17 heeft Richard Purdie <richard.purdie@linuxfoundation=
.org> het volgende geschreven:

> On Thu, 2011-06-30 at 23:54 -0700, Saul Wold wrote:
>> Richard,
>>=20
>> This address 2 bugs filed by Darren for the Beagleboard, they build
>> correctly.
>>=20
>> It also updates two recipes that Mark Hatle found lacking checksums.
>>=20
>> Thanks
>>    Sau!
>>=20
>> The following changes since commit 40ecaf6a59ba61e72d29d7e677197ef37c9984=
08:
>>=20
>>  uclibc: Add default uClibc.machine files (2011-07-01 00:40:10 +0100)
>>=20
>> are available in the git repository at:
>>  git://git.openembedded.org/openembedded-core-contrib sgw/fix
>>  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3D=
sgw/fix
>>=20
>> Saul Wold (4):
>>  x-load: Update to 1.5.0
>>  uboot: Update to 2011.06
>>  mpeg2dec: add SRC_URI Checksum
>>  libmad: add SRC_URI Checksum
>=20
> I merged these apart from uboot which Koen has valid concerns about. We
> may need to preserve the older version for a while and let this trickle
> down the tree to the layers...
>=20
> Cheers,
>=20
> Richard
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


