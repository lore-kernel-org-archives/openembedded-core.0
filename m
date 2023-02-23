Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9369EC64ED8
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 21:05:04 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.1438.1677186294931469975
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 13:04:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FUUVwnNj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id t15so11956954wrz.7
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 13:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vqK1oG7SqLyG963QWzoNcWlgsB8r8idHIrHewFhgQbk=;
        b=FUUVwnNjXk7+/Dmvn9ibL/KnRjtmtPs+wANM8lAlZN/Jh9pErLrKRNgixHHWLiNKI3
         HBCtI9QBsonClSuaNnlFbpJcuDSjpkrC+2CHYcoOTKI6WK8Mutzc2ygL2b55lkMOw0gS
         1r59+VEf3E/3mMlA68or0SyykpO9yVdC9Ph24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vqK1oG7SqLyG963QWzoNcWlgsB8r8idHIrHewFhgQbk=;
        b=jGaNWkV2UETQORmUpAfBZ6pxTY6EDFVQrXxrk84nmsSIw7eQHuUvkTX8nXPiox1Pf3
         BnXy873v87ug+vSOZFSrSTIWdsfXLZpHZFAjM+0+izHP+QhJ4KRNYwir0HZYCP33qHsP
         HhYbv0elSp4zjwzrXdjnVAT2W1jl9mwrJ7hsY4qw+qd3pncBEOLc07KrUs77/F910WHa
         Xt7JrI468XrOJTvBzR1e5Ithgs8yb9wmGfPKMsK3GtmInUaIFXXhS0HirEJeaNpTqUsw
         q7EFyjZWmC0gR6yqA2lLo6k/p3AVHflC+SFStzpaQLHpofFaNjLt3VxANpIJ2KJeBo7N
         NsQQ==
X-Gm-Message-State: AO0yUKUxaF0FyfuBnA/DwkOe4zflKUDfw6OIJ3wvJ3Bt6v2EPSPmihOC
	f65eaKALWEdFyCd6/FJGqJTv4Q==
X-Google-Smtp-Source: AK7set88ZE5D9BdPhmI8YmGG20yomyvSl7Rl5dMix846CzWks3JSctTwI8blgDLZisbG8ZeX5bkVLQ==
X-Received: by 2002:adf:f946:0:b0:2c5:6287:bd30 with SMTP id q6-20020adff946000000b002c56287bd30mr10928340wrr.26.1677186293319;
        Thu, 23 Feb 2023 13:04:53 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7? ([2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7])
        by smtp.gmail.com with ESMTPSA id c11-20020a7bc00b000000b003e91b9a92c9sm465013wmb.24.2023.02.23.13.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 13:04:53 -0800 (PST)
Message-ID: <fff39774b9eb14b58e00f15fc5747694a2ea83a3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v12] Rust Oe-Selftest implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, pgowda.cve@gmail.com, 
	openembedded-core@lists.openembedded.org, "Gowda, Naveen"
	 <naveen.gowda@windriver.com>
Cc: rwmacleod@gmail.com, vinay.m.engg@gmail.com, "Shinde, Yash"
	 <yash.shinde@windriver.com>
Date: Thu, 23 Feb 2023 21:04:51 +0000
In-Reply-To: <18d49c01-cafe-aef9-4bbc-9ab97ec067e3@windriver.com>
References: <20230223063624.2226016-1-pgowda.cve@gmail.com>
	 <18d49c01-cafe-aef9-4bbc-9ab97ec067e3@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 21:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177630

On Thu, 2023-02-23 at 13:55 -0500, Randy MacLeod wrote:
> Thanks Naveen,
>=20
> With a large patch like this it would be good if you could provide a
> =C2=A0cover letter that summarized what is different in v12, compared to
> v11.
>=20
> I've looked at the diff and my summary is below. There are some
> changes
> =C2=A0which I see but would benefit from an explanation.
>=20
> Finally, please change your SOB line to @windriver.com.=20
>=20

Changelogs definitely help, thanks Randy!

Thanks for putting this patch together Naveen, we are getting there. I
ran this through the autobuilder and the good news is we only saw one
failure related to the patch, in oe-selftest on an ARM host:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1004
(from
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4962
)

We could disable the rust tests on arm host systems to get this to
merge however ideally it would be fixed to run there properly as well.
I'm not even sure this should actually be running there at all now I
look at things. The other toolchain/machine specific tests are tagged
as "machine", e.g. meta_ide.py has:

@OETestTag("machine")
class MetaIDE(OESelftestTestCase):

or they're marked as @OETestTag("toolchain-user") or
@OETestTag("toolchain-system") in the case of the glibc/gcc tests. The
difference is how the tests are run so "toolchain-system" would be most
appropriate for rust. This means that the tests are run per MACHINE
target instead of once overall.

The second issue I noticed is that the test results are not appearing
in the test report. For the build above, this is here:

https://autobuilder.yocto.io/pub/non-release/20230223-9/testresults/testres=
ult-report.txt


and I can't see the rust tests at all. This will need to be fixed
before the patches can merge. It may be changing to be
machine/toolchain might fix that, I don't remember the details.

Cheers,

Richard

