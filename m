Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.7427.1602578694052289354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 01:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X3+MnoSj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id g12so22957820wrp.10
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 01:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=eYZqUcDdHclNRkixFf+K6MJwKJc5DbjPFH66gFWhZ+U=;
        b=X3+MnoSjIJ4qu0SdgC7ajtxjKBOIyRgJnR3onzd1zkaGCUzSsF/7h23CG3wH1tBt7V
         vITSv5ZZiqv4H/gGD3CtTxv9F6twqDdwT45vqqTVMm0DI0W8t0zJRpOaCdWVq6Tj/1De
         z42yDb5JR6LRXna+5TgO0u3M9iRWpTR1xsl4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eYZqUcDdHclNRkixFf+K6MJwKJc5DbjPFH66gFWhZ+U=;
        b=Epp2iPaQt6kepLPAB6OuqOvQKFPxfHNZU6HlyOB2SwmSOvJD4KWVyTI80XmGY1fIDP
         oYpmGKaIL3ydK9roSmWacCWqOu4GV+fAT6pZOhBxQPFnDVG8LBNsCcZLPn1CI82U6/Tq
         Agv3j/hB21UnaSnQ8l73dCn7J58tCU497IC3q7YjvYUqllDDD6yiGjKJdAViGNyYbR1v
         gxhL/xnFEwK+RMyQn/AaF8SGLdD4ldQnMF/j5/+ceLcfY0iQ63d1piLkMsmqAGmwmXye
         6YApvmhE/NFeKKkcxMN/6hI7AGMvN3lPxiC+R6Zp/57YAGnXcWEKDi6mCD6QJqHSziea
         i6vQ==
X-Gm-Message-State: AOAM533EziapzH5ecSp0CDTsu6p6QyteKg+I1LvK61WX8OhYgWsaxr65
	d+1ScpSP+J3uDKaD1siS24aaHA==
X-Google-Smtp-Source: ABdhPJxyrULpgVrDdU4SgHosn9QtMKxLU/fwwC/X1fiD1dUFmMVxa5bBtjDygZkkdEIQkeQegCI4iA==
X-Received: by 2002:adf:cd82:: with SMTP id q2mr36446680wrj.118.1602578692458;
        Tue, 13 Oct 2020 01:44:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7d78:e5d6:b970:ac7f])
        by smtp.gmail.com with ESMTPSA id q10sm28211878wrp.83.2020.10.13.01.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 01:44:51 -0700 (PDT)
Message-ID: <0aec3831d3ff64f9848512740a7621456ac45fb8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] tune-cortexa65.inc: Correct TUNE_FEATURES_tune-cortexa65
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, Peter Kjellerstedt
	 <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Jon Mason <jdmason@kudzu.us>
Date: Tue, 13 Oct 2020 09:44:51 +0100
In-Reply-To: <CA+chaQf-4692XTUAiguks3ZmGg7mLXDeFbPsn-mjLRRCMcEfQQ@mail.gmail.com>
References: <20201012213137.15179-1-pkj@axis.com>
	 <CA+chaQf-4692XTUAiguks3ZmGg7mLXDeFbPsn-mjLRRCMcEfQQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-10-13 at 00:24 +0200, Martin Jansa wrote:
> Good catch, maybe we should require tune-test.sh test for all tune
> modifying changes, it catches the issue as the very first tested
> case:
> 
> Testing fake MACHINE fake-cortexa65 for include
> conf/machine/include/arm/armv8-2a/tune-cortexa65.inc (1/76)
> ERROR: something wrong in openembedded-core/scripts/tune/log.fake-
> cortexa65
> 
> martin@jama:/OE/build/oe-core$ cat openembedded-
> core/scripts/tune/log.fake-cortexa65 
> NOTE: Started PRServer with DBfile: /OE/build/oe-
> core/cache/prserv.sqlite3, IP: 127.0.0.1, PORT: 44979, PID: 158972
> ERROR:  OE-core's config sanity checker detected a potential
> misconfiguration.
>     Either fix the cause of this error or at your own risk disable
> the checker (see sanity.conf).
>     Following is the list of potential problems / advisories:
> 
>     Toolchain tunings invalid:
> Tuning 'cortexa65' has the following errors:
> Feature 'cortexa55' is not defined.
> 
> 
> Summary: There was 1 ERROR message shown, returning a non-zero exit
> code.
> 
> I'll let it finish in master branch and update
> https://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/tune-test
> tomorrow.

Could we turn tune-test.sh into something in oe-selftest? That way it
would be tested on the infrastructure automatically...

Cheers,

Richard

