Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.29847.1604315800095396214
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 03:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dQDj6XO2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id c18so8996374wme.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 03:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=okjtHQ916Gy7OH71FcLRZZCX2MXJcQJFSpxxEgGnC/w=;
        b=dQDj6XO2rowuX7MYfyB2LPs8SxFeMXA1rT/N9CQm6dEZeG08+I4mFp2inwXg3iHDHl
         Dat6Ief5eV6tRuOa0J++ywfLopCYaRJha6ZdsxZScOOZ6U88QtsKAAYm2zfBQBRyaWZe
         k11oTQCDzLI5yClIiAIKvq/l9Po7VLRWvWxbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=okjtHQ916Gy7OH71FcLRZZCX2MXJcQJFSpxxEgGnC/w=;
        b=YniqrggaUTmN2RJcrXhUGEksMhRFTuWeh/pxYsVAOGURkhJy9YruAHyDSYbtnshWaS
         +/nob5LkahrtifhF/5RPN/NQXaDLl1b0WHtIw4vimbFIB6KeG+dEjXmp7lsKMdBTfP9b
         v7AVBdnd6c8ZF3vSkK+5dRDl+kijswBlvqHEjZNQh5T7sLZx2C0WoXMBGU0zBcQpLTX1
         9APHd8UxDkEA7iN49XwbeFogui8hJghFWa9aKOohwKxtnvhzfgEAySiEU/z9zjTFpK8T
         cR1i8GVjdEndkrisuNHzclZ3k0TqAFxc3vmT0gQpNohVvw5bQkw/W+vy9iiyNKRDVNTV
         8gEQ==
X-Gm-Message-State: AOAM531qbdp/pUyfaoSjBlx3KEb3v5t6g4PKNY6vmwGOmQFhSQicgqsF
	KUvIfHSvbo4yYQuKR1E280hmyQ==
X-Google-Smtp-Source: ABdhPJw8epkj9kKxpDjS4YlIMj4HwPS9C6WHPzBg2jAjVRd61ACzPEXf+Vree1t9DZymZj8/ggQQIw==
X-Received: by 2002:a1c:f312:: with SMTP id q18mr17253662wmq.30.1604315798605;
        Mon, 02 Nov 2020 03:16:38 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id l11sm20141851wro.89.2020.11.02.03.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 03:16:38 -0800 (PST)
Message-ID: <b72d77dbd65970a8aa40798545eed309957b121f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [gastesgarth][PATCH 01/12] gstreamer1.0: Fix reproducibility issue around libcap
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, Martin Jansa
	 <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 02 Nov 2020 11:16:37 +0000
In-Reply-To: <CANPvuRmmZoqHZP7pbNqHtPBqBo0VqTrftmBhh+nK7iTE_gF=wA@mail.gmail.com>
References: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
	 <CANPvuRmmZoqHZP7pbNqHtPBqBo0VqTrftmBhh+nK7iTE_gF=wA@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-02 at 09:57 +0000, Jose Quaresma wrote:
> I think I already know the answer but Is there any possibility to use
> gstreamer 1.18 on gastesgarth ?

Not really, we can't do version upgrades on releases in their
maintenance cycle unless there is a really pressing reasons to take
those risks. gatesgarth whilst not released yet, is imminently due to
release (I hope!).

Cheers,

Richard

