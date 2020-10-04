Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.22047.1601851551740834780
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2020 15:45:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YgtyGIBP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id e18so1576404wrw.9
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2020 15:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=PL3VKsrFq25PXsAoKAoSBbvBjpt8UUuYmYwoB/6eDZc=;
        b=YgtyGIBPYYhtYCURZUlglewovNdJ6SrtLtosk9Q4eLq+fUtS44vDN0+JDvvNQHJ7Tk
         4kuFXpt3rqyUh6famDrZXjQmc8661TZXF6abCu5PSn0Mn/ULVcXhkk/8lV4EGImkN6rV
         D855QFJDvVOFg677DgzhpAbiEHT7mbSlgcYcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PL3VKsrFq25PXsAoKAoSBbvBjpt8UUuYmYwoB/6eDZc=;
        b=csR0Ihfi4rdq3OFcBEx6k9Y3xZ8sMdV/o1zr60ODpzplKcglJfqNTdqszYvIE4cmbW
         9+OXf41fPNC2tPQlRQBnVsVvQi3YkRsejc1tlhYRCSytCSG8svreWgqc0a3VSm4NGajS
         /nGonc6UZef1UN8R2mBNR/IZAYWf9PzoQRnkUAtTJsSqPs4pVJJdn3ZeCwx14QELF6+y
         x9ylUZvzI4mMklw6gn+CRwnuWOXHmizT5Ogy+0OwRXTQUsq0A0YJ3KtaMXh4AcLMmNHV
         tmI/SFlkgYbiyDihJmV3noTWURgGrd4ivWivHEuohAOWEv4IU/4SS1c4GRJCHlyU8sVz
         bubQ==
X-Gm-Message-State: AOAM531b6RmsU9yucfFnJXIiUG7/MnlX69WpgMd/Kkce8s5LhtLnFzP7
	p++5thyZs5MOIkUHkPt6aaskBQ==
X-Google-Smtp-Source: ABdhPJwTBReGzCcNCf2/Ofp6VRHUvPrE23Ik7T6UlVjcnXCthj0x6Xt+hiqjGeAZl5fOCIhYvbItLg==
X-Received: by 2002:adf:de11:: with SMTP id b17mr14161026wrm.82.1601851550066;
        Sun, 04 Oct 2020 15:45:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 2.5.0.3.a.2.c.3.a.7.3.a.9.8.8.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (2.5.0.3.a.2.c.3.a.7.3.a.9.8.8.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:4889:a37a:3c2a:3052])
        by smtp.gmail.com with ESMTPSA id v2sm10682226wme.19.2020.10.04.15.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 15:45:49 -0700 (PDT)
Message-ID: <131a864235d72ad2fa024f854afb84f77bb9de61.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rm_work: Allow pseudo directory to be in the excludes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jan-Simon =?ISO-8859-1?Q?M=F6ller?= <dl9pf@gmx.de>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 04 Oct 2020 23:45:46 +0100
In-Reply-To: <20201003163417.67950-1-dl9pf@gmx.de>
References: <20201003163417.67950-1-dl9pf@gmx.de>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2020-10-03 at 18:34 +0200, Jan-Simon Möller wrote:
> From: Jan-Simon Möller <dl9pf@gmx.de>
> 
> While debugging the pseudo issues, rm_work was always removing the
> pseudo folder
> even when it was in the RM_WORK_EXCLUDE_ITEMS variable.
> 
> This patch puts the pseudo case within the conditional.

I've mixed feelings on this. Given the things rm_work removes, it has
to remove the pseudo database as well or you will get path mismatch
errors. I suspect we intentionally don't let the user do this.

Have you had this running without issues?

Cheers,

Richard

