Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.11791.1612884242784695664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:24:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S6aJwfe/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id f16so3538765wmq.5
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 07:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=mLWVKo+0oUO58ddikvliKWd1VaK3rdDwk9I9ycHbJSQ=;
        b=S6aJwfe/WaEDRerCkh0dnx+KTy7fWSX/mMk34caI9TnsTF4XHzIM78HT1PhgUGSHn6
         uA/eb0gEH0pR/jK6rAsvhBFQv72UuNmn/orWoD9sFbI4m3KgsBV9lEc1AJZmnIL/5qpl
         3BtZVLkHW8Hhp1XTbtA6H9hubGvVm5FzI1kes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mLWVKo+0oUO58ddikvliKWd1VaK3rdDwk9I9ycHbJSQ=;
        b=P8iHbhTdAYGq3WtpfOdTCXjqFK2CPVE8jqvTSBZ+kOoA9VvMFMX3fpbrlfm+qND314
         EaZ0u5KcPA4FACeehIwTpmZo//afImfrW0lfetm9nZSYQzyrUf/sxjd7P4KmKuWwjHEE
         c+VO4yPfMQFoSYnmNVX2sfNAInARoVBURwp3yvWeuGeQQ8XfNc/AuYc02npUNQ41ZmVU
         iW7P2sdAMeQ6IMVVRkWXSevJSB4oVT6A7QW7HQfRn7yjeATEoHwbPqbb+PlBKDWOdtZ4
         yK5GsQY0y0s9+YoQg35LtoJ+dGTa3sh/5c5RT7XzbVxOPRAYVn2Ayt4lTuZCH8uHp1kN
         c6qA==
X-Gm-Message-State: AOAM530r9PlM+QGvqAaTAEXwmcpb/huXUi1a/V37Z9Xfq75GI5db2Q2a
	HOCLdyL836XO+XS5p+Mi0P6iHA==
X-Google-Smtp-Source: ABdhPJw1y0CZ30/iPJn+cyJR6GOi4LuFYQCPXH5AH1sxetx0Vkd5mma3KnSgAfFNv+cxUzHwKh6w2Q==
X-Received: by 2002:a05:600c:230c:: with SMTP id 12mr4009531wmo.30.1612884241214;
        Tue, 09 Feb 2021 07:24:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6e64:a4a9:6e48:217c? ([2001:8b0:aba:5f3c:6e64:a4a9:6e48:217c])
        by smtp.gmail.com with ESMTPSA id t8sm4577539wmq.36.2021.02.09.07.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 07:24:00 -0800 (PST)
Message-ID: <12e761e8a4cc8f4e5f319bbee76748b6916aef1b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] opkg: Fix patch glitches
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 09 Feb 2021 15:23:59 +0000
In-Reply-To: <CAGgRHJpP0B8RUnDwT5vyTApstFggmQPfXWd5xuF8iKUsX4i-Sw@mail.gmail.com>
References: <20210209143439.1807422-1-richard.purdie@linuxfoundation.org>
	 <CAGgRHJpP0B8RUnDwT5vyTApstFggmQPfXWd5xuF8iKUsX4i-Sw@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-02-09 at 07:16 -0800, Matt Madison wrote:
> 
> 
> On Tue, Feb 9, 2021 at 6:34 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > The original patch contained some text which shouldn't have been
> > there
> > and used brackets in configure which isn't a great idea. Tweak the
> > patch
> > to resolve this.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
> > b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
> > index 285d258c635..6d0b1486ad3 100644
> > --- a/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
> > +++ b/meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
> > @@ -9,13 +9,12 @@ Index: opkg-0.4.4/configure.ac
> >  ==================================================================
> > =
> >  --- opkg-0.4.4.orig/configure.ac
> >  +++ opkg-0.4.4/configure.ac
> > -@@ -281,7 +281,12 @@ AC_FUNC_UTIME_NULL
> > +@@ -281,7 +281,11 @@ AC_FUNC_UTIME_NULL
> >   AC_FUNC_VPRINTF
> >   AC_CHECK_FUNCS([memmove memset mkdir regcomp strchr strcspn
> > strdup strerror strndup strrchr strstr strtol strtoul sysinfo
> > utime])
> > 
> >  -CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
> > -+1607446883
> > -+if [ ! -z "$SOURCE_DATE_EPOCH" ]; then
> > ++if ! -z "$SOURCE_DATE_EPOCH" ; then
> > 
> 
> This doesn't look like valid shell syntax - there should be a 'test'
> command before the '!', right?
> Or change the whole thing to use AS_IF.

Well spotted. I somehow grabbed a half complete version, trying to
juggle too many things at once I think. I've fixed it on the branch,
third time lucky :/.

Cheers,

Richard


