Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.8701.1621345691963077143
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 06:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RWAJNItu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id h4so10280340wrt.12
        for <openembedded-core@lists.openembedded.org>; Tue, 18 May 2021 06:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=AxDqr5E3u5rxY4DiOOcpZnQZLpeCvKHWXTi7ChNFb6Y=;
        b=RWAJNItuKoxH4Wr5wjmYmxcISf3SsdQSUtxn3H0/CnCxb4QF4dC/rnISylfnKlw29/
         iqu0KjguPDPcnFl9tCxWpC1GVrUvyFA8HI/WmLQV93migu3xPHvIIjihWk/8TX8EyTTX
         IxsDQ7Cc5XYSc4bXJi2WhEO5s2kvOShQPPmYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AxDqr5E3u5rxY4DiOOcpZnQZLpeCvKHWXTi7ChNFb6Y=;
        b=gTV4Lf3wzHMUrks1s8TROvYVEa0fbZ1CA5X2uDFLylAbZg3XTFgMeCzWtkmUYZEoGF
         u6549sJ+TE4Hinuzk2HhG7RRg+Ly4xHcXgr942gyJedjIL25M26gOS0Qin+W3ERCN8VY
         IgZlbX/G7UGihHcwMw2qYuCjNTbkxJEh9j7Dz6oyD5yphO/H4/83g2yVo9YspqjF44Am
         wZ36mBxemnN2+To/BKL0lr/KcHArZbdKch1JLVhaI6IbXLDYiK7aPu6Ks3kx4uNxgIsV
         3GwCZ/mHRGZkkVd6CdYJrWRuUg4ixS9N7RNKOqlIgehk5cdk/dvuIBlYWBy904X8KIFT
         dOBg==
X-Gm-Message-State: AOAM533GKdcMjMC+AFBRSXMO9Dr+3CJVQ3pdVD5ZOpd2F/sFaUxu+aGs
	6nfKGlZ43GX/Ip5U7wfgco+Cag==
X-Google-Smtp-Source: ABdhPJyddLfeK7OrQ79u6fsZjU3I2UPtHo0AHK1GITVQDOARqzGenPwCulzlf4/X4ODnOY5Ibd67Tg==
X-Received: by 2002:a05:6000:154c:: with SMTP id 12mr7044731wry.14.1621345689837;
        Tue, 18 May 2021 06:48:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:c468:ba30:74bf:a356? ([2001:8b0:aba:5f3c:c468:ba30:74bf:a356])
        by smtp.gmail.com with ESMTPSA id a19sm15136045wmb.40.2021.05.18.06.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 06:48:09 -0700 (PDT)
Message-ID: <21cb8f51cdb5851b0639a0a5bc8890d8b6c054a1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] mklibs: remove recipes and class
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, Alexander Kanavin
 <alex.kanavin@gmail.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 18 May 2021 14:48:08 +0100
In-Reply-To: <CAAnfSTtb36V82L98UcYm2SAjcvXi_VC+k7PdbE3Qt4RvzqxW0Q@mail.gmail.com>
References: <20210518062446.8201-1-jacob.kroon@gmail.com>
	 <CANNYZj8oUYaxPhBW8CsjddYPxEzqvwnCoORgebLjpkStD9pdKw@mail.gmail.com>
	 <CAAnfSTtb36V82L98UcYm2SAjcvXi_VC+k7PdbE3Qt4RvzqxW0Q@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-05-18 at 13:23 +0100, Ross Burton wrote:
> On Tue, 18 May 2021 at 10:42, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > The location of local.conf.sample* is somewhat confusing. In poky they 
> > are in meta-poky/, but in oe-core they are in meta/.
> > What's the correct way to update them?
> 
> This is one of the rare times you actually need a clone of meta-poky
> and openembedded-core to send the right patches.

In general I tend just to quietly fix things up by manually editing the patch
to match the meta-poky repo. I sometimes wonder if I should worry about
doing that :)

In this case you'd sent patches I could apply to each repo and just had
to tweak the commit message for poky, thanks!

Cheers,

Richard


