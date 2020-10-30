Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web09.19287.1604085842529945119
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 12:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q6iYD+Pf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id p22so3856798wmg.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 12:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=M2Q5Jz08r5d3Q6kRHHmlYgxurTVCCj7sMR4yXeyL7pQ=;
        b=Q6iYD+PfjvMeFmJUbxJ7H4sG+znQbkVd/Wob0hkxQ0hwiCvZn99qDGrQ+sHGBmd0Xn
         fZO/qwh6xvo6uAWdmwXmSyUcM/ZuYrNEm9qk1DhoLlGWMAD8AIx1+vWD/o+fX+c27aLs
         by8ozmnLQpNdRIWhDVIzmEjAliDiTHcpKgMMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=M2Q5Jz08r5d3Q6kRHHmlYgxurTVCCj7sMR4yXeyL7pQ=;
        b=C/x9LGupK7Xmo0OIKpL3yav2T2OCtCx6ztmWKa8wYhfSa9V/Ap9HIgAASAg9gYd1Ay
         iDY6IbwfSTHg7BDHJ3J68UnEoa7hHFio3PICMrYNbJ+4XZjyO2rGLUfXLG23OU5Gz/eB
         vXVXgDTZKg3FCBFy2tXKBsdvlgiRI3OhD3bTDYrlqt16C8H+n6S0nBeoQtYi8KaUgD7h
         icrgKPw5QwWibWkknmBFVstzEPAzKmotEXtLSpO8FHwXkq0h+Y3Eud7PuWa7n5JCHrg7
         KNSoFttkDXqJlQjNaiZM8DGcOhNzPmxGTJgmeAY/doD1ovBvl+jYzcW9jou+o8Ae1dn9
         XFWQ==
X-Gm-Message-State: AOAM530wwaZ12v9WZ03s+h44xDSEbujh7Mso5IUWY/oqcKVqD8b4quyQ
	62ypR9u/3ffIxsG1B0HqXgCsgQ==
X-Google-Smtp-Source: ABdhPJyPqh9iMBIwwIXgOxLykRXBUIZB5M/d+HewLYEG5QqPSFVFwX2/NjqP6KOGGagnRM2UP3BW2Q==
X-Received: by 2002:a1c:f417:: with SMTP id z23mr4187680wma.57.1604085841009;
        Fri, 30 Oct 2020 12:24:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.f.b.1.1.e.8.3.0.4.2.f.2.4.4.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.f.b.1.1.e.8.3.0.4.2.f.2.4.4.d.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:d442:f240:38e1:1bf4])
        by smtp.gmail.com with ESMTPSA id a199sm6217246wmd.8.2020.10.30.12.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:24:00 -0700 (PDT)
Message-ID: <3b12ced1f6625fe0a9bdeb9e5c0cd5a7ca004d50.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 05/22] gstreamer1.0-plugins-good: upgrade to version 1.18.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Oct 2020 19:23:57 +0000
In-Reply-To: <CANPvuRnjYPZabjLDTW7rttaaH6qUW7sV_ZEyS31bGZHsZHjXsQ@mail.gmail.com>
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
	 <20201029142806.1830504-6-quaresma.jose@gmail.com>
	 <88cd1831e021c2384219da4223981fa004551498.camel@linuxfoundation.org>
	 <1642964F5C513D13.27950@lists.openembedded.org>
	 <1642987B07D196A5.27950@lists.openembedded.org>
	 <CANPvuRkKDPM8h5d8wjzdvQ95vY_kYHXkxvW0Uvqw8rTYj0yWCQ@mail.gmail.com>
	 <f5f3fe375a9174e401c283431de0fca1634539a1.camel@linuxfoundation.org>
	 <1642D6DB2EF0C3ED.10902@lists.openembedded.org>
	 <CANPvuRnjYPZabjLDTW7rttaaH6qUW7sV_ZEyS31bGZHsZHjXsQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-10-30 at 18:23 +0000, Jose Quaresma wrote:
> Hi Richard,
> 
> I see your fix:
> 
> -PACKAGECONFIG[asm] = "-Dasm=enabled,-Dasm=disabled,nasm"
> +PACKAGECONFIG[asm] = "-Dasm=enabled,-Dasm=disabled,nasm nasm-native"
> 
> and only nasm-native is needed,
> because nasm is not needed on target and it's only needed at build
> time.

I was thinking about that after I sent the email. I've tweaked it again
in master-next and squashed it into the series since it was easiest to
do that.

> I can fix it and send v6 series and I have another fix for this
> series that remove 0004-capfix.patc in gstreamer1.0: upgrade to
> version 1.18.0 What do you think?

We can make this one a follow up to the series.

> I hope this is the last version and I will be more careful next time
> I submit a big patch series.

No problem, thanks for doing the work in creating it! The end result
should be good and its nice to stay close to upstream releases. I'm
think we're just about there now.

Cheers,

Richard

