Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57543C54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 15:04:55 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web08.8862.1662563089206703238
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 08:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hLbw6hvp;
 spf=pass (domain: gmail.com, ip: 209.85.221.172,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id r69so2820408vkf.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 08:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7kuPOeLWjWHR/KIecgyfS/pP+OpxlzFrsXJWeCZLN/w=;
        b=hLbw6hvpj4QfZs10usDyFCj+NI0hNzaeCMlzuFfRCBmnP64SXZgvs3da6/8SJ3Ia9a
         Z16NoD5S+QAsOBBE0pvTKp8hb6Zsepirvr+mvTRcGBblHcgVBBWYDKCOTp/q8ij62HLc
         JGxrsz2uioG1NYCSCAIiNAmWZiFPtYx6XXpXN9y1HZVMtZWXryc1xAewot0NM8ZlHYTW
         LIXQD/UL30jsvNToTDYO+Ga3Sw7ISx1RJb7wWgi0Om/X+mCUuRBxblfPOmS/6W9eZ8ze
         XGvgsY1O5bq6Ae9X8WaK10PZUWgXBwxf9uxtMXMPmSgbGp7Auug9h5c6xJbT9lu1gaGV
         RqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7kuPOeLWjWHR/KIecgyfS/pP+OpxlzFrsXJWeCZLN/w=;
        b=ZpR14CRyskfz14zDi3gaXoO1ZtF24Nm2f9/Rr023DZNe8FpEY8cYtAsnHgPbTCNHRh
         2vjjy9wh4ra7+l3+FbbryrIyHvX6u8oe3kwl7v6mA9kTXCFMpVX1lxzIHaJqdv8P1vnb
         DR2VRihus4D94kG6XWkGP6AVC8ShK4J2r5+rGajH5uZtoaWUReGSdFPhUOY0H64pR0uS
         Vi8CBERQTCz8V9xt3Ld37JWfdp15sTmR/h69B3mcoFesYIu2vTiGeEqBBTaQerYs4/Wg
         XRIK27I3rWZLdKX2Vj/JVgMKzFXqUAvHdP5gXrJPrR6GPL2lgxTpwDd9cnGSHPYpsqBC
         24+w==
X-Gm-Message-State: ACgBeo3VWfJ8zuSg5IFzptNk/VOuBvjcgApaMAAV/Hg7m7pRZ3+eQOW4
	KYJM2VkCxndRnVXuVa/OO+sc4CAADpKlqQ/0kbo=
X-Google-Smtp-Source: 
 AA6agR6EX3llrLkWi+Gw6AQKIw+kIudN4LtEuOs/2Sx51wiOcSrkEEwS5r2X1KfkkhlpNz2qKEnRsTglYQ+VL8u8uSc=
X-Received: by 2002:ac5:c351:0:b0:39e:df84:48ce with SMTP id
 l17-20020ac5c351000000b0039edf8448cemr556552vkk.9.1662563088228; Wed, 07 Sep
 2022 08:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220904063331.82988-1-naveen.gowda@windriver.com>
 <071f8e1caf21c6ba8b043f416e07629969e7f213.camel@linuxfoundation.org>
 <CALY4986Pc-HmuguPuoe=CKXqX8U=cN4VroAaEwSSuUXDsOOLUA@mail.gmail.com>
 <6e4acb0b302d1d841c765283b12a3b1976d06a51.camel@linuxfoundation.org>
 <b3185ce5cca1b255cc96f5413db5c51cdb665175.camel@linuxfoundation.org>
In-Reply-To: 
 <b3185ce5cca1b255cc96f5413db5c51cdb665175.camel@linuxfoundation.org>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Wed, 7 Sep 2022 20:34:37 +0530
Message-ID: 
 <CALY4987n9cs0EWx-+yTd37mPcxJkNAK95B_uB278vGy_RvdqRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v10] Rust Oe-Selftest implementation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
	vinay.m.engg@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 15:04:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170421

Hi Richard,

Thanks for pointing this out and your help in improving the patch.
I am using an Ubuntu-18.04 machine and am not able to see the error.

>> Something is mangling spaces in your patch. There shouldn't be tabs here.
Fixed.

>> I think this can be merged with the RustSelfTestBase class as I don't
Merged.

>> If we want to change grammar, it should be in a separate patch.
Removed it.

>> addtask do_test_compile after do_configure do_rust_gen_targets
>> put that alongside the task definition.
Added along with addtask definition.

Please find the patch posted with all the above modifications as :-
https://lists.openembedded.org/g/openembedded-core/message/170420

Thanks,
Pgowda

