Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C30CC05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 12:58:53 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.72722.1674737926326169969
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 04:58:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E490Hteq;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id e16so1799945ljn.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 04:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UwlAaR8EAWNzz8pcT5wcILnGXFh9pZ2s7IcDm0W4FSI=;
        b=E490Hteq5dFwkdYyvuB/mOO4SFHyGZAKDJx9dU1aTro0RNJUBdXe5UjAfnCD69npdG
         kliTFEBLNxaHF61G6EXfiLQM+ffLOIipRr4S5S9HVJIVL/qCH1baeoHADDtU7Qt/Si0w
         BiIxAiIcRc2fh3zrDXgoenKIiH6aeUJLVOAvDfijlGt99C7el2Yv5G1eKtpCKJLtASrJ
         Y2SxiGBIghAxqTYwiHRVEcOovls3M/W4ux8imTNWHmYFVU0yPJGUB2dRZrCdAXOOvdGD
         5QblHe6R/dmC/czYRVRn8/MJXI8YGVNx2s/I0xvIEC6lAkeCoF97dSLX32RYGaUKIPdn
         NX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwlAaR8EAWNzz8pcT5wcILnGXFh9pZ2s7IcDm0W4FSI=;
        b=VZSv1t0uUa0sn+mpN86U4Qn9jq7dV4ws//q8/9CLTkpxDHOg0YT/HVQcKXj5mEGxkK
         dbYKPllxJiSzb6hFDxWJaUJmaLzyRdwZGuIeF3Kf6Np6nsOqefXpY0feyuOfFBFhPvjr
         BNd+444NygYKHXHnwwDmqZOiCxJlG7kfSnAhXF5VicdvrkgvqxQW1u3NIIE9ozTJpzyQ
         KzaGUiPM0M+nACHgQswB4yUVtDrajtWnybkKrHeLBxTHsyGM9JV3THZtFMj5cRbvLeVD
         GN767z70jX2rXHlJRI8w8VjMFl+CUa/WM7rU4/UtYmqa+Sae8EIpUhCHjtmyML5zNqmW
         EyUA==
X-Gm-Message-State: AO0yUKWnmDsHxMK4yKImpPRJy4BeBVHVZVFDh2eo5BQBPWRSIoJIJeA0
	V2vBGqxbgV3F/WkroW5jhbsqfpSZBrNQeWWOZ0k=
X-Google-Smtp-Source: AK7set/ZFta/ntKYbmeSRNxUys44I4/Eb1qc68hJzycRlvZsQ+tnbzqL2ZF6R/vx4YxFIns32h914CejwQltQCJCtSo=
X-Received: by 2002:a05:651c:2314:b0:28c:fd59:99c0 with SMTP id
 bi20-20020a05651c231400b0028cfd5999c0mr642203ljb.313.1674737924364; Thu, 26
 Jan 2023 04:58:44 -0800 (PST)
MIME-Version: 1.0
References: <20230126083752.151940-1-alex@linutronix.de> <2986f2e9ac85049402a858526b6989028e451a8c.camel@linuxfoundation.org>
In-Reply-To: <2986f2e9ac85049402a858526b6989028e451a8c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Jan 2023 13:58:33 +0100
Message-ID: <CANNYZj-cnpyE7cbGuX+Ou465BikgwNinjAgHtOzqy-854kZ5kA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] gdk-pixbuf: remove ptest support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 12:58:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176395

On Thu, 26 Jan 2023 at 13:52, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I don't quite understand this. Does does mean the ptest was working on
> x86 but not on arm and was silently failing?

Generating data files needed for ptest was working as long as build
host could execute target binaries (build host executable from
gdk-pixbuf-native was run with target .so plugins from gdk-pixbuf to
do that) and was silently failing when that was not the case (each of
the plugins caused a load error due to architecture mismatch -> empty
output file). Since we run x86 ptest on x86 host and arm ptest on arm
host, it produced the needed file in both cases, but only by
coincidence.

Alex

