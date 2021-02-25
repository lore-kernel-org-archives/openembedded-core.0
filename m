Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.9729.1614248946400538611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 02:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BXYf6X64;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id u14so4706655wri.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 02:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=5gASRwGijlTfZ9eZxPZN/BCHEpTFfcf6C1cbbmkOAEs=;
        b=BXYf6X64JDOUeZY/bx2TfJnphcUGl40LJ6xzJcr0y7eZZg0UtjsxR6tgSaQfDiNdxi
         pJOCKrwAeUoQKMV3B112D8G2xO4yIX3jLwGFuGpuAJofqqa5wDmsdE11D9LeyxAt8NmQ
         Z7loJqjx5+NLs/WJWjYv1tzz0PiZfGzffRhd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5gASRwGijlTfZ9eZxPZN/BCHEpTFfcf6C1cbbmkOAEs=;
        b=LBdZOH2DYs8vx6Besv/sth/2TZfnyke7O8YdU3I6BgrmEkpLI234XP32EGqcxPftV4
         ZB26FwHepvXZ96VLF35DmvYD+H4LQVHmx0VCLLbqjKEULr5L5Bh7tNgCjwvon5A1lbCk
         eZhYICqlTe28Ahep7iPo8ShJBA9gbWrVMqAWfcuno/V9Xvdw/xIn0oXd0yM1UWK7rlUF
         Upl8IlYRcjCCK07jh0j1OTt4sSTSqzcF1i4wx47RzwANiWLwFDGb17rTijbnA0tBjuCk
         pDDsFI5/a/Iz6k8lV3YCf9T52uBIF7NKqdmCA+8NXuAN3iwJV/X8zqrM0jDDrUubLpaC
         99Pw==
X-Gm-Message-State: AOAM531dzCxOnFfZNUX4Ua1FyGoh1UCg+VwYBdi2BLKdaQcT1PBohu5t
	BzHk1atFYHNc6Ky9tIR3PicCAw==
X-Google-Smtp-Source: ABdhPJwh2DDMEIm/29wBEJ4VT5Q4h6T4pj8v8LGfwHFp9r2JobdyyDwU8Kqxh/kkxdR7xAk5r9Gw7w==
X-Received: by 2002:adf:fad2:: with SMTP id a18mr2725111wrs.147.1614248944403;
        Thu, 25 Feb 2021 02:29:04 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4258:f6b6:9d0d:f472? ([2001:8b0:aba:5f3c:4258:f6b6:9d0d:f472])
        by smtp.gmail.com with ESMTPSA id k4sm10517880wrd.9.2021.02.25.02.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 02:29:04 -0800 (PST)
Message-ID: <f6d954124581f233baba17e076d8a848ab998da2.camel@linuxfoundation.org>
Subject: Re: [OE-core] Pseudo Abort errors
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Phil Reid <preid@electromag.com.au>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Feb 2021 10:29:03 +0000
In-Reply-To: <6b813e24-a48e-5b92-fd26-4f1bd31a8bbd@electromag.com.au>
References: <6b813e24-a48e-5b92-fd26-4f1bd31a8bbd@electromag.com.au>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-02-25 at 08:28 +0800, Phil Reid wrote:
> G'day,
> 
> Not really sure where to look for this. But started to get random build failures
> with the pseudo client.
> 
> Failures are contained to populate_sdk
> 
> Not always the same file reported in the log and removing tmp-glibc before the build solves the problem.
> 
> I've also tried a psudeo_git.bbappend with:
> SRCREV = "60e25a36558f1f07dcce1a044fe976b475bec42b"
> 
> Which looks to be a pending commit on the list.
> Unfortunately it didn't help.
> 
> Here's what I think are the relevant parts of the log are below.
> 
> "rm -rf tmp-glibc" and a rebuild resolves the problem.
> 
> 
> Any thoughts?

Which branch and which packaging backend are you using?

There is a bitbake.conf patch on the list changing PSEUDO_IGNORE_PATHS
which would probably help but I need to understand that doesn't have 
side effects and I don't have enough data to do that yet.

Cheers,

Richard

