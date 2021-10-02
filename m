Return-Path: <daniel.diaz@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88F6C433F5
	for <webhook@archiver.kernel.org>; Sat,  2 Oct 2021 03:13:58 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web12.6893.1633144437464490001
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 20:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TQh8onLm;
 spf=pass (domain: linaro.org, ip: 209.85.167.179,
 mailfrom: daniel.diaz@linaro.org)
Received: by mail-oi1-f179.google.com with SMTP id s69so13819930oie.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 20:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Jzl9e2qy7yGXjDTrjFGY2+To2YCgWAOIfBp7f+qE7Is=;
        b=TQh8onLm/Pa7qkQ2unvlX+rLPpsPSzw403llxRo9Nggd7Qw96JmWHOXhKeRtTkkfgv
         +6EFCAdNLxUbpr0Y2bbUCQ9OeTELNX1aBDDgEvYztcRX48uJykbsPFh4sDS7Y2pY4F1r
         ven5n86BM2uKYnzl/TvjDeex2UeT+IQIpeQrBfYG3xLh2KdZz/aRsY20e1pVsrdgGgqg
         dNmelHxr+B+cg2jELNoZIkAvlsQeQ/h49Fuf2R+jOdbfHoYjIRpq/tyIxnuU/fW/zXLl
         RH2MDP2CTq4itmcead/zDFICFqPhWmNALwTggVVFAxE0GdIgvtYa5jpycSNw4crerOuV
         BmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Jzl9e2qy7yGXjDTrjFGY2+To2YCgWAOIfBp7f+qE7Is=;
        b=VRTE6KcGV9LqKxdX7VaLTngLTDGnIU7IVg0ye8+4ZYzHR0f/sMhi/0Gsz5bgxIVqyu
         htPtqzBTL3Po+elbuqscd9C2VWCvOjrqjlTJDW6Har75b5NLGbqdltn6phqNFlFOod40
         g4LgINuBGzR3XyBiRNo/VWjkvCfKAeOyIQySx6zq3l51U9AVOITqGwLWCW2vj/5t0ygb
         OAh6NHyjscYzizWeZ/DWY6vwS9hS5q1t3vpN5FMyDpjLtuzLjsFJDLCf+En5AVvy/Zgx
         YNEx81616eRwElQ5Y21f1dP8dwUUjb/K0yJHNMjW7zwYhq/tEf9OVscMXpsz/Eq3sJrx
         wDGQ==
X-Gm-Message-State: AOAM531G+jeIkp/qqI/XxBRPXv3L43Sq+Wll4Uwa2bR2VrG0DpkDYj1m
	eSZY/2Z9CaGKt9DDo5rq4LncBsoh62LhBgia0VSOYQ==
X-Google-Smtp-Source: 
 ABdhPJyjQJDTLAjbywq8wPFjOVEoyWUO7vAXJtttdYtpipym3PVyFetaNXUnmJaxkPq3AXwr6cuB2V/cleOtaqHoPHQ=
X-Received: by 2002:aca:ac0f:: with SMTP id v15mr6662281oie.11.1633144436748;
 Fri, 01 Oct 2021 20:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210930190911.31243-1-petr.vorel@gmail.com>
In-Reply-To: <20210930190911.31243-1-petr.vorel@gmail.com>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Fri, 1 Oct 2021 22:13:45 -0500
Message-ID: 
 <CAEUSe7-FAwj0jWjxK==yL6exsG9BhqoNJF7+xMhG7t_gFpXWYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Update to 20210927
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Anders Roxell <anders.roxell@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Oct 2021 03:13:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156535

Hello!

Many thanks for this prompt recipe!

On Thu, 30 Sept 2021 at 14:09, Petr Vorel <petr.vorel@gmail.com> wrote:
> New patches to fix functionality:
> * 0002-lib-fix-MemAvailable-parsing.patch
> * 0003-lapi-rtnetlink.h-Fix-include-guards.patch
> * 0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
> * 0005-lapi-if_addr.h-Define-IFA_FLAGS.patch
>
> Removed patch from this release
> * 0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch
>
> Rebased patch
> * 0001-Remove-OOM-tests-from-runtest-mm.patch
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[...]
> diff --git a/meta/recipes-extended/ltp/ltp_20210524.bb b/meta/recipes-ext=
ended/ltp/ltp_20210927.bb
> similarity index 93%
> rename from meta/recipes-extended/ltp/ltp_20210524.bb
> rename to meta/recipes-extended/ltp/ltp_20210927.bb

This needs to be updated in the recipe:

LIC_FILES_CHKSUM =3D "\
    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
    file://testcases/open_posix_testsuite/COPYING;md5=3D48b1c5ec633e3e30ec2=
cf884ae699947
\
    file://testcases/network/can/filter-tests/COPYING;md5=3D5b155ea7d7f86ea=
e8e8832955d8b70bc
\
"

FWIW, we've build-tested it (against Sumo :(, changing the override
separator), but have yet to execute the actual tests.

Greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org

