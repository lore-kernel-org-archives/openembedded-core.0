Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.14205.1588457983081571446
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 15:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SvuWxOuv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id f13so16298221wrm.13
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2020 15:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=vYwqfnacK88nhdiLF2gq+RENzhY/S5EFIORffJQYjzE=;
        b=SvuWxOuv7hjRcDN4ycJdjcStDSWXMMAnXfu7oLXZ60ALoIB47fBvTKXGWetmGqKLbW
         GdrUuq8HR7R+oX7OZjHjg7L+QyXmxFTbZJPy17rkhs9wrItKF1rNGaMQ8SorzXsQrhFR
         o/6WsILExqC/Z13iznIG3EAOFpkJ9MCBZZMLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vYwqfnacK88nhdiLF2gq+RENzhY/S5EFIORffJQYjzE=;
        b=oGdVW/+RYDKX/in/0zDN4N4Gqp+wa39gnNwwLv0F0taLnEnXWliMwelqg8SPgXYJIR
         cZ9BdpzLZKyou+dbXbI6fRujnPFeMaoqv5VwP56MSo6j8aWxUaAu2R48Q8kZmregEMlD
         Jum4vM7qAUPgfQAnN7OsFJvCD3RH6VbS+8oDV+y9LY3eEg0nFPhhiADcBWdkJ0745JBp
         rLNcy1nRiOp/yCp2XwLXwI8Y93JrUZWfXR+oWBnyjaYVZVj4wyHVg4tDv602x5rsEpMk
         1WwINESH87rs0KA8WsVyHfwQ6BGgcxf28O67hhqCOAnYXrJJJzbGHkK349i2BRBZobNc
         k5hw==
X-Gm-Message-State: AGi0PuZmAr23WnJZnNAg/JuozWI9dZ5HzUXgpNR/IiRkzI9uqU8zezW2
	8/TEX6J8bc8js8PVnQKXnhIq1M1hi6U=
X-Google-Smtp-Source: APiQypLa7hKQyEnlty5cLD/MIoAPcd9VGfwBPYBgS08pxs8jgZb6TXMl/daj9iRLstR0QWpkj//UbA==
X-Received: by 2002:adf:f24c:: with SMTP id b12mr11113981wrp.359.1588457981083;
        Sat, 02 May 2020 15:19:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id g6sm11508956wrw.34.2020.05.02.15.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 15:19:40 -0700 (PDT)
Message-ID: <104c5a968efb5c054f171c124eb5ae689090bc1f.camel@linuxfoundation.org>
Subject: Re: [OE-core] Failure when generating image with latest OE-Core
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Date: Sat, 02 May 2020 23:19:39 +0100
In-Reply-To: <0a65790cfa0f43659d0cec942d729b1a@XBOX03.axis.com>
References: <0a65790cfa0f43659d0cec942d729b1a@XBOX03.axis.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-05-02 at 16:27 +0000, Peter Kjellerstedt wrote:
> After upgrading to the latest master of OE-Core, I get the following 
> error when building an image:
> 
> DNF version: 4.2.21
> cachedir: <image workdir>/rootfs/var/cache/dnf
> Added oe-repo repo from <image workdir>/oe-rootfs-repo
> User-Agent: falling back to 'libdnf': could not detect OS or basearch
> repo: using cache for: oe-repo
> oe-repo: using metadata from Sat 02 May 2020 04:04:01 PM UTC.
> Excludes in dnf.conf: rng-tools, shared-mime-info, udev-hwdb
> --> Starting dependency resolution
> History database cannot be created: <image
> workdir>/rootfs/var/lib/dnf/history.sqlite. Error: SQLite error on
> ":memory:": Executing an SQL statement failed: no such column: 1.2
> ---> Package <internal package> <version> will be installed
> History database cannot be created: <image
> workdir>/rootfs/var/lib/dnf/history.sqlite. Error: SQLite error on
> ":memory:": Executing an SQL statement failed: no such column: 1.2
> Error: SQLite error on ":memory:": Executing an SQL statement failed:
> no such column: 1.2
> 
> I assume it is related to the recent rpm/dnf update. 
> Any ideas on what's going on?

Was this a build from scratch with a clean TMPDIR or an existing build
directory?

Cheers,

Richard

