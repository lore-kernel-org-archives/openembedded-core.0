Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D33C388F3
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:07 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.3568.1649835340148819276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 00:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fAsJhNxn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id r7so505055wmq.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 00:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=leC1fkfCUkLtYi1TrBigPAOOAVmhpZa83fuY0YVuSm4=;
        b=fAsJhNxnuM5V/8gVG3tV8VHOfAYp2xnfm8J2r0UflqZNlqkKIovyERufWZAnPVmcvm
         9FO/m8af2ENPI1X/4We+Uqb20YV5kjywlq+B+qlQjsVAKz9Ue/Pb7/Ofb3Lik5j0SJ+5
         Z4G0BjC0KJpE/mrwFevm3l/Tq1qn8wXO3UrqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=leC1fkfCUkLtYi1TrBigPAOOAVmhpZa83fuY0YVuSm4=;
        b=YEPJcvqW/ut/9DwaxyqkGIooZzzOAY1tKlpp+eY+06Skv/5xq31v992+NvpnNCN1KM
         qLtGOCvQ+/G6RpFwqIztEB5tCsCxiomuUf1KEKkvIj9zGUaVGIoJjlSdjCVMjX3LYOtX
         oUAivkB+pnAAx4VmkhHiB8inGG6LiJ4R6FiaxO7zCx48p4DPkJ3/giA8KmOzy47oKnv8
         vF4PnyKq5gzFa/J90f8TrADm94ou+VmSFirYuKNy2cjdD8wRHtSOyOOL6VSPtBuGwR7Q
         fg1gguwBMn112tNfAwx7u5cIUfMdju94G0I4LljiXnXF7mbKVNrBMFvGoivLzNuKNQ7a
         f0rw==
X-Gm-Message-State: AOAM532JwzpvzVfqwUZ1NTVHRe1lL76gXLvCvRFLAWQRhxKifJqIaiRu
	CG4V6c+50t22XNNhThqCj0Gusg==
X-Google-Smtp-Source: 
 ABdhPJwCpZM/vWcyLuKTZGMJlUrK11eWlRP5OpaueQi3woFynKeZdVzKxs+UclAeCgHTGo7dSAqBAw==
X-Received: by 2002:a05:600c:3593:b0:38e:a8a2:abe3 with SMTP id
 p19-20020a05600c359300b0038ea8a2abe3mr7528417wmq.149.1649835338521;
        Wed, 13 Apr 2022 00:35:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5cc2:b4ab:4d4b:907d?
 ([2001:8b0:aba:5f3c:5cc2:b4ab:4d4b:907d])
        by smtp.gmail.com with ESMTPSA id
 n2-20020adfb742000000b00205eda3b3c1sm32871151wre.34.2022.04.13.00.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 00:35:37 -0700 (PDT)
Message-ID: 
 <af4b0806c4668d272b38dd6def483451f45c8a9e.camel@linuxfoundation.org>
Subject: Re: [RFC PATCH 1/1] kernel: add kernel-image-fitimage-initramfs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Claudius Heine <ch@denx.de>, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 Apr 2022 08:35:36 +0100
In-Reply-To: <ec096923-51a9-5407-9836-689c3ac2d4d2@denx.de>
References: <20220330091522.795083-1-ch@denx.de>
	 <20220330091522.795083-2-ch@denx.de>
	 <ec096923-51a9-5407-9836-689c3ac2d4d2@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164306

On Wed, 2022-04-13 at 09:18 +0200, Claudius Heine wrote:
> Hi,
> 
> On 2022-03-30 11:15, Claudius Heine wrote:
> > When creating an initramfs bundled into a kernel fitimage, the resulting
> > fitimage will only be placed into the deploy directory and not packaged
> > by the kernel recipe/class.
> > 
> > Changing the kernel recipe/class to produce a package with the fitimage
> > containing the initramfs is not possible, because build dependencies
> > require the kernel packages to be already build before the initramfs can
> > be created.
> > 
> > The kernel-image-fitimage-initramfs recipe solves this dependency cycle
> > by packaging the fitimage with the embedded initramfs from the deploy
> > directory and replaces the `kernel-image` and `kernel-image-fitimage`
> > packages from the kernel recipe/class.
> 
> This patch was on master-next for a short while, any feedback on it?
> 
> In the cover letter I stated the only downside of this solution is, that 
> in case of package based updating, it would require manually changing 
> the version of this recipe.
> 
> Is this an acceptable downside, or is there a good way to fix this?

There were a few things which concern me. It is late in the release cycle for
this to make it into kirkstone so I was deferring it until 4.1 and the next
development cycle.

I was worried that it doesn't have a maintainers entry. I was also worried that
it doesn't have any tests and doesn't get used at all on the autobuilder. There
doesn't seem to have been much other feedback/review on the mailing list either.
There also isn't any documentation. This makes it likely to become a piece of
untested and potentially dead code going forward.

People are fixing up bits of the fitimage and initramfs code adhoc with just
enough changes to sovle their use case. We really need docs and tests and
ideally a clear plan on how this all fits together.

I suspect that the downside you mention, the fact that the kernel is removed
from package management will also catch people out. It is different to our
normal behaviour and I don't know how we highlight to users that this issue is
present.

I'm also worried that we don't have enough people looking at rewiew and that
there are probably issues here we need to discuss but we simply don't have the
right people with time to look at and think about it. I'm not the subject matter
expert here :(.

I wish I had something I could say as to how to make it acceptable to merge
(definitely needs tests) but I really don't know this area well enough and I
haven't had the time to think enough about it. It hovered in -next for a while
as I was trying my best to do so but with the release breaking I needed to clear
out -next for my own sanity and this ended in my defer pile. Even writing the
email explaining why takes 10 minutes.

Cheers,

Richard



