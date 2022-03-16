Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9089C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 13:40:04 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.25208.1647438003382627453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 06:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b5dnDQdX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id h15so3030041wrc.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 06:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=vPLcBwM+kTW+BK1OLIpubvI8ghb6J2KzGnLcgHOCqNk=;
        b=b5dnDQdXTQNWGfJmnKXlZQy7OGlPwyhuhy4KKYUpzrWYJXKAEQO4c2ohZkiAwNUlqt
         r+rkFzeK7NKyKkACUui9zl184ueF+1ce80IEWNsE6HQ1kJFqWIJ5Gz5dO+9pRiRlHWhW
         PHBEeARledHawLn+NBY5EfXkJ9KkKP0ebqPbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vPLcBwM+kTW+BK1OLIpubvI8ghb6J2KzGnLcgHOCqNk=;
        b=kUmVCR3Xh5cPTEwPkKKevAYuwRb6mbfQiJQRmefGNHCmM3zhUKMKckitM88LpEQgAn
         I/S8K1vwpuc6Ih9FV6asA7sECE/MhWLWeJA1TwRtLM6r5cdx4axrPLz/OGAZtPyHZ+oY
         muxHrimgx36FgWgz+q8eGa4CyoR6nzoZjmulmZq4UKCcazr7tKYSHTVXN8TRsW91bosr
         2cA6xAlLHwiv5D0atb4Qc4oPwMDuH2SJpuzM7giT95F4Jufdtn/k0Wc9C9jmo3SJrwt0
         MHi9XDmPcuK3VtyVGSU5tQvGYZqxNecGZG1cy14oWZlSCOm1hzcd+sveNSu1a9cakNvF
         uPiw==
X-Gm-Message-State: AOAM532PaB/4Tq+6kgO5RzQRw0MKlCX231OlQH1yQO4GPTAcnp+qluRE
	RP4oOrCx8y3tlyPFNAZl/Z4hFA==
X-Google-Smtp-Source: 
 ABdhPJxTldacLOaM9s64u7yj3jlyjWB29IjJ2aW+fj3uGIkOF17+mgQyIrCRFRilaDAgPOHDMk2oyw==
X-Received: by 2002:a5d:64ad:0:b0:1fe:9950:29a3 with SMTP id
 m13-20020a5d64ad000000b001fe995029a3mr22733wrp.9.1647438001790;
        Wed, 16 Mar 2022 06:40:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bc44:1420:18a9:e343?
 ([2001:8b0:aba:5f3c:bc44:1420:18a9:e343])
        by smtp.gmail.com with ESMTPSA id
 g26-20020a05600c4c9a00b00389a48b68bdsm1678859wmp.10.2022.03.16.06.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 06:40:01 -0700 (PDT)
Message-ID: 
 <b992c64440508b5e86a553eba93aa4dc2e43eb02.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/1] expect: modify fixline1 script
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe Slater <joe.slater@windriver.com>,
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Date: Wed, 16 Mar 2022 13:39:59 +0000
In-Reply-To: <16DCCFC7B5FE4136.28363@lists.openembedded.org>
References: <20220315224537.5956-1-joe.slater@windriver.com>
	 <16DCCFC7B5FE4136.28363@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 13:40:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163330

On Wed, 2022-03-16 at 08:40 +0000, Richard Purdie via lists.openembedded.org
wrote:
> On Tue, 2022-03-15 at 15:45 -0700, Joe Slater wrote:
> > fixline1 needs to be processed by fixline1, but we
> > short-circuit that.  Enter the multi-line shebang which
> > I am a bit queasy about, but expect loves it.
> > 
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >  .../expect/0001-fixline1-fix-line-1.patch     | 31 +++++++++++++++++++
> >  meta/recipes-devtools/expect/expect_5.45.4.bb |  1 +
> >  2 files changed, 32 insertions(+)
> >  create mode 100644 meta/recipes-devtools/expect/expect/0001-fixline1-fix-line-1.patch
> > 
> > diff --git a/meta/recipes-devtools/expect/expect/0001-fixline1-fix-line-1.patch b/meta/recipes-devtools/expect/expect/0001-fixline1-fix-line-1.patch
> > new file mode 100644
> > index 0000000000..d6f5d7ff0e
> > --- /dev/null
> > +++ b/meta/recipes-devtools/expect/expect/0001-fixline1-fix-line-1.patch
> > @@ -0,0 +1,31 @@
> > +From eef7c44c10de32ba399ab162cb5799fafdce3fa5 Mon Sep 17 00:00:00 2001
> > +From: Joe Slater <joe.slater@windriver.com>
> > +Date: Tue, 15 Mar 2022 22:00:04 +0000
> > +Subject: [PATCH] fixline1: fix line 1
> > +
> > +Ironically, fixline1 needs its first line modified by
> > +fixline1.  We do that, manually.
> > +
> > +Upstream-Status: Pending
> > +
> 
> This probably doesn't stand much chance of making it upstream so Pending should
> probably be "Inappropriate [OE specific cross build setup]"?

I changed this as it is easier than de-queuing and retesting!

Cheers,

Richard


