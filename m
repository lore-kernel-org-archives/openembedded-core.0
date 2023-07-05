Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37898EB64DD
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 09:23:55 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.12850.1688549029410567717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 02:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gPrj1nVf;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51d89664272so7616899a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 02:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688549028; x=1691141028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZZjD9YRnOJz32usnWvMBMNnNpd1Av66aiMnFxsj2Yg=;
        b=gPrj1nVf+GjSJDV1zjEFBcM0HUWluWKodDw4huB9AdCPaMTsOCHrc/mwoRZdzCJD6k
         EyLsIn02n3hrH3gcGq/4QHzxHnygw6SpiV74yiHMXaibA50LQxcOofg2nh3W9R+5bStv
         kKiyBIapmI5rzR9oe9OwiySBdnUdRR0sw8l/CAv/RslofpQvi/d6h9e3YkfY5fsyHYKA
         AUxmcIfXvw9299ezQKjYoc6DH/WkOcTG7qU2/AKqZ73U+DQ/RaKPubU5ANBskeKa9asW
         /cIsqyeoz0dEnwqHqhEJgWp1uFUcww0qsU3ulj3+okLnLYFsC7JCzy1WCeksAyKXZfpC
         kSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549028; x=1691141028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ZZjD9YRnOJz32usnWvMBMNnNpd1Av66aiMnFxsj2Yg=;
        b=KznWETAVW21+Ehh6Rze2wXfn3D3zEEL0Mw5qGO9vIEADGv7fPCV5hmHVZ0amrFasWK
         nzyGh2iQHbDshTJVRuyaArOsVKoEAx6gCk4bIhvzbk7m9+BVzsDbPKnBJzeYxI7OZIyx
         AAP6oM2mLJ6i1QtGHNs7VWz7JYRrnxfVQwAbs+7pQ3kgPx/pweowRohAN+iqTXvEXUi+
         989Dsi47SLTSMFQkGzLJwc60RU5VfIZQg7zDYcaMG3W9oo7gV408mRYVEmTbDSzzkC1D
         8DHQe5A2SJ5enhHqZ/IRzhx/kV7TXd2Q8b5yZ3Ebk1+fjgNqy6E9TsdvTW4GNKppcfU/
         XFHw==
X-Gm-Message-State: ABy/qLZTRdDzT4lNxEql1wX77+r9Oq+giAujKjOSb1x8C/+s7s7jV7Vw
	U6PSnwIjPe9NmVHX3iEmaDkb5V5nF0unGHWN33c=
X-Google-Smtp-Source: APBJJlEq2/OXghiDw6vcP92oJBVb5U5qtVtBB70iNu9rKrHjs9zxe6ng0eWgy8Il7OYeWHeRnry9aCdrKb/l4wvMzcQ=
X-Received: by 2002:aa7:c64c:0:b0:51e:4fa:14e9 with SMTP id
 z12-20020aa7c64c000000b0051e04fa14e9mr7755191edr.29.1688549027513; Wed, 05
 Jul 2023 02:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230704200907.20403-1-sudipm.mukherjee@gmail.com> <CANx9H-AHG59Fw4s5zQ-2yJRksJszGwdZghznqsjYyxjXnMAiEg@mail.gmail.com>
In-Reply-To: <CANx9H-AHG59Fw4s5zQ-2yJRksJszGwdZghznqsjYyxjXnMAiEg@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 5 Jul 2023 10:23:11 +0100
Message-ID: <CADVatmNtmU1gNhdfC8qfOvVxJVevOmE5rKNJ76eSHtP26LVd4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-pygments: upgrade to 2.15.1
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jul 2023 09:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183878

On Wed, 5 Jul 2023 at 08:45, Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Tue, Jul 4, 2023 at 10:09 PM Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:
>>
>> Upstream has removed setup.py and started using pyproject.toml
>>
>> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
>> ---
>>  ...ython3-pygments_2.14.0.bb => python3-pygments_2.15.1.bb} | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>  rename meta/recipes-devtools/python/{python3-pygments_2.14.0.bb => python3-pygments_2.15.1.bb} (76%)
>>
>> diff --git a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
>> similarity index 76%
>> rename from meta/recipes-devtools/python/python3-pygments_2.14.0.bb
>> rename to meta/recipes-devtools/python/python3-pygments_2.15.1.bb
>> index 16769e9263..7e3b286f41 100644
>> --- a/meta/recipes-devtools/python/python3-pygments_2.14.0.bb
>> +++ b/meta/recipes-devtools/python/python3-pygments_2.15.1.bb
>> @@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
>>
>>  inherit setuptools3
>
>
>  instead of setuptools3, inherit python_setuptools_build_meta
> Look at the build.backend variable in pyproject.toml for hints
> https://github.com/pygments/pygments/blob/master/pyproject.toml#L4

Thanks Tim. I was going through all the python*.bbclass to find a
suitable one but obviously I missed it.
Will update, test and send a v2.


-- 
Regards
Sudip

