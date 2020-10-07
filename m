Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.10074.1602066598306505188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 03:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LQUlj5NE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id d4so1729452wmd.5
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 03:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=H67s0BnR6SYF72ff+1y/pJel6xsl+vPHLkQd+iMP2Pg=;
        b=LQUlj5NEQs5uVFj220FFOz49VS8IJEnT2sYp2RVyVXj8GpqMKMj1k0VxF4S22z79kE
         w/kwYKLD1S+M4ntvHpQUCWpvi6jwg9V8qm89n0BASuAgtQYx/0+Yy0ff/S8L/PmD5LmE
         FMUxdqQRGt5uSxSfjdr7KEtFQHqVWnYx0Zxus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=H67s0BnR6SYF72ff+1y/pJel6xsl+vPHLkQd+iMP2Pg=;
        b=hbfKB6lyJyNivaFRBWQ43ZWuQhNnvIUsPs6rjHBGGAToCaHPbokQpYQznUzjKJfeNH
         ByoguPWAFj0eEpYrEvQs/rpb2wKgcNFMOKt6mVz3keOJAIRFM1EAt3+tSnrG66AE+q5N
         VY7cXKFt6EdTN+aqaXBwppopDnVIwan7WqyYz6nPoZjzRDAiMS4pWmk1STdFncHvVBQh
         agS1TcAAQGCyX0UF7NSyJjiIcWMH/mKIfM/WTvterZT7Ho0vQhHdzDOAwBo20nB7sfqE
         9E1cJfSulYnobMvRb5SHvUHYJrc1pRYrk5vtEptrvskbG0+gp7duHmQKMySz2tPL+osT
         uCgA==
X-Gm-Message-State: AOAM530akpRt8zYfdGO4cU6qeuzwNgCs+sUCRoOA739VE9psD5KEDMZA
	GLRi9RCUOqjMhn/nP7JmWaIUPw==
X-Google-Smtp-Source: ABdhPJxwqg6/ojmte4eZPumqnjSHbZxxNHARMYjJueTlQZjIw0u3KJysl7c3D+qdd1bT8yPm1DKNIA==
X-Received: by 2002:a1c:f715:: with SMTP id v21mr2710927wmh.117.1602066596607;
        Wed, 07 Oct 2020 03:29:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id w11sm1589123wrn.27.2020.10.07.03.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 03:29:56 -0700 (PDT)
Message-ID: <ae93fdcf366f38395f74b0eb6d22f471a57fb0be.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] staging: Ensure cleaned dependencies are added
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 07 Oct 2020 11:29:53 +0100
In-Reply-To: <SN1PR12MB2480A99FEE6B179D1A5A76E58B0D0@SN1PR12MB2480.namprd12.prod.outlook.com>
References: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
	 <SN1PR12MB2480083B16B34A4A0C9119978B0D0@SN1PR12MB2480.namprd12.prod.outlook.com>
	 <1ef1432ac36ca2224dea67e2824c5b8f04cc1066.camel@linuxfoundation.org>
	 <SN1PR12MB2480A99FEE6B179D1A5A76E58B0D0@SN1PR12MB2480.namprd12.prod.outlook.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-10-06 at 16:59 +0000, chris.laplante@agilent.com wrote:
> > > Is this patch something that should be backported to zeus and
> > > friends?
> > 
> > Its fixing a very rare problem that I only ran into whilst doing
> > "interesting"
> > things most people don't probably do.
> > 
> > If people were running into those issues I'd backport but for
> > master it was
> > more a correctness fix which did fix some weird corner cases I
> > debugged...
> 
> A colleague today did see something that sounded to me like it may be
> fixed by this patch. It was a native tool that should have been
> available during a do_configure that wasn't. We didn't take the time
> to dig into it though - it was resolved with a -c cleansstate of the
> -native recipe and the target recipe. 

I kind of wish people would dig into these things as its the only real
way we'll get them fixed. If it was this issue, removing the
prepare_recipe_sysroot stamp should have sorted the problem.

The issue is there in zeus so I guess we could need this fix there.
Question is whether its worth any other inadvertent breakage.

Cheers,

Richard

