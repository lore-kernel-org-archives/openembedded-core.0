Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B5AC433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 14:51:11 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.29656.1652712662723096836
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 07:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sGRpcSRr;
 spf=pass (domain: konsulko.com, ip: 209.85.222.182,
 mailfrom: trini@konsulko.com)
Received: by mail-qk1-f182.google.com with SMTP id v11so12419134qkf.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 07:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SVvZCl1kRn5GL4+xjgwkypVRI41Cxvx2Rny492OxCvY=;
        b=sGRpcSRryFhXAbgpYnNUZ1qinisvkDTqBFuJU+zBKK9n9VrZ6bBPs5zzFCBnloHk25
         cA+3i5xFF4lDLPH5BFUPKNAxHar5+elvvSC3kTi5DTgZRYsqA3dRNCv16HEB/6666dFl
         dM6xdB9T/Exlh4roH2qoTVWVGFWm6DTGwwIxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SVvZCl1kRn5GL4+xjgwkypVRI41Cxvx2Rny492OxCvY=;
        b=DK+Ajk87jS3li2sBrbkc/Eid71I7TuwKYJUu8S9GcPepd3RywISPoslQnlcc2Krig0
         yhLos4biY/sNTcqPAx1GbU4dWKVwjWJZz/pZCLXsmw5yMAd+ArKe4wWdUsZIYpSJocl2
         70Vk27Il0p5rGydK1KTusfzXD8rzMiCC17ihlmM7mFMFBVmm4YW5NJ3VL3y3ZFbFeso0
         cWjtyJW56fPpd2/F8QQidsfSIC6xT0nJfFY88BcoQCIiIlZ6pxKyNn5aDWFRv7lgsUHk
         we7c43sawe7paiqd2rgOgEpkjQEV+1DzBQ1jLoqZASs4bt1FtounF0kMgxTRI7/3s5SX
         yqqA==
X-Gm-Message-State: AOAM533LsOx3cdMXv7f0KthnQ8vrGWmCJUt0x8cIfE9SiXX+V/ArZ1/s
	QGzK2cR7l5EzXkjk/os4tQm2mQ==
X-Google-Smtp-Source: 
 ABdhPJyuRde62ZiY95lH9sETZn4JkRowoddOfAOB2VXgiVtsBVbQ+y3/Ig0+5U/tajoF5bydig+dGA==
X-Received: by 2002:a05:620a:4015:b0:6a0:2b3e:7d45 with SMTP id
 h21-20020a05620a401500b006a02b3e7d45mr12513206qko.201.1652712661866;
        Mon, 16 May 2022 07:51:01 -0700 (PDT)
Received: from bill-the-cat
 (2603-6081-7b01-4500-3ccd-92b2-2517-a737.res6.spectrum.com.
 [2603:6081:7b01:4500:3ccd:92b2:2517:a737])
        by smtp.gmail.com with ESMTPSA id
 n13-20020ae9c30d000000b0069fc13ce1dbsm6122775qkg.12.2022.05.16.07.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 07:51:01 -0700 (PDT)
Date: Mon, 16 May 2022 10:50:59 -0400
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [AUH] u-boot-tools: upgrading to 2022.04 FAILED
Message-ID: <20220516145059.GO3901321@bill-the-cat>
References: 
 <01010180c8b78249-6b4db853-83f0-4b03-aed5-d70d27cab76f-000000@us-west-2.amazonses.com>
 <CANNYZj90hTOst=OQGfvKrJkv6THpTrLFRFBsKE+uQZgLUawvFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CANNYZj90hTOst=OQGfvKrJkv6THpTrLFRFBsKE+uQZgLUawvFw@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 14:51:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165687

On Mon, May 16, 2022 at 04:43:47PM +0200, Alexander Kanavin wrote:

> On Sun, 15 May 2022 at 19:15, Auto Upgrade Helper <auh@yoctoproject.org> wrote:
> > do_compile failed
> 
> The u-boot update is held by
> https://source.denx.de/u-boot/u-boot/-/issues/12
> 
> Please address :)

I've followed up in the issue tracker (and figured out why I wasn't
seeing new issues as they're filed).

-- 
Tom

