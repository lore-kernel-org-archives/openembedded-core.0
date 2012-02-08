Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rv3DJ-0000M5-9h
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 09:49:17 +0100
Received: by wgbdr13 with SMTP id dr13so243714wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 00:41:14 -0800 (PST)
Received: by 10.180.99.100 with SMTP id ep4mr39401789wib.7.1328690474342;
	Wed, 08 Feb 2012 00:41:14 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id m8sm784267wia.11.2012.02.08.00.41.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 00:41:13 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1328638222.git.paul.eggleton@linux.intel.com>
Date: Wed, 8 Feb 2012 09:41:11 +0100
Message-Id: <17269C3B-EEDD-4E2B-B30B-F835453B285A@dominion.thruhere.net>
References: <cover.1328638222.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 0/2] Buildhistory sorting fixes v2
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
X-List-Received-Date: Wed, 08 Feb 2012 08:49:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 feb. 2012, om 19:14 heeft Paul Eggleton het volgende geschreven:

> v2 fixes incorrect variable name and removes the erroneous sorting of
> PACKAGES (for which the original order *is* significant).
>=20
> The following changes since commit =
18d9fcfc4bc4b01f73e89f3b988c9d3d543c7705:
>=20
>  libzypp: add missing runtime dependences on gzip and gnupg =
(2012-02-03 17:23:28 +0000)
>=20
> are available in the git repository at:
>  git://git.openembedded.org/openembedded-core-contrib =
paule/buildhistory-fix3
>  =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dp=
aule/buildhistory-fix3
>=20
> Paul Eggleton (2):
>  classes/buildhistory: sort image file list
>  classes/buildhistory: sort list fields in package info

Those work beautifully: =
https://github.com/Angstrom-distribution/buildhistory/commit/6f5de74027b6c=
28458c5767b8a30b64a271c5b90

regards,

Koen=


