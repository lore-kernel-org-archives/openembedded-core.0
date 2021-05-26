Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.5240.1622022251702547361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 02:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hOPHnJf5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id f75-20020a1c1f4e0000b0290171001e7329so131542wmf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 02:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VlNQ9f+wz2LkhM9Q7lINFqpB22gqVq2CRBWPS8UTnM8=;
        b=hOPHnJf5GFQu8FY0xabhZeD5PEL/o7g6kXJgJPHtyxz1z/0WMC+3dfCKet86uIBBgF
         sly7EQmXahWMGmRlvv7QZG9uMX1JBNKaVYKjuFYwGoQD7xKSoPtdGunj+2JAuEXVeEmo
         hdUXKcxrcIdrTeVHLFbOHIGDw716DxhDZFftk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VlNQ9f+wz2LkhM9Q7lINFqpB22gqVq2CRBWPS8UTnM8=;
        b=IUDr3Gu2jkEDDc9YfL0scbKWa9IfMeGcCAClHjC7ORLRwMn51y8cNgYhby0BAOhgoJ
         k7P8vEyFZJHrxzuKlzIfhd5VP61meUciEPMEcGd6wufpgA66fs6zDYuqI732xArLCuwA
         K3lcqYsYdVOoVcQjDcLlMvVhPRe5DfW4Htndo9/+fYTGD0BPKGqnECtIttA2tdFdrELB
         BEf18GK+p3JPolezC+8qr/U2T5qPALlqTvr3ANcVRXcn/q4scTav9CaciuBOIZjPAuu7
         CyPrfEy0lU6dC0cnC8HH0HAkl0zFCb3cvX1vbUblu5Nynwx0vJ5VCxlpo/YuqURgF1Pq
         WUBQ==
X-Gm-Message-State: AOAM532GyCiMHrJbTr75pR9E8KxI+jL1hENhwwPlJDsdZvLNbIEL4nfJ
	lBhYV6pfnJNOKDfYBo15ZF3Krg==
X-Google-Smtp-Source: ABdhPJwoSaXuFEUxfmRbJ1bkHrqau7KKXlxVpAcxXTpaQAccYK3UpVDrhqgxTmkXGRuY45cLXHHREA==
X-Received: by 2002:a05:600c:214f:: with SMTP id v15mr2566076wml.86.1622022249959;
        Wed, 26 May 2021 02:44:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a7fa:b38f:3320:9d46? ([2001:8b0:aba:5f3c:a7fa:b38f:3320:9d46])
        by smtp.gmail.com with ESMTPSA id r1sm18996264wrt.67.2021.05.26.02.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 02:44:09 -0700 (PDT)
Message-ID: <4c5627bc3c5a1b6f882e3455ad15d4d4cf94f64c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] Revert "gcc-cross-canadian: Add symlink to real-ld alongside other symlinks"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Samuli Piippo <samuli.piippo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 26 May 2021 10:44:09 +0100
In-Reply-To: <CABXoSoUs-V6_0Tk7SrsDCewX3QudEzQitz2iPb=zMu1-MnY6kQ@mail.gmail.com>
References: <20210521143328.3368988-1-samuli.piippo@qt.io>
	 <ea6eee79c5a985e385579eda3786c515dbfdd5a1.camel@linuxfoundation.org>
	 <CABXoSoUs-V6_0Tk7SrsDCewX3QudEzQitz2iPb=zMu1-MnY6kQ@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-05-26 at 12:23 +0300, Samuli Piippo wrote:
> Was the "gcc-cross-canadian: add symlinks for ld.bfd and ld.gold" change 
> included in that test build?

Yes, it was.

Cheers,

Richard

