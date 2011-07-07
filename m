Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qeo9H-0004QM-4Y
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 14:57:43 +0200
Received: by wyg30 with SMTP id 30so712995wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2011 05:53:51 -0700 (PDT)
Received: by 10.227.11.67 with SMTP id s3mr698464wbs.62.1310043231556;
	Thu, 07 Jul 2011 05:53:51 -0700 (PDT)
Received: from [10.75.16.17] ([192.91.60.196])
	by mx.google.com with ESMTPS id gd1sm2189233wbb.10.2011.07.07.05.53.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jul 2011 05:53:50 -0700 (PDT)
References: <1309951628-11896-1-git-send-email-koen@dominion.thruhere.net>
	<1310042708.20015.829.camel@rex>
In-Reply-To: <1310042708.20015.829.camel@rex>
Mime-Version: 1.0 (iPhone Mail 8J2)
Message-Id: <23DBF851-35A1-41DC-A709-405C6CB87B0B@dominion.thruhere.net>
X-Mailer: iPhone Mail (8J2)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 7 Jul 2011 13:53:48 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: add 0.9.23
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
X-List-Received-Date: Thu, 07 Jul 2011 12:57:43 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

When I get back to my proper desk next week I'm going to test more devices a=
nd send patches to remove .15 and .22 or fixes for .23 and removal patches a=
fter that

Op 7 jul. 2011 om 13:45 heeft Richard Purdie <richard.purdie@linuxfoundation=
.org> het volgende geschreven:

> On Wed, 2011-07-06 at 13:27 +0200, Koen Kooi wrote:
>> Older version have been retained to allow more testing of this release
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> .../pulseaudio-0.9.23/autoconf_version.patch       |   17 ++++++++++
>> .../pulseaudio/pulseaudio-0.9.23/buildfix.patch    |   17 ++++++++++
>> .../pulseaudio-0.9.23/configure_silent_rules.patch |   33 +++++++++++++++=
++++
>> .../pulseaudio-0.9.23/gcc4-compile-fix.patch       |   22 +++++++++++++
>> .../pulseaudio/pulseaudio-0.9.23/tls_m4.patch      |   34 +++++++++++++++=
+++++
>> .../pulseaudio-0.9.23/volatiles.04_pulse           |    2 +
>> meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
>> .../pulseaudio/pulseaudio_0.9.23.bb                |   25 ++++++++++++++
>> 8 files changed, 151 insertions(+), 1 deletions(-)
>> create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/a=
utoconf_version.patch
>> create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/b=
uildfix.patch
>> create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/c=
onfigure_silent_rules.patch
>> create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/g=
cc4-compile-fix.patch
>> create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/t=
ls_m4.patch
>> create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/v=
olatiles.04_pulse
>> create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.b=
b
>=20
> I've merged this, thanks.
>=20
> One question though: How/when do we remove the old version?
>=20
> Cheers,
>=20
> Richard
>=20


