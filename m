Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.10577.1611766901360360600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 09:01:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KBD3XezI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id o10so3683763wmc.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 09:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=J61S+kcRm7T08AsZq1CmRk8AIkzhBKzkttXn3+a4/kQ=;
        b=KBD3XezIS3CfVqBtT6pUdF5r0TZThCzEeWKPBsmKBP0i7SmspvpuoNv9emhZuD4mgg
         qH5BOYbtZBcBbbgIvmxmoEF7U6kSr4izZY4z7zmnxlVZMjpLDGogbiXf5vzLOi9DLGMc
         fIpvkjgA+Jq+oxctFdO7tDVnORHizMq4ArhB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=J61S+kcRm7T08AsZq1CmRk8AIkzhBKzkttXn3+a4/kQ=;
        b=BOJXOMnCH8xTuPKlBsV37c72Z/Fx5ny2k0qLVbQ275aHrnK0eTyD9cwcNbGuvBWY2b
         8M1aXV6PM2w85EghPnoU2f9vodjYFSM4HHRVPXYV+1HMKOHBmQXxNIQrQRvQTfHY1+PU
         ooZRvOQkWWMMqkejzfM0c5ZdJMamma+FOO6fKeBSNwaH1499K/asK1n62UcBNM/WJwJe
         9hbI1bDW3DTcMqWthjux5iEKvIX/TEQPtkAL4vSys+k1zp7YRS/DXL6/Zzi5L5fb/twq
         mSm0MLasuxTNzFhMTgLqGlZxKYJNkTe8QyoFOzT6aV+WH5cNPJhjMEjVLgjtJJQDlCh6
         cySQ==
X-Gm-Message-State: AOAM532hYxOLg7HJDfuDy8B9NPYemfETc84lGLrcWE2003tuv6H71MKw
	H6MGGGdPiTpd7qoFvWFZIjaBag==
X-Google-Smtp-Source: ABdhPJyjVWaHQMgCTIRuYtbVVOsjzIdKoWged+114Se4ufjvMKCDod1qSEN0wbk3yWRXtoDqM4U/DQ==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id g19mr4957401wmq.95.1611766899814;
        Wed, 27 Jan 2021 09:01:39 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc? ([2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc])
        by smtp.gmail.com with ESMTPSA id v4sm4091147wrw.42.2021.01.27.09.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 09:01:39 -0800 (PST)
Message-ID: <fd0a039b6db0bfa994bf606d6fd54a10b22afdca.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] openssl: set CVE_VERSION_SUFFIX
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@bmw.de>, chee.yang.lee@intel.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2021 17:01:38 +0000
In-Reply-To: <YBEuh09lQvJAvmqv@korppu>
References: <20210127090354.25091-1-chee.yang.lee@intel.com>
	 <20210127090354.25091-2-chee.yang.lee@intel.com> <YBEuh09lQvJAvmqv@korppu>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-01-27 at 09:12 +0000, Mikko Rapeli wrote:
> On Wed, Jan 27, 2021 at 05:03:54PM +0800, Lee Chee Yang wrote:
> > From: Lee Chee Yang <chee.yang.lee@intel.com>
> > 
> > Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> > ---
> >  meta/recipes-connectivity/openssl/openssl_1.1.1i.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> > index 52e96b7831..9ff80b3d4f 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> > @@ -230,6 +230,8 @@ BBCLASSEXTEND = "native nativesdk"
> >  
> > 
> > 
> > 
> >  CVE_PRODUCT = "openssl:openssl"
> >  
> > 
> > 
> > 
> > +CVE_VERSION_SUFFIX = "alphabetical"
> > +
> 
> I have to say that I don't like this. I'd prefer automation
> which works like dpkg --compare-versions:
> 
>        --compare-versions ver1 op ver2
>               Compare version numbers, where op is a binary operator. dpkg returns true (0) if the specified condition is satisfied,
>               and  false  (1)  otherwise.  There  are two groups of operators, which differ in how they treat an empty ver1 or ver2.
>               These treat an empty version as earlier than any version: lt le eq ne ge gt. These treat an  empty  version  as  later
>               than any version: lt-nl le-nl ge-nl gt-nl. These are provided only for compatibility with control file syntax: < << <=
>               = >= >> >. The < and > operators are obsolete and should not be used, due to confusing semantics. To illustrate: 0.1 <
>               0.1 evaluates to true.

The trouble is we have no control over what versions end up in the CPEs
and I suspect that even dpkg's version comparison doesn't work for some
of our test cases?

If it does, it would be useful to understand how they're managing to do
that as I think some of the patterns conflict as I understand it.

Debian can make it work for their packages since they control what
version they ultimately assign to them.

Cheers,

Richard



