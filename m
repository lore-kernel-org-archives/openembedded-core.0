Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DE1CD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 17:07:49 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93.1781716064821751232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 10:07:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kU+vyGIy;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8B673C2B9E0
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 17:07:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76F4D601AA;
	Wed, 17 Jun 2026 17:07:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75933106C82E9;
	Wed, 17 Jun 2026 19:07:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781716062; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k8RSirigM00XhE8RoWgPeVEJ9Q3bXlU9lUBlfldFGUI=;
	b=kU+vyGIyH75RXmbXdEW2Ud6bec7j5K/jZckAw3KtrhFnA/UK7KarLw13i6vT/Zy5Gv5Fpg
	zZzJIGKu8TbG/6Cw6oLOdWcPnyT9fIsAVwsWF86SEmUI9xl1aVCwYTjRejLLLtbEU8DQCw
	MIqOvUKWR/Z4P3lxQ6NiqXrOvT8MOaORDMB965e/xDEBmUyEByrSb1wwLvn8B2yYKtYKBG
	Nto1rIOOiAuz4SrWfCCC1s4TMlEfhv8oNhNZ+sX+eqJXudteePCYLoRT+T/qpcYvJ5wVQb
	dvfOl3hW8Gsi6Up/nLGoWhNOoJOPG2SUGmUDrMoQXU1oqN5S+R8Z0SeDyRQIUw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 19:07:39 +0200
Message-Id: <DJBHMQ37OJNP.MM0EK1L3DGP2@bootlin.com>
Subject: Re: [OE-core] [PATCH 02/30] gstreamer1.0: upgrade 1.28.2 -> 1.28.4
 (the remaining pieces)
Cc: "Alexander Kanavin" <alex@linutronix.de>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
 <20260616191628.2014553-2-alex.kanavin@gmail.com>
In-Reply-To: <20260616191628.2014553-2-alex.kanavin@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 17:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239039

On Tue Jun 16, 2026 at 9:15 PM CEST, Alexander Kanavin via lists.openembedd=
ed.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...001-Make-player-examples-installable.patch | 21 +++++++++----------
>  ...mples_1.28.2.bb =3D> gst-examples_1.28.4.bb} |  2 +-
>  ...ialized-warnings-when-compiling-with.patch |  4 ++--
>  ...-avoid-including-sys-poll.h-directly.patch |  2 +-
>  ...issing-opencv-data-dir-in-yocto-buil.patch |  4 ++--
>  ...added-buffers-in-wl_shm-buffer-creat.patch |  5 +----
>  ....bb =3D> gstreamer1.0-plugins-bad_1.28.4.bb} |  2 +-
>  ...et-caps-from-src-pad-when-query-caps.patch |  6 +++---
>  ...parse-enhance-SSA-text-lines-parsing.patch |  2 +-
>  ...iv-fb-Make-sure-config.h-is-included.patch |  2 +-
>  ...bb =3D> gstreamer1.0-plugins-base_1.28.4.bb} |  2 +-
>  ...bb =3D> gstreamer1.0-plugins-good_1.28.4.bb} |  2 +-
>  ...bb =3D> gstreamer1.0-plugins-ugly_1.28.4.bb} |  2 +-
>  ....bb =3D> gstreamer1.0-rtsp-server_1.28.4.bb} |  2 +-
>  14 files changed, 27 insertions(+), 31 deletions(-)
>  rename meta/recipes-multimedia/gstreamer/{gst-examples_1.28.2.bb =3D> gs=
t-examples_1.28.4.bb} (96%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.28.=
2.bb =3D> gstreamer1.0-plugins-bad_1.28.4.bb} (99%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.28=
.2.bb =3D> gstreamer1.0-plugins-base_1.28.4.bb} (98%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.28=
.2.bb =3D> gstreamer1.0-plugins-good_1.28.4.bb} (97%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.28=
.2.bb =3D> gstreamer1.0-plugins-ugly_1.28.4.bb} (94%)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.28.=
2.bb =3D> gstreamer1.0-rtsp-server_1.28.4.bb} (90%)
>

Hi Alex,

Thanks for your patch.

So what about the beaglebone issue you mentioned? So far I confirm the
error is present:

ERROR: gstreamer1.0-plugins-base-1.28.4-r0 do_compile: Execution of '/srv/p=
okybuild/yocto-worker/beaglebone-alt/build/build/tmp/work/cortexa8hf-neon-p=
oky-linux-gnueabi/gstreamer1.0-plugins-base/1.28.4/temp/run.do_compile.3786=
75' failed with exit code 1
...
| Assembler messages:
| {standard input}:774: Error: unexpected character `w' in type specifier
| {standard input}:774: Error: bad instruction `add.w r8,r8,ip'
| {standard input}:776: Error: unexpected character `w' in type specifier
| {standard input}:776: Error: bad instruction `add.w r8,r8,ip'
| {standard input}:778: Error: unexpected character `w' in type specifier
| {standard input}:778: Error: bad instruction `add.w r8,r8,ip'
| {standard input}:891: Error: unexpected character `w' in type specifier
| {standard input}:891: Error: bad instruction `add.w r8,r8,ip'
| {standard input}:893: Error: unexpected character `w' in type specifier
| {standard input}:893: Error: bad instruction `add.w r8,r8,ip'
| {standard input}:895: Error: unexpected character `w' in type specifier
| {standard input}:895: Error: bad instruction `add.w r8,r8,ip'
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/3938

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


