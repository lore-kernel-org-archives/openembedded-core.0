Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C08C433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 23:16:20 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.3471.1639782979656482602
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 15:16:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=tPsGacwi;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.49,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f49.google.com with SMTP id y22so13604621edq.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 15:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uuNP8XEc87lIPBV8OFbYMEbaSO9dSoDcldcsAww0QjE=;
        b=tPsGacwiS7N/JPmmvRve5p/y8Lq4II5nzq2jwWXwsJ6D81J0MJouJBmdHv7mCfQhts
         l7HbYvilqauw2DSGmSou2GM+f+J4SkxQbLMuSF8gwSPDQuznW6mNNeBa1pgboYHmp4KL
         CGXELW1kiE/JuKeZWUapSHgp4odAVjbDZ4p8LVz70GME+luOHv5h0WgpXdbTo023Yr/j
         Q94ZI1EkSlLfTivCUXbj/3Z26MBcmOpX08llq2xyBt4RFif796kRMCHnTbL8FBJAkuTN
         zG1h5uT+w5ypjzqyLMecFVS1DydQqHdPNdgdZ+EoxbxN36XvjKVsHpb2J78IDD8qQcBj
         Z5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uuNP8XEc87lIPBV8OFbYMEbaSO9dSoDcldcsAww0QjE=;
        b=TSjMOE8QN46nrnpOpExTsevajdIL6VFI1qekRlQKL4QMrgKsQS8eI7cBhAetvtQZ2C
         dNF85ieoEIVo0hYWwvrdXkELMXO0irtyZbvIYZtjWMAbpMF1XbrebufS6eAzBtjsTbfn
         kXfpOddAIcYICw3+Il6Frm0ULRnXetPm/SSXVbLVTYgAsXrvigiMaxbtwJNmGMtWwFS7
         5crBt9ybGOLG+oNO0k8iZorbJ5wW/ivuNdVXlx785Hzh2nJ6T8nuwvgbEMe8mzVdnSIr
         psL2heCjZllJ0tply9PB2yJaXzrC8W4GD77nbjtvW9gMr48t7SVe8NNh6/DE9O/CWnwc
         FvZw==
X-Gm-Message-State: AOAM532FQGrOn9wDWASd2FCMB9UMz7NXWAi4or8mRjBB7Z2raR868LYE
	9ogfQuCBGt5HE/h/YvmUpZNRb5W1jzjEuH0nn+EpcA==
X-Google-Smtp-Source: 
 ABdhPJxRtAfXWD+OSVJ+xQU14ibtku6fDMif2YMi5qVN9VNrHLtvMbM4oloX6J30EPIvGSOf+oDc9yEMzaykh8PLYjY=
X-Received: by 2002:a05:6402:4413:: with SMTP id
 y19mr4847969eda.26.1639782977879;
 Fri, 17 Dec 2021 15:16:17 -0800 (PST)
MIME-Version: 1.0
References: 
 <a1bb6b60bbde7da4496db1a2f7e48bbfb637fa4e.1638136329.git.steve@sakoman.com>
 <3913.1639769589677243183@lists.openembedded.org>
In-Reply-To: <3913.1639769589677243183@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 17 Dec 2021 13:16:06 -1000
Message-ID: 
 <CAOSpxdbvezkBr6t_rPJ0nW4JiHO0eXKVcVcrtfa9iXKcAgizfw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell 16/42] libpcre/libpcre2: correct SRC_URI
To: jhorns@ics.com
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 23:16:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159837

On Fri, Dec 17, 2021 at 9:33 AM <jhorns@ics.com> wrote:
>
> Dunfell uses 10.34 pcre2. This SRC_URI does not work with 10.34, as that version is not available there.

Urghh . . .you are correct.

It does look like sourceforge is still carrying this (as do a few
other random mirrors):

https://downloads.sourceforge.net/pcre/pcre2-10.34.tar.bz2

Any thoughts on which to use Alex?

>
> Does Dunfell need to be updated to pcre2 > 10.36?

No, I think we should stick with the current version since this is a
stable release.

Steve

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159836): https://lists.openembedded.org/g/openembedded-core/message/159836
> Mute This Topic: https://lists.openembedded.org/mt/87365168/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

