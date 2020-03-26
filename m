Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.382.1585242586812233126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 10:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bMbO3fZQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id b62so7496495qkf.6
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 10:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SgrFHsQrO3qFEz1ai3LPEny0lykvkU6xtqLEFC0LS9E=;
        b=bMbO3fZQiWRtot9rWD2XRwOz7eP4PCmLDzedjCMBPRu+BJqvizgSHHypMB/nSuGf/1
         2HTQOBbTwq86OAcgC/dpmUlJD4dokO6ZwAbe1D1wLCKAAZSDY0tTtVqDMfyHPdR3XrIU
         WKkOuNOXJuItgJikCwDMGLiVqhJ6btyOaoOuRCG9Hz7piZvP90B+E1q5nQ9gnWp1Fgoe
         x713AfpoPosO8Bk6/ztnTDaW0ihMfVINFqhMe02lEKaZ8P0JUQ5i6ri7eyOOZPIlAKUy
         r7T4SZr3xkCvZDfYNAUcaKTvBX8uSgcnOpo+bCoAVTIsq5IH5QIBgwQeNGF4uO1aNRZ2
         zm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SgrFHsQrO3qFEz1ai3LPEny0lykvkU6xtqLEFC0LS9E=;
        b=EVvqpV/Vn91OF3I7an6r9lu+V6iTXW9fr6Y/6UpFpGFtaJaUMIk1w1cRH1Plh20LPE
         6y4gvqE1M/DNLB+PlzbljoSd+dpJQEwU1dZz8u64UEhOSjsEqHcwBPcNpCV4jJFyrT+q
         yXFEtDlxJCrTn8mJhE8dEiEeHHPG4gKf/ACEvFFDphSALpK8cFGT+fJ15xoJBm2XpdKu
         oJHwmlvg7XJSAzH3WdBnbQLPVDODhtrYJynyd1tUJI94oQO2EfpdSjC/wg7Ha1vybRHR
         9K7XxUSjKhnZvFdXFAB7YWnc8N2mJVYg9k9LJ/E0xFpsA4M2OIEwi/0R4pnJGzOWQ/d+
         eewQ==
X-Gm-Message-State: ANhLgQ3XkRfUu8CKbTaLP7wIor9bKTVxK/XA5ytXQamW3yRZCM8NghMP
	JfM52Dkak5KmUVwtnP9Z7olBM8BVZd/bzXosO3Yi9XKp
X-Google-Smtp-Source: ADFU+vs8Ze3vvL43xCRuuEf6I1CEG9gNw/0zAaEYiNbkxFloqe+9J33xPd8/teyT6zsyuzLfwQIjErPN2uwwQWmV38w=
X-Received: by 2002:a37:a746:: with SMTP id q67mr9468677qke.215.1585242585694;
 Thu, 26 Mar 2020 10:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200326062919.1929050-1-raj.khem@gmail.com> <20200326130754.GA17705@localhost>
In-Reply-To: <20200326130754.GA17705@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 26 Mar 2020 10:09:18 -0700
Message-ID: <CAMKF1sptRDswkw=GAsE-S0o-s1WHMFVdh1zO-oXuaSOhzsF5JA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Backport patch to fix ifuncs on risc-v and gcc10 builds
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 6:07 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> >...
> > + configure    | 2 +-
> > + configure.ac | 2 +-
> >...
>
> This shouldn't patch both.
>

why ?

> cu
> Adrian
