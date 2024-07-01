Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71F5C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 09:50:54 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.15851.1719827450791559242
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 02:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YM9xK2IG;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec002caeb3so33618141fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 02:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719827449; x=1720432249; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VYVy4JgwlygZfP2mu+VfkVxf5vonT77ClyAPoG1bYWI=;
        b=YM9xK2IGBVSjrp4M5m0CX/WOwNuW+5HF1q/tp9vMMlXF2VFUJEKpg1/gbSLiXBuqak
         +7peGCMhVTA1mkwut+jAq2HYwaqZP3j32W1HWFRK9Vpna1mH0hzhEx+XozqAwOQ+5NdU
         RsNce6uB2az4EF4pAkUgjOa/FEJbdh3RMimt3tClZrEg4+b9YJBHI8f7Z1C89VUL673y
         KRsFYUNZsQ8/adDLC4FCRSBpa3Xj5a0LHXbfDdLOjJmOF4sm1Xly83G9gk4qP2WAh9Wi
         xP/lh0zRDP4bhVTbI89kUmWMzlla6eC+sjtryEXp4RoLsVY0Z4F+hGZhgFuwCITdOahI
         sOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719827449; x=1720432249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYVy4JgwlygZfP2mu+VfkVxf5vonT77ClyAPoG1bYWI=;
        b=DWViG7BpiUyU2DfiTDUXIJcD43/KsZ+GvvM8GEwLOMwxN3fBrw2rYkPmWZo1YSvYIT
         qb+jFXXOKj65klVi7joQ06SBJIAcbeuYoa4AUAldpTTkiZXYcTigBiTlDa6yVW9wr6Lt
         osnCOF5EIhIwqxjIWj4dskaiBURJQcxPiqp7E2gXmqYZJLnDNFbgAdpYlkM2Z5lFdWnb
         aOk4zvVYvjfjogqSjBGuMiTDfZHwuwd+QbWJPDEwvdOz5Pa563GEhepJY09EMd0i/48C
         uUd+wsVlrYZ+tq3tS53svaJOmoFR5sLa6P98vSf/QyPUKmxT8Qz9qT4o9Ydua22OHKPT
         dHLQ==
X-Gm-Message-State: AOJu0Yz0jWMI5bd40KqqoETRQGPz0GD5FIB8CLBU1Dn8JInCMII1awL4
	ewYUowN+gzmo0tcWgGLzKNfttijj6TM0wFW1Ct6j3ELLhKt6gYpz/TnwQa6S/5GktamF00457gb
	FqfxRYUZWcSB3J+27Ht8goV/ki5M=
X-Google-Smtp-Source: AGHT+IE+qDcLaOowohmUpodW+bbMX7+LCdX5IF7MyVXtzdeuYfeHf7iTTG8VnTYOLTeDuW/vW6zzMOUpuwTRlPeDlKI=
X-Received: by 2002:a05:651c:2229:b0:2ec:637a:c212 with SMTP id
 38308e7fff4ca-2ee5e6e7256mr37219041fa.39.1719827448695; Mon, 01 Jul 2024
 02:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240701092639.1498856-1-Yash.Shinde@windriver.com> <20240701092639.1498856-2-Yash.Shinde@windriver.com>
In-Reply-To: <20240701092639.1498856-2-Yash.Shinde@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Jul 2024 11:50:35 +0200
Message-ID: <CANNYZj8BGFdzu3Og12jrNLya+pA2-jQ0d+b1SG25ZUMHAaU7=A@mail.gmail.com>
Subject: Re: [PATCH 2/9] rust: Upgrade 1.75.0->1.76.0
To: Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, 
	Shivaprasad.Moodalappa@windriver.com, alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201297

On Mon, 1 Jul 2024 at 11:27, <Yash.Shinde@windriver.com> wrote:

> * Drop 'rust-rustdoc' and 'rust-dbg' from 'exclude_packages' list
> to check for rust reproducibility.

If the reproducibility issue in rustdoc has not been solved, then this
will only cause fails in CI and the patchset will be rejected. Have
you done local testing for it?


Alex

