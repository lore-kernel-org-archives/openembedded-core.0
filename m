Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.8019.1611756479862920796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 06:08:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FWp8xhWk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f54.google.com with SMTP id hs11so2861193ejc.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 06:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6UjbbbImmMLy6fWgDkuYm/eqSDoiQho2X6KOFw7rtfo=;
        b=FWp8xhWkGO4Pp38wr/N7zitmTFmUi0SrAPjWgAih4bCdBNrByTsctTkYQeqwtbhTyg
         hmK9+MchaCxHoXHmuxSZ7ZF2tYtkdmFfH9c9/d/KMa9y6wWv7giItmfmG2yqWOfVqprF
         eW5uTmPB1UIPCtSsGYfiK+TqK7PXUXXlQc3U0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6UjbbbImmMLy6fWgDkuYm/eqSDoiQho2X6KOFw7rtfo=;
        b=ZNmhhFailwMUX0a08mjlp0o3m477CuXnpdGyq5CddFY2rcL1s9hbXhZ94/MpnN9WJa
         LCRZAEDK+c9SOk8BUdnBodLHmiZotA2kHxzH2Y0GZxcd/xp19N1vvJwkzzUBp2D4SSTD
         x4LpvZx6jOILC2RWi4jqPOMGaPxhTBCVAoq7gv8JEy6oX7mxcQ0vSJzQaDKa19wUd5w8
         mzZOYkg4Sdu4TeEDQnFzPAxImp6Ja2valllqkN9EjvbnpG8kF766tbgEzvE+POXRFEbF
         AumdyQ6OElKHRYFjiyKKdj1RE8IgrUM6qr0+8U51iRkeefCxtWxD8s3qx53AwD5ahMXr
         x/lw==
X-Gm-Message-State: AOAM531PcyCBNVONWPFOVvP0BdhYj9P8GpiknZbpBCbHVcsS2Si18MHv
	EyhFK12wSJgVzQ5reMwfuc5Cvg==
X-Google-Smtp-Source: ABdhPJwdepeGOe7uCCs1YHG9GWomTnNwYVg3z8gwEIpPJBnV1DoOOYB2c9BkGU7o8HjrjdxBdYfjqg==
X-Received: by 2002:a17:906:f6d8:: with SMTP id jo24mr6970401ejb.213.1611756478329;
        Wed, 27 Jan 2021 06:07:58 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc? ([2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc])
        by smtp.gmail.com with ESMTPSA id f9sm1364970edm.6.2021.01.27.06.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 06:07:57 -0800 (PST)
Message-ID: <df9b188d261979ad6db7b40befcb9b74bbfd96c4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4] elfutils: split libdebuginfod into its own package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>, Dorinda
	 <dorindabassey@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2021 14:07:54 +0000
In-Reply-To: <20210127133500.zxg6rec7wbguikgk@qschulz>
References: <20210127132712.24952-1-dorindabassey@gmail.com>
	 <20210127133500.zxg6rec7wbguikgk@qschulz>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-01-27 at 14:35 +0100, Quentin Schulz wrote:
> Hi Dorinda,
> 
> On Wed, Jan 27, 2021 at 02:27:12PM +0100, Dorinda wrote:
> > Added package options for libdebuginfod.
> > Added GPLv2+ | LGPLv3+ license for libdebuginfod with reference to https://sourceware.org/git/?p=elfutils.git;a=blob;f=debuginfod/debuginfod-client.c;h=de26af5bb26e187b51d9ea00d5826e199a96d01a;hb=HEAD
> > 
> > [YOCTO #13807]
> > 
> > Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> > ---
> > v4:
> > -changed LIC_FILES_CHKSUM for debuginfod-client.c
> > 
> >  meta/recipes-devtools/elfutils/elfutils_0.182.bb | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/recipes-devtools/elfutils/elfutils_0.182.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
> > index f63208d72b..0b4c30b936 100644
> > --- a/meta/recipes-devtools/elfutils/elfutils_0.182.bb
> > +++ b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
> > @@ -1,8 +1,10 @@
> >  SUMMARY = "Utilities and libraries for handling compiled object files"
> >  HOMEPAGE = "https://sourceware.org/elfutils"
> >  SECTION = "base"
> > -LICENSE = "GPLv2 & LGPLv3+ & GPLv3+"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> > +LICENSE = "GPLv2 & GPLv2+ & LGPLv3+ & GPLv3+"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> > +                    file://debuginfod/debuginfod-client.c;md5=0cf97982735b2ea53f5d7fcd7d88dafe \
> 
> That won't fly. Any change to debuginfod/debuginfod-client.c will
> trigger a build error because of license changes (which isn't
> necessarily the case).
> 
> This makes it harder to upgrade the recipe (usually, just changing the
> recipe version in the filename is enough, and changes to
> LIC_FILES_CHKSUM smell fishy).
> 
> You want to use:
> file://debuginfod/debuginfod-client.c;endline=27;md5=xxxxxx
> 
> c.f. https://docs.yoctoproject.org/dev-manual/common-tasks.html#specifying-the-lic-files-chksum-variable

To be fair I think that was in a previous patch and my comments weren't
clear, I was asking for the ${WORKDIR} piece to be removed but not the
parameters which were correct!

Cheers,

Richard

