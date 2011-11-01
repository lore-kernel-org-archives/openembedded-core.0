Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RLCaO-000103-Jh
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 12:32:56 +0100
Received: by wyh5 with SMTP id 5so2139616wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 04:26:49 -0700 (PDT)
Received: by 10.216.200.82 with SMTP id y60mr4854941wen.71.1320146809668;
	Tue, 01 Nov 2011 04:26:49 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id e40sm4229195wbp.3.2011.11.01.04.26.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 04:26:48 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 1 Nov 2011 12:26:42 +0100
In-Reply-To: <1320100838.8579.0.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1319885588-5947-1-git-send-email-Martin.Jansa@gmail.com>
	<1320083026-31637-1-git-send-email-Martin.Jansa@gmail.com>
	<1320100838.8579.0.camel@ted>
Message-Id: <C71A8EF9-3824-4EEF-B383-46EBCF4B9397@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCHv2] dbus: fix for right owner in postinst
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
X-List-Received-Date: Tue, 01 Nov 2011 11:32:56 -0000
X-Groupsio-MsgNum: 11734
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BFAEC7F2-5C10-4671-9AAC-3EFAC8357549";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BFAEC7F2-5C10-4671-9AAC-3EFAC8357549
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 31 okt. 2011, om 23:40 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-10-31 at 18:43 +0100, Martin Jansa wrote:
>> * even when I see right chown/chmod in log.do_install, files are =
still
>>  owned by bitbake:bitbake (user running bitbake) and we need to fix =
it on target
>> $ tail -n 4 temp/log.do_install.27768
>> + chown messagebus:messagebus =
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/imag=
e/var/run/dbus /OE/shr-core/tmp/work/armv7a-vfp-neon-o
>> e-linux-gnueabi/dbus-1.4.12-r2/image/var/lib/dbus
>> + chown root:messagebus =
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/imag=
e/usr/libexec/dbus-daemon-launch-helper
>> + chmod 4754 =
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/imag=
e/usr/libexec/dbus-daemon-launch-helper
>> + ln -sf /dev/null =
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/imag=
e//lib/systemd/system/dbus-1.service
>>=20
>> $ ll -d =
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/imag=
e/var/run/dbus \
>>  =
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/imag=
e/var/lib/dbus \
>>  =
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/imag=
e/usr/libexec/dbus-daemon-launch-helper \
>> =
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/imag=
e/usr/libexec/dbus-daemon-launch-helper
>> -rwsr-xr-- 1 bitbake bitbake 819869 Oct 29 12:35 =
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/imag=
e/usr/libexec/dbus-daemon-launch-he
>> lper*
>> -rwsr-xr-- 1 bitbake bitbake 819869 Oct 29 12:35 =
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/imag=
e/usr/libexec/dbus-daemon-launch-he
>> lper*
>> drwxr-xr-x 2 bitbake bitbake   4096 Oct 29 12:35 =
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/imag=
e/var/lib/dbus/
>> drwxr-xr-x 2 bitbake bitbake   4096 Oct 29 12:35 =
/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/imag=
e/var/run/dbus/
>>=20
>> * and we _cannot_ use ${D} in postinst script because it get's =
expanded
>>  before including postinst file to ipk's control.tar.gz
>>  and on target I see something like this:
>>  if [ -z =
"/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/dbus-1.4.12-r2/ima=
ge" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
>>  which is wrong $D without {} works
>>=20
>> * V2: updated with Otavio version to fix it also for do_rootfs
>>=20
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>> meta/recipes-core/dbus/dbus.inc |   12 +++++-------
>> 1 files changed, 5 insertions(+), 7 deletions(-)
>=20
> This is just wallpapering over the cracks I'm afraid. There is =
something
> more fundamental going wrong here and we need to track it down...

Any news on this?



--Apple-Mail=_BFAEC7F2-5C10-4671-9AAC-3EFAC8357549
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6v13IACgkQMkyGM64RGpEBsgCgrXSM5N5b668fpKE185OhYfFq
DLgAnj8UckhM1czwC1wsbOyUIWikHXl3
=q5ig
-----END PGP SIGNATURE-----

--Apple-Mail=_BFAEC7F2-5C10-4671-9AAC-3EFAC8357549--
