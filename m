Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QXDBM-0005vz-IC
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 16:04:28 +0200
Received: by wye20 with SMTP id 20so1202720wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2011 07:01:00 -0700 (PDT)
Received: by 10.216.91.17 with SMTP id g17mr1060151wef.1.1308232860689;
	Thu, 16 Jun 2011 07:01:00 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id 74sm858729wem.41.2011.06.16.07.00.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Jun 2011 07:00:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DFA08A2.3010504@gmail.com>
Date: Thu, 16 Jun 2011 16:00:57 +0200
Message-Id: <ED0EBCC5-D086-4F71-AC7A-F733111C4B6D@dominion.thruhere.net>
References: <cover.1308215406.git.dongxiao.xu@intel.com>	<f590848e2802c1ecd7faedb6f695b8b5203c7aa8.1308215406.git.dongxiao.xu@intel.com>
	<1308216925.25285.4101.camel@phil-desktop>
	<4DFA08A2.3010504@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/6] connman: Upgrade to version 0.75
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
X-List-Received-Date: Thu, 16 Jun 2011 14:04:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 jun 2011, om 15:44 heeft Khem Raj het volgende geschreven:

> On 6/16/2011 2:35 AM, Phil Blundell wrote:
>> On Thu, 2011-06-16 at 17:20 +0800, Dongxiao Xu wrote:
>>> Enable ofono plugin into sato image.
>>=20
>> [...]
>>=20
>>> --- a/meta/recipes-connectivity/connman/connman.inc
>>> +++ b/meta/recipes-connectivity/connman/connman.inc
>>> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>>>                      =
file://src/main.c;beginline=3D1;endline=3D20;md5=3D4b55b550fa6b33cc2055ef3=
0dd262b3e"
>>>=20
>>>  DEPENDS  =3D "libgdbus dbus glib-2.0 hal iptables"
>>> -RDEPENDS_${PN} =3D "wpa-supplicant resolvconf"
>>> +RDEPENDS_${PN} =3D "wpa-supplicant resolvconf ofono"
>>=20
>>> --- a/meta/recipes-connectivity/connman/connman_0.65.bb
>>> +++ b/meta/recipes-connectivity/connman/connman_0.75.bb
>>> @@ -16,14 +16,14 @@ EXTRA_OECONF +=3D "\
>>>    --disable-udev \
>>>    --disable-polkit \
>>>    --enable-client \
>>> +  --enable-ofono \
>>>    --prefix=3D/usr --sysconfdir=3D/etc --localstatedir=3D/var"
>>=20
>> These changes look like they will have a rather wider impact than =
just
>> the sato image.  I'm not sufficiently au fait with connman to say
>> whether this is a good thing or not (although my immediate reaction =
to
>> adding extra RDEPENDS tends to be that it is not), but if they're =
going
>> to be added globally then the checkin comment ought to reflect that =
and
>> explain why it's being done.  Alternatively, you could do this in =
your
>> distro layer and/or image recipes.
>>=20
>=20
> I would say put ofono as a DISTRO_FEATURE

You don't need to build ofono to have ofono support in connman. Angstrom =
(and hence meta-oe) build with it enabled by default to support people =
who want to use the plugin on their phones. Since it's a nicely =
seperated plugin, DISTRO_FEATURE would be the wrong thing to do.

That's why I keep saying "look at the connman recipe in meta-oe", that's =
being used by angstrom and SHR with good success.

regards,

Koen=


