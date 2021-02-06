Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web08.8377.1612628949602007213
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 08:29:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=B3h1Cvim;
 spf=pass (domain: konsulko.com, ip: 209.85.222.177, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f177.google.com with SMTP id 19so10187873qkh.3
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 08:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=gwa1JloCq+gMM1VxDoKps9TDUY0mbDsgonyQQooIIG4=;
        b=B3h1CvimUrufvLE9AsUwPb5AMIihIKxgPIPjm7lrQL3iPYQOuUKYlFZiy6YWLpxB+5
         r8W0GlgihmweNTaxbxHT+rEPdCENqBPlVDxK1l3koEJjVe8wUeAkoBaX9jR24D/14lgJ
         IScAiLyPPdsMN3FeVV4V/mJrp+ACnifK4FJ9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=gwa1JloCq+gMM1VxDoKps9TDUY0mbDsgonyQQooIIG4=;
        b=m1ZYvW1UI2dHuUNbEHcwAdvURCm0omf1cCIt3of2r76lOVBqgTkVMn1xHYfAX+2Ct7
         xj2LC2jDBEk2I9MHk7DnM3SlkVZrt9qMcmN3yJ/EKnQipNDYQiPnafjBy4xZfAld8nRw
         k70K+AtkgY7I2KwLRdq7m/r1sASLAEHZqtws916/MzRYZGEDi0wxuyTbcOvOioQc3ibS
         uzcUvm6oS+mp00vhcEQgpkH4Lsiw6GBhe6oN09r5nThIQGJQki29ZZoD3w6CgRuQsRUi
         eQFGNJFnJMCsbzBKRGA9vyzSaMuHtfA0j3YZLiX7vU4s8j05r4P5kNp//cKcDQygUHa/
         UjqQ==
X-Gm-Message-State: AOAM533TDzUDXGVLoNebBlDOV5kQjT35kknl+sZvDhh5gv8/Jzb/s11P
	x7iYjQWvRH3tdFLshOEqsm89Rw==
X-Google-Smtp-Source: ABdhPJyzDN9sV2WmQBIBpeVIRFYNJ/zNypQKGrSnhUaELIZrjmz5HHy9G9A5vCyOLyl9PV4TziKA/w==
X-Received: by 2002:a37:a390:: with SMTP id m138mr9401007qke.309.1612628948732;
        Sat, 06 Feb 2021 08:29:08 -0800 (PST)
Return-Path: <scott.murray@konsulko.com>
Received: from godzilla (198-84-179-103.cpe.teksavvy.com. [198.84.179.103])
        by smtp.gmail.com with ESMTPSA id c12sm12111236qkg.118.2021.02.06.08.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 08:29:08 -0800 (PST)
Date: Sat, 6 Feb 2021 11:28:50 -0500 (EST)
From: "Scott Murray" <scott.murray@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
cc: openembedded-core@lists.openembedded.org, 
    Ross Burton <ross.burton@arm.com>
Subject: Re: [OE-core] [PATCH 07/10] autoconf: upgrade to 2.7.1
In-Reply-To: <20210206090415.1707868-7-richard.purdie@linuxfoundation.org>
Message-ID: <34bdd977-967c-85ad-d4ca-60226920afb@spiteful.org>
References: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org> <20210206090415.1707868-7-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 6 Feb 2021, Richard Purdie wrote:

> From: Ross Burton <ross.burton@arm.com>
>
> After too many years, autoconf has made a new release.  On the whole it
> is compatible with previous releases, but some macros are more specific
> about what they expose so minor tweaks to configure.ac may be required.
>
> autoconf also now invokes intltoolize, gtkdocize, and copies
> config.sub/guess, so there is less work for autotools.bbclass to do.
>
> - AC_HEADER_MAJOR-port-to-glibc-2.25.patch
> - add_musl_config.patch
> - autoconf-replace-w-option-in-shebangs-with-modern-use-warnings.patch
> - autoreconf-gnuconfigize.patch
> - check-automake-cross-warning.patch
> - config_site.patch
> - fix_path_xtra.patch
> - performance.patch
> Drop a number of patches which have been integrated upstream.
>
> - man-host-perl.patch
> Don't use the target perl path when building documentation at build time:
>
> - no-man.patch
> Don't build documentation in native builds to avoid further build
> dependencies.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>

[snip]

Small typo, subject should be "autoconf: upgrade to 2.71" (not 2.7.1).

Scott
