Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27DAC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 02:58:01 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.2961.1634093880846635611
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 19:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oWpSVDvM;
 spf=pass (domain: gmail.com, ip: 209.85.160.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id t2so1301738qtx.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 19:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y3dkytt0xs59Vf+u/b4vSrqPdDVVrqKg8tXXuyoFxm0=;
        b=oWpSVDvM/wyiaQJY8vS0sOPhlHFo2K2G29AONnShI7XNnjt423wNlykUTF3dcb2d5J
         ZgcxV0VdsibfwOLG3mQbUNHhXCxIgiQK1lXXSuTtjLMM37ejCkymTlF3Tn5MHgU01yNS
         +MabhlEhP16ZzYYe7WW3E1IMW7Yx1OVMbpOK5EysrMJFn9/QhI09v3HlETQIivacHj6/
         DaQjua64CSobACeJcTzO6dKDa08SV2DqI9Vp73zKrb26Ab4CZ0Ucx+ATpzyRoPx+h24t
         gCPw24wvUr+gBNM/MSLC3cz7Jigmnq6ULw6vXvfer6k1gQuP6RKmuWH6A9HJW/rSIYsa
         gmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y3dkytt0xs59Vf+u/b4vSrqPdDVVrqKg8tXXuyoFxm0=;
        b=dwwcqNDDFNovWt+w7gfuGQ3mCjPWfDRnyXGeuNoOY4bi1CRwvw2bkLt+n6xo3mXrFJ
         NT5bO7rYIs9H615OLcuckL0ck2v4GiYP69x7lmAOONPem8Hcr8NOQ2G3bdaHympgTMA1
         KC7WuzlwDvgZmP/HRjtYHuZwOXP9+3yx5Phn4u5vZZ4kQ63izMvd7s/n5oR58/2Ngo/Z
         58h+Dc9XFbHmUSunzZubpu+90082sB/+1BiJGOZwoCtqobvOwKw5+d/bmKqtxjE2idEP
         fWo7H/Fm0MV4O1dvba8Wv3vcCWtAvfO+dygeXTG87TKbNNr6FQ9kCyLIsS0su/C9TSKj
         SzIA==
X-Gm-Message-State: AOAM531WGO58WGDY3fhkGDc5Hsh2KDVl7c3sCBCZoaNQnZWokjRLO31y
	ZqrSQO7udrh8Q3GXMmMlrhaRgm+jBze4dR63V+sUCxmq4wx0ag==
X-Google-Smtp-Source: 
 ABdhPJwZpOrBzSTKriV9c2j/laCBLDrS4f6o3RUhT9BZkRFyrdgf7y/8lLuad5qtfKEgiKJ0kEauendNte5ThQBtWLc=
X-Received: by 2002:a05:622a:316:: with SMTP id
 q22mr26674272qtw.225.1634093879633;
 Tue, 12 Oct 2021 19:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210918221852.2284913-1-open.source@oleksandr-kravchuk.com>
 <a56da552-d10f-904d-0899-053959eca33e@pr.hu>
In-Reply-To: <a56da552-d10f-904d-0899-053959eca33e@pr.hu>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Oct 2021 19:57:33 -0700
Message-ID: 
 <CAMKF1sqfyZv2BkjcNVvk+9YKnNqCZgjZunji-cKXyjNiuRMqeA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-setuptools: update to 58.0.4
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 02:58:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156888

It also has bunch of recipes in meta-python which needs to upgrade to
use 0.58 version as it breaks packages which needs 2to3 support still.
Maybe a simple version upgrade for these recipes will fix it

here is list

https://errors.yoctoproject.org/Errors/Build/132754/

On Tue, Oct 12, 2021 at 2:36 AM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=pr.hu@lists.openembedded.org> wrote:
>
> This version broke at least python3-jsmin 2.2.2.
>
> I am hitting this issue:
>
> https://github.com/tikitu/jsmin/issues/33
> "error in jsmin setup command: use_2to3 is invalid."
>
> setuptools 58 removed support for use_2to3.
> python3-jsmin must be upgraded to 3.0.0 as a result.
>
> There be other fallouts, too.
>
> On 2021. 09. 19. 0:18, Oleksandr Kravchuk wrote:
> > Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> > ---
> >   ...ython3-setuptools_57.4.0.bb => python3-setuptools_58.0.4.bb} | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >   rename meta/recipes-devtools/python/{python3-setuptools_57.4.0.bb => python3-setuptools_58.0.4.bb} (94%)
> >
> > diff --git a/meta/recipes-devtools/python/python3-setuptools_57.4.0.bb b/meta/recipes-devtools/python/python3-setuptools_58.0.4.bb
> > similarity index 94%
> > rename from meta/recipes-devtools/python/python3-setuptools_57.4.0.bb
> > rename to meta/recipes-devtools/python/python3-setuptools_58.0.4.bb
> > index ae45936c39..2000d355a9 100644
> > --- a/meta/recipes-devtools/python/python3-setuptools_57.4.0.bb
> > +++ b/meta/recipes-devtools/python/python3-setuptools_58.0.4.bb
> > @@ -10,7 +10,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
> >
> >   SRC_URI += "file://0001-change-shebang-to-python3.patch"
> >
> > -SRC_URI[sha256sum] = "6bac238ffdf24e8806c61440e755192470352850f3419a52f26ffe0a1a64f465"
> > +SRC_URI[sha256sum] = "f10059f0152e0b7fb6b2edd77bcb1ecd4c9ed7048a826eb2d79f72fd2e6e237b"
> >
> >   DEPENDS += "${PYTHON_PN}"
> >
> >
> >
> >
> >
> >
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156862): https://lists.openembedded.org/g/openembedded-core/message/156862
> Mute This Topic: https://lists.openembedded.org/mt/85708588/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

