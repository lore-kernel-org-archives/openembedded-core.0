Received: from mail-yx0-f169.google.com ([209.85.213.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1REiXn-0006Qk-VE
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 16:15:28 +0200
Received: by yxs7 with SMTP id 7so1817980yxs.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 07:09:42 -0700 (PDT)
Received: by 10.223.63.130 with SMTP id b2mr4494631fai.35.1318601382179;
	Fri, 14 Oct 2011 07:09:42 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o22sm3908750fab.11.2011.10.14.07.09.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 07:09:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <9adcdda8d76bf9201fd6275b3d140498c2ddd774.1318601142.git.paul.eggleton@linux.intel.com>
Date: Fri, 14 Oct 2011 16:09:35 +0200
Message-Id: <303535AA-4E7A-489D-96E7-7F57755B65C3@dominion.thruhere.net>
References: <cover.1318601142.git.paul.eggleton@linux.intel.com>
	<9adcdda8d76bf9201fd6275b3d140498c2ddd774.1318601142.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/2] pulseaudio: make bluetooth support conditional upon DISTRO_FEATURES
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
X-List-Received-Date: Fri, 14 Oct 2011 14:15:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 okt. 2011, om 16:07 heeft Paul Eggleton het volgende geschreven:

> If "bluetooth" is in DISTRO_FEATURES then enable bluetooth and depend =
on
> bluez4, otherwise disable it.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    5 +++--
> .../pulseaudio/pulseaudio_0.9.22.bb                |    2 +-
> .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-

Slightly off-topic, PA has had a 1.0 release recently, any volunteers =
for adding it?=


