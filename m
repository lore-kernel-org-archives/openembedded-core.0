Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53104C433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 10:54:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.27204.1652698481130733197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 03:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YC5ogjgx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id k126so8457853wme.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 03:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=tbxCU3w+IaYrgbDD1+BRkXCSx/hAFcoW00x1EzklDoM=;
        b=YC5ogjgxDOidTS0SwjdRPf9z4XCv+G1kiJsR5quokPm/NTPJDsft9Uii90JI/M/fWh
         veycurXpVgAfO8U5umW5oSyx3hyGqhXAAA4+VbAKXaNAurNZ2NdLpz1gyqG+nw7+T58N
         ZdIKq/YwtSgepl0DS6mKw08XpgdihZI8b5md4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=tbxCU3w+IaYrgbDD1+BRkXCSx/hAFcoW00x1EzklDoM=;
        b=FGWoBEaP0aOHTpJUoOFtyorI/Yc1J/1GRX2aCTbejhNCQfZ26bApFLTWXJBIZKEuc2
         9B0YHP5D4+UDJY5mmDLVeVuiTpqPWVCeVCGBWXPGuLJseCvXxXLWRuwq+kGKy3YYYJ8Q
         msrSFWqLw/ebIQ4Y1myYyp7JDG/Bi06M9483rOZqqaNPCvfvP+EyN6idNV+fA7L0D8qw
         gjJEogy3kHEnRsnQyiexlITkuFHftelmsd7caQiGU0PCYb4bJICaJ/ecyDX8udvh0RbA
         jI58e89Av1ayTdJpQAXHfGkWKN/hzmHJdgLORxAo6JXTZprkYwmWjlHbJbEv/WQF9sr4
         vSdA==
X-Gm-Message-State: AOAM531Yv5zaOQ6N0IEQSJu7pii5JLdqyT3pElFwTB1fw5OajJDj7xtm
	k3kvI5cQbWr0xGxed9bUNi/4vAcSy2d3vFze
X-Google-Smtp-Source: 
 ABdhPJyWyO7SCteWlISQ9fkxEg0sRc0GqFSfGwQyruas1WpvriWEJ+y8lcjqnW984n5lNdcizeqARA==
X-Received: by 2002:a05:600c:4349:b0:394:1702:6d65 with SMTP id
 r9-20020a05600c434900b0039417026d65mr26743666wme.4.1652698479519;
        Mon, 16 May 2022 03:54:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:907b:5576:ab63:2b17?
 ([2001:8b0:aba:5f3c:907b:5576:ab63:2b17])
        by smtp.gmail.com with ESMTPSA id
 l16-20020a1ced10000000b00396f8c79d22sm6084886wmh.11.2022.05.16.03.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 03:54:39 -0700 (PDT)
Message-ID: 
 <4e640d6e43aae9a6be851539f6ddbb7882b82a62.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] squashfs-tools: always install prebuilt
 manpage
From: richard.purdie@linuxfoundation.org
To: Changqing Li <changqing.li@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2022 11:54:37 +0100
In-Reply-To: <20220516104207.1734099-1-changqing.li@windriver.com>
References: <20220516104207.1734099-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 10:54:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165675

On Mon, 2022-05-16 at 18:42 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> When other feature enabled, and involve help2man into squashfs-tools's
> recipe-sysroot-native, install-manpages.sh will run target binary on
> build host, eg: mksquashfs --help, which will cause error.
> Eg:
>  ../squashfs-tools/mksquashfs: /lib/x86_64-linux-gnu/libc.so.6: version `=
GLIBC_2.34' not found (required by ../squashfs-tools/mksquashfs)
> > help2man: can't get `--help' info from /tmp/tmp.pEG5R8COVb/mksquashfs.s=
h
> > Try `--no-discard-stderr' if option outputs to stderr
> > ./mksquashfs-manpage.sh: help2man returned error.  Aborting
> > ../generate-manpages/install-manpages.sh: Failed to generate manpage.  =
Aborting
>=20
> Fixed by always install prebuilt manpage, avoid running target binary on
> build host
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>

I'd much prefer not to carry a patch doing this. Which "other feature
enabled" trigger this to happen?

We might want to talk to upstream about making this configurable rather
than carrying a patch, or we make sure help2man is never accessible to
this recipe in some other way.

Cheers,

Richard


