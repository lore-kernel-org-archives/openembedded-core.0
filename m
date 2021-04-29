Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.1870.1619726007492961906
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 12:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=br3C5TqN;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id i17so2954136qki.3
        for <Openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 12:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:message-id:from:to:cc:subject:in-reply-to:references
         :mime-version:content-disposition:content-transfer-encoding;
        bh=b4/YyELSV0yza/HFWL/bpr85HRDXM9Fk5yyxmRiRsSI=;
        b=br3C5TqNY6OjGaBkHRaZiPnMReIl2B8QHaI5JLVjUEGv+hS0rz6yXCIKKXMHtkO/11
         OwXWPaFZJJRpUfpmxzX2c/5PxhW/iMTNBBZ5Zkdh42qEtGw4RW1yZL0wzNkZkKOuSQ8J
         r0yf/gBYFRofhK4PqZ7c/B/aK0MpIPFUkipEUNrbJqq1s4OmvbE4qTJ+DpStS0hTCWYa
         MWVcYRc8j84hdBtCj/HzQ0Oh7Wv8aXsSjePFvfr+qIc3alY2Fpapl9f9ZcuHk7eHqfl/
         Lh5ZlbpJ7dmTCoGs+PYq2IwFvea8J0qQnKF6xrjPx+exoStlWCRbrpk0S4Dbc+8H03Uw
         Ls3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject:in-reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding;
        bh=b4/YyELSV0yza/HFWL/bpr85HRDXM9Fk5yyxmRiRsSI=;
        b=jXxTCkreCdTsv+q/V09iP8XdJrHeukrHyDNlk4SwRJkW1PZANM6p8baZSD7+X27VhS
         d75kljZgk62Kq1JuzHIQSRT5wf11GGkmYIay6Ji+9J35t8yDdMxNN1HuM23ONAs0txnt
         LqrsxgDpanm15Y6LGzvcKbmOdL16lzZT0YG0ku7kTCptiF47yZJnW8BG1lPRgB/jWXHu
         8+jerrNz06JS6sXwi/ZOL4R4RdeD4kjkdp2MYLTBhxTI7M566Mz1dvxaih9Df5k7h922
         Ne8i4y+IwMgFBH4gQprCkxQd1cErZNaRrR7xC14oHnJcLcheb71p1aEZdpZS3TSo5J5s
         llvw==
X-Gm-Message-State: AOAM533xKjbZtBOOlSMLnRH2W9DyixBiULpjHih3ydPnABpatwKHjETN
	Otbt5i8qtgSthMTctq4ObQ4=
X-Google-Smtp-Source: ABdhPJyNhhB5+4iupHwWUXqAoQjoEK0DKmpitVPs0W9NZozwGJsBLENGMYJYdDpzCThTGoqmuQTFRA==
X-Received: by 2002:a05:620a:70e:: with SMTP id 14mr1514492qkc.278.1619726006610;
        Thu, 29 Apr 2021 12:53:26 -0700 (PDT)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (modemcable249.105-163-184.mc.videotron.ca. [184.163.105.249])
        by smtp.gmail.com with ESMTPSA id 144sm3004133qkn.108.2021.04.29.12.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 12:53:26 -0700 (PDT)
Date: Thu, 29 Apr 2021 15:53:25 -0400
Message-ID: <20210429155325.GB3587304@t480s.localdomain>
From: "Vivien Didelot" <vivien.didelot@gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Openembedded-core@lists.openembedded.org, paul.eggleton@linux.intel.com,
 a.kikin@tano-systems.com
Subject: Re: [PATCH] sshpass: add package recipe
In-Reply-To: <1e3f7ea0-3e22-a92d-7344-e6f29636df8c@gmail.com>
References: <20210429153638.1077559-1-vdidelot@pbsc.com>
 <1e3f7ea0-3e22-a92d-7344-e6f29636df8c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Armin,

On Thu, 29 Apr 2021 11:02:50 -0700 akuster808 <akuster808@gmail.com> wrote:
> 
> 
> On 4/29/21 8:36 AM, Vivien Didelot wrote:
> > From: Armin Kuster <akuster808@gmail.com>
> 
> I see meta-networking in the path. Was this change meant for
> meta-openembedded? if so,
> please use "openembedded-devel@lists.openembedded.org"
> 
> If I may recommend having it live in meta-oe rather then meta-networking.

Would you mind taking it over and resubmit to openembedded-devel for meta-oe?

Thank you,

	Vivien
