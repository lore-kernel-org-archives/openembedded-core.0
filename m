Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.24496.1618179168397476190
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Apr 2021 15:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ELNXj1mP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id s7so10824824wru.6
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Apr 2021 15:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=JdL8BvcPteZJurX/KnZbN8pSXs78sMir+1JBjPiWQug=;
        b=ELNXj1mP0KOPUVGeQM5Hmpt6Nch71tV/m+oWWeSiJ4NwtrEnZP1p5K6R3474JmLlw5
         QhG0CTni4XfWwa/IAQwDePiNKKWtg5Z7ViDAUjPQwxXYhYGLlLDWnSwENOdRvxdZcC5s
         +9HtHKyfX9fNdcrVCn4t6ibsSHd8ZZqHGAyRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JdL8BvcPteZJurX/KnZbN8pSXs78sMir+1JBjPiWQug=;
        b=G8TY5gLINZaA44Y9px4jEBQ3hcqf7mbaHfTlSk4BRtdSw9k68Vbgbbk9TTyzeiFh5T
         dFASljkd+9A+AtcQKQb1JMdtPHjaUcGL7aGQbPgqrESF0XHb85sJe5+EKI+g9rcVWV2k
         fSpbN9kh8j+jP4yDB790vT/dOVeLdVGijgDpGV54o0mQ94EvI3GOuGgBuw4efuJ8FbIs
         TpiRVM31qPv/jTjRzPl2R0jSwqP8CXN6uyQNxXX6d/p5EKvwHgahXigH26AtlgvzmWdq
         NxaSsTmQjmctFlRTZrKuElRhu5EMDy4WVyQmVBYnBgIlCXYjXRdvXb0E6qGEQ6LPB1gQ
         6BeQ==
X-Gm-Message-State: AOAM532TBwIoD9cNPyNBS/hODi6CDMmnBWvJbPmRLTqPxfwOBLHVvSgn
	Yd34zaZL5lXku5c40fTlXvVaoQ==
X-Google-Smtp-Source: ABdhPJxIguwcQeCu1wD/BpMAjLiriZyKesxiBwZua05Cn7RwAUWJPJTl6NKsT0EdnFWIKxSjLENTxg==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr28995095wrj.145.1618179166758;
        Sun, 11 Apr 2021 15:12:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4639:d550:9529:c277? ([2001:8b0:aba:5f3c:4639:d550:9529:c277])
        by smtp.gmail.com with ESMTPSA id z8sm14429460wrh.37.2021.04.11.15.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 15:12:46 -0700 (PDT)
Message-ID: <dd4c72b2aaf48cb7f015030e232bc2641e38f2ef.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] gcc: Upgrade to 10.3.0 bug-fix release
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sun, 11 Apr 2021 23:12:45 +0100
In-Reply-To: <20210411202746.388822-1-raj.khem@gmail.com>
References: <20210411202746.388822-1-raj.khem@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-04-11 at 13:27 -0700, Khem Raj wrote:
> Drop aarch64 backports which are already upstream
> List of bugs fixed is [1]
> 
> [1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=298084&resolution=FIXED&target_milestone=10.3
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Fix BINV
> v3: Fix maintainer entry to use PV
>     Fix include poison patch which was old version

Not sure we can put PV into a maintainer's entry like that as it is in the global 
namespace, it isn't gcc specific.

I also couldn't get this patch to apply, is it on a branch somewhere?

Cheers,

Richard

