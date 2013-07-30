Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id DAD006B3EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 15:31:19 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx1so7060035pab.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 08:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=h8eum5CAiqK6xX8Hr7bNbXvYlVttQXWX4RyyamP6EC4=;
	b=gJsqsz0TP0kVEfQLqjiGuqSSPgQ++lgJs7wtK3qCY0BKlcngfNokqy5uetiFCWn3cM
	nWAIkjiaX8HxNlNILZ1gI+7WSJEbrY5lN+tL+F/Nge7HZe4A7H593t2NKnzmQ49pFxWC
	cp+xTu/T5FhiiUXtsV2iLj4L70UuVcD3t/dEbB3xOyI3RCj6NPtk8LyB51VyVwl9+wfp
	LrK8rCzfQ53hT7ELMLTQKYUXjHAxLsCM0rL/hl9gIFGgA4HHZKuNJZZ267VTdg8U0Pv9
	R71tRDLcko279W7wRUE32T3eeoEMzQm/Ug0XSVZik7KYL9xI+t1QKImPwuV8rqvVsjED
	F8hQ==
X-Received: by 10.66.27.101 with SMTP id s5mr43932327pag.176.1375198280695;
	Tue, 30 Jul 2013 08:31:20 -0700 (PDT)
Received: from ddeviny-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	qg10sm83741301pbb.2.2013.07.30.08.31.19 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Jul 2013 08:31:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <8237333.h1yk84NkVT@helios>
Date: Tue, 30 Jul 2013 08:31:19 -0700
Message-Id: <1E8D28AF-6657-4E48-B7D6-79D4A29A3095@gmail.com>
References: <1374763888-7315-1-git-send-email-koen@dominion.thruhere.net>
	<21EAF1A7-D7BE-4275-9998-C42694B18C43@dominion.thruhere.net>
	<7891D5A0-7EB3-4A7A-99EC-962DC7EF9764@gmail.com>
	<8237333.h1yk84NkVT@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: fix PACKAGECONFIG options
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jul 2013 15:31:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 30, 2013, at 3:50 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> On Tuesday 30 July 2013 01:52:42 Khem Raj wrote:
>> On Jul 26, 2013, at 12:01 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>> Op 25 jul. 2013, om 16:51 heeft Koen Kooi =
<koen@dominion.thruhere.net> het=20
> volgende geschreven:
>>>> The ??=3D operator is too weak and it's setting a non-existent
>>>> PACKAGECONFIG option ('libpam' instead of 'pam').
>>>>=20
>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>> ---
>>>> meta/recipes-core/util-linux/util-linux.inc | 4 ++--
>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/meta/recipes-core/util-linux/util-linux.inc
>>>> b/meta/recipes-core/util-linux/util-linux.inc index =
d373cec..3d1198a
>>>> 100644
>>>> --- a/meta/recipes-core/util-linux/util-linux.inc
>>>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>>>> @@ -47,9 +47,9 @@ EXTRA_OECONF =3D "--libdir=3D${base_libdir}
>>>> --disable-use-tty-group \>>=20
>>>>               --enable-libuuid --enable-libblkid --enable-fsck
>>>>               --without-udev \
>>>> 	=09
>>>> 		usrsbin_execdir=3D'${sbindir}' \
>>>>=20
>>>> "
>>>> -PACKAGECONFIG_class-target ??=3D =
"${@base_contains('DISTRO_FEATURES',
>>>> 'pam', 'libpam', '', d)} \ +PACKAGECONFIG_class-target ?=3D
>>>> "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \>>=20
>>>>                               ${@base_contains('DISTRO_FEATURES',
>>>>                               'systemd', 'systemd', '', d)} "
>>>>=20
>>>> -PACKAGECONFIG[pam] =3D "--enable-su --enable-runuser,--disable-su
>>>> --disable-runuser, pam," +PACKAGECONFIG[pam] =3D "--enable-su
>>>> --enable-runuser,--disable-su --disable-runuser, libpam,"
>>>>=20
>>>> # Respect the systemd feature for uuidd
>>>> PACKAGECONFIG[systemd] =3D "--enable-socket-activation
>>>> --with-systemdsystemunitdir=3D${systemd_unitdir}/system/,
>>>> --disable-socket-activation --without-systemdsystemunitdir">=20
>>> And of course this will trigger another bug:
>>> |  * check_data_file_clashes: Package util-linux wants to install =
file
>>> |  =
/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/work/beaglebone-ang
>>> |  strom-linux-gnueabi/cloud9-image/1.0-r0/rootfs/usr/bin/su> | =20
>>> |       But that file is already provided by package  * shadow
>>>=20
>>> *sigh*
>>=20
>> +*sigh*
>>=20
>> has this been fixed yet ? just ran into same issue
>=20
> The patch to fix it is in Saul's most recent consolidated pull.
>=20

which one is it ? I am at=20

commit 09deeef20ee5a0c12ad4fd89cace6e0fb832d5b1
Author: Saul Wold <sgw@linux.intel.com>
Date:   Thu Jul 25 14:15:18 2013 -0700

    external-sourcery: add missing providers
   =20

> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


