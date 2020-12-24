Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.8305.1608797674063648840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Dec 2020 00:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DOuzmoSp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id q75so1002861wme.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Dec 2020 00:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=pwvZqcyOcLB0p+KVafIs8ufgyLUwcqvyQhw7Eo1/K/I=;
        b=DOuzmoSpqVJRfuold3NhzOJugCElxg9h5cvEiJfOUoktLOHIlGYHgSftAS8TiE/nmz
         QITzxjqpiZpuvMV7Emh7+WO+w6DOZ9yja/P6KRQQb0xclgHUaK8UuLWlJgAynilPBVxz
         boqFQpiuXqzDu22oIT2MZzRuXy760zmYDAMHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pwvZqcyOcLB0p+KVafIs8ufgyLUwcqvyQhw7Eo1/K/I=;
        b=nlU62tDV+q7jXQDnwNpKbAj0pXeAlM65hZaSOl/X5jmo2w3VmAVtlaZoMORe+mvo1/
         SZUzPq5Yimj1djRPYwoeode53o/cllZfuODGpt6aXXWKFTrr6UoVshdUgmGphAC/2Vct
         9uKiXh/y8H4bQoZJNQiPfYcS6bsBIJ9ciSuAYIuPSpm9jtN5+Uw5arDQrTUbUizazWzP
         nk5CTrlQNHdYYXtPn4/HAQYBxswxqOMFu3QyUXtVnjtXJ+KxtG6gsEEunVmllzrCouQB
         WABO1OCxVxaJKGA79DutV7bMrbkOokQUPRaIuxk8n3lbhOGvCReF+vUbHr+GVgKv8isj
         GNTg==
X-Gm-Message-State: AOAM531kCMrDC71hg6ftdZzAvyrDQoLEe/sIl9kq47Iczx7W09azk8ke
	JtfuiwWQIm5psb6OJbIQH+BVJw==
X-Google-Smtp-Source: ABdhPJyZw5It8FP2PZRaLMfJbdtJehz4RUBU6+KSqeSI258PU3rauuJwWKj9j6GsF/3IxvR8oeUDOA==
X-Received: by 2002:a1c:3d86:: with SMTP id k128mr3176938wma.66.1608797672527;
        Thu, 24 Dec 2020 00:14:32 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.7.9.f.e.b.4.7.3.0.6.1.b.d.b.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.7.9.f.e.b.4.7.3.0.6.1.b.d.b.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8bdb:1603:74be:f976])
        by smtp.gmail.com with ESMTPSA id c4sm41242700wrw.72.2020.12.24.00.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Dec 2020 00:14:31 -0800 (PST)
Message-ID: <bfa1921a87dd29998642a58d3387bb45f1d369db.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/9] kernel: consolidated pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, Jon Mason <Jon.Mason@arm.com>, 
 "Mittal, Anuj" <anuj.mittal@intel.com>, Patches and discussions about the
 oe-core layer <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Dec 2020 08:14:29 +0000
In-Reply-To: <CADkTA4MRNQ2ucJ8Ckr3y2CRgx7J2KacEbuU8uV+=MpPv-0f+Aw@mail.gmail.com>
References: <cover.1608646697.git.bruce.ashfield@gmail.com>
	 <ef75b7d902ee23f65adf34742a71b1b8ee8c64cb.camel@linuxfoundation.org>
	 <CADkTA4NJEXWs3DeXKaM_215Ue5g=ZoCrR6O-7CyvSytRv3z5jg@mail.gmail.com>
	 <AM4PR0802MB2162043FB6BB14A6F02A69E9E8DE0@AM4PR0802MB2162.eurprd08.prod.outlook.com>
	 <16538A0D49119031.25471@lists.openembedded.org>
	 <CADkTA4MRNQ2ucJ8Ckr3y2CRgx7J2KacEbuU8uV+=MpPv-0f+Aw@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2020-12-23 at 22:43 -0500, Bruce Ashfield wrote:
> On Wed, Dec 23, 2020 at 10:41 PM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > 
> > On Wed, Dec 23, 2020 at 6:03 PM Ross Burton <Ross.Burton@arm.com>
> > wrote:
> > > 
> > > > I'll tweak the v5.4 meta data and send it as a separate patch.
> > > 
> > > Will that tweak the metadata sufficiently to fix the problem? 
> > > That was the Juno machine failing, and that just uses defconfig.
> > > 
> > 
> > Should be.
> > 
> > It's explicitly setting the option, which comes after the default
> > mode. The final .config is compared to the last option, so it will
> > match.
> 
> And I should add, if it isn't, the fix is on me. So I started to
> clone
> the appropriate layers and will do a local build to check.

Bruce's update fixed it, so we're good, thanks!

Cheers,

Richard

