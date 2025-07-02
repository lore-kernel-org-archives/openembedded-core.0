Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939F4C83013
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 07:20:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.17943.1751440816573669896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 00:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ttg29wR2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 403EF442C0;
	Wed,  2 Jul 2025 07:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751440814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DW1LPa0Eefi4KwL+fob8T7xmPNrLXjG22FS5gDSENJ0=;
	b=Ttg29wR2YjrEMSW2zctgz4NtDt+JtVZMMqrTPF9rKv/t3YA7U5svORtfkB08IfYE6YsRe8
	17IgHA7+CcENR052ROhZAjnKAaet+NAt6p5PDScBozvRRNPbFjccWYz3pwjnfPVxxlCqSj
	bBlYwAX0VzE+dXAcuG+iaiPl5nH0JEhxRyv1ep+/+cP2ZeXyd9e+4yJcR7lloNue0xdXOG
	spTcWnXnBi+IhEOuwDiWQOlWI2MCFFjEBpcdDvfHp3di/aubZiOaHXFCIytjMjGixdSd9G
	OEuLRMGC/u0BqtLsX45g1HaIOuWD0HkUXJ/mhOeIEwGubd0Wnv3PMUdevTOMgQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 09:20:13 +0200
Message-Id: <DB1DYAAUP3PH.22HNIV12YSR9G@bootlin.com>
Subject: Re: [OE-core] [PATCH 7/7] lttng-ust: upgrade 2.13.9 -> 2.14.0
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
References: <20250701232440.474-1-wangmy@fujitsu.com>
 <20250701232440.474-7-wangmy@fujitsu.com>
In-Reply-To: <20250701232440.474-7-wangmy@fujitsu.com>
X-GND-State: clean
X-GND-Score: 49
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucgoufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeefleefkeffjeekgfegueevvddttdeltedugfeujeetieehjeefiefhfeeuueegnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdplhhtthhnghdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepfigrnhhgmhihsehfuhhjihhtshhurdgtohhmpdhrtghpthhto
 hepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219787

On Wed Jul 2, 2025 at 1:24 AM CEST, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-lttng-ust-common-link-with-liburcu-explicitly.patch
> 0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
> refreshed for 2.14.0
>
> License-Update: add suffix ".txt" to according files.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...0001-lttng-ust-common-link-with-liburcu-explicitly.patch | 6 +++---
>  ...thon-lttngust-Makefile.am-Add-install-lib-to-setup.patch | 6 +++---
>  .../lttng/{lttng-ust_2.13.9.bb =3D> lttng-ust_2.14.0.bb}      | 4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
>  rename meta/recipes-kernel/lttng/{lttng-ust_2.13.9.bb =3D> lttng-ust_2.1=
4.0.bb} (92%)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-li=
nk-with-liburcu-explicitly.patch b/meta/recipes-kernel/lttng/lttng-ust/0001=
-lttng-ust-common-link-with-liburcu-explicitly.patch
> index ceb240680b..b72c453b96 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with=
-liburcu-explicitly.patch
> +++ b/meta/recipes-kernel/lttng/lttng-ust/0001-lttng-ust-common-link-with=
-liburcu-explicitly.patch
> @@ -1,4 +1,4 @@
> -From 1b6bbf14de8fdfe60e446c93969e29bc2cf5f2dc Mon Sep 17 00:00:00 2001
> +From 4cdaf17efc66423aec5e3c094b9a1c31683e1a10 Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex@linutronix.de>
>  Date: Sun, 5 Sep 2021 10:44:19 +0200
>  Subject: [PATCH] lttng-ust-common: link with liburcu explicitly
> @@ -12,10 +12,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>   1 file changed, 1 insertion(+)
> =20
>  diff --git a/src/lib/lttng-ust-common/Makefile.am b/src/lib/lttng-ust-co=
mmon/Makefile.am
> -index 1ccc290..6531fa0 100644
> +index c350edc..09212a7 100644
>  --- a/src/lib/lttng-ust-common/Makefile.am
>  +++ b/src/lib/lttng-ust-common/Makefile.am
> -@@ -16,6 +16,7 @@ liblttng_ust_common_la_SOURCES =3D \
> +@@ -18,6 +18,7 @@ liblttng_ust_common_la_SOURCES =3D \
>  =20
>   liblttng_ust_common_la_LIBADD =3D \
>   	$(top_builddir)/src/common/libcommon.la \
> diff --git a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Mak=
efile.am-Add-install-lib-to-setup.patch b/meta/recipes-kernel/lttng/lttng-u=
st/0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch
> index 7bbe5c216e..faddf55402 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.a=
m-Add-install-lib-to-setup.patch
> +++ b/meta/recipes-kernel/lttng/lttng-ust/0001-python-lttngust-Makefile.a=
m-Add-install-lib-to-setup.patch
> @@ -1,4 +1,4 @@
> -From 30660997d220602202d8dc7264e49095a1581947 Mon Sep 17 00:00:00 2001
> +From 92fd7a205aff290a6f20c08e62f72094100c3689 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Tue, 20 Feb 2024 12:19:06 +0000
>  Subject: [PATCH] python-lttngust/Makefile.am: Add --install-lib to setup=
.py
> @@ -14,10 +14,10 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com=
>
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =20
>  diff --git a/src/python-lttngust/Makefile.am b/src/python-lttngust/Makef=
ile.am
> -index d53e21d..283901e 100644
> +index 30db9fb..d46b6ee 100644
>  --- a/src/python-lttngust/Makefile.am
>  +++ b/src/python-lttngust/Makefile.am
> -@@ -45,7 +45,7 @@ install-exec-local: build-python-bindings.stamp
> +@@ -47,7 +47,7 @@ install-exec-local: build-python-bindings.stamp
>   	if [ "$(DESTDIR)" !=3D "" ]; then \
>   		opts=3D"$$opts --root=3D$(DESTDIR)"; \
>   	fi; \
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb b/meta/recipes=
-kernel/lttng/lttng-ust_2.14.0.bb
> similarity index 92%
> rename from meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb
> rename to meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
> index dd7657e0cc..1a15c5b420 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_2.13.9.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://lttng.org/ust"
>  BUGTRACKER =3D "https://bugs.lttng.org/projects/lttng-ust"
> =20
>  LICENSE =3D "LGPL-2.1-or-later & MIT & GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da46577a38ad0c36ff6ff43ccf40c4=
80f"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b04e8f34dbcf08198c6618d05e8f=
e7b"
> =20
>  PYTHON_OPTION =3D "am_cv_python_pyexecdir=3D'${PYTHON_SITEPACKAGES_DIR}'=
 \
>                   am_cv_python_pythondir=3D'${PYTHON_SITEPACKAGES_DIR}' \
> @@ -33,7 +33,7 @@ SRC_URI =3D "https://lttng.org/files/lttng-ust/lttng-us=
t-${PV}.tar.bz2 \
>             file://0001-lttng-ust-common-link-with-liburcu-explicitly.pat=
ch \
>             "
> =20
> -SRC_URI[sha256sum] =3D "2ad6d69a54a1d924c18a4aa7a233db104e3cc332bcdd240e=
196bf7adbed3f712"
> +SRC_URI[sha256sum] =3D "82cdfd304bbb2b2b7d17cc951a6756b37a9f73868ec0ba7d=
b448a0d5ca51b763"
> =20
>  CVE_PRODUCT =3D "ust"
> =20
Hi,

This is causing the following issue on the Autobuilder:
| ../../../../sources/lttng-tools-2.13.15/src/bin/lttng-sessiond/ust-app.c:=
6802:23: error: too few arguments to function 'lttng_ust_ctl_recv_register_=
event'; expected 10, have 9
|  6802 |                 ret =3D lttng_ust_ctl_recv_register_event(sock, &=
sobjd, &cobjd, name,
|       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from ../../../../sources/lttng-tools-2.13.15/src/bin/ltt=
ng-sessiond/lttng-ust-ctl.h:12,
|                  from ../../../../sources/lttng-tools-2.13.15/src/bin/ltt=
ng-sessiond/buffer-registry.h:18,
|                  from ../../../../sources/lttng-tools-2.13.15/src/bin/ltt=
ng-sessiond/ust-app.c:37:
| /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/core2-32-pok=
y-linux/lttng-tools/2.13.15/recipe-sysroot/usr/include/lttng/ust-ctl.h:549:=
5: note: declared here
|   549 | int lttng_ust_ctl_recv_register_event(int sock,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/1928

Can you have a look?

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



