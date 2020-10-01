Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.4021.1601572079858564789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 10:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XiZs/Be1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id e11so2681543wme.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2020 10:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=iN2yUrSuBi/98NXn7Wd3H4A09TldzphruajR1UpauC0=;
        b=XiZs/Be1NTeTG2Skb1wbcJKeC5lH1ygZd00GD3smDExxgOtnzZJUW3B0OvlLv4HLzf
         J8chpPzf7WHL3TFTHz4DbcH4kyorbfUD9LvX9NZJPk9vlrxezCyJXe2Xn1z4EaSis3At
         MgqYKBMhCD9L77dAffC14Hz/zNNGZI1PmCe+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iN2yUrSuBi/98NXn7Wd3H4A09TldzphruajR1UpauC0=;
        b=W7oSFjbOOUhdSSUMZz13H4cEWnuf7eXb0ePArKUypQnOs1H+sHFQzvDe+4dlhxCTal
         2AHkkUxIYNTMnoVZcIWcD/hbB99gKNJQEmqq6VVFn3KKVIxZ/AaP/DLIIqtOmQ6c4JvI
         KRIGLT3+bz3BO5dFCXADVDBPTcX9+gwvvRRG138cp6dmDCD4MiOZL1cthxh3YOMDd6sl
         5I+RjxzoemWtjUWm7wQcGExOSWqELcg8ySwxlE2oueL7zWHCAdHcO9FAPl7O3orb1NQB
         Us2uNZOMVrTlu/zmS4TYQ+D4XZdKQszsVV9jYGq969OiyAmcbq78lzbW3xyAjQbWBkPs
         awJw==
X-Gm-Message-State: AOAM532HNqxmdjBtx15w5CYAuKydSB8ELm6YLc+ow+PR6/Ircl4SpuZ9
	MaGKPn3JP7m56pX5kGCReMElIw==
X-Google-Smtp-Source: ABdhPJxBi6wl+CJwGzU8bjQcSeUAozIE1sXo/BPH+RDITL39+MMK4lTanqOFnJW6rHbPR+tKW+1hqg==
X-Received: by 2002:a1c:7f8b:: with SMTP id a133mr1036014wmd.155.1601572078169;
        Thu, 01 Oct 2020 10:07:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9c3e:7322:3204:3cf7])
        by smtp.gmail.com with ESMTPSA id k6sm801620wmi.1.2020.10.01.10.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 10:07:44 -0700 (PDT)
Message-ID: <9d4997385b6095a0569babae0eb1241274cd9e2e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] coreutils: improve coreutils-ptest RDEPENDS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 01 Oct 2020 18:07:41 +0100
In-Reply-To: <20201001161111.2889773-1-ross.burton@arm.com>
References: <20201001161111.2889773-1-ross.burton@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-01 at 17:11 +0100, Ross Burton wrote:
> Add perl-modules to the RDEPENDS to avoid having to list all perl
> modules that are required, as this package isn't going to be
> installed
> outside of testing builds.
> 
> Remove libmodule-build-perl from RDEPENDS, it appears that this isn't
> needed anymore. With and without this package the test results on my
> image are the same: 619 tests, 462 pass, 154 skip, 3 fail.  This
> *drastically* reduces the build impact of enabling ptest as
> packagegroup-core-build-essential (thus target gcc) is in the
> dependency
> chain.

When you tested that, did you actually test an image just with the
coreutils ptest installed? That was how we exposed this originally and
without it, the test results werent' consistent.

Cheers,

Richard

