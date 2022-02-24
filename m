Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C649C433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 06:01:45 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.6991.1645682504586852016
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 22:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SORE+Zgx;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id m22so1139236pja.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 22:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=dP6jbhcnYc1OFRxF+N+wfsPfqHfGYFkD6RmpW0jBwPc=;
        b=SORE+Zgx/6aNmp/tMeoSDWfTgJXOBD/AWuyJTB2EXrFc+jyxcndPf037qaRg4iKibO
         MtwuegoPqx+me6HIC7K8riyMkxKnyWIwstqhMXOsOATWoHj4tZf7Di59iKsSiH75AUxK
         qfrN7o+mocyFh7ZpgvANvj18bmdpFu9ZwN6S9dF6BffKaMp410sOLxwxf9uAfkQfUWn6
         wF7L5P40VdxTd/51z0H3i3Avb1G/RGQ25iUmSo1SAsQ5oJCB0dqxevx7gL0I/pbS/YKw
         YAK16slYZE78u+LwzAOVkg8tOTG4hpUu6DXDq2ZwMancmGjCCkWIojGrXwQ6ePOd30mc
         JENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dP6jbhcnYc1OFRxF+N+wfsPfqHfGYFkD6RmpW0jBwPc=;
        b=DEADkJwvLov3GJ3QpsTDIYihUkMKdPEu+Xo+a/xFZKMYZl94y3/hYjhirj9eP29szO
         EZRKbrt3c1UHEKbw4EvebQeUdkmBg7APGIoL5GNXuW9hA97Z8yMIrQGK4IV48tOo4Fjh
         9S0VVVJK3WdU8Hk688ECSS/taNEUakQxhFGS+Fw1cb/B2gjHijcfA813t7+QXg+P838g
         N02aY6+zBajHtABGTRncFLA3jf40oyHFFrGT0lLpE6rPiVB6NfRAYUmAsrUP0RAaYtL8
         A0I1W5dzF5OMzyIHjWRAhIYHzwBBTyf6OhEWhI707UPNTEJUe3GZJzIZonjeSmhmhfoX
         oL4Q==
X-Gm-Message-State: AOAM531XtNUNvX9yYCdCb1zhgAPAEVZhuUbwjv2gHBP6tDzUW3RV+jWn
	a3Ggy6516VH6hP4qrjL67Fg=
X-Google-Smtp-Source: 
 ABdhPJyXjZdEbDNh4v0G95EwDAaFiPRY37Z+Cje3oscRvQ4bKaOq4pmBjJiqxZoNNCtorJrVaumRCA==
X-Received: by 2002:a17:90a:8d82:b0:1bc:6b54:e798 with SMTP id
 d2-20020a17090a8d8200b001bc6b54e798mr12905841pjo.77.1645682503901;
        Wed, 23 Feb 2022 22:01:43 -0800 (PST)
Received: from ?IPV6:2601:202:4180:a5c0:a146:84cb:55f8:acd0?
 ([2601:202:4180:a5c0:a146:84cb:55f8:acd0])
        by smtp.gmail.com with ESMTPSA id
 b1sm1254648pgb.66.2022.02.23.22.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 22:01:43 -0800 (PST)
Message-ID: <a7834308-c239-23a7-6c15-e789d939ddf1@gmail.com>
Date: Wed, 23 Feb 2022 22:01:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core][dunfell 0/8] Patch review - vim CVEs
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1645465376.git.steve@sakoman.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <cover.1645465376.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 06:01:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162296



On 2/21/22 11:34, Steve Sakoman wrote:
> There's a fairly constant flow of CVEs being reported for vim, which are
> getting increasing non-trivial to backport. There are currenly 26 CVEs
> outstanding for vim in dunfell.
>
> This has been handled in master with a number of version updates. Since
> vim is a fairly stand-alone package it seems to make sense to also follow
> this strategy for dunfell.
>
> This patch series backports the vim version updates from master.
>
> I'd love to get some feedback on this approach.

Under the situation, this is a good approach. Thanks for putting series 
together.

- armin
>
> Passed a-full on autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3256
>
> with the exception of a known autobuilder intermittent issue on oe-selftest-ubuntu,
> which passed on subsequent retest:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3193
>
>
> The following changes since commit 81fab225daf798792c139f669f5bfd96d9fd25a8:
>
>    ruby: fix DEPENDS append (2022-02-21 04:52:33 -1000)
>
> are available in the Git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut
>
> Alexander Kanavin (1):
>    vim: do not report upstream version check as broken
>
> Richard Purdie (2):
>    vim: Upgrade 4269 -> 4134
>    vim: Upgrade 8.2.4314 -> 8.2.4424
>
> Ross Burton (4):
>    vim: set PACKAGECONFIG idiomatically
>    vim: upgrade to 8.2 patch 3752
>    vim: update to include latest CVE fixes
>    vim: upgrade to patch 4269
>
> Steve Sakoman (1):
>    Revert "vim: fix CVE-2021-4069"
>
>   ...1-reading-character-past-end-of-line.patch |  62 ------
>   ...src-Makefile-improve-reproducibility.patch |  13 +-
>   ...28-using-freed-memory-when-replacing.patch |  83 -------
>   ...eading-uninitialized-memory-when-giv.patch |  63 ------
>   ...rash-when-using-CTRL-W-f-without-fin.patch |  92 --------
>   ...llegal-memory-access-if-buffer-name-.patch |  86 --------
>   ...ml_get-error-after-search-with-range.patch |  72 ------
>   ...nvalid-memory-access-when-scrolling-.patch |  97 --------
>   .../vim/files/CVE-2021-3778.patch             |  61 ------
>   .../vim/files/CVE-2021-4069.patch             |  43 ----
>   ...1e135a16091c93f6f5f7525a5c58fb7ca9f9.patch | 207 ------------------
>   .../vim/files/disable_acl_header_check.patch  |  15 +-
>   .../vim/files/no-path-adjust.patch            |   8 +-
>   meta/recipes-support/vim/files/racefix.patch  |   6 +-
>   ...m-add-knob-whether-elf.h-are-checked.patch |  13 +-
>   meta/recipes-support/vim/vim.inc              |  27 +--
>   16 files changed, 33 insertions(+), 915 deletions(-)
>   delete mode 100644 meta/recipes-support/vim/files/0001-patch-8.2.3581-reading-character-past-end-of-line.patch
>   delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3428-using-freed-memory-when-replacing.patch
>   delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3582-reading-uninitialized-memory-when-giv.patch
>   delete mode 100644 meta/recipes-support/vim/files/0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch
>   delete mode 100644 meta/recipes-support/vim/files/0003-patch-8.2.3487-illegal-memory-access-if-buffer-name-.patch
>   delete mode 100644 meta/recipes-support/vim/files/0004-patch-8.2.3489-ml_get-error-after-search-with-range.patch
>   delete mode 100644 meta/recipes-support/vim/files/0005-patch-8.2.3564-invalid-memory-access-when-scrolling-.patch
>   delete mode 100644 meta/recipes-support/vim/files/CVE-2021-3778.patch
>   delete mode 100644 meta/recipes-support/vim/files/CVE-2021-4069.patch
>   delete mode 100644 meta/recipes-support/vim/files/b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162067): https://lists.openembedded.org/g/openembedded-core/message/162067
> Mute This Topic: https://lists.openembedded.org/mt/89301811/3616698
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


