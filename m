Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.2269.1585678735557052554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 11:18:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=EbNRDsLi;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.195, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f195.google.com with SMTP id 139so14220581qkd.9
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 11:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=3Hke5C2OmFnrm7j4k8qFPDCJL7UWdiXu90YGkmz8o+c=;
        b=EbNRDsLi6njJg4RmG1K0TuMksMf/3EsI1k+sUwYIzQCBA9VegyX0PakepU3RjCqGmU
         iId2zqz15w+zKnlFxnt9b57lOhm8VUotAjJPKItayTx9aIyRtV83V3Bi2o59HjNjP/zo
         l01r4Iwjq7+GuCCB7UGTMv47Mph92EYPUYAQZGb8jFstdWDc9AOV9q6QOmyUhOUzhNCu
         0/G4vah4PjRICyfTPklFZ0WmmQ8NFfdG0XiCe/3PRTuhvMIH3Ei3RirjP6mowWR5lLhJ
         lVDVb7afQsKuSaB+t/B57FVK2FfRqC0Kr5HJSQpPB9FqKgbUV5WcoqgE8u0Xcr98Pew0
         xq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=3Hke5C2OmFnrm7j4k8qFPDCJL7UWdiXu90YGkmz8o+c=;
        b=uX5/BOAAy1SotSrwKEd7Q+cQYgrIfD+Gs9PyhnWSEw+I3PSJCQx/bLbcF5INtU5rcb
         7LGNVLBwIY1O6P6DtvlHnU9h1dZCxF/234oPheWF5CvAtnjuiOjW8nShPJNGuDaiNhfn
         4ryy9hrKhuxvOGGwnX77w21jWi8Cyu4NdCFmySN4pj/A4zrpE2puVZ8jI739TW+fAVG5
         S+L8KSpxC87UKy5b/saMqUh3lk4mvHv7jCdNuqvTSqGIqe4ZE+rk4JyiUo329tavwoOt
         AEIAAssp6l+mA8aI2rOX4AWNrR5KYebQkBLCuvmdf/lQB9rBFGE4CHWoAzCMptn92SHP
         7xnA==
X-Gm-Message-State: ANhLgQ3PAxRUsorH729JycOOsn45oAs81eSnSfOYgL9nLwP4XHnoRiiS
	aF8S1HJsOrs0LXG5qvYeE6IXWeOuQ84Gkw==
X-Google-Smtp-Source: ADFU+vvS9Ge1lYZPLkvdYTfXmd0ZVprwEzs64GV3iqqP02rrM/Hoole9mLb8QSeia2KFNJeJrNzxOA==
X-Received: by 2002:a37:a44b:: with SMTP id n72mr6477614qke.471.1585678734274;
        Tue, 31 Mar 2020 11:18:54 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id f1sm12095249qkl.91.2020.03.31.11.18.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2020 11:18:53 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f48.google.com with SMTP id bp12so7380164qvb.7
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 11:18:53 -0700 (PDT)
X-Received: by 2002:a0c:b617:: with SMTP id f23mr17546473qve.134.1585678733035;
 Tue, 31 Mar 2020 11:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200331174641.1094071-1-otavio@ossystems.com.br> <20200331180709.GM1578@denix.org>
In-Reply-To: <20200331180709.GM1578@denix.org>
Date: Tue, 31 Mar 2020 15:18:41 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpgo=WJuR5CupXuGmMLSiYxvDrHBbur1Q93+OVc1OMvcQ@mail.gmail.com>
Message-ID: <CAP9ODKpgo=WJuR5CupXuGmMLSiYxvDrHBbur1Q93+OVc1OMvcQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: Add UBOOT_LOCALVERSION_AUTO support
To: Denys Dmytriyenko <denis@denix.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, Tom Rini <trini@konsulko.com>, 
	Stefano Babic <sbabic@denx.de>, Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"

Hello Denys,

On Tue, Mar 31, 2020 at 3:07 PM Denys Dmytriyenko <denis@denix.org> wrote:
> On Tue, Mar 31, 2020 at 02:46:41PM -0300, Otavio Salvador wrote:
> > Add the Git revision used for the build. It is very useful especially when
> > using custom or vendor U-Boot forks so we can map a binary to a specific
> > source revision. Valid values are "0" or "1".
>
> Well, UBOOT_LOCALVERSION was originally added specifically for this purpose -
> to be able to append git hash.

Not really; it kinda of maps to what Linux kernel provides and it is a
"suffix" for the version. For example "-ti" to imply it came from a
Texas Instruments fork.

> > This is based on a class which has been in use in `meta-freescale` BSP
> > for years and has been very useful especially for custom U-Boot releases
> > as it allow we to know the exact Git revision used for the binary.
>
> And in meta-ti BSP we've used for many years:
> UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}')}"
>
> And get_git_revision() just calls "git rev-parse HEAD"
>
> So, it seems a bit redundant to add another variable for this...

How I use this is:

UBOOT_LOCALVERSION = "-updatehub"
UBOOT_LOCALVERSION_AUTO = "1"

I think it is way easier for users to do that. Using inline Python
code is possible but it is not something I qualify as user friendly.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
