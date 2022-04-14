Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2878C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 17:17:28 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.267.1649953345677171021
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 09:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iGhQJJFq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id q8so3228744wmc.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 09:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=pFJ6HB8G+z4en4BV7QSrvfpHB8RENT0/qSrir7iYkkk=;
        b=iGhQJJFqq0NoB71ke44PRgiFDI7KJl19sjDfDH/nHsmhcxBIu6+WTRyBHRtQL/y+LE
         spFbN7qhZcLOOrtDMndPBK1jVTf3sYrf7laCuTU1djLB/N2kII2DU156fwrBrrjSwsZT
         eDE4Z6ZDgyLOjTDsB3QGRpwwvv+8qL+w4v0vE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pFJ6HB8G+z4en4BV7QSrvfpHB8RENT0/qSrir7iYkkk=;
        b=lWBKdT5WV9lXXKCiwgQ4vYORJ0Vw7bLMsEuVUX+aX0SzVJ3i0+x4mRI55bz/FCcMok
         PbIZeox+xBfAr10F8Lr6lMGXHqSwClvTVRfoUMvTJIqAA9wLkFkWs5w8avczZJdYTnFB
         WA7gHdVxSoFvoE3GdvDVk24P+4jkbn6YDlVxGFgRJFL7FIGfJ0ZxtReqNd8/XIXiZ4Sb
         bA4r/ONtHEjlFA20ybjXdB5Oo01Wz+5u2v+MwPsdsY7sqb5mY9edWy9135dSGLDqa566
         NK1338Q9J+WXt5NhMOtUYNLLAfTTbkADDIh93KIICG82MdzQgbKrQGBIh3//dFPl8LGb
         7R1A==
X-Gm-Message-State: AOAM532TWK4811rF+h8jHteeFVQE+6HwXyHEhU5f2zRnOoh8PUphDyI4
	3mCc/mbZe5ZImisMOcrGIV2bqg==
X-Google-Smtp-Source: 
 ABdhPJxZWNqjyVrKNd9cxMsJ3rSTJpVbmadnyE/b+BDJpKC7vwQmD9Nt8MEky29Ylju1rDvU/GJX0A==
X-Received: by 2002:a05:600c:5114:b0:38e:bd9c:9cb0 with SMTP id
 o20-20020a05600c511400b0038ebd9c9cb0mr4217982wms.153.1649953344073;
        Thu, 14 Apr 2022 09:22:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:353f:5203:2a56:f190?
 ([2001:8b0:aba:5f3c:353f:5203:2a56:f190])
        by smtp.gmail.com with ESMTPSA id
 p3-20020adfaa03000000b00207a1db96cfsm2198765wrd.71.2022.04.14.09.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 09:22:23 -0700 (PDT)
Message-ID: 
 <1e34b7db2161ffbfeb4c4091c81759923a8e45db.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bluez5: install /var/lib/bluetooth directory
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	f_l_k@t-online.de, Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Scott Murray
	 <scott.murray@konsulko.com>
Date: Thu, 14 Apr 2022 17:22:19 +0100
In-Reply-To: <7a6794ed-2ddf-b64d-ea33-cb11eb3759d2@weidmueller.com>
References: <20220408081533.1705128-1-yi.zhao@windriver.com>
	 <348e8577-31f3-3ed6-393a-ebe511cb2186@weidmueller.com>
	 <111d0c91-aaff-966f-6425-f4da193c29e2@windriver.com>
	 <8c740cc8-8c84-9e34-ff12-8c1d5721d302@weidmueller.com>
	 <bf017503-5365-98c2-3546-96b4cc4313c4@windriver.com>
	 <0e14a9c4-2692-4f2e-b707-b9532706bab1@t-online.de>
	 <16E4C65A42F3BFA4.4406@lists.openembedded.org>
	 <7a6794ed-2ddf-b64d-ea33-cb11eb3759d2@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 17:17:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164409

On Wed, 2022-04-13 at 10:21 +0200, Stefan Herbrechtsmeier wrote:
> Hi,
> 
> Am 11.04.2022 um 09:17 schrieb Stefan Herbrechtsmeier via 
> lists.openembedded.org:
> > Am 08.04.2022 um 22:03 schrieb Markus Volk via lists.openembedded.org:
> > > also had this issue and found out, that the bluetooth service did come 
> > > up, once bluetooth was enabled
> > > 
> > > My fix was to edit like this
> > > 
> > > ReadWritePaths=:/var/lib/bluetooth
> > > 
> > > The colon ensures that the service won't fail if the directory doesn't 
> > > exist
> > 
> > Regarding the documentation the ReadOnlyPaths and ReadWritePaths makes 
> > not sense because ProtectSystem=full mounts /usr, boot loader and /etc 
> > directories read-only.
> > 
> > Have somebody report the problem to the bluez project?
> 
> I have open an issue:
> https://github.com/bluez/bluez/issues/329
> 
> I will post a patch when we come to a solution.

We have a slight challenge in that I'd like to build 4.0 rc2 but I think there
will be complaints if this is left broken.

I'm going to post a version of your patch and hope that improves things. If
anyone knows of issues with that patch please let me know ASAP.

Cheers,

Richard


