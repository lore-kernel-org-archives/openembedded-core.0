Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RH8Dq-00068W-Gi
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 08:04:50 +0200
Received: by bkat8 with SMTP id t8so4711381bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 22:58:57 -0700 (PDT)
Received: by 10.223.63.130 with SMTP id b2mr23547407fai.35.1319176737466;
	Thu, 20 Oct 2011 22:58:57 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n25sm9416400fah.15.2011.10.20.22.58.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 22:58:56 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20111020214817.GM3522@jama.jama.net>
Date: Fri, 21 Oct 2011 07:58:50 +0200
Message-Id: <C9B0D52E-6D7F-4751-B7E8-AD66921C7A07@dominion.thruhere.net>
References: <cover.1319139126.git.raj.khem@gmail.com>
	<15763124703d12326c8ba4d296a2b2680528c2da.1319139126.git.raj.khem@gmail.com>
	<20111020194453.GL3522@jama.jama.net>
	<B412182F-53D6-406D-8751-2E179257D135@dominion.thruhere.net>
	<20111020214817.GM3522@jama.jama.net>
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
X-List-Received-Date: Fri, 21 Oct 2011 06:04:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 okt. 2011, om 23:48 heeft Martin Jansa het volgende geschreven:

> On Thu, Oct 20, 2011 at 11:42:27PM +0200, Koen Kooi wrote:
>>=20
>> Op 20 okt. 2011, om 21:44 heeft Martin Jansa het volgende geschreven:
>>=20
>>> On Thu, Oct 20, 2011 at 12:36:01PM -0700, Khem Raj wrote:
>>>> Fixes the compile problems e.g.
>>>>=20
>>>> | checking for GL... yes
>>>> | checking for DRIPROTO... yes
>>>> | checking for DRI... no
>>>> | configure: error: Package requirements (glproto >=3D 1.4.14 dri =
>=3D
>>>> 7.8.0) were not met:
>>>> |
>>>> | No package 'dri' found
>>>> |
>>>> | Consider adjusting the PKG_CONFIG_PATH environment variable if =
you
>>>> | installed software in a non-standard prefix.
>>>>=20
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>> .../xorg-xserver/xserver-xorg_1.11.1.bb            |    1 +
>>>> 1 files changed, 1 insertions(+), 0 deletions(-)
>>>>=20
>>>> diff --git =
a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb =
b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
>>>> index 0f94fe2..2aa71e5 100644
>>>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
>>>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
>>>> @@ -1,2 +1,3 @@
>>>> require xserver-xorg.inc
>>>> require xserver-xorg-${PV}.inc
>>>> +DEPENDS +=3D "mesa-dri"
>>>=20
>>> You can do this in xserver-xorg.inc
>>> just change
>>> LIB_DEPS +=3D "virtual/libgl" to
>>> LIB_DEPS +=3D "mesa-dri"
>>=20
>> that will drag it in for -lite as well, is that OK?
>=20
> No it will not, this is not xserver-xorg-common.inc

Ah, I got confused by 'require xserver-xorg-${PV}.inc'. Time to get some =
more coffee.

regards,

Koen.=


