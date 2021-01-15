Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.309.1610711416469539552
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 03:50:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hWOp6fSS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id g10so7353188wmh.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 03:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Cr3hFKRm/DXEqtQJWmVTzNAZBUBwV8CEjg5GlKneSe4=;
        b=hWOp6fSSIhaSYXm30zSu9FBYZk4u8T4g3krTWR6YlxKHfHRKx51VLGIsAQLcJv7peb
         yPIQKo0yj6//ogKBPIZxQggCEEPrIORhqXQ8Cgyd1ByCTsioVrkJgiUbl90WWHqVu+87
         hP51s247oSsCd3zGBajjxxgdLYL48FgzCUI2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Cr3hFKRm/DXEqtQJWmVTzNAZBUBwV8CEjg5GlKneSe4=;
        b=YuHoAFihnnggaaKIpu4p1L+ZKsgLrsfgUbH73DzAvSUYM+nDgPt0e8PnblKpYIV1iy
         DO7jArGTIV6rxlWaOlRjfXuS3Jlxo7M9vlXSpPcyDw/dL/ncV6N2WjF3SfNMpKp41OYv
         I+TtsMehi6ORKKrSkCAEzqVvR9dCZ5Y8hXNKcZWm79r6k4lbNAkezX3oCQQm9H4EP8B4
         dONVAqqFKu4CXxRg41b7WjZZ2AEoVIauXRmiEFnvRdqloi9odUAsOX6letJu6hqmlW2T
         rseMBsooUPfbEp2S1IX4HZAoBWvg/MIYoHT5iCYe1ISdv8qMJvc4gADaSkJa9tXVXlxD
         mzwQ==
X-Gm-Message-State: AOAM5339PeGi3lG1uNXqDzyNl23BErtT2VgI3G39fZR3Qf2JDo9+LdsL
	a+1L42+JPwLYk55GQWK8rCF1Ug==
X-Google-Smtp-Source: ABdhPJzTm1CWXaEsHbSKpPXoj0RyRWvBfrS+kQm4ZjdbuPwiPzi4x27xSTyepT5HfvioiS18DtDSTQ==
X-Received: by 2002:a1c:96d7:: with SMTP id y206mr8459432wmd.9.1610711415091;
        Fri, 15 Jan 2021 03:50:15 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:974a:2423:c71:b423? ([2001:8b0:aba:5f3c:974a:2423:c71:b423])
        by smtp.gmail.com with ESMTPSA id e15sm14929263wrx.86.2021.01.15.03.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 03:50:14 -0800 (PST)
Message-ID: <b0d62ff669b3f4fd6c30356681d243d526c743cc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][dunfell][gatesgarth][master] cairo: whitelist CVE-2013-0800
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2021 11:50:13 +0000
In-Reply-To: <YAGArK89wZmPcFLQ@korppu>
References: <20210115104714.36449-1-mikko.rapeli@bmw.de>
	 <502f246c4bf113fb8ae4c6c3db0bc5c1b8ee23d4.camel@linuxfoundation.org>
	 <YAGArK89wZmPcFLQ@korppu>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-15 at 11:46 +0000, Mikko.Rapeli@bmw.de wrote:
> On Fri, Jan 15, 2021 at 11:23:39AM +0000, Richard Purdie wrote:
> > On Fri, 2021-01-15 at 12:47 +0200, Mikko Rapeli wrote:
> > > It affects only cairo embedded into Firefox.
> > > 
> > > https://security-tracker.debian.org/tracker/CVE-2013-0800
> > > 
> > > "The description is misleading: Firefox embeds a copy of Cairo, the interdiff
> > > shows the respective change at mozilla-esr17/gfx/cairo/cairo/src/cairo-image-surface.c
> > > Apparently the forked copy has changed, the code isn't present in vanilla Cairo"
> > > 
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > > ---
> > >  meta/recipes-graphics/cairo/cairo_1.16.0.bb | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > > index 8663dec404..29088ab0d6 100644
> > > --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > > +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> > > @@ -29,6 +29,9 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
> > >             file://CVE-2019-6462.patch \
> > >            "
> > >  
> > > 
> > > 
> > > 
> > > +# Affects only embedded cairo in Firefox
> > > +CVE_CHECK_WHITELIST += "CVE-2013-0800"
> > > +
> > 
> > That sounds a lot like we should send a CPE change upstream to classify
> > it as firefox rather than cairo?
> 
> Ok, I sent an email to cpe_dictionary@nist.gov for removal of
> "cpe:2.3:a:cairographics:cairo:-:*:*:*:*:*:*:*" from CVE-2013-0800 data citing
> the Debian details.
> 
> I hope this was the correct way to do this.

Sounds good to me, thanks!

Cheers,

Richard

