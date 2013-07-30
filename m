Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3EF8A6B410
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 08:52:45 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id z10so6455222pdj.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 01:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=+NyW5UT7F/1P5aUJIddoGSBVO+3cmdBBFuaU8ZPA0go=;
	b=q6eOZfHhzWIk+gNWVrj+bxckj5SMEc7LyhJtHUyUvPRNpgOkK8Ia/RgsG7Y5tIxwOn
	W6IfZqkWwOqyBKcCMd+xy/b8ThhdkMR29XSAQ4k5G3iRwL2P4bSBBSZi8O358yj+pnqo
	hGQn0GsaNV5xJRGdRoSl+03XcyQkrw6lfRll1jQKdQKWtxh/GCdrdPqK89ebSWA7wR5k
	Oj9Lh+OjHOS59MtqXJJF/BZaARmMcw5ZsKYj4xmPlDWaDvOtOMyKwgzJvp+U2DGd6zEB
	o9b/k9z0vrtGusdQthKdGrO5n1qBzwY4n+OAIHakvM+HW+pV5V4sm9eYAWDunR15p1Fu
	54zA==
X-Received: by 10.67.22.69 with SMTP id hq5mr51430610pad.174.1375174365879;
	Tue, 30 Jul 2013 01:52:45 -0700 (PDT)
Received: from ddeviny-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	pq1sm81779728pbb.26.2013.07.30.01.52.43 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Jul 2013 01:52:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <21EAF1A7-D7BE-4275-9998-C42694B18C43@dominion.thruhere.net>
Date: Tue, 30 Jul 2013 01:52:42 -0700
Message-Id: <7891D5A0-7EB3-4A7A-99EC-962DC7EF9764@gmail.com>
References: <1374763888-7315-1-git-send-email-koen@dominion.thruhere.net>
	<21EAF1A7-D7BE-4275-9998-C42694B18C43@dominion.thruhere.net>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 30 Jul 2013 08:52:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 26, 2013, at 12:01 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:

>=20
> Op 25 jul. 2013, om 16:51 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:
>=20
>> The ??=3D operator is too weak and it's setting a non-existent =
PACKAGECONFIG option ('libpam' instead of 'pam').
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/recipes-core/util-linux/util-linux.inc | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/util-linux/util-linux.inc =
b/meta/recipes-core/util-linux/util-linux.inc
>> index d373cec..3d1198a 100644
>> --- a/meta/recipes-core/util-linux/util-linux.inc
>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>> @@ -47,9 +47,9 @@ EXTRA_OECONF =3D "--libdir=3D${base_libdir} =
--disable-use-tty-group \
>>                --enable-libuuid --enable-libblkid --enable-fsck =
--without-udev \
>> 		usrsbin_execdir=3D'${sbindir}' \
>> "
>> -PACKAGECONFIG_class-target ??=3D =
"${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} \
>> +PACKAGECONFIG_class-target ?=3D "${@base_contains('DISTRO_FEATURES', =
'pam', 'pam', '', d)} \
>>                                ${@base_contains('DISTRO_FEATURES', =
'systemd', 'systemd', '', d)} "
>> -PACKAGECONFIG[pam] =3D "--enable-su --enable-runuser,--disable-su =
--disable-runuser, pam,"
>> +PACKAGECONFIG[pam] =3D "--enable-su --enable-runuser,--disable-su =
--disable-runuser, libpam,"
>>=20
>> # Respect the systemd feature for uuidd
>> PACKAGECONFIG[systemd] =3D "--enable-socket-activation =
--with-systemdsystemunitdir=3D${systemd_unitdir}/system/, =
--disable-socket-activation --without-systemdsystemunitdir"
>=20
> And of course this will trigger another bug:
>=20
> |  * check_data_file_clashes: Package util-linux wants to install file =
/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/work/beaglebone-angstro=
m-linux-gnueabi/cloud9-image/1.0-r0/rootfs/usr/bin/su
> |       But that file is already provided by package  * shadow
>=20
> *sigh*

+*sigh*

has this been fixed yet ? just ran into same issue

| Collected errors:
|  * check_data_file_clashes: Package util-linux wants to install file =
/builds1/angstrom/build/tmp-angstrom_next-uclibc/work/qemuarm-angstrom-lin=
ux-uclibceabi/systemd-image/1.0-r0/rootfs/usr/bin/su
|       But that file is already provided by package  * shadow
|  * opkg_install_cmd: Cannot install package packagegroup-target-sdk.
| ERROR: Function failed: do_rootfs (log file is located at =
/builds1/angstrom/build/tmp-angstrom_next-uclibc/work/qemuarm-angstrom-lin=
ux-uclibceabi/systemd-image/1.0-r0/temp/log.do_rootfs.27649)
NOTE: recipe systemd-image-1.0-r0: task do_rootfs: Failed


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


