Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9F7C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 16:40:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.44.1646843996673584802
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:39:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dbRFpu9N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id l10so1738779wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=87E4698Y7CtPhJHrPNemXXs89RWRykK8fMyzcLLH0hQ=;
        b=dbRFpu9NbUVAGUlgRYpFlsWtJU3Ekwcw1+/j5Ckde/fzybz7/2hd3VxnzOLYhcjgjg
         3lHPA9YRxZUKeYRU993X2MV4nsDX+r9V9buoFkmv4LJ9qKRt5HR/nkQPP03CSlcsewi5
         cz7fqGAjQHZGS0v6WGJvsAiGvxVZK2SJ7mVzg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=87E4698Y7CtPhJHrPNemXXs89RWRykK8fMyzcLLH0hQ=;
        b=JFYaqOmmeoZRM7L8r3P1hCuthvBaUv4elT4aUM841H5iTfOOw3Dl3MM9nkUWicMYo7
         bTIokKO5ypWpYD4cvJ0aQTDx8iFR67ByoffQ4KQ0D+YSmRvHDrawgaeo9Ss/ccJXFSRJ
         Y8VQapjoExnl4ot4VwZNEfocpnrc8JjGx0HWAVJ2llEIZ0th+jwLWwmB9sC8tfiC1ncV
         +vF3s97u6RindpeKikfjKRS7fSyw0ttnXcR5rjxYAgNTGl8lPuJUV6XeXREs8sOIjb7W
         hhrygx+Zb7OnAar6aQkBgIyGT49jXqM3jOD2rNtVrknVGF8inc9L/jv/jiFZ5SU/6xW2
         v4mg==
X-Gm-Message-State: AOAM533xtrNArRbBJ3eS4h30VihRbVO4AEvufybZy75Z7Yqsn60vrfin
	ydlxTTcPyxk3cvSr2nC+W0AvpQ==
X-Google-Smtp-Source: 
 ABdhPJzUwn+mtE7pdkYV10S/OSBQUyVP0R1UnyZaRPU4yma9r6gV7aQuhu6X4lkcy0YmsARne2DioQ==
X-Received: by 2002:a1c:f30b:0:b0:37b:b5de:c804 with SMTP id
 q11-20020a1cf30b000000b0037bb5dec804mr8172010wmq.166.1646843994989;
        Wed, 09 Mar 2022 08:39:54 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:32b1:4783:6b7d:78e6?
 ([2001:8b0:aba:5f3c:32b1:4783:6b7d:78e6])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm2690200wmb.3.2022.03.09.08.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 08:39:54 -0800 (PST)
Message-ID: 
 <1d8f614abcdb7345019934093b13155a5234e788.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 03/16] dbus: update 1.12.22 -> 1.14.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton
 <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>
Date: Wed, 09 Mar 2022 16:39:51 +0000
In-Reply-To: 
 <CANNYZj8UnxaMikzLxxQKKirHn-ut=CQ0qTKW928q1Zv6CwYrjQ@mail.gmail.com>
References: <20220308093224.3436483-1-alex@linutronix.de>
	 <20220308093224.3436483-3-alex@linutronix.de>
	 <CAAnfSTupWXPF34RZ4qw+38XfL29CnG2zv8xCcES4dqCPERFZXw@mail.gmail.com>
	 <CANNYZj8UnxaMikzLxxQKKirHn-ut=CQ0qTKW928q1Zv6CwYrjQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 16:40:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162973

On Wed, 2022-03-09 at 16:51 +0100, Alexander Kanavin wrote:
> It's atomic with dbus gaining a glib dependency unfortunately. I don't
> want to break bisection.

Are you saying that dbus gained a hard glib dependency? That wasn't clear from
the commit message if so and is an important detail...

Cheers,

Richard


