Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B00CA1012
	for <webhook@archiver.kernel.org>; Sat,  6 Sep 2025 07:09:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.2856.1757142570079668651
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Sep 2025 00:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TeMnJEeG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E10021A0DD7;
	Sat,  6 Sep 2025 07:09:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6EEE606A1;
	Sat,  6 Sep 2025 07:09:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C61A1102F1C26;
	Sat,  6 Sep 2025 09:09:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757142567; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N6YLVwOaTpkUujmYVokMQ+1Qt6ULYHFyrZ4I9CzJ9cg=;
	b=TeMnJEeG1hAHtvsIJo6Hw9h6B+G8w6aHOXtrwJ3j79QkpJD9ju/1ppld77TRXJ4YBQ+JLq
	oUD4xYV5l+gqs9lYlNW3bTjWyZZ3gkdeER4gZDgtnlVdzoZJV/flFbzxP3RsGw6pbCNowp
	kz8TGVRgxMebVjmKHQXop9EH72DB9VScF+cWQO9jOpOD0/A1a4AcsQMJBHmw+VoMeGM7rD
	PGZisODq5qw0UCHdUT33hfT6wb7CfAKeMcrDwjTc7cOEEvvfWe/LbyJR8c1qw4NNFJwrUU
	+y7g3sz9P7+ap0HbpCXFFa0TZxRL2GVrvZBiiB/mqSKF83Up+7CaCCghFFGnAw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 06 Sep 2025 09:09:20 +0200
Message-Id: <DCLJ1WDNAFOK.25OLNFTSU7E1J@bootlin.com>
Subject: Re: [OE-core] [PATCH 4/5] linux-yocto/6.12: update to v6.12.44
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1757088383.git.bruce.ashfield@gmail.com>
 <49711da41bc89be1bd5001b4e1398e6c88f10438.1757088383.git.bruce.ashfield@gmail.com>
In-Reply-To: <49711da41bc89be1bd5001b4e1398e6c88f10438.1757088383.git.bruce.ashfield@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Sep 2025 07:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223042

On Fri Sep 5, 2025 at 6:09 PM CEST, Bruce Ashfield via lists.openembedded.o=
rg wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating linux-yocto/6.12 to the latest korg -stable release that compris=
es
> the following commits:
>
>...
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
>  .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
>  3 files changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/reci=
pes-kernel/linux/linux-yocto-rt_6.12.bb
> index 8b8a87735c..aba255dfa3 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
> @@ -14,13 +14,13 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel=
 to linux-yocto-rt to enable it")
>  }
> =20
> -SRCREV_machine ?=3D "b9c1961e3d966405a925249e8a75ddd436429286"
> -SRCREV_meta ?=3D "ddf44e2c61ca41d03f51f460e7619488a70c6fc1"
> +SRCREV_machine ?=3D "2f3bb461fad19a35096f049d947cc639f517e22b"
> +SRCREV_meta ?=3D "b14d2173319779e94720b45b7be544da8a5f4026"
> =20

Hi Bruce,

It looks like b14d2173319779e94720b45b7be544da8a5f4026 commit is missing
from yocto-kernel-cache git:

ERROR: linux-yocto-6.12.44+git-r0 do_fetch: Fetcher failure: Unable to find=
 revision b14d2173319779e94720b45b7be544da8a5f4026 in branch yocto-6.12 eve=
n from upstream
ERROR: linux-yocto-6.12.44+git-r0 do_fetch: Bitbake Fetcher Error: FetchErr=
or('Unable to fetch URL from any source.', 'git://git.yoctoproject.org/yoct=
o-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-6.12;destsuffix=3Dke=
rnel-meta;protocol=3Dhttps')

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2344

Can you push it of fix the sha1?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


