Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.2587.1604097886190317581
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 15:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=buck1LgY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id 13so4223672wmf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 15:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=k3hSv/MWtLpKpokPlmwji5XTkoAgruv2oC8YSr9UnWU=;
        b=buck1LgYxb16UfNBPEnwqdevlBdJUvac3zzMx0yi0uUT5zX2J1FPjHW6Qtnntnz3j8
         O2OBcwXLzycZtcMDE2aIdiGlkQuI/p8WCD8saZhwGIRLT4SCob2DUhp9eEu9E+nmY1GV
         w3hGzte07v5OK5S4i0sDFSpRzDzx41WwtwBps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=k3hSv/MWtLpKpokPlmwji5XTkoAgruv2oC8YSr9UnWU=;
        b=P9zFisV7jRh5k5q4X+lNh/t0U/MfpkvDxHxSXd7YGl2t5vGXjpvGLq1qWoNUXXl1Wk
         RTCCZ5HHCe/MoffV6VHcmf04d/JaYYGGgIMlxaqLJBXpaqpDtLBU+z0/9TsqQ+F0JIKm
         hseAAkx7bydcWnxCLDdcS4oQwJF6w570jywZoC2clC679udsXldPaUAFxMI7qtDqCzRg
         Eeh0Rt7OqDJiNhW+KHOkdHJvJGi4u0uXVQxhNdbeL3olT6XB6PKrD3oWIAk0Z6IP1Zvb
         rxJrVsCjiuLoGVKs7FdUsL8tM+Iq0EfhdbrTiPKcMbGexi3kM26k5gUwDYARkyLfLYOb
         unxQ==
X-Gm-Message-State: AOAM5332dFZzVp78I4W+81LaGqDCYUCkQqC0SLClku316h9sLSThWpKh
	9tyH4GYgOV2wo9KZsua8VMVA7w==
X-Google-Smtp-Source: ABdhPJwXkFW30NMeOHry7wvjUk0M0DEmeZQMxGBxeKBcwp3qdRO8rhrZQpgM/Pv4pawTN4+TpTbr0g==
X-Received: by 2002:a1c:6302:: with SMTP id x2mr5424820wmb.121.1604097884543;
        Fri, 30 Oct 2020 15:44:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id o7sm12344220wrp.23.2020.10.30.15.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 15:44:44 -0700 (PDT)
Message-ID: <395078c7524717b4fee84f188889ad7644edf7e2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gdb: Update to 10.x release
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 30 Oct 2020 22:44:43 +0000
In-Reply-To: <20201030201433.1776776-1-raj.khem@gmail.com>
References: <20201030201433.1776776-1-raj.khem@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-10-30 at 13:14 -0700, Khem Raj wrote:
> here is announcement [1]
> [1] https://www.gnu.org/software/gdb/download/ANNOUNCEMENT
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Failed on genericx86:

https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/1538

Cheers,

Richard

