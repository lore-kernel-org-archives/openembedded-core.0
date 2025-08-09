Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D315EC87FCF
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 14:41:01 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.7528.1754750452210861111
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 07:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sek/T3ta;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6180ce2197cso850440a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 07:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754750450; x=1755355250; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l1VC2x0b+hMHNPeXzGNlzz7uYYLoC2/EMl0DRqP4y5E=;
        b=Sek/T3taUf2uTDRbUs/WFNFEYZCgsSNNvIOzKuuux2qwucUcOiJ/Cm2C0gujvdsMgx
         4eyiXXlGETezbexvPQ1XP11uJjLKjgcgeAQ5yeHD+7d7Eqdt/mxvfsZO6p4mFOQ8so+H
         jCan9fikw7oybPmcMYicMkAGUKdMWSC8ya9wV3TzmcBJ5yFz6GP7+bvyYmbPb+FGoi9T
         2rta2kUN/FaWN8XdDMYZcPArzc7k78LOhu35hK2nT/41Pd1mHdtsVoO1VcXwTFfmhhPD
         8sQr6tr9xrll0ml4djh3H7hDNKwJWwXyyr/yoCIQABTJq9kP2qqMWVEXNQoWfZOOhXp8
         KkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754750450; x=1755355250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1VC2x0b+hMHNPeXzGNlzz7uYYLoC2/EMl0DRqP4y5E=;
        b=bpVRlRaucWZfJOZCkFY/uSgI3TO4B6jvmKSOVrSTiwr6IlaoObVSSoAm5LklRk0c6a
         gwn9+3wgg/2x5v0ZqlMHVovh0/qHOcl1p2cIa7BE2oCnjHJCuQeTTAQStcddmKbq+mMI
         Z+HrdhnKGmLBh8QMe/3dnFscRncRFuQM4tUuYa8hDlrl67QOZVkU0NNQc6iocuW6y/x/
         b0MoN8DJFTLLqZkl4ogc4xs8bN3v49uvqE6iQmZgvmVEk0xeUcZU8k0P8If9DLUKXMNm
         7Oi3p+RjFQY4dEOsmysmLTE7DVMRYnULbdjjn6LMkQAyjP+PEoQTHt2a1uulJdnh76I+
         llrw==
X-Gm-Message-State: AOJu0YwEDrLzsUQrYXA1cOPX0YqLhWNjwtHWv9eVsJNUBSk7VEkjZV4D
	b/D8YlF5ILWAOzezYtmBN1vNL6E5P18TA+/09fS0GThZmE100NntL3lJ
X-Gm-Gg: ASbGncuBTOTqeDt63qLPZH36nKw5vBMqlljgt8/FZnBCD8d2+qfBgHBpr8zt4JN+l9E
	hZvhEx8gVgQ+6Ou4H5yhA6IaGgMHL1tqLU35FHHN3lXu9p2t/IXtRe7iZoxuF2tWlzimpnCn11U
	YmwADIyodkWReAXF+V6iPSRAaaXo60aj1mdAhSrZl113qpQx2OWhx517tjry/zNErJwsulFMJ6h
	AnEANdmCJfKkb02JEsVQSK6uh8pAXu79K/XghVMNhgpxiA/a5xn6kaxqHcNXv7ZadFst0Y7nwBZ
	RY8Wk1Ev58teZIJcUw7KYiy5ZssJUSIiG8alZDjbXJHhWG80Y/mQnzZVF19R3z5DUf1GYyf74oe
	Ng5RJ0vFRZrgn7CDIfcCl1i+QTtVKHl5qug1oI6lF
X-Google-Smtp-Source: AGHT+IGRNJFVd2e30rD1zBTsNGYmEVLOdWpmUPjYWkP1VOSb2ely64R1j2OtSbxwPnaYBT1MMbn9PA==
X-Received: by 2002:a17:907:928e:b0:af9:c119:3b4 with SMTP id a640c23a62f3a-af9c6453233mr558684366b.13.1754750450260;
        Sat, 09 Aug 2025 07:40:50 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0771f9sm1692426466b.16.2025.08.09.07.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Aug 2025 07:40:49 -0700 (PDT)
Message-ID: <94194d86-7dda-4080-b484-cf30da04ad65@gmail.com>
Date: Sat, 9 Aug 2025 16:40:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] rpm-sequoia: upgrade 1.7.0 -> 1.9.0
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
References: <20250809071200.4017253-1-skandigraun@gmail.com>
 <CAMSfU+7fZMF6E4sJyjPwT8x=T3fB1_JK-k8Y-irAq13Y04xQoA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMSfU+7fZMF6E4sJyjPwT8x=T3fB1_JK-k8Y-irAq13Y04xQoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 14:41:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221674



On 8/9/25 16:10, Yoann Congal wrote:
> Hi,
>
<snip>
>
>      require ${BPN}-crates.inc
>
>     @@ -64,6 +63,11 @@ do_install:append () {
>      do_install_ptest:append () {
>             install -d ${D}${PTEST_PATH}/src
>             install -m 644 ${S}/src/symbols.txt
>     ${D}${PTEST_PATH}/src/symbols.txt
>     +
>     +       echo "#!/bin/sh" > ${D}${PTEST_PATH}/run-ptest
>     +       echo "rc=0" >> ${D}${PTEST_PATH}/run-ptest
>     +       echo "export TEST_DONT_BUILD_LIB=1" >>
>     ${D}${PTEST_PATH}/run-ptest     
>     +       chmod 755 ${D}${PTEST_PATH}/run-ptest
>
>
> Wouldn't that make run-ptest basically a no-op?
>

Thanks for reviewing.
It looks like a no-op, but it isn't. cargo-ptest checks if run-ptest
script exist[1], and if it does, it appends its own content to it, so
both are kept.
What came to my mind after sending it is to add this script simply as a
file to SRC_URI instead of echoing it, but didn't want a v3 without
someone asking for it.

[1]:
https://git.yoctoproject.org/poky/tree/meta/classes-recipe/ptest-cargo.bbclass#n102


> Maybe you can, either:
> * rename the run-ptest generated by cargo-ptest and exec'ing it from
> your script to keep the envvar
> * overwrite the run-ptest generated by cargo-ptest (but keep its
> current content: e.g calling the test binaries in sequence, printing
> "PASS:" ...)
>
> Best regards,
>  
>
>      }
>
>      # Tests need objdump
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#221671):
>     https://lists.openembedded.org/g/openembedded-core/message/221671
>     Mute This Topic: https://lists.openembedded.org/mt/114612984/4316185
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     [yoann.congal@smile.fr]
>     -=-=-=-=-=-=-=-=-=-=-=-
>
>
>
> -- 
> Yoann Congal
> Smile ECS


