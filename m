Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5D3C43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 16:24:44 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.1296.1657902281763327678
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=STdFFU7g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 p26-20020a1c545a000000b003a2fb7c1274so619506wmi.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=iiuo9rmQ+oosmPyBHz+pM/ul7ZOsLLYQROTFevSe8rM=;
        b=STdFFU7gKEnERyKEqW55/FGnDJH15zbFve3pTNWjp8TixaLgHYHI2UouXnLiFNjO0I
         kUV/HNWbPlum0XMPBgj9d8G3uTjlUpqbaJbLqI87geGCnQ7Z+OZyXGH7MGU7jEu6Sdlg
         FmSJJSbth1+viTvBwmIzEIXf7Xc/ptiTUnWzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=iiuo9rmQ+oosmPyBHz+pM/ul7ZOsLLYQROTFevSe8rM=;
        b=MaL3r+SVwwnZALeh+NO5YCExYeoLvB0ZmpWsmsRBJv5os9mr+7ZEstt4Z3FhHmFGwW
         QIjTiXfNInQH74OTRang/TEkCowzSzcWG+UqbbZna7BRnh7t/GJJTVCVO1KTEOjTVcPb
         e3XfBuDPBXeInTL+8OMqOxYeudFrWNKsRuJ+Yo4Z08PQ5OOzKEKkliYK8O3pjl/wy/qo
         Bxan10KfHMQuocsUwwrSiJyFgz9PYC11h1uG+ASO1CNcR/F/fkaghVMpg08R30gle5a3
         mWnUOSSQFCrHIIjn8fU8nDNFeJ9qdYhhuiihuO7wv3rOhBwRdYbf21MFON2782/EjBX4
         IMjg==
X-Gm-Message-State: AJIora8Ix3pryWn4mtqbnEZPBXatWUJo0okLFLIY0mQEyTvLiL1S0YXf
	wt7RTNq9F8Y/o8a6qELz/lZXew==
X-Google-Smtp-Source: 
 AGRyM1uNIRa+4rj4g2oFDviPUYzT9CRHWIoaCVUFQZykBUnNptJFgqNCDPWrpiLXd5ZHWp3V/yVBmw==
X-Received: by 2002:a05:600c:35c7:b0:3a3:af7:30f5 with SMTP id
 r7-20020a05600c35c700b003a30af730f5mr5079541wmq.162.1657902280159;
        Fri, 15 Jul 2022 09:24:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ef6a:f831:81f1:d696?
 ([2001:8b0:aba:5f3c:ef6a:f831:81f1:d696])
        by smtp.gmail.com with ESMTPSA id
 m15-20020a7bce0f000000b003a31169a7f4sm127242wmc.12.2022.07.15.09.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 09:24:39 -0700 (PDT)
Message-ID: 
 <0ba86b61ac08c9f8350aaaa622d0d59a740f5f40.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] scripts/oe-setup-builddir: copy
 site.conf.sample out of template directories (if it exists)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>
Date: Fri, 15 Jul 2022 17:24:39 +0100
In-Reply-To: 
 <CANNYZj9Xdk7+-miNQiKi7CBHpGk7X29oF8Miv2Sd2QbBbj6sTQ@mail.gmail.com>
References: <20220706182329.3085564-1-alex@linutronix.de>
	 <6ee630104deb0e90d99c9ecb0ce2dcad7212a4f0.camel@linuxfoundation.org>
	 <CANNYZj9Xdk7+-miNQiKi7CBHpGk7X29oF8Miv2Sd2QbBbj6sTQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 16:24:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168125

On Fri, 2022-07-15 at 18:15 +0200, Alexander Kanavin wrote:
> On Fri, 15 Jul 2022 at 16:42, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > We'd always intended that site.conf was more something the user would
> > setup once for their environment and not need to change. It was
> > therefore deliberately left out of the auto-setup piece.
>=20
> I don't think I understand this point in particular. If site.conf is
> copied once into a newly created, empty build directory, why is that
> problematic?

Originally, we actually wanted this to be something like from the
user's homedir, i.e. things they really would setup just once.

Doing that has downsides in that if not careful, things can "leak" into
a build unexpectedly too so we never did end up enabling it from $HOME.
I do still think of it that way though.

In that sense, it was something a user would provide, not something
that would be provisioned by automated scripting. If there are settings
to be provisioned by a layer, we have local.conf for that? Why do we
need another file too?

Cheers,

Richard

