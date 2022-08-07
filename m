Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D36C19F2A
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 14:07:31 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.13815.1659881242951971333
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 07:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K2B8MPaL;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id gk3so12330646ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 07:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc;
        bh=vlPSGy2D8E/jyU53x/xxK7vmqK3/H/ZqVVXznN4Rrao=;
        b=K2B8MPaLkgwckM48dQ21uTAlQTvp/+zmIU3yHM9WDPvxtV+hkPW8fqYy1T0XRcK17m
         xOEuXWpPwQaW20ZQawNgTxIiqEw1QdMm3GPAbBntqzcGtdC9IcFXz/QtbkNbYr78gaxF
         +MgGLFxdmlJVsuNN6E7WGWMJxZY1iYd0F1ELt9ULPDtMOA5ZSmhXHD7+gVQgP4rW0SQF
         yF7bBUPeiCnexVzWx5XiUrPpg/PugCAHGWvwTLhyxq/RCWhWfv8VBiU5s1EstomAy0B9
         QzUgwinDA6Wts8lfkU5dnY0ryxDE4013gTW3zz6n9YDcbErrG1D2+hTZOivRGwk+Bzl1
         iB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc;
        bh=vlPSGy2D8E/jyU53x/xxK7vmqK3/H/ZqVVXznN4Rrao=;
        b=wTV3S/V3F1kNgTBgh2ax+tLUbftt2bJsSsTuN3fyw4bu65NvwF0q3itle3S1AxVXDs
         MapuFNdVWRlYpUZ6pI/26BYjSU5P1N4RtQmnCPs7ji6AoZJ/qudK9zGep3IsNDTtzIAu
         xIk4NmuRBkFCtRUTZ8+qlf6iC+gGQA2gvnwVj46BbxMfMl4LYq3EErCpqIjjrOVH23RT
         qMa69nuD4Eyv+3gq74c9R3X9jZ9YYFh5a0VZ7VhDpmLrqPOSUFmkC9ybthCpb01XUby5
         HskThb6vzppnbKF7pOLkr9ZCok2YoRR7I24xUNIt7VDysguWADOaN7i6zvpAoPX3n3Cl
         Mckg==
X-Gm-Message-State: ACgBeo35rf5p2Ao4cyuUkrSbtTf6klgVnEjyj1+Bp+o2YGtkN1XjkxUU
	930aS+VB88aC4RFP1DjQ6YI=
X-Google-Smtp-Source: 
 AA6agR7OcKwKEwQP+VcYVx0ZA+6gfjO/N8YTtu0wv9LvYny0t85MMO7YkReC3iXzjYqb8ozffmUjKA==
X-Received: by 2002:a17:907:28d6:b0:731:100c:8999 with SMTP id
 en22-20020a17090728d600b00731100c8999mr6345451ejc.210.1659881241377;
        Sun, 07 Aug 2022 07:07:21 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 cq21-20020a056402221500b0043ba7df7a42sm3139086edb.26.2022.08.07.07.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 07:07:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 7 Aug 2022 16:06:46 +0200
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/7] glibc: Bump to 2.36
Message-ID: <Yu/G9qK9Whx922Gw@jama>
References: <20220807041541.2665647-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220807041541.2665647-1-raj.khem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 14:07:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168993

On Sat, Aug 06, 2022 at 09:15:35PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

...

> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index 99017ce1d41..b6da2c345db 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
> -SRCBRANCH ?= "release/2.35/master"
> -PV = "2.35"
> -SRCREV_glibc ?= "b6aade18a7e5719c942aa2da6cf3157aca993fa4"
> +SRCBRANCH ?= "release/2.36/master"
> +PV = "2.36"
> +SRCREV_glibc ?= "c74bb93cfdb04d49155b0e30983a3c866167bbca"
>  SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"

FWIW: The glibc-2.36 tag is 1 commit after c74bb93cfdb04d49155b0e30983a3c866167bbca


commit c804cd1c00adde061ca51711f63068c103e94eef (HEAD -> master, tag: glibc-2.36)
Author: Carlos O'Donell <carlos@redhat.com>
Date:   Fri Jul 29 18:03:09 2022 -0400

    Create ChangeLog.old/ChangeLog.25.

