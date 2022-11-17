Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6860BC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 15:39:44 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.19153.1668699583319094101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 07:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=j2ULl/bz;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id x21so3168044ljg.10
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 07:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fMSQIue2NhWbwvdJ0HF+qO1oOCM6vC9VVIdc45UP8a0=;
        b=j2ULl/bz1K43vrp+z2tORwKh8dN6V6pAMOcqc2sHigk8Pg9h4/RN66TU8BVyv2bjk4
         ooPn9WFxhw+/cfHW1quEgeM0qbN+4UFsFVd5MGX9hvJvFIedMms0T3gmhKra8aAVjR4D
         V6ZkRtGuZNHl1iIL3GVeGxqjoj3NG0kAUpMAZ5N+Tkm6/dEzJNQGK/VxJRbBnZjtcnyN
         6yMX+N+5w7YHPD+VbrHetQsjBQt1OVXArfq5V5qJPq8Y0npIP9dt5EIcZpAWhmexMiqZ
         s1p6UKo1YSrtjPkPhnwbK/ZyN/TBBUrk0ao2wrugtMXwNQQ3xkeMhhb0cpYuSqIjYM0f
         juhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMSQIue2NhWbwvdJ0HF+qO1oOCM6vC9VVIdc45UP8a0=;
        b=fXW6r2v8GnltHa3HQ2uk1b1rKV2hfI3OVccZTZ0cIc6JQPjufPYg1LiX/4RQglMr9c
         YdDYKxkmQnYbg/TLsWrYZKRha0RgdOH85W7DhnGM6igmyUVANO/4+apBBDcx85KaVkxl
         axzw4+3lDCPfi5xRujIUCoRC+K6v8TaGctIyO/ZqhA9I0LJtxpFpbxMjhd14oxSYODfU
         D7UV1ingLQZ2ydq1m8WoA28hv8OL1G3+tq+xKx0CfGvdmWnrMYjxzMob9e+4nW/FgA+g
         cSJ1lt3ZRVfWiPfBxnuWH6DaUO64uF5+ljX8eCwy2Id5cvrnF7sed97inBo9fP5qVjk9
         PkRA==
X-Gm-Message-State: ANoB5pl9I3GXcmIz7ZNevHGdQGjJ0L4UkTFFEhLohvxIjhG/h1D1yEBG
	tdahnHeYDkieUJdP+lT/sPrLYQ==
X-Google-Smtp-Source: AA0mqf4AuCXZRkxHjP5OsqA5EcHPGQ3Z43NNiHDd48Z4ZUNWOlmeJIELeLJTnHSukdnBNxfPJrad2Q==
X-Received: by 2002:a2e:2a82:0:b0:277:13ef:53c9 with SMTP id q124-20020a2e2a82000000b0027713ef53c9mr1138472ljq.90.1668699581066;
        Thu, 17 Nov 2022 07:39:41 -0800 (PST)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id k2-20020a2eb742000000b002770fb5722fsm256554ljo.123.2022.11.17.07.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 07:39:40 -0800 (PST)
Date: Thu, 17 Nov 2022 17:39:38 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/2] image specific configuration with oeqa
 runtime tests
Message-ID: <Y3ZVup8YKv6LQzuF@nuoska>
References: <20221117071223.107064-1-mikko.rapeli@linaro.org>
 <5b79cba0817750882a0ef1f1dd9b9581abc9db28.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b79cba0817750882a0ef1f1dd9b9581abc9db28.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 15:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173431

Hi,

On Thu, Nov 17, 2022 at 03:17:43PM +0000, Richard Purdie wrote:
> On Thu, 2022-11-17 at 09:12 +0200, Mikko Rapeli wrote:
> > Many runtime tests would need customization for different
> > machines and images. Currently some tests like parselogs.py are hard
> > coding machine specific exceptions into the test itself. I think these
> > machine specific exceptions fit better as image specific ones, since a
> > single machine config can generate multiple images which behave
> > differently. Thus create a "testimage_data.json" file format which image
> > recipes can deploy. This is then used by tests like parselogs.py to find
> > the image specific exception list.
> > 
> > Same approach would fit other runtime tests too. For example systemd
> > tests could include a test case which checks that an image specific list of
> > services are running.
> > 
> > I don't know how this data storage would be used with SDK or selftests,
> > but maybe it could work there too with some small tweaks.
> > 
> > Mikko Rapeli (2):
> >   oeqa: add utils/data.py with get_data() function
> >   oeqa parselogs.py: use get_data() to fetch image specific error list
> > 
> >  meta/lib/oeqa/runtime/cases/parselogs.py | 17 +++++++---
> >  meta/lib/oeqa/utils/data.py              | 41 ++++++++++++++++++++++++
> >  2 files changed, 54 insertions(+), 4 deletions(-)
> >  create mode 100644 meta/lib/oeqa/utils/data.py
> 
> This patch looks like it is one side of the equation, i.e. importing
> the data into the tests. How does the data get into the deploy
> directory in the first place? I assume there are other patches which do
> that?

Patches in other layers do that, yes.

> We have a bit of contention with two approaches to data management in
> OEQA. One is where the runtime tests are directly run against an image,
> in which case the datastore is available. You could therefore have
> markup in the recipe as normal variables and access them directly in
> the tests.

My use case is running tests right after build, but I would like to export
them to execute later as well.

> The second is the "testexport" approach where the tests are run without
> the main metadata. I know Ross and I would like to see testexport
> dropped as it complicates things and is a pain.
> 
> This new file "feels" a lot like more extensions in the testexport
> direction and I'm not sure we need to do that. Could we handle this
> with more markup in the image recipe?

For simple variables this would do but how about a long list of strings
like poky/meta/lib/oeqa/runtime/cases/parselogs.py:

common_errors = [
    "(WW) warning, (EE) error, (NI) not implemented, (??) unknown.",
    "dma timeout",
    "can\'t add hid device:",
    "usbhid: probe of ",
    "_OSC failed (AE_ERROR)",
    "_OSC failed (AE_SUPPORT)",
    "AE_ALREADY_EXISTS",
    "ACPI _OSC request failed (AE_SUPPORT)",
    "can\'t disable ASPM",
    "Failed to load module \"vesa\"",
    "Failed to load module vesa",
    "Failed to load module \"modesetting\"",
    "Failed to load module modesetting",
    "Failed to load module \"glx\"",
    "Failed to load module \"fbdev\"",
    "Failed to load module fbdev",
    "Failed to load module glx"
]

Embed json into a bitbake variable? Or embed directly as python code?

Cheers,

-Mikko

