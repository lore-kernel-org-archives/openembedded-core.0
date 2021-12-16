Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B275BC433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 22:27:47 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.1270.1639693666471133620
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 14:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EDWP8QZy;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id d2so367846qki.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 14:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bu1CzS4DgNymZv93P++JhklAC14ItSlDWTp5ZcCPAOI=;
        b=EDWP8QZyh1kAl9MERrsQj8zv08ubpJo4bWmkDuMQqj0vAIctDfs7uRpVY90KuWUB4q
         hR3OsHEgINexqPJ+VVG/ZcrHJJ2vq/9fLv7rAWVMUoEiddH1U4JbyFP0LvDcXzlPuOhn
         niKFaI9OPs3zEgR7QDRnorSmJsAfKBSLUs2rvY+7MvuZTgGSl0XHJ4c9gFhFQXr5P2sX
         d0LZEBWxBPUoe5a8XEuHRyKWCF5od8v0e+5eqwYblm3XLdYt+tuyc4EKroTSGhEYqKU+
         dIyUbjjxEVW09whoLNnLt0xhbwv8KIOSpARpqKLR6xMM5IfsOxOxxYdMvZ/E4JgYxvSm
         ixKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bu1CzS4DgNymZv93P++JhklAC14ItSlDWTp5ZcCPAOI=;
        b=eIvnJRKamyvjHRWdH1SlQ6ryP7Iv6pDaS4Hj72sMcYY/4Aawl5Z9Omrp8n1PmgJXOf
         hZVhDAFC2pTYdWCqgOR6uS8GA6gZu6vpxduVRRsA7/PNgNIv3E7E67KI64E33ZyaHC15
         E+N1bNhNGpL1E4SuAIOH2JXNpm4eJBDKb+INA5t4K8WVsH1L6gAJLmiyACMEYF4ZCsTo
         wsZuecl5rso/8DhXvAxCNNSNOqwfpJJBZTgkXvUw0Fxjmq1CKt4OkF8y6rxxhi8wpAFB
         9bCvFUKH9oaMxm/4mx8cVxueg/Cu5XdWZHK0Ez8v0LjKCK/MeLWocAWqtAvPrMIxvC4e
         m4sA==
X-Gm-Message-State: AOAM530KcHRN37FUf9RBVVE1f4PFSWNt3PlkUss9J/9XlO87S0gXUyV6
	xpToDaER+n7y4HTaX7Ym51VPTuvAqFNx3i7CXfzm9QqR
X-Google-Smtp-Source: 
 ABdhPJzKpCqlkXTqoxu/J09zbFUc6yoZUw86xHWSA0QIpF/GWvC3ODoqyZrYuduPCthGEZdedlpisDkittyWivrnLxo=
X-Received: by 2002:a05:620a:f06:: with SMTP id
 v6mr124025qkl.149.1639693665572;
 Thu, 16 Dec 2021 14:27:45 -0800 (PST)
MIME-Version: 1.0
References: <20211216170022.22028-1-chaitanya.vadrevu@ni.com>
In-Reply-To: <20211216170022.22028-1-chaitanya.vadrevu@ni.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Dec 2021 14:27:19 -0800
Message-ID: 
 <CAMKF1sq7WTtE=9SAEuos_swd0aahCA-X3M+v0qNhLBGnydm6yg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-pyelftools: Depend on debugger, pprint
To: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 22:27:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159809

On Thu, Dec 16, 2021 at 9:00 AM Chaitanya Vadrevu
<chaitanya.vadrevu@ni.com> wrote:
>
> python3-pyelftools uses python3-debugger, python3-pprint.
> So add dependencies on these packages.
>
> Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
> ---
>  meta/recipes-devtools/python/python3-pyelftools_0.27.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.27.bb b/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
> index 0cfd99504b..f8b9d420a5 100644
> --- a/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
> +++ b/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
> @@ -11,3 +11,5 @@ PYPI_PACKAGE = "pyelftools"
>  inherit pypi setuptools3
>
>  BBCLASSEXTEND = "native"
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-debugger ${PYTHON_PN}-pprint"

this should use new override separator. It should be RDEPENDS:${PN}

> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159796): https://lists.openembedded.org/g/openembedded-core/message/159796
> Mute This Topic: https://lists.openembedded.org/mt/87771402/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

