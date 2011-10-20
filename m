Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RGx3O-00027d-KV
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 20:09:18 +0200
Received: by eyd9 with SMTP id 9so3142296eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 11:03:23 -0700 (PDT)
Received: by 10.14.10.212 with SMTP id 60mr1556223eev.16.1319133802430;
	Thu, 20 Oct 2011 11:03:22 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id q50sm27691415eef.9.2011.10.20.11.03.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 11:03:21 -0700 (PDT)
References: <cover.1319064436.git.josh@linux.intel.com>
	<04a2c43182d07a54ec535dea8c7434f6741014e1.1319064437.git.josh@linux.intel.com>
	<C07B2928-F2D1-4A85-BCFF-7D0360C8BFED@dominion.thruhere.net>
	<4EA05D42.30500@linux.intel.com>
In-Reply-To: <4EA05D42.30500@linux.intel.com>
Mime-Version: 1.0 (1.0)
Message-Id: <FEAA96D9-206B-4993-B727-58BA40145FC4@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (9A334)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 20 Oct 2011 20:03:09 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] gst-plugins-good: correctly handle gconf schema
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
X-List-Received-Date: Thu, 20 Oct 2011 18:09:18 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 20 okt. 2011 om 19:41 heeft Joshua Lock <josh@linux.intel.com> het volgen=
de geschreven:

>=20
>=20
> On 10/19/2011 10:41 PM, Koen Kooi wrote:
>>=20
>> Op 20 okt. 2011, om 00:49 heeft Joshua Lock het volgende geschreven:
>>=20
>>> Add the shipped gconf schema to the base package and inherit the gconf c=
lass
>>> so that scheme processing is handled via post* scripts.
>>>=20
>>> Signed-off-by: Joshua Lock <josh@linux.intel.com>
>>> ---
>>> .../gstreamer/gst-plugins-good_0.10.30.bb          |    6 ++++--
>>> 1 files changed, 4 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.=
bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
>>> index 96855aa..d63b09a 100644
>>> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
>>> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.30.bb
>>> @@ -7,9 +7,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b=
6cdffcea4f398e37343 \
>>>=20
>>> DEPENDS +=3D "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3t=
ag flac \
>>>        speex libsoup-2.4 pulseaudio"
>>> -PR =3D "r2"
>>> +PR =3D "r3"
>>>=20
>>> -inherit gettext
>>> +inherit gettext gconf
>>>=20
>>> EXTRA_OECONF +=3D "--disable-aalib --disable-esd --disable-shout2 --disa=
ble-libcaca --disable-hal --without-check"
>>>=20
>>> @@ -20,3 +20,5 @@ do_configure_prepend() {
>>>=20
>>> SRC_URI[md5sum] =3D "62fd7a3ef187c4f99b3d7c352d58dae9"
>>> SRC_URI[sha256sum] =3D "b12cba90b27d8423cd0a808939098d19db3996cfb9bf5285=
07c6321782e095f6"
>>> +
>>> +FILES_${PN} +=3D "${sysconfdir}/gconf/schemas/gstreamer-0.10.schemas"
>>=20
>> If think that schema needs to go into the gconf-elements plugin package, n=
o?
>=20
> Is that a statement or a question? That was my hunch but I was having a
> hard time finding anything which explicitly stated that.

It was a question, there are few plugins that can hook into gconf, I lost tr=
ack which plugins are in -good


>=20
> Cheers,
> Joshua
> --=20
> Joshua Lock
>        Yocto Project "Johannes factotum"
>        Intel Open Source Technology Centre
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


