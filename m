Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.62.1584984242303316944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 10:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dTa0SmGk;
 spf=pass (domain: konsulko.com, ip: 209.85.128.66, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f66.google.com with SMTP id m3so407231wmi.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2020 10:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=Z+54EVkmknz92vJpl2eugsCC0kTAsX2jIUFcn9rbhpk=;
        b=dTa0SmGk0sF5mcTqOy+V8QiYRgnaknK1AXVFGWTRi+0aGf1NvAktxHj/ZejG85XBCx
         FC4J3TN4XaLZoQEAqjyX5O9EKkfQBcvILtIBKsw1WcLvA2M94g3Wt6YsuU4Pse1+GeXL
         Bmh2EJnF46T2C24CUDx6WglfQVsWBdh4L8tHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=Z+54EVkmknz92vJpl2eugsCC0kTAsX2jIUFcn9rbhpk=;
        b=QGdmypGil4KBx1mOPZkAiBbYgTYmTDHwPHlBirIwBj0MmiuSIAsLMXzyG+tndNOOkU
         ethHS2BJfZVErFtYbcPrWmt7VLSLk7lJ3dbXnKne5t8JoN25HP0DtXnCDj/3xz1tK6jA
         KXcmJBirQ76jhFHJyMJHZ5V77kSdGwgoOIRdjO/0ixmPNNpCgj+7Sz1RZ8L30g1Q64/Z
         nTJZedr8Z/rvqI3vwKkPaekvU6Thdi6XaARdK2w74zIPakgiBq9UUxxhlO/XnF21Xbd5
         udOzFy+vAkfWC184bg9ZzNDXz6EmYMaJ5LcJ11SHFyVE0NU6PCBpzT51l+2bBseRnPG8
         LPPQ==
X-Gm-Message-State: ANhLgQ2KPOVuIm6I1aksE9R3BZFVIJo/XIdAJINo17ROn5LfKQssewcq
	GUAkeWR3n1XaabhcWJQIStHs+A==
X-Google-Smtp-Source: ADFU+vsvX6SHjmTCLWxd/mdKtxJYHTslssCUp3cxHsXm3iI9+VwrYLUMuwTrEL7xi4PqArxbTd3Hfg==
X-Received: by 2002:a1c:ba04:: with SMTP id k4mr387326wmf.10.1584984240671;
        Mon, 23 Mar 2020 10:24:00 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ub1910 ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id j39sm25807526wre.11.2020.03.23.10.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 10:24:00 -0700 (PDT)
Date: Mon, 23 Mar 2020 17:23:56 +0000
From: "Paul Barker" <pbarker@konsulko.com>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] archiver.py: fix typo of "ARCHIVER_MIRROR_EXCLUDE" in comment
Message-ID: <20200323172356.4eb5a14f@ub1910>
In-Reply-To: <alpine.LFD.2.21.2003231301590.43292@localhost.localdomain>
References: <alpine.LFD.2.21.2003231301590.43292@localhost.localdomain>
Organization: Konsulko Group
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Mar 2020 13:03:55 -0400 (EDT)
"rpjday@crashcourse.ca" <rpjday@crashcourse.ca> wrote:

> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
> index c036e0cbe2..606eaabcb0 100644
> --- a/meta/lib/oeqa/selftest/cases/archiver.py
> +++ b/meta/lib/oeqa/selftest/cases/archiver.py
> @@ -208,7 +208,7 @@ class Archiver(OESelftestTestCase):
>          """
>          Test that the archiver works with `ARCHIVER_MODE[src] = "mirror"` and
>          correctly excludes an archive when its URL matches
> -        `ARCHIVER_MIRROR_EXCLUDES`.
> +        `ARCHIVER_MIRROR_EXCLUDE`.
>          """
> 
>          target='selftest-ed'
> 

LGTM, thanks for catching my typo :)

-- 
Paul Barker
Konsulko Group
