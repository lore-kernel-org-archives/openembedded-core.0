Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RnVmT-0002wb-CW
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 14:42:25 +0100
Received: by werb12 with SMTP id b12so1011931wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2012 05:34:47 -0800 (PST)
Received: by 10.180.100.130 with SMTP id ey2mr3613198wib.15.1326893687414;
	Wed, 18 Jan 2012 05:34:47 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gy6sm22477533wib.11.2012.01.18.05.34.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jan 2012 05:34:46 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <182165EE-D546-4E80-932D-6409E234863B@dominion.thruhere.net>
Date: Wed, 18 Jan 2012 14:34:44 +0100
Message-Id: <74FB388C-DFB3-42A8-AAA3-C92B74433F9A@dominion.thruhere.net>
References: <1326855665-11617-1-git-send-email-raj.khem@gmail.com>
	<182165EE-D546-4E80-932D-6409E234863B@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] e2fsprogs_1.42.bb: Fix build fallout for uclibc
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
X-List-Received-Date: Wed, 18 Jan 2012 13:42:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 jan. 2012, om 10:51 heeft Koen Kooi het volgende geschreven:

>=20
> Op 18 jan. 2012, om 04:01 heeft Khem Raj het volgende geschreven:
>=20
>> e2fsprogs 1.42 onwards uses fallocate() which uclibc
>> does not implement(yet). In most of places its use
>> is controlled and it only used when configure detects
>> fallocate being present but in this one case it missed
>> to check for fallocate being available so here we
>> add the check
>=20
> FWIW, e2fsprogs(-native) also has problems with ASNEEDED:
>=20
> | tune2fs: symbol lookup error: tune2fs: undefined symbol: =
ext2fs_group_desc

And that one suddenly went away!=


