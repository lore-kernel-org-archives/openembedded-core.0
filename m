Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1E3CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 09:43:22 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5819.1763372598154112779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 01:43:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DMbf6/Cy;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9FD01C12641;
	Mon, 17 Nov 2025 09:42:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF64C60720;
	Mon, 17 Nov 2025 09:43:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 505FF1037197C;
	Mon, 17 Nov 2025 10:43:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763372595; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ugbzsr62WvJP0XlE97J6sHLC1EKdKiuialvC/gWCxM0=;
	b=DMbf6/CywxkPiZYXd9GNUFcImh3VUv8bmuxYlK/+7lqK/NH1siTSXxYREC6Wev/pHMfuKU
	7m2nf8wxw/xPAwvU7oDZXvblrWvY0IIpJT7xzRYIdML6HkmS/0V8tRBzQprFmt9Md0007R
	80XaixE4FitZwSXFklGYeGZJ91qxGkkFuroEsa8AB1q2TThcft6aMuB594PPKmrl2Prb9+
	JtfBRaVb1rVriMDa7cMjvMmuUZlx9MEecLZAIDnmWIGnniMbwi5pmEkwI7Of4/5h7QKw8p
	cegDqWTsGUdoYOPXdf2D0TnNOXDt0MgDajm5mrlBlu4CS7CZeanAUOf9cvMdng==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Nov 2025 10:43:13 +0100
Message-Id: <DEAVEY6WFZQJ.3TEPYDJIZ01P7@bootlin.com>
Subject: Re: [OE-core][PATCH v4 2/2] opkg: upgrade 0.8.0 -> 0.9.0
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ecordonnier@snap.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251023134656.2059483-1-ecordonnier@snap.com>
 <187122D70EFBB6A8.8642@lists.openembedded.org>
 <CAHUKmYb450p4o1-sE1TsFLUgp1iQn6D1ZAhhsZagb3L5BpeGYA@mail.gmail.com>
In-Reply-To: <CAHUKmYb450p4o1-sE1TsFLUgp1iQn6D1ZAhhsZagb3L5BpeGYA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 09:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226489

On Mon Nov 17, 2025 at 10:26 AM CET, Etienne Cordonnier via lists.openembed=
ded.org wrote:
> Hi,
> what is the status of the patch updating to 0.9.0? I have seen that it is
> not in master-next any more.
>
> Thanks
> =C3=89tienne
>

Hi =C3=89tienne,

Your patch is still in the queue, but is expected to be merged in master
after whinlatter release, so it is not present in master-next at this
time.

You can see it in my master-next branch:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dmathieu/mas=
ter-next&ofs=3D50

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


