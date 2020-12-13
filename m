Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.26847.1607900969003962800
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 15:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cHNDW84f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id c133so144578wme.4
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Dec 2020 15:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Ghrn9226nQvee5iJWlhYrScqqllT1naMnQGahdBi7EQ=;
        b=cHNDW84f0EVCtY8wQ8NBfkMVvC+XJkhpgq9V3g26Zknmuh1nSHTLP2ISsoUVWMo0sl
         fXT5W+qgBWgOHBupPzWnvpVzmbFdKh9EK38ZYcbx67N+/WyKzxCFT0PJQKrx6tGeEtc2
         r5P9YOh+Yyn/2IoEeW5A1yopMBb1WYySH3Rx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ghrn9226nQvee5iJWlhYrScqqllT1naMnQGahdBi7EQ=;
        b=kEsWTh/3RaTAscvbcF9GMgh0RqiHfSnkMOO24QgxG/3vPPUNTFvEwzNUIEOXcxi9RC
         8hi6hyD+5DdpjhcyzryWD3Rk026DCc1UMKHw5WW924G61o+DIyFOmiJp4UA13tQNBx2B
         lxQUGJ5jTcbTlwJO+xPcSlvk5wu6YBm+Xnn1iNHGZgYwZ0GwlGXK3+EFDE7AXVnDmSH0
         cVUrJeHzFT8a7TkrbVrA9ZD8Plgj1B0gZ7I/a50V+r3pkLQ/n4Q0xNkKmicXZgpBBjVY
         J8tg05y/Kn8pJqtqgAkxOIDZe7Di8hJmVBiwns59/0FETn8gOCtsVCKkNi9B3OqTCMV2
         3JJQ==
X-Gm-Message-State: AOAM533MpBJocucMJ6ABEV2dWcr86QJr8oqjzn5VZrulaU6rZAwAs+PR
	Di8zzKqnWipjfvVDKJXS6en9MA==
X-Google-Smtp-Source: ABdhPJziWDoVptvMudhW2eMerAq3xMU/YFxpseBLZKENY+OMKdFd51goNdXfUnRiyDmD5VmGSg+mGg==
X-Received: by 2002:a7b:ca41:: with SMTP id m1mr20701893wml.76.1607900967380;
        Sun, 13 Dec 2020 15:09:27 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id 138sm31103641wma.41.2020.12.13.15.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Dec 2020 15:09:26 -0800 (PST)
Message-ID: <09e9d4fe00cf8d42f3bb9cef83ae0988452df050.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel: set COMPATIBLE_HOST to *-linux
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Dec 2020 23:09:25 +0000
In-Reply-To: <CAAnfSTvfQZWGXCjduUU_1M4ae=vnmqLO95JBsS-ZeNrHf6KbEw@mail.gmail.com>
References: <20201211160922.4125554-1-ross.burton@arm.com>
	 <51192976-54f1-a6dc-6be0-0780c3006338@gmail.com>
	 <CAAnfSTvfQZWGXCjduUU_1M4ae=vnmqLO95JBsS-ZeNrHf6KbEw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-12-13 at 22:20 +0000, Ross Burton wrote:
> On Fri, 11 Dec 2020 at 16:53, Khem Raj <raj.khem@gmail.com> wrote:
> 
> > > +COMPATIBLE_HOST = ".*-linux"
> > 
> > does this cover linux-gnueabi and such tuples too ?
> 
> Maybe?  Depends on the matching in anchored.  If it does by accident
> then explicitly matching would be better.  What machine has a triple
> like that for testing?

Most arm machines I think? :)

It is unanchored, something which I have to wonder about. I also don't
like the overhead adding COMPATIBLE_* adds but I guess we just have to
live with that :(.

Cheers,

Richard

