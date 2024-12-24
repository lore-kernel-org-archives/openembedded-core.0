Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71403E77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:12:50 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.30369.1735031561967580922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:12:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I30yRHcC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DE221C0002;
	Tue, 24 Dec 2024 09:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735031560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3/1MP0yH/9C0Ljfo//xPztgsbzAe3eZZbtbJsAQsXr0=;
	b=I30yRHcCG/gRS46jYlKQBrcHsOLHI277VVO0me0KVjxsiYkrnwDYfwGZQE9aAhWgLQKame
	B3G19zUPQ9MxbrgeroAZ+qg2uCfSJplxZgwuvgistCtjXvSp16z4mc6sT5Yub9ywgKVco+
	HfmEehb6vjuuwMcaduvdCi28TaURYglf3oQy96M59a0cIwLSW5EzkDRIuOFlLWlVbfDV2U
	1wIPaQpb31PwGsarkwG3x+oaqXWGB3UIwfmFaTA1GBubK1n1g9y8VUEnq3OwIq+lht/sys
	YjX4KrOy5pYRzP+ztMdsMyyjaEIbY/89bNAgq88kYqVhjx3OGt4wuNddkkV0nw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Dec 2024 10:12:40 +0100
Message-Id: <D6JTCV5WC5QA.7PWQQGV9CR4B@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 10/22] python3-jinja2: upgrade 3.1.4 -> 3.1.5
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
 <1734945065-4373-10-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1734945065-4373-10-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 09:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209060

On Mon Dec 23, 2024 at 10:10 AM CET, wangmy via lists.openembedded.org wrot=
e:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-python-module-do-not-manipulate-the-environment-when.patch
> removed since it's included in 3.1.5
>
> Changelog:
>  https://jinja.palletsprojects.com/en/stable/changes/
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/python3-jinja2/fix-3.13.patch      | 87 -------------------
>  ...inja2_3.1.4.bb =3D> python3-jinja2_3.1.5.bb} |  6 +-
>  2 files changed, 1 insertion(+), 92 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3-jinja2/fix-3.13.=
patch
>  rename meta/recipes-devtools/python/{python3-jinja2_3.1.4.bb =3D> python=
3-jinja2_3.1.5.bb} (85%)
>
> diff --git a/meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch b=
/meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch
> deleted file mode 100644
> index 34ecd15176..0000000000
> --- a/meta/recipes-devtools/python/python3-jinja2/fix-3.13.patch
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -From cf6ba7732b49ab4637aa747186cf1d1572688584 Mon Sep 17 00:00:00 2001
> -From: Thomas Grainger <tagrain@gmail.com>
> -Date: Mon, 13 May 2024 18:02:35 +0100
> -Subject: [PATCH] fix test_package_zip_list on 3.13
> -
> -Upstream-Status: Backport [https://github.com/pallets/jinja/pull/1979]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----

Hi Wang,

We have some failing ptests on this one:

AssertionError:
Failed ptests:
{'python3-jinja2': 'START: ptest-runner\n'

https://valkyrie.yoctoproject.org/#/builders/61/builds/633/steps/12/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/73/builds/635/steps/13/logs/st=
dio

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20241223-59/testresults/qemuarm64=
-ptest/core-image-ptest-python3-jinja2/
https://valkyrie.yocto.io/pub/non-release/20241223-59/testresults/qemux86-6=
4-ptest/core-image-ptest-python3-jinja2/

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


