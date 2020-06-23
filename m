Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.7878.1592921908547678657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 07:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VA4Yc7Gz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id s10so759991wrw.12
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 07:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=q0OxZtWvdhgioFlzvga6OxzSBW7MddhWzAJ3onW65RY=;
        b=VA4Yc7GzljTlXkO7Y5qDRHWnr9olAWVp/9muwKoGJXES/sFYMdA/JHTqG+QVPMBiAo
         av6E+AmQ5uvL7dgyEsiHluc3ND6caQ/2YIv63Sh9KsRqlvABrKGZ83ccy3/2iIBQWjvq
         od8PQycJ2hPmJksiexCz26UOrB15MsxjYAlPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=q0OxZtWvdhgioFlzvga6OxzSBW7MddhWzAJ3onW65RY=;
        b=QEU8Nw1cJrncbmUbeXf8Ot81Hhu+061CZ74BCjoZYzBcOw2oW3SHk+rf40KqMDzJZz
         Qrdx6Rd2dZMzxHXGdowa04YVlDCvbHBKx3D4JeGhbOh6suk8y23D468BUG5SAx8BcDBl
         m6fc9HKL1QImav05iqE9fRoxbeOE0E617Adbkw075aBbdXbNVoomF+XmvNZkHMo5OKpg
         W7zUzvrew1GtOMMpZR9es6zs9c6D0ROlbgUjLbDG2g2BiyOXcJ+0xkEZNSHZASrWvJx0
         omI1iuz4/tPkr0oG4uehhf+o95w9IZEuG9EIGwBjtdLSztK/edAW+iiATdp9XYYhWoZ3
         qvxg==
X-Gm-Message-State: AOAM532mEtiWzFxZTBzosQpZnpxqpWIDXYkGQevWidnLpeFYa1XRAgvJ
	nTpdj2+IOWSPKBbpONddOLKw2Q==
X-Google-Smtp-Source: ABdhPJwPwO/RC5BkD2g7QKodiBU7y9j2gnVo2TXbVwBXjkwSrxa3hlqSFsRmZaewIxraZ3Ouk4vB1w==
X-Received: by 2002:adf:aad8:: with SMTP id i24mr24713879wrc.102.1592921906848;
        Tue, 23 Jun 2020 07:18:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d24sm3683320wmb.45.2020.06.23.07.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 07:18:26 -0700 (PDT)
Message-ID: <a1b56d0357a0bb9c6b216ba041a86857b250a5ca.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 0/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, "Xu, Yanfei"
	 <yanfei.xu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jun 2020 15:18:24 +0100
In-Reply-To: <CADkTA4NPL0jU-edpy2r-H0=1v=ugvKr7NQ3ELyKO11i1rDG2vg@mail.gmail.com>
References: <1619EF7B69C83A3C.10370@lists.openembedded.org>
	 <9de30c55-f97d-59f7-11a3-0366349102b6@windriver.com>
	 <CADkTA4NPL0jU-edpy2r-H0=1v=ugvKr7NQ3ELyKO11i1rDG2vg@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-23 at 08:18 -0400, Bruce Ashfield wrote:
> On Tue, Jun 23, 2020 at 4:26 AM Xu, Yanfei <yanfei.xu@windriver.com>
> wrote:
> > ping Bruce
> 
> heh. I was waiting to see what Richard thought, since he noticed
> something in v2 that I missed :D
> 
> I'll have a look at this later today.

FWIW it looks more how I expected the patch to look so I'm probably
fine with it.

Cheers,

Richard

