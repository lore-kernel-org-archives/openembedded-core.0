Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.58702.1606736845915843868
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 03:47:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fSOtoPOm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id e25so5754581wme.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 03:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=UMTnTgGBfp1SObaNkgZZSwyO/AOvcGdBIEHdLzEMngo=;
        b=fSOtoPOmzzOHqjreWWJs+aeS5aBCHxMHdi4iZgMik+6CpR6vpnY4dGIlnqjDinUFq5
         baB8FU94un+fUA9ZEXcIdZNtjqOjvI1eiOnU2Vmb7I3rwO2063ZC/8awZOIa0neGLF7e
         szv9neHtNOstEKDISj52CDcuN9ifgBrVCQF6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UMTnTgGBfp1SObaNkgZZSwyO/AOvcGdBIEHdLzEMngo=;
        b=oY31FTVKzEWXP7Hv7QaPnCWImH2RWAdICXf8tMwlnHwzssQ5uqA1r3EAgSmgxVTqfi
         qxky028rrFQUuZ2kdq5kxUo6dSOylQ/NWteVgcvaE0d0fhBxu8qUSXNAdl9evGb5WOkQ
         6dag7QTh1i8HAW0pPuXyJcqjbTJRo466WjEGtlryprZtbyzlM1/b3SYFMxuF7Johyto8
         nB+v4u+hLYxpABruV6q0x5ebEB0k4yuXZflrbMHn5jdlhsT+cWs0M3zDw6yfI24IWXZV
         ukr/MURl/+/wlcvnpH5oKDZzg/zFH4EMcs7cjUue87PgX4zl4phJLoiCH7oKrei34yvB
         OWZg==
X-Gm-Message-State: AOAM5310+tRYXyTs1iAhtzdl+rpwCSHeMbKFTkZq06Q4FSp+kRqkKoYV
	FGHAR+/A6TGg824hen6rxJDgXw==
X-Google-Smtp-Source: ABdhPJztN/ybN2deuzaFRlQhblXM+qSZ67b7rb7HGsA/UbL0vJY84PrN8kYMcpMPT1bXZXdyl9v84g==
X-Received: by 2002:a1c:220a:: with SMTP id i10mr9277331wmi.93.1606736844412;
        Mon, 30 Nov 2020 03:47:24 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.8.4.7.c.c.2.8.a.5.e.3.8.c.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b1c8:3e5a:82cc:7486])
        by smtp.gmail.com with ESMTPSA id q12sm24250856wmc.45.2020.11.30.03.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 03:47:23 -0800 (PST)
Message-ID: <1f005e64f11edd73d83461290baf0805f886fa41.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2 1/4] pseudo: Simplify pseudo_client_ignore_path_chroot()
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 30 Nov 2020 11:47:23 +0000
In-Reply-To: <dc076eec080ae9dd901ed4387b1a20239f7594ce.1606312002.git.pkj@axis.com>
References: <cover.1606312002.git.pkj@axis.com>
	 <dc076eec080ae9dd901ed4387b1a20239f7594ce.1606312002.git.pkj@axis.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Peter,

On Wed, 2020-11-25 at 14:48 +0100, Peter Kjellerstedt wrote:
> This also plugs a memory leak in pseudo_client_ignore_path_chroot().
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

I make no claim to understand what happened but I tried patches 1 and 2
in a build over the weekend and with the first two present:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1602
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1584
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1586
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1610

I then removed this one leaving only patch 2 and the build was fine.

So there is something odd in this patch but I've not looked into what
or why only selftest is affected.

Cheers,

Richard

