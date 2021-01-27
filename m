Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.11224.1611769214056943269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 09:40:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KsgqG5Jk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f45.google.com with SMTP id z22so3442202edb.9
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 09:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=eKRXkISqaZGHU7AitsbHnrQO78gmfVDhLx/+xRtbkXc=;
        b=KsgqG5Jk7dypZsfxgU16e3c58IyW/QeORsQtIU7dOnyG4KhTFGPICfnhcYTLGXGmhO
         V87sbCLh6J9Z4x3rrOCX/MLihGoS+OpTj1Pqn3wwrZPBx+KnlUev73vdcNHfHMoT2ajk
         h6jo+Z4RwQTfkeM3wxZsYKLk2v+MhBFZN6NHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=eKRXkISqaZGHU7AitsbHnrQO78gmfVDhLx/+xRtbkXc=;
        b=e4FhjcFCazQCub3x4yAjOWUWba/THDpxUmKenWFKLpg2bvMJ8iJkrr4qnVhZ4G99e0
         uTMmH57SAaubzV+/rzT3rCtWNDy3YHcZ9fTQU5IqX5kyVKhb/5Q7JLgOu5Rrt7sgRhnk
         CLzVN5UKWLNjOYeqdBQhEBrxR/yNYWwEd1L+FZ7GBtT1bLmZUe8a+QHDzGAImVjXDoyn
         T628GOKAg0QSdU4T2KPHUO3Pi4Mp5zyz3UB5RYZ2z5Yebg5NSrmaS3hu4akNZo2yMjNE
         dbsrbkpYR8tiA/6uK85Pxc/7rcyToEi6csNI8pGzoYRySeQ9bb7sxBZ+lzAAfumEf988
         +Sfg==
X-Gm-Message-State: AOAM532dSQZWycDgyaPYA+QSc7Loqx0eMf1BTepdQSrSks1/oYagmHJJ
	9pV8VKSUXAfvzr/0OlVG5HgaRw==
X-Google-Smtp-Source: ABdhPJxIfDUXvSLPMEhwYu7iiVOdw7zLmv23SBdDvPR1NZsi8th6HZQ8eM3KJE/gSX/HdY1QT0RJFw==
X-Received: by 2002:a05:6402:27d1:: with SMTP id c17mr10056185ede.109.1611769212501;
        Wed, 27 Jan 2021 09:40:12 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc? ([2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc])
        by smtp.gmail.com with ESMTPSA id i22sm1135080ejx.77.2021.01.27.09.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 09:40:12 -0800 (PST)
Message-ID: <21627f968cce11a5547e135742b8d740c3a7f7b2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] openssl: set CVE_VERSION_SUFFIX
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de
Cc: chee.yang.lee@intel.com, openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2021 17:40:09 +0000
In-Reply-To: <YBGezLdwMjy/faKV@korppu>
References: <20210127090354.25091-1-chee.yang.lee@intel.com>
	 <20210127090354.25091-2-chee.yang.lee@intel.com> <YBEuh09lQvJAvmqv@korppu>
	 <fd0a039b6db0bfa994bf606d6fd54a10b22afdca.camel@linuxfoundation.org>
	 <YBGezLdwMjy/faKV@korppu>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-01-27 at 17:11 +0000, Mikko.Rapeli@bmw.de wrote:
> Hi,
> 
> On Wed, Jan 27, 2021 at 05:01:38PM +0000, Richard Purdie wrote:
> > On Wed, 2021-01-27 at 09:12 +0000, Mikko Rapeli wrote:
> > > On Wed, Jan 27, 2021 at 05:03:54PM +0800, Lee Chee Yang wrote:
> > > > From: Lee Chee Yang <chee.yang.lee@intel.com>
> > > > 
> > > > Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> > > > ---
> > > >  meta/recipes-connectivity/openssl/openssl_1.1.1i.bb | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> > > > index 52e96b7831..9ff80b3d4f 100644
> > > > --- a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> > > > +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
> > > > @@ -230,6 +230,8 @@ BBCLASSEXTEND = "native nativesdk"
> > > >  
> > > > 
> > > > 
> > > > 
> > > >  CVE_PRODUCT = "openssl:openssl"
> > > >  
> > > > 
> > > > 
> > > > 
> > > > +CVE_VERSION_SUFFIX = "alphabetical"
> > > > +
> > > 
> > > I have to say that I don't like this. I'd prefer automation
> > > which works like dpkg --compare-versions:
> > > 
> > >        --compare-versions ver1 op ver2
> > >               Compare version numbers, where op is a binary operator. dpkg returns true (0) if the specified condition is satisfied,
> > >               and  false  (1)  otherwise.  There  are two groups of operators, which differ in how they treat an empty ver1 or ver2.
> > >               These treat an empty version as earlier than any version: lt le eq ne ge gt. These treat an  empty  version  as  later
> > >               than any version: lt-nl le-nl ge-nl gt-nl. These are provided only for compatibility with control file syntax: < << <=
> > >               = >= >> >. The < and > operators are obsolete and should not be used, due to confusing semantics. To illustrate: 0.1 <
> > >               0.1 evaluates to true.
> > 
> > The trouble is we have no control over what versions end up in the CPEs
> > and I suspect that even dpkg's version comparison doesn't work for some
> > of our test cases?
> 
> For example:
> 
> $ dpkg --compare-versions 1.1.1i lt 1.1.1j && echo true
> true
> 
> dpkg can tell that 1.1.1i older version than 1.1.1j.
> 
> $ dpkg --compare-versions 1.1.1i lt 1.1.1e || echo not older
> not older
> 
> and dpkg can tell that 1.1.1i is not older than 1.1.1e.

I think the problem is things like:

$ dpkg --compare-versions 1.1.1 gt 1.1.1pre0; echo $?
1
$ dpkg --compare-versions 1.1.1 gt 1.1.0; echo $?
0

which we can disallow in OE's version fields but not in upstream CPE
entries :(

Cheers,

Richard



