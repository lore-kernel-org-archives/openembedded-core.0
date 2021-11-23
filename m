Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B642C433F5
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 17:47:46 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.14807.1637689665331637247
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 09:47:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CBPM+BgS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id c4so40303752wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 09:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=OlJ/8auqr318ZMdG62Rv0yULVbh67nv8ktxnC0aASdY=;
        b=CBPM+BgS5U0RShnmI+kmVDHbRHpAXYlmpvo6QrGEkM+RSzm7CvyZL875CgC2/cbC+0
         yJyWyM1CdkrMjcbuoefDF8AxNFkntX1uhMHXKKmW2VRxKVeOCFvWwSr7lZS3YI3U7oZq
         lLelxeN8jx8/TMY3pgmnWlvMwUPlOFMJUw7qY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OlJ/8auqr318ZMdG62Rv0yULVbh67nv8ktxnC0aASdY=;
        b=3M7LWLFd5xGRAmbrSMd5uIeoPNGdOMtOPdghCiN+rJMnJMSsbYZ/ncAhwn+itRiu6M
         d15LCWEt+/bQ/cXz3DgueR2q3Q8bNwv96l6ltSfBMC37qY9BkNpjB9EFo31BTBj5Y3o2
         XIxWcSECRpo0kbfhUeL7GDr4Fq2f1mCRywrVF8fuLU9mvfbEKFkdSF4KIsxa6wV4dKhF
         cd0L47CGjuaIOTp6Foebw2qCX4LuvVJtFeldlsiIH++y42iIqGkZacsS3EmKXV79KUkk
         lI01iFAtzJTDuuGHNWF7sfCmoXQMBqlKQlTe3JGWrzW89hRlTMUbxHeOXZhTtVlpDrAa
         cgBg==
X-Gm-Message-State: AOAM53243hKTEY8PpYjqeYGff5W7lqnPlO1d3Ke+go9H/MFJQuWBcUK+
	VLsbF2hDhgKCrnn8pIvxB7F+YfwGsVX1ng==
X-Google-Smtp-Source: 
 ABdhPJwrsNLg0X27GuNSmb3P32uQp9oNebx0jFH/aC0U3z+XKsCPfIFl5tFqYat5J6fuBZWsEmaEHg==
X-Received: by 2002:adf:f489:: with SMTP id l9mr9652796wro.268.1637689663921;
        Tue, 23 Nov 2021 09:47:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e990:5f99:797d:8988?
 ([2001:8b0:aba:5f3c:e990:5f99:797d:8988])
        by smtp.gmail.com with ESMTPSA id
 p19sm2492976wmq.4.2021.11.23.09.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 09:47:43 -0800 (PST)
Message-ID: 
 <c35c49f48551f7af11b5c1a0157ede51fe768b84.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] glibc: Fix i586/c3 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 23 Nov 2021 17:47:42 +0000
In-Reply-To: <ede0b539-455e-1774-21bd-b2c3d5e42a50@gmail.com>
References: <20211123165519.36922-1-richard.purdie@linuxfoundation.org>
	 <ede0b539-455e-1774-21bd-b2c3d5e42a50@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 17:47:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158614

On Tue, 2021-11-23 at 09:13 -0800, Khem Raj wrote:
> 
> On 11/23/21 8:55 AM, Richard Purdie wrote:
> > CET can't be enabled on i586 or c3 for x86, adjust the configuration accordingly
> > to fix those builds.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >   meta/recipes-core/glibc/glibc_2.34.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
> > index 72064772789..7efc1ec1ef7 100644
> > --- a/meta/recipes-core/glibc/glibc_2.34.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.34.bb
> > @@ -90,7 +90,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
> >   
> >   EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
> >   
> > -EXTRA_OECONF:append:x86 = " --enable-cet"
> > +EXTRA_OECONF:append:x86 = " ${@bb.utils.contains_any('TUNE_FEATURES', 'i586 c3', '--disable-cet', '--enable-cet', d)}"
> 
> does this make glibc tune specific now ?

glibc is compiled so it is already tune specific :)

Cheers,

Richard


