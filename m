Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.17754.1622934609660279714
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jun 2021 16:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d587ugUG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id c9so4373426wrt.5
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jun 2021 16:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Zej3hHz5dXVx4bDW5j8nkGy50qXPqA5s5NVA/vZO4Vw=;
        b=d587ugUG5mt2LQmRJ6UHohGqHeI9vvT5r4z7YVFoKh8mHBXI9bR+Jf5EfqDokwC3A0
         w7UZ5v3lub6qTzq4PJck6C8fk0qkGyMkVRiWQXJD4pMJC2Sd8JfdyqBxFa4KStC3ayQD
         IZI56v9a04Ieku4e6uqlVrm+oUEa+P3aeyfjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Zej3hHz5dXVx4bDW5j8nkGy50qXPqA5s5NVA/vZO4Vw=;
        b=g/QrgBhHLtSPhIrGYtBGz9gVgsT9yXOj1mcm3VyVjKbeY8HHqh+I0LlKT93OIIH2P0
         x0Q0hdvKFX84mddc4Z5bOUmi7HFRz7soZqrUgGwDnyfa3k8DdG/A4jASjY1HJdPTc5s+
         HmbhIdirM3SEhI3WNSFACb/wcrGj4AEn6nehhKdcjz/ogk50F9LtT3jxi3fziqaF+JEV
         h8MUXDXzdKI2bngSGiRNOVsmCXZP3TLyQEwFvX/uT7frxSvx7Pdlp0Dp5cQHd13R+5wz
         FmzA6wrRTLznqEcNgeONsFGIvvLhHp9pfNHImXvqGoB2aigHbvTqGyhhMQhbzsCl+Efx
         Y8XQ==
X-Gm-Message-State: AOAM531aRv9pWxL5ckbLfOE/4O6svSd/j416xLnL8zAqezFQEVru+d65
	KYdWTqSxDrLtR3sReo3DA64RRg==
X-Google-Smtp-Source: ABdhPJxClEEN9ACZ5MLrqPOc92D/wAwfp9dskCzFamk1ygAcJgfcSbgHMnD0js1pV1il90Kh8BfWPg==
X-Received: by 2002:adf:fc90:: with SMTP id g16mr10191632wrr.183.1622934607788;
        Sat, 05 Jun 2021 16:10:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b686:a129:22a:9e80? ([2001:8b0:aba:5f3c:b686:a129:22a:9e80])
        by smtp.gmail.com with ESMTPSA id e17sm12144928wre.79.2021.06.05.16.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 16:10:07 -0700 (PDT)
Message-ID: <2ac70a7b01743192ae4ec42b2b1eee18becde25d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core
	 <openembedded-core@lists.openembedded.org>, Michael Halstead
	 <mhalstead@linuxfoundation.org>
Date: Sun, 06 Jun 2021 00:10:06 +0100
In-Reply-To: <CANNYZj_ExBZwGzRrnG8Yb2nsNmzCKkZV09FqFuMbCdxAepNSkg@mail.gmail.com>
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
	 <20210604091458.1381144-4-alex.kanavin@gmail.com>
	 <1685B658849E960A.4717@lists.openembedded.org>
	 <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
	 <50a73766-dc52-0600-a6cd-7ab422030782@gmail.com>
	 <7e56d093ba6c1390cec71ef3a362abe84ce735bb.camel@linuxfoundation.org>
	 <CANNYZj_ExBZwGzRrnG8Yb2nsNmzCKkZV09FqFuMbCdxAepNSkg@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2021-06-05 at 21:27 +0200, Alexander Kanavin wrote:
> On Sat, 5 Jun 2021 at 18:09, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > 
> > I've just realised this is also happening with master in a-quick:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1441
> > 
> > all centos8 failures.
> > 
> > Michael: Did something change on those machines during maint on Friday
> > that could be triggering ths?
> > 
> 
> 
> I manually ran sato testsdk on the centos8 worker just now, and it passed without errors.
> 
> Was there maybe a period where system time on the host was wrong?

I tried again with the autobuilder, still fails:

https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3516

so whatever it is, it is still "live".

Cheers,

Richard

