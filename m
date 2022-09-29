Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BAAC433F5
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 19:03:48 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.14748.1664478217892817796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 12:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZviK8k+Z;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: danismostlikely@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id s18so1372481qtx.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 12:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date;
        bh=8J8k8Ww0xpfpnhR6RNIzd3IJbyFoe0tUkNAQKXn6ZjE=;
        b=ZviK8k+Z6AcWp2AVPK8h9bUKBgADCQQN/c9GF2/fuMH11z8pvz5O6LPGoTzL9KLAfy
         SIp9v6jclJD4/KgY6zPguoPqGD6zHK09byAuIYNa3SJD03QzqgZ2ptKw8c7eMajlPH5e
         RL7HEMOhyXQIMLoDb8s6eu4QfsfCjmMUEL6W5j8cOUBMHTfL4jtDOhuamv9/CwRh6VD1
         jDZnauXh1piB+No6gSGDTIVymDEAEZ3xlY7tpmVJenVVmCHHfxwaKR0EdWOOpzIqPJM5
         Ib+FDw21e0VcbuTtEmjyzl230u/eRmhoEvJS+ES3SI5z8ERWwg9Q3EMp7VZVTAVndrpR
         PJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=8J8k8Ww0xpfpnhR6RNIzd3IJbyFoe0tUkNAQKXn6ZjE=;
        b=FzB9SL2l7PvSIRfFwlAJJyDH/JHFl7/tc+VxR3ynDlPBFxTubplBjIrc4s45eBw63f
         12h1RfpgUf3fX4ui7x4Na4LS3Dn7fVgT3s7PiWfi4Bt6RO2GHD2uSwbbwQdIPlWM9jiy
         RGVu/xq2sTlG7ysUCWuYRD1SRveFsqTQztKpawF0qAaQmKuPhX0tkEoOajOGbNk/ZMDK
         /oyKjFyy37lLrgwzaHxEW2gL8a4K+Sw5ZLmjua0Z1PYA5VqDr0Z9KrbGxJBQFTTV5rNv
         PAohsqK7XPm1KqTAW8jDmxx0ejFRJCmScmWEUhdGm169na4TBE06/tvoJOcl9uwu+3g0
         O5yg==
X-Gm-Message-State: ACrzQf15V7n2VBGtAEESX8JL+UiEtK19wIcHYZby8vMjgpXSrfLo86Rw
	Dev3dgehf+fPXghwnFrikH0=
X-Google-Smtp-Source: 
 AMsMyM7TOjNFcS3DjaCoRm0P4Y7fpDut/o3X76kMECz/zVDnpfKOuCsEC8svrJwd3SwZ8UpKm7fp9w==
X-Received: by 2002:ac8:5b0e:0:b0:35c:bae7:d9eb with SMTP id
 m14-20020ac85b0e000000b0035cbae7d9ebmr3654767qtw.681.1664478216825;
        Thu, 29 Sep 2022 12:03:36 -0700 (PDT)
Received: from git.shadrach.duckdns.org ([204.83.204.148])
        by smtp.gmail.com with ESMTPSA id
 16-20020ac84e90000000b0035d4b13363fsm2128qtp.48.2022.09.29.12.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 12:03:36 -0700 (PDT)
Date: Thu, 29 Sep 2022 13:03:34 -0600 (CST)
From: Dan McGregor <danismostlikely@gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
    openembedded-core@lists.openembedded.org,
    Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: Re: [OE-core] [PATCH 3/3] systemd: generate manpages indexes
In-Reply-To: <712a80b5-7b54-be2b-99c3-3d35ff935b0c@gmail.com>
Message-ID: <7fe67a25-5280-820f-94fc-2448ed406d60@gmail.com>
References: <20220928221320.1763684-1-danismostlikely@gmail.com>
 <20220928221320.1763684-3-danismostlikely@gmail.com>
 <f272f8ecb7f5dd8c34b6abfb64d89f8bc209bdd7.camel@linuxfoundation.org>
 <712a80b5-7b54-be2b-99c3-3d35ff935b0c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 19:03:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171197

On Thu, 29 Sep 2022, Dan McGregor wrote:

> On Thu, 29 Sep 2022, Richard Purdie wrote:
>
>> On Wed, 2022-09-28 at 16:13 -0600, Dan McGregor wrote:
>>> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>>> 
>>> Now that python3-lxml is in core, use it to generate
>>> systemd.directives and systemd.index manual pages.
>>> 
>>> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
>>> ---
>>>  meta/recipes-core/systemd/systemd_251.4.bb | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>> 
>>> diff --git a/meta/recipes-core/systemd/systemd_251.4.bb 
>>> b/meta/recipes-core/systemd/systemd_251.4.bb
>>> index 910ea71bf64..b4ad7e45eb0 100644
>>> --- a/meta/recipes-core/systemd/systemd_251.4.bb
>>> +++ b/meta/recipes-core/systemd/systemd_251.4.bb
>>> @@ -159,7 +159,10 @@ PACKAGECONFIG[localed] = 
>>> "-Dlocaled=true,-Dlocaled=false"
>>>  PACKAGECONFIG[logind] = "-Dlogind=true,-Dlogind=false"
>>>  PACKAGECONFIG[lz4] = "-Dlz4=true,-Dlz4=false,lz4"
>>>  PACKAGECONFIG[machined] = "-Dmachined=true,-Dmachined=false"
>>> -PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native 
>>> xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
>>> +PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,python3-lxml-native 
>>> xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
>>> +# Ensure we're seeing the XML catalog from the build system and not the 
>>> host.
>>> +# Otherwise, the build may fail generating the manpages.
>>> +export XML_CATALOG_FILES="${STAGING_ETCDIR_NATIVE}/xml/catalog"
>> 
>> Wasn't there a fix that means this isn't required now?
>> 
>> https://git.yoctoproject.org/poky/commit/?id=544c3255b1b1d2be7d7c77f0d64cc4a11a947887
>> https://git.yoctoproject.org/poky/commit/?id=fbc8f3d395711db00cae32d2502588ea9b61b1da
>
> Could be, I've been sitting on this change for *years*, but haven't submitted 
> it because python3-lxml wasn't in core. Last time I tested without setting 
> XML_CATALOG_FILES it failed, but now I see that I also removed libxslt-native 
> from the PACKAGECONFIG depends list. I'll test with libxslt-native and 
> without setting XML_CATALOG_FILES and probably send a v2.
>

Looking further, setting XML_CATALOG_FILES *is* required, because 
python3-lxml wraps the libxml2 libraries directly, not the command-line 
tools. For now I'd like to keep setting the variable, but we should 
probably find a way to handle the catalog path in the library itself 
rather than only wrapping the executables. Or finding a way to patch 
python3-lxml to use the build path's xml catalogue.

