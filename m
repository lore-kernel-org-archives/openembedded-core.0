Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955DEC433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:10:28 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.39149.1656684622593921286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DBg5XcRg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id l68so1387593wml.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Gj2k7exBBiEWvh1biv9VeB8OKoYnms9JmBsBx7z6jZo=;
        b=DBg5XcRgwfE/HiX3ltS4n6WlDkseotrWsBxBcku2izHaLbq3HX9BVHLyY9uDURDRST
         5SYMyqb5j9UsOJWCTZqKXkLDR5fcwKuoAQ2lM7QTVj+I18x+s9N5oZlvAMkMwXdNEucN
         pBENXwHtGoCyd5nBBMsQaeLAirztAxGQ4qVjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Gj2k7exBBiEWvh1biv9VeB8OKoYnms9JmBsBx7z6jZo=;
        b=PnTx73reIuCKcSWSUq7ZUeQvUB9Chpyxm+RwKaqqqRk1l7jR1dU/ibzLhj8dHZqJJT
         crpy7+y6jIfHmUltanBZSOEdmcA5QgAGNpcUQgmB0NbaFWsu5bMylD3iaq2VqJALX6ps
         Xx9IJC3Am2f3P+9eApjqZY2DAT31dCe7ztwiKJH9qaZVXR0YycApqnvPUqUB4rQqYpXm
         KjLRuMoFuW12GlQqWh518SDnlYsNzwy1YQ6jKbnXM3OHXlqNlnAr0G0qq4Fp9J08ggdx
         Z3LEhqEsit3pKfVg7xUCqwJpEhH7UVViSVxGi2zKWm4kikbOFrRvfo7Xn/RAqjQoIeOj
         WVbw==
X-Gm-Message-State: AJIora87xs/IK3lpoWwMMUb3DOwQ1x7fjwrkzeQc6+ZsEe9Ucbcv1Mf2
	ms5q6VvKluFIVxKAtVPWAfD17lUBQ6vCLA==
X-Google-Smtp-Source: 
 AGRyM1vBVgezr4L86Mz38OK+U4z6OeyKkaBlBXXAjt7lCV+B2J1tEbRCzobHEKhsKr+lfCHpIc5zEg==
X-Received: by 2002:a05:600c:3ba7:b0:3a0:5831:57f0 with SMTP id
 n39-20020a05600c3ba700b003a0583157f0mr18539516wms.206.1656684621110;
        Fri, 01 Jul 2022 07:10:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a49f:615b:a613:6a47?
 ([2001:8b0:aba:5f3c:a49f:615b:a613:6a47])
        by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c4e8700b003a17ab4e7c8sm8121216wmq.39.2022.07.01.07.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:10:20 -0700 (PDT)
Message-ID: 
 <2c3b783f7fb4359c4768992b0e28486e80a8d5e4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/7] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 01 Jul 2022 15:10:19 +0100
In-Reply-To: <16FDB5A16CDF6390.2437@lists.openembedded.org>
References: <cover.1656616115.git.bruce.ashfield@gmail.com>
	 <16FDAC3178C621FE.2437@lists.openembedded.org>
	 <16FDB5A16CDF6390.2437@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:10:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167473

On Fri, 2022-07-01 at 13:52 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2022-07-01 at 10:59 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Thu, 2022-06-30 at 15:16 -0400, bruce.ashfield@gmail.com wrote:
> > > With conference travel and issues with meta-virtualization, I've been
> > > behind in sending this out .. but I have been queueing changes, I jus=
t
> > > wanted to be around in case something breaks.
> > >=20
> > > Here are the -stable updates and the start of my efforts to bring
> > > 5.19 in as the new reference kernel for the fall release.
> > >=20
> > > lttng-modules needed it's normal tweaks to work against the 5.19 sour=
ce,
> > > but otherwise, nothing significant has popped up.  I have other parts
> > > of that uprev under test (libc-headers, systemtap, etc).
> >=20
> > Thanks Bruce!
> >=20
> > Unfortunately there was one issue the autobuilder found, a
> > reproducibility issue in perf:
> >=20
> > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220630-53g=
dlqxv/packages/diff-html/
> >=20
> > I've not looked into it other than looking at the above link but it
> > seems some python paths are creeping into the binaries.
>=20
> This looked a little suspicious to me:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
h=3Dlinux-5.15.y&id=3D18f2967418d031a390a5befe855dd0faa8af70b9

Confirmed that it is this change.=C2=A0Not sure why but at least we have an
idea of where the isssue is.

I've also sent a patch to insane.bbclass to change WARN_QA such that we
can detect this kind of issue much earlier in people's local builds. It
may expose issues in other layers but those issues probably do need
exposing at this point too...

Cheers,

Richard

