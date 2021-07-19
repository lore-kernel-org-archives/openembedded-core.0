Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.25591.1626688705319706395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 02:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=LF81CAqx;
 spf=pass (domain: burtonini.com, ip: 209.85.221.43, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f43.google.com with SMTP id f9so21246846wrq.11
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jul 2021 02:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dq11sH1FA+mqzqy/sYXGIRLRqIZkmFt5NgZ9S14pQ5M=;
        b=LF81CAqxtpmrIlVOvBve54rFHXPZWEHyS/RU6pM5pKQCRe9c3UUpikgyUufS3zDWUS
         64YDW0PMUMGnEjbPidwV6vjtzD6nvPK1+Nd29mzTIsbpIAN5eODvNSAc6TvQ1yJDIwiD
         F6I3EryMMGO4LnaXx7zM8kvHVLCGzpJVX4tqm5hiQXCjvFpLd1mcJVeQBuZPjTGxScjz
         thfqMdB3oJqS9JPqHihDN/C/lSiliQLvDC/9TCsjRinMr5Jr7JwBB5TOMsqbenApkjzL
         O91fM6Jvtihmk7MZeAaX4gugPqdjZeEpXoiSIjTGH0YxLqv7pxsbj+GrdV/UKrOfUXqU
         8XiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dq11sH1FA+mqzqy/sYXGIRLRqIZkmFt5NgZ9S14pQ5M=;
        b=Q7R9r48v7foM5wdIMqLHFIYdSI/9EOwBEWQuL+7nr4xJ1fVdRb44Ka3v31zBRRXo2D
         VVrIK51pArhcM7G55Wqjk6YimfPnDkvZrmG2R61eZfUfEpjVOfID9Efz20A2pWd8Q6Wm
         hcdHVZymvhflQIyRPvEBugXiOFNgc9z5nFalZdxl/f5mhUF7QKM2jck8zwgn+6S4mK4W
         uK92GGpgzUybCMWTf7DELa+vYmuwNChbXwSru4Y5DNWF5XRf4LNirxiOITv/+sGMy1Iz
         K/SueicHR9XkcR1J0KbV/6iJTK99C5oW6APOclThEYoSMU5wFdNDEwaGs5OcezP43kPA
         jLEw==
X-Gm-Message-State: AOAM5324A8xJNzUlvIHuD2+K10jWGitIzGx3pX3U6eSw7xS89As4fy2L
	R4qNMHUs6PwcmgGrv9pL/ydbIcQXN3T4dRDP6ed78Q==
X-Google-Smtp-Source: ABdhPJwI/x8IV7LeMlk0slaYCQOud6dHsNh3ZQUb+1NCcYehP1EhtURTAE6OQs99RX+yr3B4bVVJ04lsaN9y82jEb+k=
X-Received: by 2002:adf:f54c:: with SMTP id j12mr29381817wrp.109.1626688703616;
 Mon, 19 Jul 2021 02:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210718140327.6CDDF960325@nuc.router0800d9.com>
In-Reply-To: <20210718140327.6CDDF960325@nuc.router0800d9.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 19 Jul 2021 10:58:12 +0100
Message-ID: <CAAnfSTuCpZCXN66b52yyJFh+r8wPB4xFJd0cCP9_Qj=CvENHew@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 18 Jul 2021 04:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Jul 2021 at 15:03, Steve Sakoman <steve@sakoman.com> wrote:
> New this week: 1 CVEs
> CVE-2021-36217: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36217 *

Patch incoming for this.

Ross
