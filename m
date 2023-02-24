Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9DCC64ED6
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 01:57:26 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.8028.1677203837659349648
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 17:57:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lYv3nHAj;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id q11-20020a056830440b00b00693c1a62101so2476729otv.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 17:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rGPQBGp7Nw4GXKr6Mp21MvqBWap31lRqpSFYQ1igJ5Y=;
        b=lYv3nHAjHnQ+ZTXCV0F2f25rzbc7t5Ce0s9ZcGpkrFHmri38vaLU1+/gKdqSTOkeFH
         bX7PeiYKfUBHnISu3MwTxSCpJq+h0eflL+EhyTPgO6pt6EdeZeZ+o9SAapVo8o6ialIK
         b1LY32LOCu8ke4+dz2TmIMCKi8RFkVYWSwK2tU0krUzItSscPecCh4KNOZ4444U7OVIu
         OYFQj7lL5R19h9suKgDF6FxnRLtrWq327EwC0g1u1kwgzVxqYzmYcusC/OVcNMor8mhX
         K0Pbn0rMrhuQTaumTzJYfdK3tdQns5d8y93KXwXpK9dnXLxmDUZG0aVEXHy71MZpCBVi
         r5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGPQBGp7Nw4GXKr6Mp21MvqBWap31lRqpSFYQ1igJ5Y=;
        b=t6DYQxldlN5ed5oG5BoZcdPe89Pq0kg3qzcobt2hhxkbWGvH58g2BAxIEXQ4qr+ZAj
         Va5hgJInRMTELwsUtvoI3m+A3xFFDlpnCgI79N7kcoA8CCMUp0d+rSYwy2v+s7b/FtQE
         dcmlXtFQGdH7c9F0FdR+Sf+4CWsImjeIvTX3pDHsnNK65Hc9MslbMEUZ0Rs3eefZg/NV
         MxB7gr2AuMMD0+Quj4AeJq4VDCt2xxZanyONstCy5PIz4jIaAw8sS9GBQvyjqoiNjg11
         4432MGRcp7TEOzKX0/tURpCpDq5lQVNEe7NWFVazVA7Z0SOg/XH3ws9YaHoyN5tEjzv9
         1lCQ==
X-Gm-Message-State: AO0yUKULNxZQdEfe6MgtzyjwauNSshQmoPw8+UO8zmZQd3CI3hDptPAw
	Tumo7s2HdxAWfNvEBbpMqZ+Suk9VzE77yLN44putPCIl
X-Google-Smtp-Source: AK7set8UsROC3Ng745N50OD9FZVv5morn/2RXBWFXoj2aFJa0u+Vtug5E9Pu7xOJkLZGEa/VDcIWnkab7tM3u8sC9CQ=
X-Received: by 2002:a05:6830:40b7:b0:690:daac:e823 with SMTP id
 x55-20020a05683040b700b00690daace823mr1066108ott.2.1677203836785; Thu, 23 Feb
 2023 17:57:16 -0800 (PST)
MIME-Version: 1.0
References: <20230223065816.3151823-1-raj.khem@gmail.com> <Y/f3/n9f4AxtHcoo@mail.local>
In-Reply-To: <Y/f3/n9f4AxtHcoo@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Feb 2023 17:56:50 -0800
Message-ID: <CAMKF1srZ=NMtKo_Pn=s9ow913j8AmC9heZKGKyHRB6RAStJFdA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] binutils: Enable --enable-new-dtags
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 01:57:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177648

On Thu, Feb 23, 2023 at 3:34 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Could this be the cause of this?
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230223-79c9rmcw/packages/diff-html/

most likely yes. I will take a look. Lets work on merging the other
binutils and gdb upgrade patch meanwhile.

>
> On 22/02/2023 22:58:16-0800, Khem Raj wrote:
> > Use DT_RUNPATH over DT_RPATH. If DT_RUNPATH is present, LD_LIBRARY_PATH is searched before
> > DT_RUNPATH, Search order is DT_RPATH then LD_LIBRARY_PATH then
> > DT_RUNPATH, this order ensures that injecting
> > malicious shared objects is way harder with DT_RUNPATH.
> >
> > This is now default on major linux distributions already
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/binutils/binutils.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> > index b2dbf241df..c69d29448f 100644
> > --- a/meta/recipes-devtools/binutils/binutils.inc
> > +++ b/meta/recipes-devtools/binutils/binutils.inc
> > @@ -96,6 +96,7 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
> >                  --disable-werror \
> >                  --enable-deterministic-archives \
> >                  --enable-plugins \
> > +                --enable-new-dtags \
> >                  --disable-gdb \
> >                  --disable-gdbserver \
> >                  --disable-libdecnumber \
> > --
> > 2.39.2
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#177602): https://lists.openembedded.org/g/openembedded-core/message/177602
> > Mute This Topic: https://lists.openembedded.org/mt/97178429/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

