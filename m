Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.15417.1609775661516260794
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 07:54:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IBbNhzLd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id r4so19764381wmh.5
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Jan 2021 07:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=M0hJrCXGJoKtBfY502sGfSLKLRl7DDrXOvA51dW4P9s=;
        b=IBbNhzLdzs9iBVjnjojSasGVFwXhhhz59u7Uy+G4VnNlk3lzbXSahutfZsQOzirzW6
         ykJxhLB6qDiGcCUvzr4kFuvf2KoT+gEbhUVeJqi1FB3wH18mRyCYgzUjGOzfaQG0gA9x
         JIg8OzDjc7ABMFWdnO//mFjITpA1he0Wlyr0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=M0hJrCXGJoKtBfY502sGfSLKLRl7DDrXOvA51dW4P9s=;
        b=tTRiE/p8vkPGHReiHKBBFnLofsfaLEKboXwEOtdRz7WCGLuA1HDZg7J+x1rSEMbiu9
         G250evxMqKkDzgFUsChK/Uh854TIY0TQqznGxLExUXr84TK0tccMlDV8GeMGxZQ2u/Pk
         GmLxshqWOMQ9pSWhNBOOjB36UbSrgXQgQAKMOvlBucio5fDFiz27MCJPwoLASklpjxUC
         seb6bYTxAxowhdXIqYZszHPjPX7dDPWqybNEcU8jqPrlwWPDYR7jetxTyOd9rPN/aMWw
         d2w9x8a477zy0TfDdXC0g8UUuRJGYGPI8BFtuv+9qkf8bDZHCEE+ydfKeL7SVZ65BLQX
         aaDw==
X-Gm-Message-State: AOAM531c5tP9tKlxDsUdaEb8psMSfn5bXt0FKVFa4VPNZhp7zntv5j9p
	0EjcJDouMhlmSHj8jNwc+rshlQ==
X-Google-Smtp-Source: ABdhPJxlxBRAF59Q+/4IFm6rH3LI7rlVGsbnzA/oqPYDcgjDr/bazYODlfVDWweStUym0UeTv3jDpg==
X-Received: by 2002:a7b:c773:: with SMTP id x19mr26719672wmk.127.1609775659983;
        Mon, 04 Jan 2021 07:54:19 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4767:d28d:f91a:aa32? ([2001:8b0:aba:5f3c:4767:d28d:f91a:aa32])
        by smtp.gmail.com with ESMTPSA id s6sm100452783wro.79.2021.01.04.07.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 07:54:19 -0800 (PST)
Message-ID: <c1b3a226025c8373f7c452a3a77eef30d4d44ac2.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/9] kernel: consolidated pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jon Mason <jon.mason@arm.com>, bruce.ashfield@gmail.com, Ross Burton
	 <ross.burton@arm.com>, "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: nd@arm.com, openembedded-core@lists.openembedded.org
Date: Mon, 04 Jan 2021 15:54:16 +0000
In-Reply-To: <818c16d5-07aa-1638-3b99-b2ea975c3d46@arm.com>
References: <cover.1608646697.git.bruce.ashfield@gmail.com>
	 <ef75b7d902ee23f65adf34742a71b1b8ee8c64cb.camel@linuxfoundation.org>
	 <818c16d5-07aa-1638-3b99-b2ea975c3d46@arm.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-01-04 at 10:38 -0500, Jon Mason wrote:
> On 12/23/20 7:32 AM, Richard Purdie wrote:
> > Ross/Jon: We also need to talk about the intermittent ptest results
> > on arm...
> 
> Is there a bug in bugzilla tracking this issue?  If so, we can add it
> to our internal queue to track and work-on.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14163
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14164
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14165

and maybe

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14170

(which is showing sometimes for x86 and sometimes for arm)

Cheers,

Richard

