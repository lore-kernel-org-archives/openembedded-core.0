Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.9612.1608631424298653832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 02:03:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TRxoDRN4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id t16so13946412wra.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 02:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=RNkjCCOZdkmTRpZoiwEChTPuGX7ODbl3t6Rkj+qruNw=;
        b=TRxoDRN4keBdXzScHFUou4ZbFqxKi7dpK6zuyN2gFs+iWlTXYFg3f3Sv6PEFLvWk4x
         YN/s5DCg2wiQwxXQMrd/yvb+48tJgopm3Rewo9LKdzfquMf38E/YMvf1lAuIV10kyWtk
         DFoP+KVux2dtMfUOAQrWUTNKdlkEf/lYx1hts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RNkjCCOZdkmTRpZoiwEChTPuGX7ODbl3t6Rkj+qruNw=;
        b=jS8cjV5U8vVW1hIPVQOle95mlRn3b6j9sCJDl7fvDX+1430G4zOdvbw9Zr5aJHq98p
         1lHjUKXy3aFaxZZf2Jj8pZTI351zAGRFsoJ/eHQ04d6aVpL0gG8YY25bHmlT6rhkW5R1
         8xRavSBuJJmHo6OFw9+7IHjrNGJrSJXC2Tg0CLHBQC0MljKSg3qy+6jpFj5gzX7i1QNc
         DDM4ZHMZyMBrJ5pIpad01uf/RLYYtqBc2WvKx8qI9wzSbhfFi3COo36o0pMoKx9XLFRz
         g6WZMU/vpj01uo8VvNwuqDdksRUlmFdXjZzMkOF8blhxL2EW59ZIFLvVw7RJGX/j2LbT
         o5nA==
X-Gm-Message-State: AOAM53315JABYzIeV+M4tTufpYFwGi5CpJKtuzQCCvZzdGA7s2J+zL+B
	7FnzSU2PtixlOXHhHu7ghia5dA==
X-Google-Smtp-Source: ABdhPJyr2d2WxbRRnOn4TIfpRA6ri38OqaZnrjd57Ac51J6qKXA5PVkftM9PoZxSAsM3eGEPwCBZVA==
X-Received: by 2002:adf:ec41:: with SMTP id w1mr23254118wrn.12.1608631422547;
        Tue, 22 Dec 2020 02:03:42 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.b.4.9.2.e.e.0.9.c.7.7.e.d.7.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.b.4.9.2.e.e.0.9.c.7.7.e.d.7.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:67de:77c9:ee2:94bb])
        by smtp.gmail.com with ESMTPSA id h14sm30554189wrx.37.2020.12.22.02.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 02:03:41 -0800 (PST)
Message-ID: <45cc5593b9b9bfbdfde689a5f72a678a99eb5d2b.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 00/28] Patch review - pseudo file mode corruption fix series
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Erik Boto <erik.boto@gmail.com>, Steve Sakoman <steve@sakoman.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Dec 2020 10:03:41 +0000
In-Reply-To: <CALNvYWMznudnN+_6yCkxcwxhtv=8M=hRC1nNpQP6Ww7ZTedvPg@mail.gmail.com>
References: <cover.1607007208.git.steve@sakoman.com>
	 <CA+chaQeEFu6++N5J2qkEjU9HZPqjAahuDVGZAcfsma-9zjDLZw@mail.gmail.com>
	 <CAOSpxdaJXGM5HMR0yvobzN2sa2cy-+AxLqsa99tD4pn6fiN7+g@mail.gmail.com>
	 <CALNvYWMznudnN+_6yCkxcwxhtv=8M=hRC1nNpQP6Ww7ZTedvPg@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-12-22 at 10:08 +0100, Erik Boto wrote:
> There's a bug affecting wic in combination with --exclude-path /
> --include-path that would then be backported into the LTS version.
> See
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14129.
> 
> Maybe the issue that is being fixed is more serious then the issue
> being introduced so it's a valid trade-off, I just wanted to mention
> it so it's known.

I've been suggesting Steve hold off this until we sorted out master,
having a patch queue ready is helpful though so we don't lose track of
all the patches.

There were some fixes from Peter/Paul around pseudo which we needed and
have now merged which leaves the above issue...

Cheers,

Richard



