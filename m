Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.8284.1601041000889656987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 06:36:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VwSyCtdy;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: parkch98@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id nw23so3688636ejb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 06:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+tw1v7phgbS+dHiYuRloO4SFzMR6347M4QrGFsmwUVE=;
        b=VwSyCtdyYvhHwSbuCVnLeTuWlAJvSaRq4h/7+NbaQYSKn6FwMxYGhqaZK506zVMgSW
         v6QG8z86r6dHeXZe8YNXXZuuJ1YDpLS9E6mYc+J3Q4h6oykGHjOQhmnZihuou5qO/B0N
         escrqoRwhmTN9hCPiCInjQ3yH9u89ClAAONP9njWF+bqW6lM6lEGQqkeBzSm70BxUDw+
         lCXQczhifz1wyEPiQVLfuPTcC25BO7xG97dEd/DsygOtc7c+w3vFMwYbIDe11w9q/3Jt
         D+vIYZ7dMYZi44+U1G8s7P5qTDvbuvFqTZhPe6N+9JHcMjR62eSXFl/B7L5xmrlDYTSc
         Kwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+tw1v7phgbS+dHiYuRloO4SFzMR6347M4QrGFsmwUVE=;
        b=Lw68Le+jAooX9g/2GGL58Z9+2g7bsxbtFiTVJHgHAyc4jRN0AIko6jpK8eVGdceOK9
         zxKcewUfszxfOOB4R0N+bueZa+VQVuffC1nDPr5ZHSBHeAsbAHKGonCFR2iUH0Fk8IHY
         lku7H5kHkl7reR++TN219fK1J/TpsBV+2ZvDgb0saxamurG7ImzuUNOkhbnIUIVSAebe
         eIGa5j+o8RKBIdffRW2k4G7sFujjUiD6zLspQ+sMGg34oAwpsDJBpvdpSGhYXCm1TBJD
         yZo6HQ20iT7wpad1PHUy4Si7iO/zPhFtGhDWcooMbXoG3Jv2SpiuiQw5/oRNq2OeC69b
         J8bA==
X-Gm-Message-State: AOAM533m5V5VV8rnunXTXXh+l9kCZ01Z2337XTnw4/00Xo/UOnv4sAjh
	lcOM5N1me1SCurpMwQCwkTY0ed95hBdsaaUFkxg=
X-Google-Smtp-Source: ABdhPJwNdqz7U1yjA2haTDFbHKCP3RCcTRpBZL/HNeqIosX/4DwgxwfvJXQ1OLMDx//GqocYYjoevmqgZ+8hLQ1zanQ=
X-Received: by 2002:a17:906:82d1:: with SMTP id a17mr2697782ejy.385.1601040999152;
 Fri, 25 Sep 2020 06:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200922151518.1615-1-rasmus.villemoes@prevas.dk> <bf1062de-a95d-591c-151d-b25e55d7a3cf@prevas.dk>
In-Reply-To: <bf1062de-a95d-591c-151d-b25e55d7a3cf@prevas.dk>
From: "Chanho Park" <parkch98@gmail.com>
Date: Fri, 25 Sep 2020 22:36:28 +0900
Message-ID: <CAPTzV16=6hmmts0_VuMLFPDiOB5XHU0m2azS8Rac+o0OcJ+kAw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] fix externalsrc task dependency issues
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Sep 25, 2020 at 6:06 PM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> On 22/09/2020 17.15, Rasmus Villemoes wrote:
> > This is all entirely untested, hence RFC. But if this doesn't work for
> > some reason, I think externalsrc.bbclass should grow some comments as
> > to why deltask is used instead of the noexec flag.
> >
> > Patch 4 is a revert of patch 1, but I did it that way to facilitate
> > backporting, in case patch 2 is too dangerous for backporting. If that
> > is considered safe enough, it should be enough to apply patch 2 to
> > avoid the churn. In any case, patch 3 is just a little simplification
> > made possible by patch 2.
> >
> >
>
> Ping. Chanho, can you tell if this would fix the externalsrc problem?
> Richard, any comments on the deltask vs noexec usage?
>
> Rasmus

It works for me.

Tested-by: Chanho Park <chanho61.park@samsung.com>

-- 
Best Regards,
Chanho Park
