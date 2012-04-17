Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SK52V-0006GC-Q9
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 11:49:35 +0200
Received: by wibhj13 with SMTP id hj13so273938wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 02:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=GQNbdMpNDiaFFmNJQru49rsIlOjtVjPIjvhqxqyK3to=;
	b=P+ZqRhFqHXvRW0vsoLRToPNaIlMdAPjMDAE1u4HQyI0P/sc8tn+r8C/yKUnSVS9F9w
	IDQbn8ZNppz7nouWgs/pcJlCg8gJ4BwjBAo3XCLqwe2otjvEmiM6AYcDqpARugqLNn0E
	zdzUR3SOVr/fI/bq6hFqGRlT9dNEeWW68qQ7f9NteHldmxBnt5M7UA87LD6RKaW6GRbY
	inhbXDof9shcI0C5NVOqPhsdlR9az6Q2uaZWPbPMAshJoDbi7bQLj6ioR2crB5irrQFy
	m3EzpmjF41Z5A73M9f6omdZs6o3ommpKLpfbD0ZBVx216KaHhM+UOzFkcijpYlqePLGi
	nMeQ==
Received: by 10.180.24.66 with SMTP id s2mr26889267wif.7.1334655609950;
	Tue, 17 Apr 2012 02:40:09 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ca3sm25742595wib.6.2012.04.17.02.40.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 02:40:08 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1332618407-30816-1-git-send-email-obi@opendreambox.org>
Date: Tue, 17 Apr 2012 11:40:05 +0200
Message-Id: <F744A0A9-A640-4453-8119-18D2DF60364E@dominion.thruhere.net>
References: <1332618407-30816-1-git-send-email-obi@opendreambox.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkN4nL5lCrfmnmOqTqHXxTERU2Qde/EvmOSqeQbox+fbWXQCkQEHD9Uubj1z1453vB4szk9
Subject: Re: [PATCH] busybox: move watch to /usr/bin for compatibility with procps
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
X-List-Received-Date: Tue, 17 Apr 2012 09:49:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Ping

Op 24 mrt. 2012, om 20:46 heeft Andreas Oberritter het volgende =
geschreven:

> Commit 68dc2a3fa30c03a196d650de34d0c657a7b85454 broke opkg upgrade:
>=20
> | update-alternatives: Error: cannot register alternative watch to
> | /usr/bin/watch since it is already registered to /bin/watch
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> * Martin, can you please verify whether this really helps? I've built =
a
>  rootfs with both busybox watch and procps installed. I didn't =
actually
>  do an opkg upgrade.
>=20
> .../busybox/busybox-1.19.4/watch.in.usr-bin.patch  |   29 =
++++++++++++++++++++
> meta/recipes-core/busybox/busybox_1.19.4.bb        |    3 +-
> 2 files changed, 31 insertions(+), 1 deletions(-)
> create mode 100644 =
meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
>=20
> diff --git =
a/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch =
b/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
> new file mode 100644
> index 0000000..e8e1edf
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
> @@ -0,0 +1,29 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +=46rom f2372ab626a395d067704f4c318180fb6039de15 Mon Sep 17 00:00:00 =
2001
> +From: Andreas Oberritter <obi@opendreambox.org>
> +Date: Sat, 24 Mar 2012 17:36:48 +0100
> +Subject: [PATCH] watch: move from /bin to /usr/bin for compatibility =
with
> + procps
> +
> +Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> +---
> + include/applets.src.h |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/include/applets.src.h b/include/applets.src.h
> +index 87d9cbb..c148a8c 100644
> +--- a/include/applets.src.h
> ++++ b/include/applets.src.h
> +@@ -404,7 +404,7 @@ IF_VLOCK(APPLET(vlock, BB_DIR_USR_BIN, =
BB_SUID_REQUIRE))
> + IF_VOLNAME(APPLET(volname, BB_DIR_USR_BIN, BB_SUID_DROP))
> + /* Needs to be run by root or be suid root - needs to write to =
/dev/TTY: */
> + IF_WALL(APPLET(wall, BB_DIR_USR_BIN, BB_SUID_REQUIRE))
> +-IF_WATCH(APPLET(watch, BB_DIR_BIN, BB_SUID_DROP))
> ++IF_WATCH(APPLET(watch, BB_DIR_USR_BIN, BB_SUID_DROP))
> + IF_WATCHDOG(APPLET(watchdog, BB_DIR_SBIN, BB_SUID_DROP))
> + IF_WC(APPLET(wc, BB_DIR_USR_BIN, BB_SUID_DROP))
> + IF_WGET(APPLET(wget, BB_DIR_USR_BIN, BB_SUID_DROP))
> +--=20
> +1.7.5.4
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb =
b/meta/recipes-core/busybox/busybox_1.19.4.bb
> index dff616d..3f22669 100644
> --- a/meta/recipes-core/busybox/busybox_1.19.4.bb
> +++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
> @@ -1,5 +1,5 @@
> require busybox.inc
> -PR =3D "r0"
> +PR =3D "r1"
>=20
> SRC_URI =3D =
"http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball \
>            file://udhcpscript.patch \
> @@ -8,6 +8,7 @@ SRC_URI =3D =
"http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=3Dtarball \
>            file://get_header_tar.patch \
>            file://busybox-appletlib-dependency.patch \
>            file://run-parts.in.usr-bin.patch \
> +           file://watch.in.usr-bin.patch \
>            file://busybox-udhcpc-no_deconfig.patch \
>            file://find-touchscreen.sh \
>            file://busybox-cron \
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



