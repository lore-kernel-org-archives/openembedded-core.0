Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web11.10452.1589537781744668492
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 03:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Tqj1E6Hb;
 spf=pass (domain: konsulko.com, ip: 209.85.167.193, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f193.google.com with SMTP id p127so1701279oia.13
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2020 03:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bqxhyE4oEDJWDVD73jxIY/Oq0CCPITxQGVm1z3KS73E=;
        b=Tqj1E6HbI+Qubo/pWQGz2MlXZoQYRblWfma3HNk9bFRLX6VCltcqMXYxmKBRm/ctVa
         XRie27bVB6TlnetUnCKMF5yo89E9s6X73LroG0aZEABmbCdUWmBinyt3gWZZiGwxHiCs
         CQcfh/7KMZ3HpBKQYQKT/aqThdIPf2foKcmTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bqxhyE4oEDJWDVD73jxIY/Oq0CCPITxQGVm1z3KS73E=;
        b=FTmgG73uq4edm2FyMN2PyUvljB0NHwbz5munyy6LyqpB4sKTafYyz+NRA8kOr0aPPP
         GUK4EKFunVTrHgWIxtcCYEpCyUsu6zsdE+09CwWP33gSM/XjJs2jyWw4FYApNFVqRh94
         T7L6siLxwJ1LHBE9InSDaw3uPLzVwhUfPFvb50GFO52QY/dceEYL5aWmQa+dgnjRm756
         xAMTG08Xjyd34eBs5jZLiQPF9qsMbMbN9oF/RL86zCkgcPqk2wMjEEzzNnTqYHEYS5vi
         VuGtXxOEvT1oqmkwUAs8z6/tb9SDLgtGszGFJS/EFcgbwmih5W+gqzHVA3lPrEVwJjyq
         Vlwg==
X-Gm-Message-State: AOAM533fGOMkN/NkoF1x5IH3i7MfqV0WOFvGoKyaSXVAQ6gQmdKj3CE2
	YSOf4HVx5sX7TliXy9xNg6r+LQCgI9/htHwydc5puQ==
X-Google-Smtp-Source: ABdhPJxcjJqVcYyj9lmE6lIgdnO1qCzfA8kK87P5hDj4+ifSObeQuNYX/JprqN7a0llGePDnPqEh4CMsWSSIoXZVews=
X-Received: by 2002:aca:ea46:: with SMTP id i67mr1456875oih.152.1589537781129;
 Fri, 15 May 2020 03:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589536566.git.liezhi.yang@windriver.com> <38eda2606c19cf817d09b35f1eb49d50170a52ae.1589536566.git.liezhi.yang@windriver.com>
In-Reply-To: <38eda2606c19cf817d09b35f1eb49d50170a52ae.1589536566.git.liezhi.yang@windriver.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Fri, 15 May 2020 11:16:10 +0100
Message-ID: <CAM9ZRVuv+aL55apdEvFeqrHx_Nq=CKA1EAk=QkfhC92+9UrSMw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] archiver.bbclass: Add ENABLE_COPYLEFT_FILTER to enable/disable copyleft_filter.bbclass
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 May 2020 at 10:57, Robert Yang <liezhi.yang@windriver.com> wrote:
>
> Set it to 0 can make it archive all the used sources during the build, nothing
> will be filtered out, this is useful when we want to archive all the sources.
>
> This equals to:
> COPYLEFT_LICENSE_INCLUDE = "*"
> COPYLEFT_LICENSE_EXCLUDE = ""
>
> But there are a lot of settings in copyleft_filter.bbclass, so it may not work
> when its default settings are changed, add the var ENABLE_COPYLEFT_FILTER will
> make it more reliable.

Why would copyleft_filter.bbclass not work when the settings are
changed? They're intended to be configurable.

I've been using `COPYLEFT_LICENSE_INCLUDE = "*"` in several projects
for years now. I'm not sure that we need another overlapping variable
which could confuse users further.

Thanks,
Paul
