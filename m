Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E522C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:32:07 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.8492.1634214724896308659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bZYZ+Xyq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id e3so18793992wrc.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=GpWXJwGqyLc3gGp71fNSDk8qiWDhXliqTd/2T9b1jS0=;
        b=bZYZ+XyqLDnfdPL36qHK3EmQDakOzAqLXTJZap8M5skz6a5t68JxxaF0r65jgnqyCv
         ZPxVXxZnm3nPJtN/OAjkzwwlS5Idy6PPkwcYSxTLfc0QTv4j2FXc/kYFuRuh4qaQxyZ6
         BoD521C7cPaCBH31bz5/qyb5JB78rvOsjXnNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GpWXJwGqyLc3gGp71fNSDk8qiWDhXliqTd/2T9b1jS0=;
        b=UraaInEUxsjX0YoThBhGd4P3Q0x6zkZDkP0ql+mG20SQfH0fEP96f6Q53TJw6E0ZL/
         DtpLMHVZ3Zn/x5Teu3e1SIIFmMmM4UC5uahsyz5qW359ATylk20sJNfXeJ1y1DnJGwYG
         F0c57rmF30rWhv90oxKeBMlk6aZWi84gXTwcC8ZBmahW/d8OyciR3LhSP6nHk0uWnrQN
         LdVaet3ZNfYYisoG8E4542TbkxAXadF6s3AGN2Gfj5Y8RB1XgFUNQNOlGOViV72hTaFP
         WiYHD96Of8N+thg/Rlir/vkXD0MkX3RZrma3oO3CdKJ2On/nP2KEoHbKg40V14u4w8tK
         9jaQ==
X-Gm-Message-State: AOAM533Ny0yYhF/11pavv8qPbaVu2eSmdLEgBjOs5vh0lkTclQVAdEVO
	Ut3NHOZZRvjQWJmqG4lUBD3Ebw==
X-Google-Smtp-Source: 
 ABdhPJxFPC9upBsxL3xGAgx6xPJHYg7AxbqnzYth2HxWzwRT9KSc/4jkUO+DLYnOd5c8lSemccTczw==
X-Received: by 2002:a1c:23cd:: with SMTP id j196mr5492834wmj.11.1634214723246;
        Thu, 14 Oct 2021 05:32:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb5c:837c:62b1:b238?
 ([2001:8b0:aba:5f3c:eb5c:837c:62b1:b238])
        by smtp.gmail.com with ESMTPSA id
 z5sm10048796wmp.26.2021.10.14.05.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 05:32:02 -0700 (PDT)
Message-ID: 
 <f83e1f3063a28ca1e761ab11656846fd71ca41e2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 7/7] reproducible: Drop
 BUILD_REPRODUCIBLE_BINARIES variable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Oct 2021 13:31:58 +0100
In-Reply-To: 
 <CADkTA4MccXdOvzaEoHOX-wVj-iFsLRb7OsDpO+myowr3f0gT=w@mail.gmail.com>
References: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
	 <20211014121025.2913401-7-richard.purdie@linuxfoundation.org>
	 <CADkTA4MccXdOvzaEoHOX-wVj-iFsLRb7OsDpO+myowr3f0gT=w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 12:32:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156949

On Thu, 2021-10-14 at 08:28 -0400, Bruce Ashfield wrote:
> On Thu, Oct 14, 2021 at 8:10 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > We want things to be reproduicble and the variable doesn't really change
> > much any more. Drop the remaining uses and make those code paths always
> > active.
> 
> It wasn't clear to me from reading the patch.  What is the way that
> someone would now get the current timestamp into a kernel build, if
> that's the behaviour that they want ?

With this change they probably don't get the option. If we want that to be
configurable, we should probably move the control to a different variable which
is focused specifically on the kernel. The hardest bit is probably picking a
name!

You don't really want to turn off all reproducibility everywhere for just the
kernel timestamping change.

Cheers,

Richard


