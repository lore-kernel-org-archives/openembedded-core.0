Return-Path: <daniel@qtec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF451C6FA82
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 11:34:33 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.9846.1664278468842977202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 04:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=Y+WUKS3K;
 spf=pass (domain: qtec.com, ip: 209.85.217.46, mailfrom: daniel@qtec.com)
Received: by mail-vs1-f46.google.com with SMTP id h1so9325116vsr.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 04:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=qDYWiL5drBG+kd9JGxycPsCKcF2U2Wipho0Gm6LkDr8=;
        b=Y+WUKS3KafQKH7yBLhYrMK5Iqs6mKgCwGu17QGl3DyV8Y1EMRTXMPYz5rnEaIVWBh8
         u3aSwmor3iyRkooD4ebj5VIxLEjqspWmUtp5EJINHPRYJzBGPPNWzaOsMvAoEjmpB0bI
         CGvomJTPo+3a7Ah9/RfQsSAnXU8+9j2K8MdNC0VG22uzXqteLz96LBOMR6TQka7th8uE
         66KyXxE3VTVkEljl4jLA+EINvCifP5+QgcxD07Tukk3KZF7poFiW4WnQSlwZU8s/WW8I
         0LtlZXb68htv78il5T1ZUgXWNdwaDKCteMRFCfOSHzpD8B5jS5+xwfVMb++GMmep4QkQ
         nzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=qDYWiL5drBG+kd9JGxycPsCKcF2U2Wipho0Gm6LkDr8=;
        b=m6eDOi9g6qBeq+sFcV37XJaR5b1ic0D94oIeWIjzhle2pObc2fvr6jT81dx/StlVG9
         nsfs+ji6fA/szYLWBsiNAAIu/RZfaesgD72lpf1XctFmekCQpgeZ9AwXnrEULPYdvTAP
         QmG3kkRyTCDuTEwkOqlxDDT0S/U/KYA94yjygUgUwr6gVRgjUdxofoAJ4QPKSov4mWp9
         hat7E+6qRVrZGkCQZGT2s+/HAQLdPcX5MlQnnTSlP6gjg9O9p54MhoVbbQphA1/LLnOj
         hsjZb9PNK5q8dSYoHaVthjsDZlJnSZlgUlYR2MzNQI9dAG9ZwEClZEn/oc9qviajIBuu
         +nsw==
X-Gm-Message-State: ACrzQf0ItGmb6L0/vzhO7zFdqKXgIobr7AVy9mY67xY66xm4HB0ge8LW
	hy6h1stMAN0CP7m3YW9daCIZy+IWnoRSXqjJOiocmQ==
X-Google-Smtp-Source: 
 AMsMyM7lIiv12dYMOMrviHYjNdRCxhZZax+vUq+OEj0Df5Zl6/zAC8BZYRI6sZ0u/uoapBbqmV2liHvrKfbpBr+YkaY=
X-Received: by 2002:a05:6102:3ec7:b0:356:cbdf:122d with SMTP id
 n7-20020a0561023ec700b00356cbdf122dmr9229853vsv.9.1664278467728; Tue, 27 Sep
 2022 04:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <258A1233-0D8F-4A61-B976-AE5D4A1516C5@arm.com>
 <20220927102904.722281-1-daniel@qtec.com>
 <8AA6EB38-88F4-448C-9C63-5848162DB40F@arm.com>
In-Reply-To: <8AA6EB38-88F4-448C-9C63-5848162DB40F@arm.com>
From: Daniel Gomez <daniel@qtec.com>
Date: Tue, 27 Sep 2022 13:34:16 +0200
Message-ID: 
 <CAH1Ww+RttSrArcsM0Od1bFRPsc2QLhVMO9ujr73FnNHpqfFkdQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] dropbear: Add enable-x11-forwarding
 PACKAGECONFIG option
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"dagmcr@gmail.com" <dagmcr@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 11:34:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171094

On Tue, 27 Sept 2022 at 12:32, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 27 Sep 2022, at 11:29, Daniel Gomez via lists.openembedded.org <daniel=qtec.com@lists.openembedded.org> wrote:
> > diff --git a/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch b/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch
> > new file mode 100644
> > index 0000000000..994bbdd42a
> > --- /dev/null
> > +++ b/meta/recipes-core/dropbear/dropbear/0007-Fix-X11-build-failure-use-DROPBEAR_PRIO_LOWDELAY.patch
> > @@ -0,0 +1,27 @@
> > +From 0292aacdf0aa57d03f2a3ab7e53cf650e6f29389 Mon Sep 17 00:00:00 2001
> > +From: Matt Johnston <matt@ucc.asn.au>
> > +Date: Sat, 23 Apr 2022 22:33:31 +0800
> > +Subject: [PATCH] Fix X11 build failure, use DROPBEAR_PRIO_LOWDELAY
> > +
> > +Upstream-Status: Backport
>
> This patch also needs your S-o-b.

Okay, thanks. I will then send a v2 with that. Although this should
have been the v2 already. Sorry for that.

Here the previous patch thread:
https://lore.kernel.org/all/20220720194416.89631-1-daniel@qtec.com/
>
> Thanks,
> Ross
>

