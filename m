Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.6379.1585057704669279260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 06:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=unjP5wJp;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id 10so14936974qtp.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 06:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lIt71TPPRfSRfePmU7WYcVOYocCW+z1KtbKJ+f3+xVg=;
        b=unjP5wJpDtfg9YJJqXw+b2vu+GTYKLWMyFnulXawrI767sKL5FjBSstIVE5kKYpKhs
         TMJM0r/q55g0OMaSpazBuExCGfPWKFmCFFmjYavTCWEBds0kDv4i/W/AbdrXy12SYLZI
         SY1H93SxNtg7Wq1Y22AvEJG2N7kP9nfZl3RQWNKWaEmvI7HLSinD3k38kaLyY9LwJQs+
         kq5LSIIxiPbMg1LRG4+4ic17Yd1n0HcJJynxUakwhheBCdymUhQ3/XXRnI8xoH5ppz6i
         AJqRf0iXsK9dapz5863eABychT9mILRV3WZ0zNWxyHMIvzBu97r4lrRc/cBhn/ay605L
         gS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lIt71TPPRfSRfePmU7WYcVOYocCW+z1KtbKJ+f3+xVg=;
        b=HNesLbXopHdjwas3GQbCz7G7QsQ/Ua5zNuM9ugmgYkPljCpzqZslu/SDBsCKjQIXW+
         2KILhitXMB2v1IQxBV+6UKi4OISztct4b/9pNxpqDm8n77sKlukKbbdVH+7ArHRSZF4T
         E1pSila0IAoTItEHvVHA1rmQpbzm5Iu6rj4jFUgz7xSU3KXD+rwB0lxm9kqXoxxJw7QY
         VTt3QromRG8DQ83IT9IAwi5AsrNZJnp7dKGeMxMO8peZ3pzMLSrV7tvi5w6IBz2Jnhqr
         rvEPHgPrnU5xyc1M03sG/QJnNDmlJnbQIU85udbiYy1UkaJ3ofAJZu9b1Th1RVGQs6g2
         8MCQ==
X-Gm-Message-State: ANhLgQ05J10h3fWGYZ8tQVTXaV94/phPJLaHe2xtk9AtuBPuvBo9Vp4h
	bAztzFW0Uoc9mjRLqcMNzG9itVk3hLerGfvyOJOMyN0x
X-Google-Smtp-Source: ADFU+vv7b1Ei8Lumd6m7FYD2/T8sZPAOXM9AmL9Rkx9wdBKk/3EBL5GEblecciWNMZUbkXnFJviiXAYIxQi41qQ7DLs=
X-Received: by 2002:ac8:17f9:: with SMTP id r54mr26228414qtk.285.1585057703556;
 Tue, 24 Mar 2020 06:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200323232529.3658577-1-raj.khem@gmail.com> <20200324113756.GB10278@localhost>
In-Reply-To: <20200324113756.GB10278@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 24 Mar 2020 06:47:56 -0700
Message-ID: <CAMKF1sokYen+3WDEtcwL-rLkBJbYJAFOC3UPx=7E=fLUnA6=Sw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lto.inc: Add global LTO distro policy file
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 24, 2020 at 4:37 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, Mar 23, 2020 at 04:25:29PM -0700, Khem Raj wrote:
> >...
> > +LTO_pn-python3 = ""
> >...
>
> Building Python with LTO works by passing --with-lto to configure.

I think per recipe knobs I did not work on yet but perhaps worth
adding them in next release
or may be as packageconfig dependent on lto distro feature
>
> cu
> Adrian
