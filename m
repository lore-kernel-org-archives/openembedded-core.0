Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.17287.1631462075346757900
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 08:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E4g8UQAu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id m25-20020a7bcb99000000b002e751bcb5dbso4853595wmi.5
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=iaQph0mlcNICZS94zBygrm3XEo0u/dx/Wu0+9K4k66c=;
        b=E4g8UQAuLEUEWsKTP1vvJ9xgiWeMAU0tr0LCVjraFD/Zqcm1TMedzsQO9OZHJCoWvf
         NlZUlqzKM3vCUqgPmMS+1+fnarjbKyZxEKOT87yel4clJ2SmlCHX7vtTlqD9ZXTF+qK0
         DPNudZL7pZ1mQGiclOio8U4v+JDr1RArAQ2w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iaQph0mlcNICZS94zBygrm3XEo0u/dx/Wu0+9K4k66c=;
        b=xn/Zhl47gXAmrEEe/as0lt9rusKHrCr424dmXRrNuW6SINB/0f5sDXO2zefXaNtP+F
         242rX+qeN2RBn4cMXjQDzzH4LmY2IWE6fNl7ZfCcmj0rc8+jH9qgx0KrurIFO2h3kCl8
         BOoFoLtzvdSo3JGiwmhx9jqGC572GZagsSM3ee8r/a1IbeQf5Lvk1jNN5suQ5l0xqy9d
         76gan0oh1pcrarvsoLO62MoRIfv4Zx0XDiIHaC+VdCnUFjBDEuTZocz/vUza1MJQmo9o
         Lx8rrzGIKAMpFIbIaKvxXQCvAuBFUlAF52x1vBThL64pMvTAhy/jbdfDqwXvmTLI78q5
         JXqg==
X-Gm-Message-State: AOAM532vrTupNg7QETb3RifrriU31HhK+IxckWC2+MsQ2Wu8bQuel1eC
	T3nOV41b73HyaEDXW5rzu/mxMg==
X-Google-Smtp-Source: ABdhPJx05gEZyFt7vsdSWrhe/uS0LWsY6y+5wq1BFJXqkTvqRt0seBDDrhdS/mo203hNax7FHuSTdA==
X-Received: by 2002:a1c:f613:: with SMTP id w19mr7107128wmc.9.1631462073618;
        Sun, 12 Sep 2021 08:54:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:65df:1d9c:d97e:b357? ([2001:8b0:aba:5f3c:65df:1d9c:d97e:b357])
        by smtp.gmail.com with ESMTPSA id y4sm4453736wmi.22.2021.09.12.08.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 08:54:33 -0700 (PDT)
Message-ID: <7af69960b5cc22aa021b1814c883a3ac8ff8c592.camel@linuxfoundation.org>
Subject: Re: [OE-core] can one identify how much work sstate cache would save a build?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Sep 2021 16:54:31 +0100
In-Reply-To: <9c5322ee-8fcb-180-133d-d96610f31440@crashcourse.ca>
References: <9c5322ee-8fcb-180-133d-d96610f31440@crashcourse.ca>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-09-12 at 10:00 -0400, Robert P. J. Day wrote:
>   off the wall question from a friend, but is there a way to get a
> general idea of how much work (how many tasks?) could be saved for a
> build based on some available sstate cache directory?

Run a build with bitbake -n against it and there is a summary printed near the
start of the build which says something like:

Sstate summary: Wanted 1525 Local 0 Network 1515 Missed 10 Current 0 (99% match, 0% complete)

Cheers,

Richard



