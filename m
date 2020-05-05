Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.23.1588641477569471876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 18:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y9JNXMKO;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: sakoman@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id x18so752179wrq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 18:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bnwz/4txzOgMomJYDO3L3IeXZjjIQIp9R+Ikxy9J2rw=;
        b=Y9JNXMKOe5j8COkPJf7EJUFGv4uT0qFzhhbgx6T+Qm0VMDsh5RtEwuclMttTvgJLrl
         /N4C8RrVWhxe5Ri6foSXqDgfwquGELD9csdHlNS374SmVb40FVvqbZlE/Z6emlXiU2qE
         GdqODrmmW4Tlp9vIe+iUJDnMCYNcdEFNQO6Zg4h+jGoSmzwrLk+TqcSpSOkEDUljGWXQ
         B2kNRvvnsROleymrV2Mfu+iXJWnqWfdQS5sKCW+CA3+rn/O2mZLNRcld0x+UK2gUlLyl
         H2j+vTf6w82wzEW4ay7Y1d2bHe8w8DbAMOGJtqPMZWAqwp3kil1H/fU2zz490Qopx26H
         2UTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bnwz/4txzOgMomJYDO3L3IeXZjjIQIp9R+Ikxy9J2rw=;
        b=M4hw1siIF/l+RRZe6VOWGIK1LXR+Jk0cGkJa5yxJYUo5mdyQjlAFHeqQJW63GLlxMf
         SYF7+CnpDgnPpxgudvN6oUZd+lyf0iNHyuAEerNffeKkqGMTPo588tnEMI2SQjwAR7UX
         rtyv5YVQTfEIjWENfD7ZbooW8Tq9I7xPmo6JbXF/FTVaie53rj2k7cW7bCNu94WZd14E
         XEzVruYXYz6JQEmI1CNICDeJCeJc7agmR2NJazfvv1h09GW3wJcmp9FRlcft8cF9um6o
         vJSXF3zmWPRjxlDmYNpztV3epIhtbeU6e7RbVb/bAUZeRnsyRINUNNmts9Epru5+cSa2
         un0g==
X-Gm-Message-State: AGi0Puay7IJ/z65hfCpUPvkMXIGqvLxmUA9SBpRuju2TPRjc+VUAnikg
	OOSK3cqU8x5yWwxPcYohkiMYeShs7khWT+04br+Qt+tB
X-Google-Smtp-Source: APiQypLBXpCxMXscnEZMHkO9fSrPdzplAKKSeASJk6w8QG6fP1KPm0BsZ44x2+TP0bvO3gQD1ZA9272iQ3Zf35Ol5Kw=
X-Received: by 2002:adf:a1c8:: with SMTP id v8mr643756wrv.79.1588641475675;
 Mon, 04 May 2020 18:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200504205751.40338-1-alejandro@enedino.org> <20200504210236.2273.59294@do>
 <f242e19e-c275-f0b0-b7f1-63f7c056c611@linux.microsoft.com>
In-Reply-To: <f242e19e-c275-f0b0-b7f1-63f7c056c611@linux.microsoft.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 4 May 2020 15:17:44 -1000
Message-ID: <CAGDS+nm9n-VBw2Hf-Yk93K2-xLSSrZUuR8TTCZuSXpZ-oTmPJQ@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFtPRS1jb3JlXSDinJcgcGF0Y2h0ZXN0OiBmYWlsdXJlIGZvciBuZXdsaWI6IFVwZ3JhZGUgdG8gbGF0ZXN0IHllYXJseSByZWxlYXNlIDMuMy4w?=
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 4, 2020 at 11:12 AM Alejandro Hernandez
<alhe@linux.microsoft.com> wrote:
>
> My bad, this meant to be a patch for Dunfell since its been merged on master already, please disregard this failure

If you'd like me to consider a patch for dunfell, I'll need a little
more info than just that it is a version upgrade.

For dunfell patches to be considered they should be in one of the
following categories:

Acceptable:

Security and CVE fixes
Fixes for bugs
Changes to follow an upstream stable series or LTS that aligns with
the original release (based on compatibility)

Potentially Acceptable:

Fixes so codebase works with newly released distros (only in the first
six months after a given release series first releases)
Bug fix only version upgrades for upstreams with a good stable process

So if you could tag any patches for dunfell LTS with [dunfell] in the
subject and let me know which of the above categories the patch falls
into I will be a happy maintainer ;-)

Steve

> On 5/4/20 2:02 PM, Patchwork wrote:
>
> == Series Details ==
>
> Series: newlib: Upgrade to latest yearly release 3.3.0
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/23943/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 26eb22191f)
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
>
> 
