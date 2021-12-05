Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CCBC433EF
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 01:27:47 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.32515.1638667665430291364
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 17:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=g4GKcgAT;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1638667665;
  x=1670203665;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8TvlEvMZyjYudDpboDClHKn8sc18vd6hZ8xw2T1RrfA=;
  b=g4GKcgATR47OOy43eIvc6HHLQcdvl3OqIIXzfLAw23u9QFa9DG7MwcX8
   gREQhBYESDnDbRZAf5rc81cTSiN/tuoaHSB95e9yZrMke+x1vvar9adpB
   IGQHZFZO6xLEaxUkYU0gk9ErFYgs8m1kAsctyHka2Kq5cVvBW1Jtg59ag
   Emu08cAkVDHPJ89f+kjcedKhFj7qcBdnOVN4hjR0TGUGCRBq2tE4ZxywC
   paI5eHsBOZVZYGvti4zy8DNfy4e3fmda154Qfb5q7HmvUhWMYK/GMdlQn
   wfYeRKcwasg1ImGzTvcvTZe3DiwkpzOqHtbt16sUn41pJuOgdeONEhfVA
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 26/26] serf: mark patches as inappropriate for
 upstream submission
Thread-Topic: [OE-core] [PATCH 26/26] serf: mark patches as inappropriate for
 upstream submission
Thread-Index: AQHX6N8NC6kNULozqUq/hyxxeYTk5KwjHBFQ
Date: Sun, 5 Dec 2021 01:27:43 +0000
Message-ID: <4895d5ef7ab64630844bc041de06f0db@axis.com>
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-26-alex@linutronix.de>
In-Reply-To: <20211204071323.2480163-26-alex@linutronix.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Dec 2021 01:27:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159188

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 4 december 2021 08:13
> To: openembedded-core@lists.openembedded.org
> Cc: Alexander Kanavin <alex@linutronix.de>
> Subject: [OE-core] [PATCH 26/26] serf: mark patches as inappropriate for
> upstream submission
>=20
> With this commit I am entering the patch nirvana (and I intend to stay
> there):
>=20
> ~/development/poky$ grep -ilr "upstream-status: pending" `grep -ilr kanav=
in meta*`|wc -l
> 0

Even though we appreciate your work, I think the two paragraphs above=20
belong after the --- below, as they don't have anything to do with the=20
actual change in this commit.

//Peter

>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch    | 2 +-
>  ...op.creating.directories.without.sandbox-install.prefix.patch | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do=
-
> not-use-ERR_GET_FUNC.patch b/meta/recipes-support/serf/serf/0001-buckets-
> ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
> index e6172ef5aa..73e8a8386b 100644
> --- a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-
> use-ERR_GET_FUNC.patch
> +++ b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-
> use-ERR_GET_FUNC.patch
> @@ -6,7 +6,7 @@ Subject: [PATCH] buckets/ssl_buckets.c: do not use
> ERR_GET_FUNC
>  Upstream removed it in
>  https://github.com/openssl/openssl/pull/16004
>=20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [last release in 2015, last commit in
> 2019]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>  ---
>   buckets/ssl_buckets.c | 3 +--
> diff --git a/meta/recipes-
> support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-
> install.prefix.patch b/meta/recipes-
> support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-
> install.prefix.patch
> index 91640d6044..ba1b01c740 100644
> --- a/meta/recipes-
> support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-
> install.prefix.patch
> +++ b/meta/recipes-
> support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-
> install.prefix.patch
> @@ -31,7 +31,7 @@ ERROR: scons install execution failed.
>    and the installed paths (including the paths inside libserf*.pc)
>    look correct
>=20
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [last release in 2015, last commit in
> 2019]
>=20
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> --
> 2.20.1


