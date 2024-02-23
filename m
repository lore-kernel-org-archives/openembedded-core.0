Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CD1C5478C
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 09:10:35 +0000 (UTC)
Subject: Re: [PATCH 1/3] useradd.bbclass: Fix order of postinst-useradd-*
To: openembedded-core@lists.openembedded.org
From: "Jermain Horsman" <jermain.horsman@nedap.com>
X-Originating-Location: Enschede, Overijssel, NL (143.178.210.159)
X-Originating-Platform: Windows Firefox 122
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 23 Feb 2024 01:10:27 -0800
References: <5eb199fe11d71f598726b75808b3330cd3efd2e5.1708613381.git.pidge@baylibre.com>
In-Reply-To: <5eb199fe11d71f598726b75808b3330cd3efd2e5.1708613381.git.pidge@baylibre.com>
Message-ID: <5914.1708679427032535180@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 09:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196053

Although I did notice the rest of the file uses this syntax,
and I do not believe there are any guidelines specific to this (that I am a=
ware of),
I did want to comment on this.

> +	if test "x$1" =3D "xgroup"; then

> +	if test "x$1" =3D "xuser"; then

> +	if test "x$1" =3D "xgroupmems"; then

As these are quotes variables the added 'x' doesn't really add anything her=
e.

> +	if test "x$1" =3D "x"; then

Same here, but this could just test for a zero length variable instead usin=
g 'test -z "$1"'.

Sincerely,

Jermain Horsman

