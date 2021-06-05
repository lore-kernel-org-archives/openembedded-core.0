Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.13310.1622906037346678373
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jun 2021 08:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vu0uOohe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id u7so6794567wrs.10
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jun 2021 08:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=RvOphRQeeY8myP8jKQf6aeWZmXMRgxZVmoXzZkiGY60=;
        b=Vu0uOoheEaHDvCS1xQdrA48hB/JwVGKbkKA9N5sAGbzL7illF9IjLcO3ZgaUfY2mra
         CI4chYD1q335O/MvMvqT9ulHe//xeYJJk94Gp0Y5kuhk8bXAEZOzmDEsIQC3DSX0WNjr
         n2ICZ5YuqAMDMQeWoow3sZLNP+c9UlxB1QQpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RvOphRQeeY8myP8jKQf6aeWZmXMRgxZVmoXzZkiGY60=;
        b=cLp2uwoOQxzPe1OQu3V9UDEgxdhmxolwkc0SCAHa5PexdN/7XefJBOL9GQ7z04PHby
         QN2buzzNSMo4kWwiXZyL0ureoe5b+yuA8EqQrdUVJxK31S58G+QaKAmHjDVMDlp6bozP
         cjWux/m3n4h51SBV47m71N1L53hYbjGUCFx4O0Tbi4tJBJmsABmERG9sxfg4SChuUIvq
         Y2Xf+KhKPushARob0XuFsOEgWZRseKSaj3QqvfcgO3+RbNYRpb8XDYfGwEM6eXNeX1i0
         rSJv00wpqVj5xQM0XhGJmPo4IznXJFMfLHMUPhIH/HnZDs4PPpdUKTW8A1fp6K0DBqzG
         RC8Q==
X-Gm-Message-State: AOAM531GkewmUc9WJVj9UMUyF0AKxSAZloltV/XHVJenY8k+YMHtgpU7
	F/cuE1bOvs8nUO908ATTQPcqkg==
X-Google-Smtp-Source: ABdhPJz/S5hbZWR9PFFGQPB8Or9xh2wdPuwwuxlu9PHemss3fGIfYydvgEQdYRR0aGs8dkkBC2xHZg==
X-Received: by 2002:a05:6000:154c:: with SMTP id 12mr6313561wry.126.1622906035493;
        Sat, 05 Jun 2021 08:13:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5b89:f6cd:8040:62ea? ([2001:8b0:aba:5f3c:5b89:f6cd:8040:62ea])
        by smtp.gmail.com with ESMTPSA id r4sm10154605wre.84.2021.06.05.08.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 08:13:55 -0700 (PDT)
Message-ID: <f9cc3da4399fcca66a9c43638dcf4eca162ba23a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 05 Jun 2021 16:13:53 +0100
In-Reply-To: <1685B658849E960A.4717@lists.openembedded.org>
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
	 <20210604091458.1381144-4-alex.kanavin@gmail.com>
	 <1685B658849E960A.4717@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2021-06-05 at 15:35 +0100, Richard Purdie via lists.openembedded.org wrote:
> On Fri, 2021-06-04 at 11:14 +0200, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../cmake/{cmake-native_3.20.2.bb => cmake-native_3.20.3.bb}    | 0
> >  meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
> >  .../recipes-devtools/cmake/{cmake_3.20.2.bb => cmake_3.20.3.bb} | 0
> >  3 files changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-devtools/cmake/{cmake-native_3.20.2.bb => cmake-native_3.20.3.bb} (100%)
> >  rename meta/recipes-devtools/cmake/{cmake_3.20.2.bb => cmake_3.20.3.bb} (100%)
> > 
> > diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.20.3.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/cmake/cmake-native_3.20.2.bb
> > rename to meta/recipes-devtools/cmake/cmake-native_3.20.3.bb
> > diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> > index be43760628..0987c01c87 100644
> > --- a/meta/recipes-devtools/cmake/cmake.inc
> > +++ b/meta/recipes-devtools/cmake/cmake.inc
> > @@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
> >             file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
> >  "
> >  
> > 
> > 
> > 
> > -SRC_URI[sha256sum] = "aecf6ecb975179eb3bb6a4a50cae192d41e92b9372b02300f9e8f1d5f559544e"
> > +SRC_URI[sha256sum] = "4d008ac3461e271fcfac26a05936f77fc7ab64402156fb371d41284851a651b8"
> >  
> > 
> > 
> > 
> >  UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
> >  
> > 
> > 
> > 
> > diff --git a/meta/recipes-devtools/cmake/cmake_3.20.2.bb b/meta/recipes-devtools/cmake/cmake_3.20.3.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/cmake/cmake_3.20.2.bb
> > rename to meta/recipes-devtools/cmake/cmake_3.20.3.bb
> 
> Seems there is some intermittent issue that the cmake upgrade brings in:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/3509/steps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3513/steps/12/logs/stdio
> 
> yet the latter passed in:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3514

Re-ran it on centos8 and it failed:

https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3515

so this looks to be centos8 specific.

Cheers,

Richard

