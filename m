Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.33684.1585216961007255821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 03:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E3HoYRzd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id p10so6945159wrt.6
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 03:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=0zgPI2vcydqYGEPiXimiGrE4lyYBMtItePJXdVeATsk=;
        b=E3HoYRzdVxgIuAcxbXswHXtN09rT8VCqvC8qsbw0Wz7fSukNBgowo1y666r6dh3dkb
         fWSXue3TKNBHciMlu6XmLUS70HbQeoUcgE6yph8XTSUKr6WkXVblkOSiS5YQNpF0JQAK
         mLTiqTT2ph+yVel6aJ2ciRNXfOHFNxA9n/m28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0zgPI2vcydqYGEPiXimiGrE4lyYBMtItePJXdVeATsk=;
        b=DP5JxykuGv6cLQOZ9y7RvFNBa+ZZC6IymGgpuhqTldTmrUWq7izARZX+lIDMYw2APn
         oyo/n7r2+CVwjl0ZAvLJPJwuPwPwcH7BYONRQHfsxUL5Yj4e7V6EhzBWdMsh5LB5uz2H
         JVsHyX6RGJQ8qvBKzecjwdgenskPYdYuSO/azLp+ZbqfF24Avx7YZUtd9VgD1U4XkKAr
         O3PocNN7I88jzYxkPBgGmbA1jGSYze6+zrEw1us4JwWcL+rTtdvVXYUpesOk9FF6Dvga
         VpBBr+Gz/6g5yb6/Atm2Inb+MGta1SknRSxMN+8f8H3Q/PhKMVPMy4Jh3tHIgR6gigBM
         PIhA==
X-Gm-Message-State: ANhLgQ3Be/o/22hAQR8w0M+UElH7UTWphEJFUNA5IzYyTHvSMPXEkUrb
	kONkJYdcmGIe2CBAFdRYNlkE5A==
X-Google-Smtp-Source: ADFU+vsJHVjXTP/8QU2DGZ7pB3f7b6on+bcS6vnl/8dD+aIEt400LdI1leEB7yFlpwOfO8yTwQMyag==
X-Received: by 2002:adf:f58f:: with SMTP id f15mr8848630wro.16.1585216959466;
        Thu, 26 Mar 2020 03:02:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l12sm2822509wrt.73.2020.03.26.03.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 03:02:38 -0700 (PDT)
Message-ID: <3ac793ad1e480d3af9c599bdce6e21a02a33162d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] libnotify: upgrade 0.7.8 -> 0.7.9 / port to meson
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andreas M?ller <schnitzeltony@gmail.com>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Mar 2020 10:02:37 +0000
In-Reply-To: <CALbNGRQ-4wLXC-fttpLc6ixJYxWb0HHGgsDQr+x8RhvxLGOgpw@mail.gmail.com>
References: <20200319011206.14726-1-schnitzeltony@gmail.com>
	 <CALbNGRQ-4wLXC-fttpLc6ixJYxWb0HHGgsDQr+x8RhvxLGOgpw@mail.gmail.com>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-03-26 at 09:13 +0100, Andreas M?ller wrote:
> On Thu, Mar 19, 2020 at 2:12 AM Andreas Müller <
> schnitzeltony@gmail.com> wrote:
> > From [1]:
> > New in 0.7.9
> > ============
> > * Fixed linking in darwin [Iain, Marco; !5]
> > * Added man page for notify-send [Jan; !6]
> > * Dropped autotools [Jan; !11]
> > 
> > [1] 
> > http://ftp.gnome.org/pub/gnome/sources/libnotify/0.7/libnotify-0.7.9.news
> > 
> > Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> > 
> > 
> Ping?

We're at feature freeze and stabilisation for 3.1. I've already taken a
number of things I probably shouldn't at this stage but changing
software over to meson poses far too much risk at this point in the
release so this cannot go in, sorry.

Cheers,

Richard

