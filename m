Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SuKuM-0004wG-Nn
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 12:03:02 +0200
Received: by wgbdr1 with SMTP id dr1so1445137wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 02:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=DalWRlsFUF9ALu36yVUkuX8iOEF1tITVoUXGvHNHFwQ=;
	b=Kn3ASCj6g4s7+9bfp6GgzQa8a3P6Bqr8UOiFKpGbRQKpYOqpqDsrp7HgO+Qr65meyW
	9idFB5mbgf8vAHtoPZ3o9LhLAIsAPLBoiDmJMRs0epdh9tbXAlhWliRQR723MuIi/bQc
	iuZhDk+O0qgAXK2z2XeY8h8puFoODvS0uMAqOtBrjG1IeQAoi3y28YVd8IfovSdGonYX
	Bzsmzx448xU28rgrD+EJFcaQ81LMpRbMjPZ0e8HOvMqDNQdZ+KLhMILIkjnTw+vg4jt5
	yZ9/WlSPVwrY7ItsjnW/yys1WJnwqSsLzPHCJ55/nGf8dJ5S2CjK6A0R5KyBvakwgDLE
	ofmQ==
Received: by 10.180.106.97 with SMTP id gt1mr12048627wib.5.1343296292190;
	Thu, 26 Jul 2012 02:51:32 -0700 (PDT)
Received: from [172.20.0.6] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id bc2sm11353143wib.0.2012.07.26.02.51.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jul 2012 02:51:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <50110B50.3030900@intel.com>
Date: Thu, 26 Jul 2012 11:51:28 +0200
Message-Id: <446507ED-01C5-4006-B9AE-C8D77B61C213@dominion.thruhere.net>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<5010E3CF.3060709@intel.com>
	<919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
	<1756274.ud5AYazWdz@helios>
	<F0E3167B-ECF8-494D-83E8-0D31CC826E65@dominion.thruhere.net>
	<50110B50.3030900@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQmiZkVKwHHUdKhBq1gTqDcCdGjCrBW7RzHgoEo/6tFSQTyU8O7MmpMyCk9lL0lQf7onalqG
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 10:03:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jul. 2012, om 11:18 heeft Radu Moisan het volgende geschreven:

> What's the point of PROVIDES +=3D dbus-x11, it build fine without it =
(I'm not questioning the correctness of this, just want to understand =
the need for it).

This morning you said:

"it does not build, it complains about nothing providing dbus-x11"

That's what the PROVIDES is for.


>=20
> Radu
>=20
> On 07/26/2012 11:43 AM, Koen Kooi wrote:
>> Op 26 jul. 2012, om 10:42 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:
>>=20
>>> On Thursday 26 July 2012 10:08:49 Koen Kooi wrote:
>>>> Op 26 jul. 2012, om 08:29 heeft Radu Moisan <radu.moisan@intel.com> =
het
>>>>> volgende geschreven:
>>>>> it does not build, it complains about nothing providing dbus-x11
>>>>>=20
>>>>> Radu
>>>>>=20
>>>>> On 07/26/2012 09:17 AM, Radu Moisan wrote:
>>>>>> Followed suggestions from Bugz 2261:
>>>>>>=20
>>>>>> 1) remove the --with-x/--without-x configure arguments. If you =
want to
>>>>>> force no-discovery for native builds the correct argument is
>>>>>> --disable-x11-autolaunch. This ensures that DBus looks at the =
build
>>>>>> environment to determine whether to enable X11 bus discovery or =
not.
>>>>>>=20
>>>>>> 2) make the virtual/libx11 DEPENDS conditional based on the x11 =
distro
>>>>>> feature. This makes the build dependencies reflect the feature =
list.
>>>>>>=20
>>>>>> 3) remove dbus-x11, meaning that dbus-launch with its potential =
X11
>>>>>> dependency is now back in dbus where is belongs.
>>>>>>=20
>>>>>> 4) Potentially make dbus provide dbus-x11, for compatibility.
>>>>>>=20
>>>>>> Fixes [Yocto #2261]
>>>>>>=20
>>>>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>>>>> ---
>>>>>>=20
>>>>>> meta/recipes-core/dbus/dbus.inc |   11 ++++++-----
>>>>>> 1 file changed, 6 insertions(+), 5 deletions(-)
>>>>>>=20
>>>>>> diff --git a/meta/recipes-core/dbus/dbus.inc
>>>>>> b/meta/recipes-core/dbus/dbus.inc index a75583d..9559f6f 100644
>>>>>> --- a/meta/recipes-core/dbus/dbus.inc
>>>>>> +++ b/meta/recipes-core/dbus/dbus.inc
>>>>>> @@ -31,10 +31,10 @@ CONFFILES_${PN} =3D =
"${sysconfdir}/dbus-1/system.conf
>>>>>> ${sysconfdir}/dbus-1/session>>
>>>>>>   DEBIANNAME_${PN} =3D "dbus-1"
>>>>>>=20
>>>>>> -PACKAGES =3D+ "${PN}-lib ${PN}-systemd
>>>>>> ${@base_contains('DISTRO_FEATURES', 'x11', '${PN}-x11', '', =
d)}">>
>>>>>> +PACKAGES =3D+ "${PN}-lib ${PN}-systemd"
>>>>>>=20
>>>>>> -FILES_${PN}-x11 =3D "${bindir}/dbus-launch"
>>>>>>=20
>>>>>> -RDEPENDS_${PN}-x11 =3D "${PN}"
>>>>>> +# for compatibility
>>>> PROVIDES +=3D "dbus-x11"
>>>>=20
>>>>>> +RREPLACES_${PN} +=3D "dbus-x11"
>>>> RPROVIDES_${PN} +=3D "dbus-x11"
>>> For the sake of clarity, you mean both of these, not RPROVIDES =
instead of
>>> adding RREPLACES - right?
>> Correct, you need both (or rather all 3 if you include PROVIDES).
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



