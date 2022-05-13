Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4104C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 09:32:29 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.6199.1652434346026776310
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 02:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YM4kX/C0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso6617644wma.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 02:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=P2CAthtLNY672V1xmAkIiZ2kdkPI4okjgS7yCpjKwuI=;
        b=YM4kX/C0zP5sN2iMcDU/KIDsVo/ZphnHIIP8LivInShbrMFpn7Ig7+FqkKhWUStTVb
         hYcaaJpBQoLcP0jAPZ4iG2dOaXceW+yBffssL8hGDwV+gsYnAE6lOjgrp3nPJCRx6QX5
         GSLEpb56ztv8Bj2b/h8vkJuGVuNETsljci8yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=P2CAthtLNY672V1xmAkIiZ2kdkPI4okjgS7yCpjKwuI=;
        b=TfkZrYGTaiXbzNXvidbajLHRhFRrm/5DTUXZZYdPyO7OKResqIlyn9TxC9gJ4Vw9Q7
         bPViUafMaIkl4qPUtXJmGU63KdFYZ1vHq4uf1UTp89cCl2NzVl/dDBC8OCWpD3H6HtNg
         Zpl+Jb8QteeexHKa59CTAqC8UkJqqpDtt7qiz7Q2XeI+BT5hdPeZADDjfSyV48xtLSAr
         hqvNm+8Qp0Li128aD45IAKVc3qpS7dIxBQmjZOWGzMXU4k2aQ9wU/V9BH0yFzQOZruta
         CkwMCQ9OdR6T+SzYCViq18vYtLhk9z0UUNw5LHzVI95qZS9LF0fy8glYRTnK2Ji1ileo
         yPiA==
X-Gm-Message-State: AOAM531F0P+JtXKb7vVFl8VoFlLVp1Nb1ulucXub7KBLCyzHb7/v4z/y
	43S6uPpChc3arDFNPgh5zHMQsg==
X-Google-Smtp-Source: 
 ABdhPJwBBdCo4Sqkic8HHcT+drklnAnGJfss+m61EN9eXKCHRfGeP0qjTmmOinhlYinu+h5dD/+t+w==
X-Received: by 2002:a1c:7307:0:b0:394:5bfe:391d with SMTP id
 d7-20020a1c7307000000b003945bfe391dmr14054562wmb.17.1652434344383;
        Fri, 13 May 2022 02:32:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a1e1:9ec5:5b27:abc8?
 ([2001:8b0:aba:5f3c:a1e1:9ec5:5b27:abc8])
        by smtp.gmail.com with ESMTPSA id
 n6-20020a1c2706000000b003942a244ec0sm2284687wmn.5.2022.05.13.02.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:32:23 -0700 (PDT)
Message-ID: 
 <0fe8ccbbe8212d19ac1f076a48659559875d2104.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemuarmv5: use arm-versatile-926ejs KMACHINE
From: richard.purdie@linuxfoundation.org
To: Jon Mason <jdmason@kudzu.us>, Bruce Ashfield <bruce.ashfield@gmail.com>,
  Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 13 May 2022 10:32:22 +0100
In-Reply-To: 
 <CAPoiz9w-MAekBhBiDE_0Pm7bv9DxNhKXHZh5rYD3mjLYw-RDzA@mail.gmail.com>
References: <20220504140956.4373-1-jdmason@kudzu.us>
	 <CADkTA4M8bqvWeo7ghPF_rJjVOFGHxdvpkqtveAntW055p490vw@mail.gmail.com>
	 <CAPoiz9w-MAekBhBiDE_0Pm7bv9DxNhKXHZh5rYD3mjLYw-RDzA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 09:32:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165547

On Thu, 2022-05-12 at 22:15 -0400, Jon Mason wrote:
> I think this needs to get pulled back to kirkstone, as I'm now seeing
> ERROR: linux-yocto-5.15.36+gitAUTOINC+fcf48627ea_ebfb1822e9-r0
> do_kernel_metadata: Could not locate BSP definition for
> qemuarm/standard and no defconfig was provided

You didn't cc Steve. Since I know things are nearly ready for a build
I've taken this back to kirkstone since the other patches went in.

Cheers,

Richard

