Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.63876.1600099111682241446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 08:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KItWtqgA;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id db4so9213699qvb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 08:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Op75kPyHcnMyktoavuOcSc8O8b5tPCiCl6vX0UXX/RY=;
        b=KItWtqgAabBR9rb1VzmgV35yWjCdQheaelVOrUOFB1kuh9AOxAHL2KMESeiN2cgzm/
         lgqCPS//RaKxVwkvasqIW+d8o9/GmiKRQqU3LbnHGJA5v6859tRMc6ADQFCghonm+x/J
         /J5fAxBTf/q56wSiHK3e4yW8/I5iAwafvD/4AkzvlSIvKtdbM7HRTvQDFBvViKWf6QwD
         ajcqgyycDEQ1YsiIqaF7x25ly/+aekp1n78mAl+eo4M7ykaMO4P61Tgr/aEbsxgkuQ/c
         hu7hMCs9Dwp37efYvpu8yMgPA7GpustBe6hT5YmtkAL1ySkA/QTkNiBaHJzcJA+3Z+KK
         Z4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Op75kPyHcnMyktoavuOcSc8O8b5tPCiCl6vX0UXX/RY=;
        b=G3Hte79fwq+G79NzgBT7jjr20jffT4gd820Od62jjY5wZfwFxDhwYNYZ11lMDNqeX9
         htEsQD3Wv7n7VPUfdVz7bWTCFf/LtYjQPxGGPf4LnCFXNqpVSHGrUKtA+UJV99Yp/emF
         boqeWfe8x6BzJblhgfLwM9sVXAedMa+SIJHCph6tegfvBdKoFQ3v6S1riWvkw8fE3KJX
         n0Z/IxLGAGM4sdVewSMwdgBEBpXNFqyeeDy0AAG7lDG3jOcVDGPZDJM6U1CBYNUIElT3
         R3lR9OTMcP+5djiiJAGDSPvWYtIqKx8rseptfydg9MbgIGn82cK/jgjKR3Cku5rMs0db
         M/sQ==
X-Gm-Message-State: AOAM530k+9vy/9QTWRXeuB8y1lQl1wKCfu5mQI3/ZstAIgy7FQSjTHQO
	7ULpcMkbLgIPXI+rHleHgNLLt/sgEvkba9WBmcA=
X-Google-Smtp-Source: ABdhPJx8c0qmWz4HAIo4ERr8+P+CxzTVSIVQu9b0c9i1c78Sorme6+YEMum1dwNsnsdZZwarel5/FnkOonttsG25EpQ=
X-Received: by 2002:a0c:f687:: with SMTP id p7mr585950qvn.15.1600099110781;
 Mon, 14 Sep 2020 08:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200914033421.48381-1-chee.yang.lee@intel.com> <CAAnfSTuxVhcA1P_-efXbSL5X5i8_RkP_ruVEoY571pOwhTvdCw@mail.gmail.com>
In-Reply-To: <CAAnfSTuxVhcA1P_-efXbSL5X5i8_RkP_ruVEoY571pOwhTvdCw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 14 Sep 2020 08:58:04 -0700
Message-ID: <CAMKF1spXCx0gRzf9AJ8LkM5VoZTmv7KCg-P39qppC-j2=UzJRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] cve-check: use ALLOWLIST
To: Ross Burton <ross@burtonini.com>
Cc: Lee Chee Yang <chee.yang.lee@intel.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 14, 2020 at 3:42 AM Ross Burton <ross@burtonini.com> wrote:
>
> On Mon, 14 Sep 2020 at 04:34, Lee Chee Yang <chee.yang.lee@intel.com> wrote:
> > use allowlist instead of whitelist.
> > Replace CVE_CHECK_PN_WHITELIST with CVE_CHECK_PN_ALLOWLIST.
>
> This is a deprecated variable already, I wouldn't bother changing it.
>
> > Replace CVE_CHECK_WHITELIST with CVE_CHECK_ALLOWLIST.
>
> ALLOWLIST really is a horrible word as this isn't a list of CVEs being
> allowed, it's a list of CVEs being not considered.  CVE_CHECK_IGNORE?
> CVE_CHECK_EXCLUDE?

Yeah it's more like an ignored list than block list.

>
> I do also think that we should do these variable renames in one go,
> instead of piecemeal either side of a release.
>
> Ross
> 
