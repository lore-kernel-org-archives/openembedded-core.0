Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787DFC4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 16:02:02 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.17693.1667750519771808312
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 08:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PZGKXGoR;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6FE46E0004;
	Sun,  6 Nov 2022 16:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667750517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4o1zYSAqnTAlZLrXe5NFRMteK8FyCom9TFrj8TkhJ2U=;
	b=PZGKXGoRe1W0EEaRVgeHYzVwEizhTF2EFSXkrL87FO7tqksnk3xgNjLpvnWBxdtnOgg03y
	4pGxG4HQIC9rMZYMdrU1EUD0KR1pEKBKMy87gec1lixYkt9JZC0WKsUSEZ+reZNDz1mlUd
	0D32MiiDNMnAmpDc1KyMNulJ8/o6mO44L/sWjURG9nUoHaPB5+KZnmOtIYs5wi1t8zJmdY
	5ZTD1kZPTsKZ1v5o2zkQgnBZaiUZSNcoG+nPbvczmeAwC6MJFGzGv3GrsD+PpL3hpy4cOj
	4+Cf8yznrZgiu38uO9AkGjA8fSKwB9Qf+bEW63UHC1WDjWrpI5lWhhsC1C2mGg==
Date: Sun, 6 Nov 2022 17:01:57 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: ecordonnier@snapchat.com
Cc: openembedded-core@lists.openembedded.org,
	Etienne Cordonnier <ecordonnier@snap.com>
Subject: Re: [OE-core] [PATCH] mirrors.bbclass: use shallow tarball for
 nativesdk-binutils
Message-ID: <Y2fadQvhPh/wHFRK@mail.local>
References: <20221104142443.1728589-1-ecordonnier@snap.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104142443.1728589-1-ecordonnier@snap.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 16:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172805

On 04/11/2022 15:24:43+0100, Etienne Cordonnier via lists.openembedded.org wrote:
> This is useful e.g. when using meta-clang, which introduces a dependency to nativesdk-binutils when
> populating the SDK, and then a full tarball of binutils is fetched additionally to a shallow tarball.
> 
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>

The SoB needs to match the author and sender. You are using two
different addresses here.

> ---
>  meta/classes-global/mirrors.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
> index 81fef7f660..8b984de3bf 100644
> --- a/meta/classes-global/mirrors.bbclass
> +++ b/meta/classes-global/mirrors.bbclass
> @@ -91,6 +91,8 @@ BB_GIT_SHALLOW:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "1"
>  BB_GIT_SHALLOW:pn-binutils-cross-testsuite = "1"
>  BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} = "1"
>  BB_GIT_SHALLOW:pn-binutils-native = "1"
> +BB_GIT_SHALLOW:pn-nativesdk-binutils = "1"
> +
>  BB_GIT_SHALLOW:pn-glibc = "1"
>  PREMIRRORS += "git://sourceware.org/git/glibc.git https://downloads.yoctoproject.org/mirror/sources/ \
>                git://sourceware.org/git/binutils-gdb.git https://downloads.yoctoproject.org/mirror/sources/"
> -- 
> 2.36.1.vfs.0.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172714): https://lists.openembedded.org/g/openembedded-core/message/172714
> Mute This Topic: https://lists.openembedded.org/mt/94806491/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

