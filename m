Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0D6C4332F
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 08:44:03 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web08.21345.1664959437373432409
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 01:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yCz0KBSS;
 spf=pass (domain: linaro.org, ip: 209.85.167.54,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id d18so11518874lfb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 01:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=gKH19TCSRa/DE7ls5VMztpmZtNeIbsVszR8XyjWzy3M=;
        b=yCz0KBSSajai4AOmLENNwGA/vG/+iceeeE/7W1SN3TZxGaoTA5ZZ6Ex0FHmzviFtCk
         Sp4O/N3nV47gX/mxH63xJBhDZmWhgQt8spV9r9r/RaGx3T8PP7sxzzrNLQXIqMK2YdPH
         Uh/jV5CVH1QgSqGewoMBU/08S9OnjOWj7jporqGn9CIh9hnjMwTZDzsIatgXfkG/q8hM
         qiE1KiaVSxHf9M4FbCFzCgAdlEvW+7aQzJXSDqNLMux9j60AnPDH2aJv1Sp0opTKyMfK
         THeTtdqKFa8CIMf4A39m9qMos8gGf0lEjit42x8oj6VaF/v9WDL1gIRga4RQfIteOdWc
         oSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=gKH19TCSRa/DE7ls5VMztpmZtNeIbsVszR8XyjWzy3M=;
        b=YOjRqHyTBBFC91YmGtwEb5L2+WQ42atP4bda32wQn55NfbZhLb7UI97p61RtT9Zdnf
         C3SrOEYNscCsXj4nvFPXdoMvCzVWLGtCmMiG/HU05KW2xfQr0+rXFxIHSIop76jjSyXL
         rN72aeA9FDT5e1vWQbvrMrp/MWxvCfjrlPQX7DYR+6kdOFqbBquTfu93TwtDk6qyfXA2
         J9rrDtwcXXrDPSDB3VH3JloDkOc3Emza8lmQzCi43k9C7rRb+N9ZE9q0lT0ugMK/RAX8
         iEaKVLYNBmAJAp6TSajjUMWMpSh6A/Op/M8d966Oos0idW6E9cpUadkeOEUr29Ve11+f
         cB3w==
X-Gm-Message-State: ACrzQf3GWwQ5Rv9Txltm0gbggu6j0Syxh/NVkWf5KuOtn29XOcwtv9xT
	Q11aUC5+KyXf7HH2Ri1aiC1Paw==
X-Google-Smtp-Source: 
 AMsMyM4FDnVru1moIvDJ7m6ncbG1Mz5l4iDwosYqbYq7ruBM0IkTXYlM0g7Z20OGJLw1VEh2hCbJkg==
X-Received: by 2002:a19:5506:0:b0:4a2:405a:8f06 with SMTP id
 n6-20020a195506000000b004a2405a8f06mr4288671lfe.503.1664959435295;
        Wed, 05 Oct 2022 01:43:55 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id
 c17-20020a056512105100b004a1e592837esm2268488lfb.140.2022.10.05.01.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 01:43:54 -0700 (PDT)
Date: Wed, 5 Oct 2022 11:43:51 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: docs@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [docs] [PATCH v2 2/5] classes.rst: document
 openssl-native.bbclass
Message-ID: <Yz1Dx2rm4AfhsjNo@nuoska>
References: <20221004152750.978712-1-mikko.rapeli@linaro.org>
 <663d2c74-59ba-032d-88a3-dfe22237136f@theobroma-systems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <663d2c74-59ba-032d-88a3-dfe22237136f@theobroma-systems.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 08:44:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171451

Hi,

On Wed, Oct 05, 2022 at 10:31:25AM +0200, Quentin Schulz wrote:
> Hi Mikko,
> 
> On 10/4/22 17:27, Mikko Rapeli wrote:
> > It sets various environment variables correctly for openssl-native.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >   documentation/ref-manual/classes.rst | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> > 
> > diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
> > index 11e0d472e8..5fc30f9233 100644
> > --- a/documentation/ref-manual/classes.rst
> > +++ b/documentation/ref-manual/classes.rst
> > @@ -1672,6 +1672,17 @@ one such example. However, being aware of this class can reduce the
> >   proliferation of different versions of similar classes across multiple
> >   layers.
> > +.. _ref-classes-openssl-native:
> > +
> > +``openssl-native.bbclass``
> > +==================
> > +
> > +The ``openssl-native`` class supports using the native version of openssl
> 
> The :ref:`openssl-native <ref-classes-openssl-native>` class supports using
> the native version of ``openssl``

The text and syntax was shamesly copied from the other class descriptions.
Sould those all be updated?

> > +built by the build system rather than support of the version provided
> > +by the build host. It helps setting environment variables for engines,
> > +modules, certificates etc correctly. For full certificate checking
> > +users should also add ``ca-certificates-native`` to :term:`DEPENDS`.
> > +
> 
> I could suggest:
> """
> built by the Yocto Project instead of the one provided by the build host
> distribution.
> """
> 
> I find "rather than support of the version..." confusing.
> 
> I think we could also replace the "It helps" sentence by stating that any
> recipe requiring openssl to be run on the host should inherit this class
> instead of just adding openssl-native to DEPENDS. Maybe that could even be a
> new QA check?
> 
> I would still keep the last sentence though.
> 
> What do you think?

Yes, I can send a new version. I copied the text template form the other
class descriptions so maybe they need to be changed too.

> (Thank you for sending a documentation patch in the same series as the code
> implementation, this is rare enough to be highlighted, much appreciated!)

You're welcome. I RTFM all the time and thus would like to keep the docs
in sync whenever I can.

Cheers,

-Mikko

