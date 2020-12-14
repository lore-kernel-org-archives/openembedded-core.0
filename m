Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.38788.1607967027512647173
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 09:30:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=plHOswzK;
 spf=pass (domain: burtonini.com, ip: 209.85.167.45, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f45.google.com with SMTP id m25so32124578lfc.11
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 09:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zvGbIvsDg9TMRy5Kny6phjpBex10NS7tLAqa0YLQgps=;
        b=plHOswzKKYROqxKH3skUffWunbTvFKHNjtcnRnoLPvI62uyDC3mRx71NgHFg9LoCJu
         gzA96HktuqRNv2DSg4xoOdq1bNCZ6VuR/MzlbrPQ8Ze/4rQCUD2ULXD+eLq9ykfGOhJ6
         ImQJm7cscIQw3zByrKAN7kEnOQHPIfhkDeLP73SO00COkODYrgTVkYV3nfquWPk26GaZ
         ULqaxPHJ0v3BXTYhw3eWH33EEXg5514085gCTRN89QgtI0kJPbmlfrs+eQt5JethAZk1
         v5KI3pSEfBqsncWP8m2ZTJ+lsC0e5Np05vdDi3RJiSB54ppvZxapV3mTYiW+Wl6kcBaT
         N8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zvGbIvsDg9TMRy5Kny6phjpBex10NS7tLAqa0YLQgps=;
        b=ibnUs9LxrZNL44fXpxYPULJG3iy4/gOFlwXG0YfyET+fI7Bk7EthFZza5tz9h/zped
         FmlO87D1VMY+9XEJmsgDHor/SPqxWyU204BMz5+6ZNF3DrljwoJscd9NuaCUXzkId7O7
         p0xtH7w7/jQmkeGXKdZIo0qmV93eZXtZfqp6NZvflxxRcFt/0cufWDw924Lpv9scKe4h
         T0yo4DCG+LpHqrqZKAmJrVmuRsZX+wlHlBt3/ztV/ty7hy88n22mVd+jSIEihcf8zWwr
         bw1X/jnABLqLDkcNskCnaOAek4m5O//97/e5m8Kbfl6OwxMpLkZCbti1gB1N1rhS70lM
         hQHg==
X-Gm-Message-State: AOAM530wkc0GSOLEkOOHNaNNJmeLuVP4A9b92z+0/O1eRC+YKOImkDsI
	HaEz3MbbJlxIhymggAWVUuI4VxKx9fI8jdLL+t0JLQ==
X-Google-Smtp-Source: ABdhPJxN+ronNi+cnQzLXc1XI3K50vV0+omC1qgF6Y8FbGsAWrvxOLUr+Zzj5M+eMWs/h5QW7ZdxG+PhDUSZKxDlQyI=
X-Received: by 2002:a2e:b1d2:: with SMTP id e18mr4592626lja.101.1607967025651;
 Mon, 14 Dec 2020 09:30:25 -0800 (PST)
MIME-Version: 1.0
References: <20201210162023.3239592-1-ross.burton@arm.com> <46755a3c09815c2083f65c090406711ac5114e03.camel@linuxfoundation.org>
In-Reply-To: <46755a3c09815c2083f65c090406711ac5114e03.camel@linuxfoundation.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 14 Dec 2020 17:30:14 +0000
Message-ID: <CAAnfSTsM6p4+WCdA30xvC00vdAFD--isrrFPnQ=+2G7xcRjHrg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] yocto-check-layer: make argument parsing unambiguous
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alejandro Hernandez <alhe@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Dec 2020 at 13:31, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/2825
>
> Do we need to update the way we're calling it on the autobuilder?

Yes.  Sorry, forgot this was on the autobuilder.  Patch incoming.

Ross
