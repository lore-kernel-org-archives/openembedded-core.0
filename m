Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RnWWe-0004IX-US
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 15:30:08 +0100
Received: by werb12 with SMTP id b12so1056421wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2012 06:22:30 -0800 (PST)
Received: by 10.216.132.88 with SMTP id n66mr5208795wei.32.1326896550893;
	Wed, 18 Jan 2012 06:22:30 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bj10sm22708897wib.9.2012.01.18.06.22.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jan 2012 06:22:30 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F16D407.70801@ts.fujitsu.com>
Date: Wed, 18 Jan 2012 15:22:29 +0100
Message-Id: <8179F4CB-8841-4AD2-AAEB-77B4885D5204@dominion.thruhere.net>
References: <4F16C61C.4020304@ts.fujitsu.com>
	<965E9502-1313-4711-9FF9-49A01141319C@dominion.thruhere.net>
	<4F16D407.70801@ts.fujitsu.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: How do I get rid of systemd
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
X-List-Received-Date: Wed, 18 Jan 2012 14:30:09 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 18 jan. 2012, om 15:15 heeft Rainer Koenig het volgende geschreven:

> Am 18.01.2012 14:28, schrieb Koen Kooi:
>=20
>> What's wrong with cgroups?
>=20
> Probably nothing. But now I've got an image that has both systemd and
> systemv to boot up and that results in an endless loop with kernel
> messages about omap_i2c.
>=20
> My idea was that OE is a toolchain that enables me to build a =
customized
> distribution, so I thought I have the choice to use
> systemd or systemv with a configuration setting. But it came out,
> that systemd is sort of mandatory nowadays and its not that easy to =
get
> rid of it.

It's really easy, just create your own image. But don't come complaining =
if you use a task that depends on systemd.=


