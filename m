Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web08.3440.1608764155704077866
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 14:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q6GmnzUb;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: twoerner@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id q137so598280iod.9
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 14:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G4HWiVVIaGvZglY/km/xMDgnhv/GSlBq2yhZJ7gH3Bg=;
        b=q6GmnzUbb0/w3tyn9stzW5IbQk8Y+kRXa5H78O8pEVxWd5Csz7pe7S3Xx/Y98hc1qK
         BhoiNGHmLvwL4SrJ2QrIaZh2TtgsFtw0pc537jPF9KsCRSLFjZ+MXMyyIIU2ynnVtuvO
         GY6hVEsZx0dvmGx7twnbmySMCNBR2iKH7kgSyT/WBtXtI2BpLwdZOnXMU4FLW2CU2xtx
         aqWnCR7CrJNYY4FG2amrqy6zhGUjuTyxeLWrv88L+0GkPQcIoDJ9yF4DbPAcjvmsVK5R
         AqmXmOmz0U0MBA+0zYPeJLKItRi9eSr2/ZcOafxoCFQCmzybpWZTIp/GZZO77HpWCMKp
         BTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G4HWiVVIaGvZglY/km/xMDgnhv/GSlBq2yhZJ7gH3Bg=;
        b=n8sP5OgdcnslkN+/ne6jQhODQcUnD3DJc3MHB3BnkecslbEftpUmUMMBqmzdGYZH53
         DH2YY0e2qw2DgawvFB5GRq+qJ2xbMMy0dJWvHdaEJF+gKJlS91W06eJvodm5BKiGW6Na
         oIuK4+qxGn/BLL7EFk+43XqDMmVyrx1D5j6pIluIx6YIRD/kITJ59R4gTfb2SSWBUAuB
         G4Abu9yMu+kdR3xCTx0oEdN28S8rHFR4MmLkxaeCt5i7Sqm9YUB28vzl+W2uHEAh6qIP
         2yacO4F+9JJgjOUEpEM6AioMVkLGJJLVDHqoT67L1GWg3YrRTO1ZmZzmr87qYDF5R4eU
         i9Kg==
X-Gm-Message-State: AOAM531GeaDye9joezg6PDyzQbk1BVRzFC93D78jm8tYDVcxw3X+uIMh
	Ot7xfimUd9ACdt+RfO6yY4A=
X-Google-Smtp-Source: ABdhPJyyZJbelQ7nLLkUu6TK65jzRkyYwPUhhyTz28XnoFhZj99VVkgsMgCIK6d3x+gRCk/seOu/IA==
X-Received: by 2002:a05:6638:e8c:: with SMTP id p12mr24303443jas.112.1608764155045;
        Wed, 23 Dec 2020 14:55:55 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id j15sm1904403ile.1.2020.12.23.14.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 14:55:54 -0800 (PST)
Date: Wed, 23 Dec 2020 17:55:51 -0500
From: "Trevor Woerner" <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [master-next][PATCH 2/3] psplash: work on first boot (sysvinit)
Message-ID: <20201223225551.GB1691@localhost>
References: <20201223170621.35727-1-twoerner@gmail.com>
 <20201223170621.35727-2-twoerner@gmail.com>
 <743d9e91ea6fb99193e315f8b20778e418109da7.camel@linuxfoundation.org>
 <20201223215005.GA9542@localhost>
 <20201223224129.GA1691@localhost>
 <595b6989f099f65292ba79446e2dc527b4587aac.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <595b6989f099f65292ba79446e2dc527b4587aac.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed 2020-12-23 @ 10:43:03 PM, Richard Purdie wrote:
> You're misunderstanding my question. In your patch you create
> "/.psplash" in the splash recipe.
> 
> Is there a reason the psplash recipe can't create "/mnt/.psplash", i.e.
> match the original path ?

Understood. I just wanted to update the email thread with the actual error
messages (instead of going from memory) for posterity.
