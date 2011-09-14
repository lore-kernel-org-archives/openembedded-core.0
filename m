Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R3nSj-0005qs-QA
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 13:17:06 +0200
Received: by wwf27 with SMTP id 27so1652290wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 04:11:54 -0700 (PDT)
Received: by 10.227.144.208 with SMTP id a16mr3721682wbv.32.1315998714376;
	Wed, 14 Sep 2011 04:11:54 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o7sm3687420wbh.8.2011.09.14.04.11.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Sep 2011 04:11:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201109121134.42474.paul.eggleton@linux.intel.com>
Date: Wed, 14 Sep 2011 13:11:50 +0200
Message-Id: <FF2EB738-77F7-4BC5-BB83-82ED8CBC0F96@dominion.thruhere.net>
References: <20110911172241.GA3674@chargestorm.se>
	<1315762415-18070-1-git-send-email-eric@eukrea.com>
	<201109121134.42474.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Wed, 14 Sep 2011 11:17:06 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 12 sep. 2011, om 12:34 heeft Paul Eggleton het volgende geschreven:

> On Sunday 11 September 2011 18:33:35 Eric B=E9nard wrote:
>> - 4.7.4 was release on the 1st of september, the changelog is =
available
>> here :
>> =
http://qt.gitorious.org/+qt-developers/qt/releases/blobs/v4.7.4/dist/chang=

>> es-4.7.4 and mostly contains bug fix.
>>=20
>> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
>> ---
>> .../conf/distro/include/distro_tracking_fields.inc |   32
>> ++++++++++---------- meta/recipes-qt/qt4/{qt-4.7.3.inc =3D> =
qt-4.7.4.inc} |=20
>>  4 +-
>> .../0001-Added-Openembedded-crossarch-option.patch |    0
>>=20

[..]

>> rename to meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
>=20
> Thanks Eric, tested OK.
>=20
> Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Saul, Richard,

Could you please give us an heads-up when this is going in, since it =
needs matching commits to meta-oe and meta-angstrom as well to keep the =
.bbappends working. If we don't succeed in merging the bbappend changes =
into oe-core we should consider breaking the 'git mv oldrecipe =
newrecipe' into an add and delete spaced a day apart.

regards,

Koen=


