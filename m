Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.13790.1619798333840681081
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Apr 2021 08:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BXvgihm/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id i21-20020a05600c3555b029012eae2af5d4so1950999wmq.4
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Apr 2021 08:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=9RawlhRGfcbQE5eGc2ouzy7/lA+Q11r5B8VwR/lH+eY=;
        b=BXvgihm/N6WaIGaUBP5k2x9iE8rCs2mZQVAKLWtOenWMtNrga8yVi2ljPoUv8J92Bd
         x2mlwDbodHEzNX0hmhgD6H9cG++IcKWhVSMujZf2v1/7ZFRfH4lWSBYD/T8ZKJYTVI7A
         3ccDbeaokd5yrjfeChqoiAeZPVknbm3bvCSVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9RawlhRGfcbQE5eGc2ouzy7/lA+Q11r5B8VwR/lH+eY=;
        b=O+U9Ijaukz5EzzezAG7MHYRjk09znn8dlNv+wXQldPMrVHR/v5+F29ftySFhC0O2ay
         eYI6lzUQfu6I9z4ypVcdVZIKE8PRwL8SEd1l3khJez9UzLUONjFJfzh1n+0YA7K+4fpR
         E3QaFuPcKdmERjMybcl5wf/4Jq48C1KILT0LuQ8NI96XqJEMp1b8Hx2JGRpKs0sl1Zgm
         OD4VOoHZyjEW9/J0AzPNzet46+9uwSXpbWUUVoWAidd31oH4MYHI5DlVGc0zKqaf5w3a
         bV1Jky8nr+hkYl12plQNdesmgyFZwDo1794DESlz/yryf1svLKGdAC/H0dPJN5+rZ++o
         8tEA==
X-Gm-Message-State: AOAM530wLLC4Kg06WUE/KImB3hfMmX3v+KxO/cbp91M28W3mKiWm2159
	ZXW6hCMEVIgsWe+2cx73Bqnaog==
X-Google-Smtp-Source: ABdhPJyIG8VfJG2WdnNxKsBCQ3VN2wgMNPx0R4vihg6mKZ5PAryTuWydM4wNjwyom32WCqF8JkP3ZQ==
X-Received: by 2002:a1c:f404:: with SMTP id z4mr17678399wma.39.1619798332278;
        Fri, 30 Apr 2021 08:58:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:38ed:4baa:ed1c:e489? ([2001:8b0:aba:5f3c:38ed:4baa:ed1c:e489])
        by smtp.gmail.com with ESMTPSA id n22sm1068097wmo.12.2021.04.30.08.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 08:58:52 -0700 (PDT)
Message-ID: <27e726bde79ae49abcb12b0d028b8d38d2cf77a8.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 07/12] go: Use dl.google.com for SRC_URI
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Apr 2021 16:58:51 +0100
In-Reply-To: <CAOSpxdZpcGXGP_yFzCaneJHwQ+B9_J36c_xoYEeoCKhEigk3FQ@mail.gmail.com>
References: <cover.1619796615.git.steve@sakoman.com>
	 <327b83f6460dc069f22e1ce68f09af12d25ce4bb.1619796615.git.steve@sakoman.com>
	 <01250a308dc7b262963fae41d95c0f1d68b455e6.camel@linuxfoundation.org>
	 <CAOSpxdZpcGXGP_yFzCaneJHwQ+B9_J36c_xoYEeoCKhEigk3FQ@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-04-30 at 05:53 -1000, Steve Sakoman wrote:
> On Fri, Apr 30, 2021 at 5:44 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Fri, 2021-04-30 at 05:33 -1000, Steve Sakoman wrote:
> > > From: Khem Raj <raj.khem@gmail.com>
> > > 
> > > golang.org/dl is resolving to this anyway
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > (cherry picked from commit 8470e38ac1d9f9bb6d8a4ee43724af452d080057)
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > ---
> > >  meta/recipes-devtools/go/go-common.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
> > > index 39a681a712..c368b95b69 100644
> > > --- a/meta/recipes-devtools/go/go-common.inc
> > > +++ b/meta/recipes-devtools/go/go-common.inc
> > > @@ -14,7 +14,7 @@ LICENSE = "BSD-3-Clause"
> > > 
> > > 
> > > 
> > > 
> > >  inherit goarch
> > > 
> > > 
> > > 
> > > 
> > > -SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main"
> > > +SRC_URI = "https://dl.google.com/go/go${PV}.src.tar.gz;name=main"
> > >  S = "${WORKDIR}/go"
> > >  B = "${S}"
> > >  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
> > 
> > 
> > We are seeing autobuilder issues with some go downloads which we may want to
> > resolve before merging this.
> 
> OK, haven't seen those with dunfell but will drop this patch from the
> pull request and monitor master for resolution.

It is this and the https change earlier in your series. It could just be
some corrupt files in DL_DIR but I'd be happier we get this resolved there first.

Cheers,

Richard

