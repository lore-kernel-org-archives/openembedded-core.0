Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.98.1608139497855049129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 09:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q0lHT48L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id m5so23933214wrx.9
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Dec 2020 09:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=s2BUc2QLhqEokdXwUHhMgpoeNa3+DeuH3eVDHNApDdw=;
        b=Q0lHT48LlCzwSfIoRvfJPbQwNfdl/LMniWcs0km30vWVomrgnSC4rBoAe7dyWWtpw1
         RWbyxACPKeFFE8JJg15fIMQOyj17/L4A0nuCc9D93Dxg5KCakyh/Ljo072z0fITH/b3C
         OZJnW+MigZDT78L7RN8Mjjua3SfO58dyQvD2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=s2BUc2QLhqEokdXwUHhMgpoeNa3+DeuH3eVDHNApDdw=;
        b=PpjxZ8ccM3PB50YBNmPZVovcxt3ka1wydfghuZMzPEGeaA57PJ7g7RPd7mLV5YnS+C
         9vlTSUgl44EORcLEG0rzXiuYirH1YUC1wG/3KEMdE/nlynH0C4/Q8QljXZrbRy8vLq+T
         Hhr8QWUHuZR6qPyHCfk4JeUwLtttD6nifFCJehzDzQyLXmuk7nXaYVIU4KdHJAIuMb25
         4VLb7AFao9O+DzQaf9lrxGe3TXC1B+lN2QDi990Y14wByXtw7kxaKXk2VDjF4AKTeW1c
         /f1bePjMQB6ZJLg1BwA2hS0o2KqCs3XuNHmvZRLu5gzYtJ99Tn06ilS5ChI+dIpzMN31
         ikqg==
X-Gm-Message-State: AOAM5330wRQSiMo9KbhI4vgSsZXx4W+z1MmzVplnf9kqdvKudOdg3/qa
	/WgIf8jwEaf9zNXQ4d5XSb4c+Q==
X-Google-Smtp-Source: ABdhPJxH/IHEByPZvHQFojBdIijTdT08FyaKGD33KM/knjRws0AXjcZb/R0cu05JmzJc4Z0prsUczw==
X-Received: by 2002:a5d:6cad:: with SMTP id a13mr38640236wra.275.1608139496326;
        Wed, 16 Dec 2020 09:24:56 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id j10sm4097883wmj.7.2020.12.16.09.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 09:24:55 -0800 (PST)
Message-ID: <2857cf4f91605b6862b75096610e1f77779695e6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH v3] iproute2: split ip to individual package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sinan Kaya <okaya@kernel.org>, openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2020 17:24:55 +0000
In-Reply-To: <284464d4-6bc6-f70a-4c5e-630cc9fc13b0@kernel.org>
References: <20201216164510.9823-1-okaya@kernel.org>
	 <497c9433b74b13fc96510739deb4b41d2ea2fd5e.camel@linuxfoundation.org>
	 <284464d4-6bc6-f70a-4c5e-630cc9fc13b0@kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-12-16 at 12:09 -0500, Sinan Kaya wrote:
> On 12/16/2020 12:00 PM, Richard Purdie wrote:
> > I accept there is a case for splitting out ip, the patch now splits
> > out
> > every binary though? That isn't what the commit message says...
> 
> I thought of going all the way to split everything since I'm here.
> 
> Is your preference to keep ip or have individual packages for the
> remaining ?

I have a very strong preference for only splitting the things we need
to split.

Cheers,

Richard

