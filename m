Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DCFC433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 16:28:02 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.1880.1636648081210356934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 08:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eIKkRHjp;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id n15so5857471qta.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 08:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m46o9OvlmlxiB7Fmbuk5hp4NTXbWU494hiQcpG0bt64=;
        b=eIKkRHjpnCK8qqhSIPNJ7eAtz27+4kqAm6nfZkKV8dv3on+7Wk0/zpYMjFtLdKprGu
         N9KDpT2+2MwBf7PPjvJ4bT7MquXpk34pNY4vCg7J8sBNrJUrPO7xeqESE9npYfYJ98V7
         eI3Em+2TzXRPhMUaO9GwI47OYdcbSmoEnY9NY15vW1+ZdPjG1UcgvkDGLxmlaC3UR7pS
         tdYoI2RinJgLCJ/O9MZdDcQ+BaX5Y4PyT8t/nE7AB+Zg+/jZfXojThuLqObMpu1n3EBV
         w+eCdAaRLkymN3I4yu0Irf4J5O5asIWU/DSryYcruqFDEQ0fhxO3QzVl4T32N+BmB1Fq
         d76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m46o9OvlmlxiB7Fmbuk5hp4NTXbWU494hiQcpG0bt64=;
        b=u2MIOAlG+K/f6WkaH+knD9n2EDMZyUyQwzitDXoNR52XHCK6f5AJGLGpyZ+dEKTs3V
         H2Mrge9ayaicBh0/sGZcp1NUSaRTOAP1zqf2uzI5Tau0MDB3Gt/VlgR/cVBYCoTCLhAm
         mM+VFtsrA3187AlFEUCLZFhlaYX2VdAIjuYjmhfpr9hu2TLXUqZdY3rGhMYfyc2F4D/4
         wNFjtKscIjU1IRLCMojM/d4V4pT8rFtWfm4kYJ6QhJbnNa8b0WW2jPC721qDUSHJhkLq
         mMnqCA9gsWV/8ygulMnccnOUC7MsnfGsOHYyZq+dwPrEY+cMe9B6Xwm46iIS1ciCtgPQ
         gTWw==
X-Gm-Message-State: AOAM530Hq8b3xaPSMOZFpa3zGasM2HK46vSIcHp6epDpv8qmcj2Wjf+1
	Yo+ccjqzbB7lmwvkR+UBL+W67UfMe2UUTN61x+s=
X-Google-Smtp-Source: 
 ABdhPJwMnvpDCErPOg7TUriOZ5+F88494b6F9UDvjihzEg/ChrFte4ffPxegmUQGlHVqpIMZuJbtLnpnYq5l6T/1vwg=
X-Received: by 2002:ac8:1e0b:: with SMTP id n11mr8657401qtl.274.1636648078870;
 Thu, 11 Nov 2021 08:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20211111153946.10084-1-anuj.mittal@intel.com>
In-Reply-To: <20211111153946.10084-1-anuj.mittal@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Nov 2021 08:27:33 -0800
Message-ID: 
 <CAMKF1srS75BpqQ0XJ_aJvXSQSrLGqYSGwDGnyS7aTj2nMcpc5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc-version.inc: remove branch= from
 GLIBC_GIT_URI
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 16:28:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158192

On Thu, Nov 11, 2021 at 7:40 AM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> GLIBC_GIT_URI is used along with branch=${SRCBRANCH} so no need to add
> it here.

right, LGTM

>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index 6dac7f0c7a..281df7ecda 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -3,6 +3,6 @@ PV = "2.34"
>  SRCREV_glibc ?= "ae37d06c7d127817ba43850f0f898b793d42aea7"
>  SRCREV_localedef ?= "95c0221703ad970a52445e9eaf91c4aff35eebef"
>
> -GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;branch=master"
> +GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158190): https://lists.openembedded.org/g/openembedded-core/message/158190
> Mute This Topic: https://lists.openembedded.org/mt/86984642/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

