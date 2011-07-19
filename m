Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qj60u-0002Xh-PO
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 10:50:48 +0200
Received: by wyg30 with SMTP id 30so2879458wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 01:46:43 -0700 (PDT)
Received: by 10.216.220.212 with SMTP id o62mr428886wep.75.1311065203674;
	Tue, 19 Jul 2011 01:46:43 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id j54sm1587221wed.47.2011.07.19.01.46.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jul 2011 01:46:42 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1310976967-7251-1-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 19 Jul 2011 10:46:40 +0200
Message-Id: <10AF858D-EEF0-4B5C-A001-DC007E0A5B30@dominion.thruhere.net>
References: <1310976967-7251-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] gcc-package-target: don't fail if the .la files we try to delete are not there to start with
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
X-List-Received-Date: Tue, 19 Jul 2011 08:50:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Any comments on this one?

Op 18 jul 2011, om 10:16 heeft Koen Kooi het volgende geschreven:

> This fixes:
>=20
> | rm: cannot remove =
`/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-=
gnueabi/gcc-4.5-r39.1+svnr175127/image/usr/libexec/gcc/arm-angstrom-linux-=
gnueabi/4.5.4/*.la': No such file or directory
> | ERROR: Function 'do_install' failed (see =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-g=
nueabi/gcc-4.5-r39.1+svnr175127/temp/log.do_install.19514 for further =
information)
> NOTE: package gcc-4.5-r39.1+svnr175127: task do_install: Failed
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-devtools/gcc/gcc-package-target.inc |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc =
b/meta/recipes-devtools/gcc/gcc-package-target.inc
> index 9a91a7f..e6105da 100644
> --- a/meta/recipes-devtools/gcc/gcc-package-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
> @@ -84,7 +84,7 @@ do_install () {
> 	# Cleanup some of the ${libdir}{,exec}/gcc stuff ...
> 	rm -r ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
> 	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
> -	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/*.la
> +	rm -rf ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/*.la
>=20
> 	# Hack around specs file assumptions
> 	test -f ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs && sed -i =
-e '/^*cross_compile:$/ { n; s/1/0/; }' =
${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs
> --=20
> 1.6.6.1
>=20



