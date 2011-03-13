Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Pynx3-0004IN-Gb
	for openembedded-core@lists.openembedded.org;
	Sun, 13 Mar 2011 17:15:29 +0100
Received: by wwb17 with SMTP id 17so4200521wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2011 09:13:49 -0700 (PDT)
Received: by 10.227.53.73 with SMTP id l9mr4698203wbg.19.1300032829329;
	Sun, 13 Mar 2011 09:13:49 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id x1sm5349323wbh.20.2011.03.13.09.13.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 Mar 2011 09:13:48 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4D7CE94A.5080706@mlbassoc.com>
Date: Sun, 13 Mar 2011 17:13:47 +0100
Message-Id: <CCDB3981-855D-444D-A271-A863C2765CC4@dominion.thruhere.net>
References: <cover.1299940883.git.raj.khem@gmail.com>
	<4D7CE94A.5080706@mlbassoc.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: [PATCH 0/1] Import own-mirrors class from OE
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
X-List-Received-Date: Sun, 13 Mar 2011 16:15:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 mrt 2011, om 16:56 heeft Gary Thomas het volgende geschreven:

> On 03/12/2011 08:04 AM, Khem Raj wrote:
>> Hi Richard
>>=20
>>=20
>>=20
>> Pull URL: git://git.openembedded.org/openembedded-core-contrib.git
>>   Branch: kraj/own-mirror
>>   Browse: =
http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dkr=
aj/own-mirror
>>=20
>> Thanks,
>>     Khem Raj<raj.khem@gmail.com>
>> ---
>>=20
>>=20
>> Khem Raj (1):
>>   own-mirrors.bbclass: Bring own-mirrors.bbclass from oe commit
>>     0ef914b250df46a41348479446214575668943fb
>>=20
>>  meta/classes/own-mirrors.bbclass |   12 ++++++++++++
>>  1 files changed, 12 insertions(+), 0 deletions(-)
>>  create mode 100644 meta/classes/own-mirrors.bbclass
>>=20
>=20
> Poky/Yocto already has a mechanism for this by overriding PREMIRRORS
> I would think sticking with one extension method would be better.
>=20
> Here's what I have in my [Poky] DISTRO.conf:
>=20
> SOURCE_DIR ?=3D "/opt/poky/sources"
> PREMIRRORS =3D "\
> http://.*/.*   file://${SOURCE_DIR}/ \n \
> https://.*/.*  file://${SOURCE_DIR}/ \n \
> ftp://.*/.*    file://${SOURCE_DIR}/ \n \
> bzr://.*/.*    file://${SOURCE_DIR}/ \n \
> cvs://.*/.*    file://${SOURCE_DIR}/ \n \
> git://.*/.*    file://${SOURCE_DIR}/ \n \
> hg://.*/.*     file://${SOURCE_DIR}/ \n \
> osc://.*/.*    file://${SOURCE_DIR}/ \n \
> p4://.*/.*     file://${SOURCE_DIR}/ \n \
> svk://.*/.*    file://${SOURCE_DIR}/ \n \
> svn://.*/.*    file://${SOURCE_DIR}/ \n"
>=20
> Users can have their own mirror by defining SOURCE_DIR in local.conf

How is that easier and more maintainable than:

INHERIT +=3D "own-mirrors"
SOURCE_MIRROR_URL =3D "/some/dir"

?

Especially when more uri methods get added to the fetcher and oe-core.



