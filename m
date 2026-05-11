Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67457CD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 09:14:25 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45953.1778490859985667884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 02:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QF/wQ9/a;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BED784E42C04
	for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 09:14:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 932C460646;
	Mon, 11 May 2026 09:14:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32DC711AE8370;
	Mon, 11 May 2026 11:14:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778490857; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LjOitjs/aZS9UtxQF8lHIQmo6ntshwYgOIWbgW5CRts=;
	b=QF/wQ9/annlwcY2ST7IX/8a9bQQGAD5lIPrZqsHkCNnZh8JvyIU7GWYPT5DSPPlzScx1yK
	D8nUHK4T5PQGImwsjG/hs/TTzTLKmqjgF1uynrATQRmdnTc93Ld1LHdHTcTvzYVTD3had7
	4XxgeIIzCUbzesLLNYpHRjvm5URtGYhyrThKauUUafHyg3OTTx6uFp4Mfr9/mYyd8tqHRg
	1BMCDeKj+4oU9TvJdbFGmYSx+yo1GwugqdynDl0RCz2+i9ECdItFTcCVzS7agruqCYL/SM
	wmrNVfAVSD4rBA1LJe+uwdwxhf+bbyZOncAqTNae2ljj8EwHRI667IpPuUsBfQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 11:14:15 +0200
Message-Id: <DIFQE3VZD05G.2H5DUXPSAEZF5@bootlin.com>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gnutls: upgrade 3.8.12 -> 3.8.13
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260510162450.1988369-1-peter.marko@siemens.com>
In-Reply-To: <20260510162450.1988369-1-peter.marko@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 09:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236788

On Sun May 10, 2026 at 6:24 PM CEST, Peter Marko via lists.openembedded.org=
 wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Solves CVE-2026-33846, CVE-2026-42009, CVE-2026-33845, CVE-2026-42010,
> CVE-2026-3833, CVE-2026-42011, CVE-2026-42012, CVE-2026-42013,
> CVE-2026-42014, CVE-2026-5260, CVE-2026-42015, CVE-2026-3832 and
> CVE-2026-5419.
>
> Release notes: [1]
>
> Rebase patches and drop patch included in this release.
>
> [1] https://github.com/gnutls/gnutls/blob/3.8.13/NEWS
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---

Hi Peter,

Thanks for the upgrade.

I note some issues on the autobuilder: build issues with musl and ptest
failures.

ERROR: gnutls-3.8.13-r0 do_install_ptest_base: Execution of '/srv/pokybuild=
/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/gn=
utls/3.8.13/temp/run.do_install_ptest_base.4034882' failed with exit code 1
...
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-po=
ky-linux-musl/gnutls/3.8.13/recipe-sysroot-native/usr/bin/i686-poky-linux-m=
usl/i686-poky-linux-musl-ld: mini_dtls_fragments-mini-dtls-fragments.o: in =
function `split_client_hello':
| /usr/src/debug/gnutls/3.8.13/tests/mini-dtls-fragments.c:429:(.text+0x6c)=
: undefined reference to `rpl_malloc'
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-po=
ky-linux-musl/gnutls/3.8.13/recipe-sysroot-native/usr/bin/i686-poky-linux-m=
usl/i686-poky-linux-musl-ld: /usr/src/debug/gnutls/3.8.13/tests/mini-dtls-f=
ragments.c:431:(.text+0x8b): undefined reference to `rpl_malloc'
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-po=
ky-linux-musl/gnutls/3.8.13/recipe-sysroot-native/usr/bin/i686-poky-linux-m=
usl/i686-poky-linux-musl-ld: mini_dtls_fragments-mini-dtls-fragments.o: in =
function `queue_put_renumbered':
| /usr/src/debug/gnutls/3.8.13/tests/mini-dtls-fragments.c:412:(.text+0x391=
): undefined reference to `rpl_malloc'
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-po=
ky-linux-musl/gnutls/3.8.13/recipe-sysroot-native/usr/bin/i686-poky-linux-m=
usl/i686-poky-linux-musl-ld: /usr/src/debug/gnutls/3.8.13/tests/mini-dtls-f=
ragments.c:417:(.text+0x44c): undefined reference to `rpl_free'
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-po=
ky-linux-musl/gnutls/3.8.13/recipe-sysroot-native/usr/bin/i686-poky-linux-m=
usl/i686-poky-linux-musl-ld: mini_dtls_fragments-mini-dtls-fragments.o: in =
function `client_push_split_hello':
| /usr/src/debug/gnutls/3.8.13/tests/mini-dtls-fragments.c:472:(.text+0x535=
): undefined reference to `rpl_free'
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-po=
ky-linux-musl/gnutls/3.8.13/recipe-sysroot-native/usr/bin/i686-poky-linux-m=
usl/i686-poky-linux-musl-ld: /usr/src/debug/gnutls/3.8.13/tests/mini-dtls-f=
ragments.c:473:(.text+0x541): undefined reference to `rpl_free'
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-po=
ky-linux-musl/gnutls/3.8.13/recipe-sysroot-native/usr/bin/i686-poky-linux-m=
usl/i686-poky-linux-musl-ld: mini_dtls_fragments-mini-dtls-fragments.o: in =
function `client_push_split_hello_bad_seq':
| /usr/src/debug/gnutls/3.8.13/tests/mini-dtls-fragments.c:500:(.text+0x629=
): undefined reference to `rpl_free'
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-po=
ky-linux-musl/gnutls/3.8.13/recipe-sysroot-native/usr/bin/i686-poky-linux-m=
usl/i686-poky-linux-musl-ld: /usr/src/debug/gnutls/3.8.13/tests/mini-dtls-f=
ragments.c:501:(.text+0x635): undefined reference to `rpl_free'
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-po=
ky-linux-musl/gnutls/3.8.13/recipe-sysroot-native/usr/bin/i686-poky-linux-m=
usl/i686-poky-linux-musl-ld: mini_dtls_fragments-mini-dtls-fragments.o: in =
function `client_push_inj0':
| /usr/src/debug/gnutls/3.8.13/tests/mini-dtls-fragments.c:192:(.text+0x139=
d): undefined reference to `rpl_malloc'
| /srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-po=
ky-linux-musl/gnutls/3.8.13/recipe-sysroot-native/usr/bin/i686-poky-linux-m=
usl/i686-poky-linux-musl-ld: /usr/src/debug/gnutls/3.8.13/tests/mini-dtls-f=
ragments.c:208:(.text+0x1424): undefined reference to `rpl_free'
| collect2: error: ld returned 1 exit status

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3767
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/391
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/375

Failed ptests:
{'gnutls': ['key-openssl']}
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3652


Can you have a look at the issues?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


