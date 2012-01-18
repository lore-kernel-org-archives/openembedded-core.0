Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RnVgq-0002ph-Mc
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 14:36:36 +0100
Received: by mail-ww0-f43.google.com with SMTP id dr11so3588686wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2012 05:29:00 -0800 (PST)
Received: by 10.180.106.130 with SMTP id gu2mr36539704wib.6.1326893340786;
	Wed, 18 Jan 2012 05:29:00 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fd1sm22688943wib.0.2012.01.18.05.28.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jan 2012 05:29:00 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F16C61C.4020304@ts.fujitsu.com>
Date: Wed, 18 Jan 2012 14:28:59 +0100
Message-Id: <965E9502-1313-4711-9FF9-49A01141319C@dominion.thruhere.net>
References: <4F16C61C.4020304@ts.fujitsu.com>
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
X-List-Received-Date: Wed, 18 Jan 2012 13:36:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 jan. 2012, om 14:16 heeft Rainer Koenig het volgende geschreven:

> Ok,
>=20
> built my first basic customized console image (based on angstrom's
> console-image.bb) and managed to get SystemV init pulled in by =
deleting
> the systemd entry for the init manager.
>=20
> But systemd is still pulled in via connman, dhcp, rsyslog and ntp. How
> can I get totally rid of systemd so that I don't need a kernel with =
CGROUPS?

What's wrong with cgroups?=


