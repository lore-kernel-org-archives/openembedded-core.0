Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD250C64ED8
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 19:39:32 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.28099.1677267568947768016
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 11:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=oBA/Ve1c;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id d30so1575600eda.4
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 11:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yeYlk+eURqf4s1ubVnfOnmSlB1ncARw0/58Z3Cviu8A=;
        b=oBA/Ve1c/X6nvqS7OTM3gnuOfl1Iqy63Gn2YWHojHoZcueXBM+BILgX1f9igr0UeuH
         Lb/r28DgVvERrf0PF3CFpi7PNzhBMeocOGJfSIdy2pCluZzzNK/r4/k6SNX4jNn7q9TQ
         46XqqFb9DQn5JnMqo23SzDJzqBeTU7wWI6ctq4FmlX/eg2DxAT5LnsjRnHK3cbMGYEWn
         Q6aJDIPN3Iw4vNFb3Xb/u/rnIdUwYzU5+kAUKr1criF6zeXmF64yKDXrN5GAPxjUP7JB
         iMhFzIi5F+26Bon1wA8W0UWqvzyTRIGUNA+aZ+zc/F1MiGVWjeqoRaMNII9XeOOsbSa9
         Uo2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeYlk+eURqf4s1ubVnfOnmSlB1ncARw0/58Z3Cviu8A=;
        b=3gKaxEx+PjWlJoK8xVu2eayqR6yFBZ9sJxtG9W/BCY5j1vFVZisj/5iXbwOBkl6FOY
         7dqUDRSyBg8R6d7SssHdyIzTdZloWRc7gPc9HcqoDNyKkJWzpWB9Ve1eRiFEDVfV2ZU+
         mBMCEFHm1tnVOM+ONn0C3GoncvCiv4LRCEkVKh0KkED6P8vB76jGu8xYGFQjr+5NKN3q
         EpOpG2kWlGtKENJMm1RbIPqP+K8mVUbgwgzzMdbV/FpsJbPg2sK6OdRdcGCHR6wfJ8bL
         QNlNhQnCUuBRkggO/o6XaUTsrnKDl3QJmoDVLcqEpLfBKBSC0Kni3xV2F3UtHMnczoO6
         y9rQ==
X-Gm-Message-State: AO0yUKU7pI3B/kiDiIZ7CsQ74znln8jOViKjC0WgkkxJryJ4qKPfflDj
	BxTLHLnNLwmdW0PMfwV8rHNoYBxVN7dgzgqn7GYFhw==
X-Google-Smtp-Source: AK7set/AK3kZOyTWLvTapf9aWnofrt8nk/iIout3QO7vytANRHm45ejfBw5dQ9/EpLkK9SlBObZQ7BOmsICByaPjaXs=
X-Received: by 2002:a50:baa4:0:b0:4ac:20b:96b0 with SMTP id
 x33-20020a50baa4000000b004ac020b96b0mr8129978ede.3.1677267566957; Fri, 24 Feb
 2023 11:39:26 -0800 (PST)
MIME-Version: 1.0
References: <PR3P192MB071469B386531AC4342395CFDAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: <PR3P192MB071469B386531AC4342395CFDAA59@PR3P192MB0714.EURP192.PROD.OUTLOOK.COM>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 24 Feb 2023 09:39:16 -1000
Message-ID: <CAOSpxdabYiY_FzTupjtfhKKO4og4Y86U7e0YziLLaWC2ffJZpA@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] bluez5: Exclude CVE-2022-39177 from cve-check
To: hsimeliere.opensource@witekio.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 19:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177711

On Tue, Feb 21, 2023 at 6:58 AM Hugo Simeliere via
lists.openembedded.org
<hsimeliere.opensource=witekio.com@lists.openembedded.org> wrote:
>
> CVE already fixed in CVE-2022-39176.patch
>
>
>
> Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
>
> ---
>
> meta/recipes-connectivity/bluez5/bluez5_5.55.bb | 7 +++++++
>
> 1 file changed, 7 insertions(+)
>
>
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
>
> index e5353bd815..be74a35e0a 100644
>
> --- a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
>
> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
>
> @@ -6,6 +6,13 @@ SRC_URI[sha256sum] = "8863717113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e089
>
 Your mailer seems to be corrupting the patch:

Applying: bluez5: Exclude CVE-2022-39177 from cve-check
error: corrupt patch at line 10
error: could not build fake ancestor
Patch failed at 0001 bluez5: Exclude CVE-2022-39177 from cve-check

Please correct and send a V2.

Thanks!

Steve

> # These issues have kernel fixes rather than bluez fixes so exclude here
>
> CVE_CHECK_WHITELIST += "CVE-2020-12352 CVE-2020-24490"
>
> +# Commit 7a80d2096f1b7125085e21448112aa02f49f5e9a, e2b0f0d8d63e1223bb714a9efb37e2257818268b
>
> +# and 0388794dc5fdb73a4ea88bcf148de0a12b4364d4 to fix CVE-2022-39177
>
> +# already backport in CVE-2022-39176.patch
>
> +# https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/1977968
>
> +
>
> +CVE_CHECK_WHITELIST += "CVE-2022-39177"
>
> +
>
> # noinst programs in Makefile.tools that are conditional on READLINE
>
> # support
>
> NOINST_TOOLS_READLINE ?= " \
>
> --
>
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177529): https://lists.openembedded.org/g/openembedded-core/message/177529
> Mute This Topic: https://lists.openembedded.org/mt/97113394/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

