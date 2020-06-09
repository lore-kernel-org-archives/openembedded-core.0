Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.1721.1591718097369287954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 08:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U4cA+LiV;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: jacob.kroon@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id m32so11600579ede.8
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 08:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zwGFNLO3hHRcXrDi7vVO8p92wrQ5L2zaN2MYWuaosMY=;
        b=U4cA+LiVX8KHmdAYJ00Rb1V6DJPxqbCW5s1aP5N8x9sszkFFPIAyqKp2NGhtDbSgja
         IFJbdgESnbr1FfDis/Yke703MJuiYnTnp1qMtv+Z1l1ITA6xApamnPsppkgmqaRnpul7
         DDmHtg54z6NUnXd9Hq5zBZCRAtwxdmmuSLlfuczZFjvRblw4D1Vq4uoMhswKjBz2E5D0
         rZb6w8ZcYkjCbJMPk3trnl1IuwmOaJe+QSNJvF3pgbGY7Q89z4X20F8w8LhACONoR4+v
         vmGy6xn2oGj9QkjpGWfom6Yt/zCosSZjtKUWnipdOgTZi222H2UGODsclTgIn1MoaGb7
         J8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zwGFNLO3hHRcXrDi7vVO8p92wrQ5L2zaN2MYWuaosMY=;
        b=DHcrlmTVIR+ySPi791f7SWhH7Yq3RXpJtFPBNYIZjHBjQ97rvz3ZayuLaFm6XT+VWC
         tjLjAwRBLVm9emg9IIxID6F9FIDBPnbabImlIRmVJd1HsSD3a94VAK1zoL4QYdQii7ik
         iWm2W9RLvKmDW7hKxebDLb/gDyhoAFy0mVGD4lDkgDpmMifB67CJ6egGZUgnY/M0Dbn8
         NavsjvWPd3bWT55gQ2JraKADzc8U0OBM684BcEtQMEL85yR3w1JA8SYFbqfJXHxMWho7
         zdYG9UM+bScwnWt3RnXXOxV4qzFp1PpFjCi2r4pfogcufNsoFg2MIHUmXrvAUzHkrncb
         cx0g==
X-Gm-Message-State: AOAM531teHQIo900V0EWh9FRB0K5q8lpnNKaDuNu0BzhICnat8pCEbw3
	k+4JE0+43zZtCsiUxK98GBnAsOE5
X-Google-Smtp-Source: ABdhPJw3Wlp8kB8N5DVF6bO1j8kBq499eHiEg+l+hVp8Lbm4OJkSATaRMjCiCRLHDFWTkSfMH5QnwQ==
X-Received: by 2002:a05:6402:3c1:: with SMTP id t1mr28125353edw.350.1591718095512;
        Tue, 09 Jun 2020 08:54:55 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id c9sm13481417ejx.98.2020.06.09.08.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 08:54:52 -0700 (PDT)
Subject: Re: [OE-core] [RFC][PATCH 1/2] features_check: Warn if not used
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200609141114.1751767-1-jacob.kroon@gmail.com>
 <CA+chaQc9NQ_y3DprG8QQVaund2X-Mqj_==Pn+CUQ_UasKaD40w@mail.gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <4ffc0268-9718-6bbb-ba72-8cad4ee50279@gmail.com>
Date: Tue, 9 Jun 2020 17:54:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQc9NQ_y3DprG8QQVaund2X-Mqj_==Pn+CUQ_UasKaD40w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 6/9/20 4:34 PM, Martin Jansa wrote:
> Seeing how many cases like this exist(ed), this look very useful, but it 
> would be even better if we can catch the opposite case when e.g. 
> REQUIRED_DISTRO_FEATURES are set in recipe, but doesn't do anything 
> because of missing features_check inherit.
> 

Yes, that would be a good test for insane.

> But I understand that such check might be more controversial as it would 
> need to be checked globally (outside this bbclass), maybe something in 
> insane.bbclass catching both cases as QA issue?

I didn't want to add this check to insane since I like that you only pay 
for the check if you actually use the class.

Not sure if that is worth pushing for, but I think I recall someone 
saying that a large part of the parsing time is spent running the 
anonyous python(?).

Jacob

> 
> On Tue, Jun 9, 2020 at 4:11 PM Jacob Kroon <jacob.kroon@gmail.com 
> <mailto:jacob.kroon@gmail.com>> wrote:
> 
>     Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com
>     <mailto:jacob.kroon@gmail.com>>
>     ---
>       meta/classes/features_check.bbclass | 20 ++++++++++++++++++++
>       1 file changed, 20 insertions(+)
> 
>     diff --git a/meta/classes/features_check.bbclass
>     b/meta/classes/features_check.bbclass
>     index 4ba827d4ab..31ce600374 100644
>     --- a/meta/classes/features_check.bbclass
>     +++ b/meta/classes/features_check.bbclass
>     @@ -12,11 +12,25 @@
>       # Copyright 2019 (C) Texas Instruments Inc.
>       # Copyright 2013 (C) O.S. Systems Software LTDA.
> 
>     +FEATURES_CHECK_INCLUDE_STACK := "${BBINCLUDESTACK}"
>     +
>       python () {
>           if d.getVar('PARSE_ALL_RECIPES', False):
>               return
> 
>     +    unused = True
>     +
>           for kind in ['DISTRO', 'MACHINE', 'COMBINED']:
>     +        if d.getVar('ANY_OF_' + kind + '_FEATURES') is None and \
>     +           d.overridedata.get('ANY_OF_' + kind + '_FEATURES') is
>     None and \
>     +           d.getVar('REQUIRED_' + kind + '_FEATURES') is None and \
>     +           d.overridedata.get('REQUIRED_' + kind + '_FEATURES') is
>     None and \
>     +           d.getVar('CONFLICT_' + kind + '_FEATURES') is None and \
>     +           d.overridedata.get('CONFLICT_' + kind + '_FEATURES') is
>     None:
>     +            continue
>     +
>     +        unused = False
>     +
>               # Assume at least one var is set.
>               features = set((d.getVar(kind + '_FEATURES') or '').split())
> 
>     @@ -39,4 +53,10 @@ python () {
>                   if conflicts:
>                       raise bb.parse.SkipRecipe("conflicting %s
>     feature%s '%s' (in %s_FEATURES)"
>                           % (kind.lower(), 's' if len(conflicts) > 1
>     else '', ' '.join(conflicts), kind))
>     +
>     +    # Only warn if inherited directly in a .bb-file; if the class
>     is inherited
>     +    # via an .inc/.bbclass it could be a false positive
>     +    inherited_from_bb =
>     d.getVar('FEATURES_CHECK_INCLUDE_STACK').split()[-1].endswith('.bb')
>     +    if unused and inherited_from_bb:
>     +        bb.warn("Recipe inherits features_check but doesn't use it")
>       }
>     
> 
