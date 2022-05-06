Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598E9C433FE
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 06:30:25 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web08.6630.1651818624283759085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 23:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bgilFXln;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id t25so8136974ljd.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 23:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LjKXaA4fWB/CUpVLlX6GcYpzFTQxYoHkqe/uggaW/AE=;
        b=bgilFXlnwuI9r2Qo915BXQYDQOljvf7KASRAshJ7S862usi2QlGwkoZKjE3b931C7X
         9PYtkw3k9LWfpABOai7TBGvp0JgrcmmnGFxA4OoE7BRfroVQvknpkJfki40IPhRO3ZWE
         tohf2MCD0KYdPDbI7IEMkjP4BFVLmAA2hulnNqpDYsBo4JNF8hG/km13afaRVQjC2h7b
         zBybg1+d0EzyTgNvWOODRodMVaa8zmeoAZeJrkCVYcYlQg5v3hMZm27MyBtGznOypzdc
         oXdgyj4zin5j6U7B0AnpTsS+ihFNAitn5W9wEXvAtYiBUGl7+LxnVFez8SPdf7q4k7b3
         Pnuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LjKXaA4fWB/CUpVLlX6GcYpzFTQxYoHkqe/uggaW/AE=;
        b=tCuswAEMCtoe7SXyDmSIYRyBqykNw8z3HZlq6jyY7I+s0LhKMJJEOp2HhAiiCJggqT
         aJH7xX1Q7CEVMDv54zSTHBQV6hVth5FDivZHeuZusoU9t72CawjSI5f9qlwQVZG00iK4
         ZGZ9Nc0cPfZlPM8hkAtyJmyJm/znCsj5C5J98SNyDq/VqF+X/5j82gJsYuDvFrOl4bWH
         OUkEd506lRNoETflTjJIJRaeIwjiNo1iKWI4x9DvanaSKjjDwEmk1UDdOGIqIx/zzAHf
         QARb/+0/1lDwVIsI8Pw7hnA2nonhLN/RJJBHpmw0YWJAr/SKRXasO10py0vhjLQQS2iw
         E6Tg==
X-Gm-Message-State: AOAM533kta/bUhOPkY+5gTgsJ/ZFByZ+QXATBtayui1cVnWfqJYntQv4
	0C/6nSTL262bRojazS8wMn//6jup2jTjnDZjWgo=
X-Google-Smtp-Source: 
 ABdhPJyJCwtr2cnw9YO192/5QZ8mZ62Hcv0C4hU6f8u9zeRSksC504BHO3bK3k8xCWIwsKmyB29hh35OvchBzkYpBi0=
X-Received: by 2002:a2e:824b:0:b0:24d:c247:c928 with SMTP id
 j11-20020a2e824b000000b0024dc247c928mr1128653ljh.68.1651818622170; Thu, 05
 May 2022 23:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <1651808269-3775-1-git-send-email-leimaohui@fujitsu.com>
In-Reply-To: <1651808269-3775-1-git-send-email-leimaohui@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 May 2022 08:30:10 +0200
Message-ID: 
 <CANNYZj96-SMiUCmTMhZ3uoLSHN8mH0js6e2k2JJQOW3Tp3MV5w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gnutls: Added fips support option.
To: leimaohui <leimaohui@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 06:30:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165318

On Fri, 6 May 2022 at 05:38, leimaohui <leimaohui@fujitsu.com> wrote:
> +DEPENDS:append:class-target = " gnutls-native"
> +DEPENDS:append:class-nativesdk = " gnutls-native"
> +PACKAGECONFIG[fips] = "--enable-fips140-mode --with-libdl-prefix=${STAGING_BASELIBDIR},--disable-fips140-mode"

I think the unconditional DEPENDS lines can be avoided if you use:
PACKAGECONFIG[fips] = "--enable-fips140-mode
--with-libdl-prefix=${STAGING_BASELIBDIR},--disable-fips140-mode,gnutls-native"

Alex

