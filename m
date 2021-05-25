Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.916.1621962951120474311
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 10:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sSuJ4aUz;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: petr.vorel@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id p7so29322611wru.10
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 10:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+yZ0JIKt9yjbO+zE3MGi/YdxtV8rgjg6FL2SL4rAeRg=;
        b=sSuJ4aUzvAPLal49KLaSkUgv9w1avjFKySESwNCaHMDl2tv18LXnoTsZ014bPviS2a
         7xAO55ClpIZRfw97293YiMbPbJfBdy+azQ+cwo8L27n7lwAUgowBlqm12+FTsApcT0C6
         2wDhJc5KiAQZlJtgJuaf2ZNjD8JcrYZoavVDTWe8NTyHTXYStRtgJNPJpuj4GFFPrMR6
         WgLNr+smfqkvsCjFtYKydP9rJvX+soLQt0NMTL5nDzQ12A6QfMnnVhiqzAHbrA5h8hpo
         PhoQGpEHYBai1gagSuXal57Nh6elr8F0jSuUBNbD7OnLYI5SkBKhW40VuDXInpJ+jCai
         EHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=+yZ0JIKt9yjbO+zE3MGi/YdxtV8rgjg6FL2SL4rAeRg=;
        b=aoV9NrJ+cA7ymzD+LipiRQMaIUFQxdZg0mY21zL+aLp4EUjNnn1LAjL8OH6LG6EUre
         P9BJWVDK4QpoJYDpA4LyH1MhKPdHlRdRK+tCJtgSW/Xla29f8F6UQ5zQAVwq3Y5+edBN
         jXd8aXQpLzcf6VvHcYarF66xx5uBiaahC67D/2OimHk0IP4Omvxi6Vt4rvIfd/7b11tG
         v0wAurttzUjRUVa6hlXISrDbuZqDx+Cb6hIDp0Yzu+lBQ3vzh0PO5d11ehCHquftQGoG
         VNX2PjOkKbm0zsCOUqtFWd5/WcfUsuiCmIf+helC3Jal7yhv/1Dd2vkBPhLETlzb/fAj
         /D1A==
X-Gm-Message-State: AOAM531ePH2GWVwxDi/kGg7mQ2X4+RJIrhFRCopsnWFa1Zl2Zc/B4aE5
	YJfYkMTx41J/mmGwVbhOixc=
X-Google-Smtp-Source: ABdhPJyf6J29E1+TvM5xcsrzmXFa+xRkPIBG6hohmzl4FxkRsYj4zfK3b2aW/R2vkZECr9c3qwk7jA==
X-Received: by 2002:a05:6000:4d:: with SMTP id k13mr29168099wrx.98.1621962949572;
        Tue, 25 May 2021 10:15:49 -0700 (PDT)
Return-Path: <petr.vorel@gmail.com>
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id u132sm9773279wmg.31.2021.05.25.10.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 10:15:49 -0700 (PDT)
Date: Tue, 25 May 2021 19:15:47 +0200
From: "Petr Vorel" <petr.vorel@gmail.com>
To: Daniel =?iso-8859-2?Q?D=EDaz?= <daniel.diaz@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] ltp: Update to 20210524
Message-ID: <YK0wwzjedOBm0K9I@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20210524182955.29512-1-petr.vorel@gmail.com>
 <CAEUSe788VziRFpqe2NmX0ktu5ry659bfO-H+wAhtAmkfASzGZw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEUSe788VziRFpqe2NmX0ktu5ry659bfO-H+wAhtAmkfASzGZw@mail.gmail.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Daniel,

> Hello!

> On Mon, 24 May 2021 at 13:30, Petr Vorel <petr.vorel@gmail.com> wrote:
> [...]
> > diff --git a/meta/recipes-extended/ltp/ltp_20210121.bb b/meta/recipes-extended/ltp/ltp_20210524.bb
> > similarity index 94%
> > rename from meta/recipes-extended/ltp/ltp_20210121.bb
> > rename to meta/recipes-extended/ltp/ltp_20210524.bb
> > index e1ffd0ddf4..bf6e564482 100644
> > --- a/meta/recipes-extended/ltp/ltp_20210121.bb
> > +++ b/meta/recipes-extended/ltp/ltp_20210524.bb
> > @@ -27,19 +27,14 @@ CFLAGS_append_x86-64 = " -fomit-frame-pointer"

> >  CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
> >  CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
> > -SRCREV = "4d005621edd109d119627eb9210b224a63bf22cb"
> > +SRCREV = "0fb171f2beddaf64bd27597577c206c0f892b3cd"

> >  # remove at next version upgrade or when output changes
> >  PR = "r4"
> >  HASHEQUIV_HASH_VERSION .= ".4"

> Shall we reset/remove this?
Thanks, yes it should have been removed.
I'll try to send v3 tonight.

Kind regards,
Petr

> Greetings!

> Daniel Díaz
> daniel.diaz@linaro.org
