Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3821C433EF
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 19:51:17 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.13147.1636919476409225935
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 11:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VHpVejun;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 o4-20020a1c7504000000b0032cab7473caso10059231wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Nov 2021 11:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=CCcTnF1g+9pKIopBt6phXF4r7iSw67B5UuC2Ur7wvt4=;
        b=VHpVejunaPXM3jfgDAF5LyuwmikVhhKKyXoBB2Q2vM4y1DDyjkFen+DwVtNmalBiSk
         ZPSJxvHQNt96Z0SdKtNtukx8wKopO2nBRi6thGVBAqhXgT8wpZzCsA0BxIishBYMLvpW
         7yZJ4F9j2gBg3UGQyOf5LiIZcmJGq8w8is7uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CCcTnF1g+9pKIopBt6phXF4r7iSw67B5UuC2Ur7wvt4=;
        b=ODaHAJ4KXXCH1nrNwF4cFf/lymPZFzTqtMG9g/ac+QrUuijOR8Eyia3N5J74LDjnAj
         kNUZdmuF2cYZxj5L1HW493Y+OliFmiWmATAG98ddd5GM3T9iwBkkhCsu1eMpbHdDHyAM
         rc7iTifr91N5+PqwwtgwgA8v+po+o3tigzUDSOKTU4O1pBsEZQoloCs0ProepITdiuJf
         Pk5HjhbH1CUBR/xatuJmao0P++IkEi+R0RyK6F82sWAOe3Khs0Hdq9NgfqgFOXX/0PPQ
         j+BgaxyQl4mSy0YPRluTP+Y4Bi9MioD9OwVkYoyQH7C5RYHeGO9X2YeIf/XDSVWG7mZ6
         Vktg==
X-Gm-Message-State: AOAM532ja2Ur9t5fBM+X2vIFSpOpYXFgX37jJo+tEDHlJ6AZJ2BqBM9j
	H/GWkkgc7AN12S8yNmPEZQZ2ZA==
X-Google-Smtp-Source: 
 ABdhPJzhU9uQlv6i1oXPntJgIxn8QP701JTVDFOqiFC+Aax0WpkQYJeKwPKlninVA+52f1l7jy7v2w==
X-Received: by 2002:a05:600c:22d0:: with SMTP id
 16mr14282575wmg.37.1636919474666;
        Sun, 14 Nov 2021 11:51:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2532:5b3a:7e94:ed1b?
 ([2001:8b0:aba:5f3c:2532:5b3a:7e94:ed1b])
        by smtp.gmail.com with ESMTPSA id
 e8sm8381236wrr.26.2021.11.14.11.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 11:51:14 -0800 (PST)
Message-ID: 
 <24dd6bb7c3d4bb755281b3697ed18c7116a5d101.camel@linuxfoundation.org>
Subject: Re: [hardknott][PATCH] mklibs: remove recipes and class
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 14 Nov 2021 19:51:13 +0000
In-Reply-To: <c02ee82c-4d14-d704-6fa0-50578f9f746f@gmail.com>
References: <20211114065008.3899-1-jacob.kroon@gmail.com>
	 <dfc7b7fc105d153303d7d5933689d9b469fb5a22.camel@linuxfoundation.org>
	 <c02ee82c-4d14-d704-6fa0-50578f9f746f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Nov 2021 19:51:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158264

On Sun, 2021-11-14 at 20:47 +0100, Jacob Kroon wrote:
> On 11/14/21 20:36, Richard Purdie wrote:
> > On Sun, 2021-11-14 at 07:50 +0100, Jacob Kroon wrote:
> > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > 
> > > This is not enabled or tested by default, and has never been
> > > ported to python 3 upstream[1], which means it doesn't work at all
> > > with plain poky. If you need it, please put it in a separate layer
> > > and/or modernize to work with py3.
> > > 
> > > https://salsa.debian.org/installer-team/mklibs/-/blob/master/src/mklibs
> > > 
> > > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > (cherry picked from commit 908df863b419d1cad7317153101fc827e7e3a354)
> > 
> > What issue is it causing in hardknott? Normally we don't backport invasive
> > changes like that...
> > 
> 
> The problem is that mklibs-native doesn't build with gcc 11, and 
> "image-mklibs" was in USER_CLASSES by default in hardknott.
> 
> I sent a patch to fix mklibs build here:
> 
> https://lists.openembedded.org/g/openembedded-core/message/151982
> 
> but after some discussions we just decided to drop mklibs support 
> entirely with the proposed patch.

ok, that is something we should fix. My worry is that the backport as is will
need everyone to update their local.conf since the class will no longer be there
and it will throw errors if people try and include it. This isn't what people
expect from a point release.

Could we just remove it from local.conf in hardknott? That should solve the
issue but reduce risk to anyone who has hardknott already working fine with an
older gcc.

Cheers,

Richard


