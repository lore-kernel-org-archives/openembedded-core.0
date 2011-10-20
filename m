Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RH0TO-0001L3-Sk
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 23:48:23 +0200
Received: by eyd9 with SMTP id 9so3366980eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 14:42:29 -0700 (PDT)
Received: by 10.223.5.139 with SMTP id 11mr20436610fav.21.1319146949563;
	Thu, 20 Oct 2011 14:42:29 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id u6sm17979293fan.17.2011.10.20.14.42.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 14:42:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20111020194453.GL3522@jama.jama.net>
Date: Thu, 20 Oct 2011 23:42:27 +0200
Message-Id: <B412182F-53D6-406D-8751-2E179257D135@dominion.thruhere.net>
References: <cover.1319139126.git.raj.khem@gmail.com>
	<15763124703d12326c8ba4d296a2b2680528c2da.1319139126.git.raj.khem@gmail.com>
	<20111020194453.GL3522@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/4] xserver-xorg: Add mesa-dri to DEPENDS
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
X-List-Received-Date: Thu, 20 Oct 2011 21:48:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 okt. 2011, om 21:44 heeft Martin Jansa het volgende geschreven:

> On Thu, Oct 20, 2011 at 12:36:01PM -0700, Khem Raj wrote:
>> Fixes the compile problems e.g.
>>=20
>> | checking for GL... yes
>> | checking for DRIPROTO... yes
>> | checking for DRI... no
>> | configure: error: Package requirements (glproto >=3D 1.4.14 dri >=3D
>> 7.8.0) were not met:
>> |
>> | No package 'dri' found
>> |
>> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
>> | installed software in a non-standard prefix.
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> .../xorg-xserver/xserver-xorg_1.11.1.bb            |    1 +
>> 1 files changed, 1 insertions(+), 0 deletions(-)
>>=20
>> diff --git =
a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb =
b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
>> index 0f94fe2..2aa71e5 100644
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
>> @@ -1,2 +1,3 @@
>> require xserver-xorg.inc
>> require xserver-xorg-${PV}.inc
>> +DEPENDS +=3D "mesa-dri"
>=20
> You can do this in xserver-xorg.inc
> just change
> LIB_DEPS +=3D "virtual/libgl" to
> LIB_DEPS +=3D "mesa-dri"

that will drag it in for -lite as well, is that OK?

regards,

Koen=


