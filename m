Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVr2q-0004la-Ad
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 21:46:21 +0100
Received: by eaad13 with SMTP id d13so1225059eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 12:39:39 -0800 (PST)
Received: by 10.213.3.80 with SMTP id 16mr660222ebm.59.1322685579609;
	Wed, 30 Nov 2011 12:39:39 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id z54sm9933931eeh.5.2011.11.30.12.39.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 12:39:38 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1322684398.17484.31.camel@ted>
Date: Wed, 30 Nov 2011 21:39:15 +0100
Message-Id: <B04EE6A0-D2A1-4573-85D3-A8705625236E@dominion.thruhere.net>
References: <1322641493-5889-1-git-send-email-koen@dominion.thruhere.net>
	<1322674730.17484.15.camel@ted>
	<F82CA009-53D5-45C1-AD7B-E0168518436F@dominion.thruhere.net>
	<1322684398.17484.31.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] consolekit: package /var/log/Consolekit
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
X-List-Received-Date: Wed, 30 Nov 2011 20:46:21 -0000
X-Groupsio-MsgNum: 13320
Content-Type: multipart/signed;
	boundary="Apple-Mail=_82D3CC60-8BB7-4354-9B74-C65C7F057CD4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_82D3CC60-8BB7-4354-9B74-C65C7F057CD4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 30 nov. 2011, om 21:19 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-11-30 at 18:50 +0100, Koen Kooi wrote:
>> Op 30 nov. 2011, om 18:38 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Wed, 2011-11-30 at 09:24 +0100, Koen Kooi wrote:
>>>> This fixes startup issues like this:
>>>>=20
>>>> 2011-11-30T09:02:10+01:00 beaglebone ck-log-system-start[91]: **
>>>> (process:91): WARNING **: Couldn't create log
>>>> file /var/log/ConsoleKit/history (No such file or directory)
>>>>=20
>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>> ---
>>>> .../recipes-support/consolekit/consolekit_0.4.5.bb |    4 ++--
>>>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb =
b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
>>>> index 562dfb3..a02203c 100644
>>>> --- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
>>>> +++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
>>>> @@ -2,7 +2,7 @@ DESCRIPTION =3D "ConsoleKit is a framework for =
defining and tracking users, login
>>>> HOMEPAGE=3D"http://www.freedesktop.org/wiki/Software/ConsoleKit"
>>>> =
BUGTRACKER=3D"https://bugs.freedesktop.org/buglist.cgi?query_format=3Dspec=
ific&product=3DConsoleKit"
>>>>=20
>>>> -PR =3D "r5"
>>>> +PR =3D "r6"
>>>>=20
>>>> LICENSE =3D "GPLv2+"
>>>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
>>>> @@ -23,7 +23,7 @@ EXTRA_OECONF =3D =
"--with-systemdsystemunitdir=3D${base_libdir}/systemd/system/ \
>>>>                ${@base_contains('DISTRO_FEATURES', 'pam', =
'--enable-pam-module --with-pam-module-dir=3D${base_libdir}/security', =
'--disable-pam-module', d)} \
>>>>               "
>>>>=20
>>>> -FILES_${PN} +=3D "${libdir}/ConsoleKit ${base_libdir} =
${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
>>>> +FILES_${PN} +=3D "${localstatedir}/log/ConsoleKit =
${libdir}/ConsoleKit ${base_libdir} ${datadir}/dbus-1 =
${datadir}/PolicyKit ${datadir}/polkit*"
>>>> FILES_${PN}-dbg +=3D "${base_libdir}/security/.debug"
>>>>=20
>>>> PACKAGES =3D+ "pam-plugin-ck-connector"
>>>=20
>>> Looks like this is breaking builds:
>>>=20
>>> | consolekit                  =
##################################################
>>> | error: unpacking of archive failed on file /var/log: cpio: rename =
failed - Invalid argument
>>>=20
>>> :(
>>>=20
>>> =
http://autobuilder.pokylinux.org:8010/builders/nightly-x86-64/builds/197/s=
teps/shell_30/logs/stdio
>>=20
>> I suspect that's another victim of fs-perms.txt and rpm, it seems to
>> break if /var/log is a symlink in other packages. I am going to argue
>> that the breakage isn't a bug in consolekit :)
>=20
> I really don't care whether its a bug in consolekit or not. The point =
is
> that builds that were working before this change are now broken and we
> have a regression.
>=20
> Who is going to fix the regression?
>=20
> Someone told me the answer is easy, I just revert the appropriate =
patch.
> I tend to take on a lot of these types of issues and silently fix them
> but I really need some help with it...

What I did for angstrom a while ago is to use a custom fsperms.txt that =
stays out of /var. That's why I'm not seeing this bug :)

regards,

Koen=

--Apple-Mail=_82D3CC60-8BB7-4354-9B74-C65C7F057CD4
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7WlHYACgkQMkyGM64RGpEEMQCeKQ3ZXC01aRo2lPOAqHyE8hCJ
SH4AniJB4HR6e9v1gebTSZKBeG8BTpwi
=u/EJ
-----END PGP SIGNATURE-----

--Apple-Mail=_82D3CC60-8BB7-4354-9B74-C65C7F057CD4--
