Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web11.13328.1586778455421293740
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2020 04:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=gKH6OO/Q;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.67, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f67.google.com with SMTP id bu9so4154403qvb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2020 04:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=0Kj+XkPN2GMwHglPTpNx8WYyQmOrLlm0ubCWZSL+7Dc=;
        b=gKH6OO/QezfLcbWYp/limeiA0gPXTzTrdFzqNHYYDCgP+gknD5u5WtvcU8E6AUxwRI
         tZEu1wshepX0bcgjStpVOurcRDeEzykSa2duuOKjuGytydgTHBiy6K7NYZuEZCSdHHx/
         lMactZNx7xo4/cfOHdQ7a8dwAp6wfCXfSllZX9rpER2/6KwFcMlIs2GnzBza70EYKOE6
         tt18JyxRgau/omq4HWmtuZCNBzJf8y2sLdoiahtYjeQrRoN/vhLRWTUp4qXijvHaxhzG
         yF5PFqPsBLWLR+2l291fuLZQRUTjj+IRAfZtmpQV62g5oedN3ABKA3aEgxyViN8Ndnl7
         7smA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=0Kj+XkPN2GMwHglPTpNx8WYyQmOrLlm0ubCWZSL+7Dc=;
        b=TQLm8Al3zTCVAkABcusWLKmgeRePrKlbtsS0tEEjS3suw87I7XlYtXnmdDcUGVL9+1
         45FvX7pdwqtFtl9B/sKI2RRAtQNnxben9KDS4IWPFHMtSRLbFg88NbkXMaddKS4Oms+T
         aUeFHrVQO+1zXw8jhc13e4rznWec3FC2rnKpwnMKFdhwUdq2mznavDMtsLwts13ZK5Qx
         yNpV41zMMRHAjPrYWO2VvxxzCPBkJWj0aIKpvQhzX95psE1I4MeiCf2tkgN2Ad2/se4w
         RhHEonWjoLcA8zyOpDtYgKCY3noKo6DXs2xQMrAmlXg56KsUmbWYXWR1hosLnJUOSjjA
         JQGw==
X-Gm-Message-State: AGi0PuapB+qX6PZFU7OUqvSVTPh2CpZU8v1jIq4eRpMmnNWP4JSoErBd
	D+j6J1nMeRtStgLmluFb1KmF/BKTDxuMew==
X-Google-Smtp-Source: APiQypKkUFGnU1jUV8qOjgjnNbPsEh2xfzf4JJRPy7CuUSg3bGj+ErNy9xBKuCi7kPISwBFlQMOMaw==
X-Received: by 2002:a0c:e803:: with SMTP id y3mr5505387qvn.117.1586778454253;
        Mon, 13 Apr 2020 04:47:34 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id o6sm8035927qkd.113.2020.04.13.04.47.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 04:47:33 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f54.google.com with SMTP id du18so3747335qvb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2020 04:47:33 -0700 (PDT)
X-Received: by 2002:ad4:5448:: with SMTP id h8mr16654900qvt.23.1586778452769;
 Mon, 13 Apr 2020 04:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200402001431.435999-1-otavio@ossystems.com.br> <20200412210715.GE1578@denix.org>
In-Reply-To: <20200412210715.GE1578@denix.org>
Date: Mon, 13 Apr 2020 08:47:21 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo+r=74d1B3Nu3aX9AfT_tgo9UN8YkzRyUki82fSJZRZQ@mail.gmail.com>
Message-ID: <CAP9ODKo+r=74d1B3Nu3aX9AfT_tgo9UN8YkzRyUki82fSJZRZQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] u-boot: Restore valid default environment for running system
To: Denys Dmytriyenko <denis@denix.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	Stefano Babic <sbabic@denx.de>, Tom Rini <trini@konsulko.com>, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 12, 2020 at 6:07 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > +
> > +        # Generate the uboot-initial-env
> > +        oe_runmake -C ${S} O=${B} u-boot-initial-env
>
> So, why is this enabled unconditionally? Should this be in UBOOT_MAKE_TARGET?
>
> I use this .inc file for building different u-boot pieces by different recipes
> (main u-boot, SPL, etc., etc.) controlling the build with UBOOT_MAKE_TARGET
> below. Now each of those generate u-boot-initial-env and they clash in deploy.

They clash? how so? it generates different filenames so should not have a clash.

> > This change is late in the cycle but it is critical in my opinion.
> >
> > The lack of default environment as well as the configuration for the
> > tool is a regression from the previous release and this mitigates it.
>
> Well, I would rather live w/o env rather than unable to build u-boot at all...

Please provide more information as I did not figure out what is not
working by your report.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
