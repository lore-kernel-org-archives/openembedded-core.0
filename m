Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F37C433FE
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 06:51:04 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.27423.1665903056000063179
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 23:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cj33KOlg;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id a29so13190700lfo.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 23:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4MMESYodhLgq5gMO4+yeujySSsoT1LZ6ld6VqWtby7Y=;
        b=cj33KOlgJ3OcbbVQ8Y9wKZugCKCjO9U2s1OkDB/bgenIdjMxqeEr5+RpE9PAOBWEZW
         eej6yWPRjm3rvDGDNqNDnmRGDPwoWbJ/feRpA6kKeSVSFR9qmv+/eT5uN5+0JrVFzYhG
         e/dqNNK6i7ks8rZGGfgWbtZaxgflVXqX39gKAwpDSEZyU9heWasZ2zVtKrXiETQOti++
         WEsWgIFDiYaCKDl/m4t9lP0bBCIWrsh8wz679xCbTBYg8rQLewMxI1ivc0bB9jJKgqDG
         z34/pU2GW8Y8YZ+cUcO9MF+LHkFz5MlNZ3tX5TfaMMK84BvzCG3GZUZA1D6Q/xE3Ogl+
         puOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4MMESYodhLgq5gMO4+yeujySSsoT1LZ6ld6VqWtby7Y=;
        b=IN1ZsUXzg7DLr0ATkaviu0rX7BmkL7gbclGLuUncqLDS69CJ7qUGlExPJJczyKF+Sa
         IlJwKkkT0QnvogmgPUkK06dIUF/cxau7FK4MSSjrYo8kWUavSsEKRJMWfKR1M7OcXi4e
         DG2m7oLgALfbubP6njoQtQ4EqCf8El5a5eovhsc9OEWOsLGW1CkTReugYmdAxdvwDrmI
         L65wPMy6jHBmOGGHVPj63lnv8mpSRjGm/3Nn2rqLvKuJhUAAn/0xkCucmzWg5AmWWl3y
         33nWaKLutZvhkh6wPQwd/vlkDxu3AyPF32AJCKoge4oBmWnuYNIUCeZMFdRiA7e2xVCy
         vI6Q==
X-Gm-Message-State: ACrzQf3E5dr7njyZcLrLj0TXcJ5sSRwZVkZ+NkrSsozj5slvwvqsfi5q
	J0coJvm9nW8uvktPPaPsQjC0UI0cZIw=
X-Google-Smtp-Source: AMsMyM57nnLkmJ+0DYXz4oNk7ry/C5Dqay5lAzMb5ps2STme/scNNADJA1uum6BdYlSFRvtiB3HXPw==
X-Received: by 2002:ac2:58ca:0:b0:4a2:d337:bb0 with SMTP id u10-20020ac258ca000000b004a2d3370bb0mr1963948lfo.452.1665903053857;
        Sat, 15 Oct 2022 23:50:53 -0700 (PDT)
Received: from [192.168.10.143] (89-253-118-72.customers.ownit.se. [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id a3-20020ac25e63000000b0048b969ac5cdsm974886lfr.5.2022.10.15.23.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 23:50:53 -0700 (PDT)
Message-ID: <0171f109-2941-3269-3bd5-adf497e30e59@gmail.com>
Date: Sun, 16 Oct 2022 08:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [OE-core] [AUH] acpid: upgrading to 2.0.34 SUCCEEDED
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <01010183ddac296d-fddf5612-f98f-47a4-99db-94cd829db3ba-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <01010183ddac296d-fddf5612-f98f-47a4-99db-94cd829db3ba-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 06:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171889

Another AUH mail bomb, another time where I am pressing "delete" 148 
times in my email client. I don't review machine generated emails.
I would not cry if AUH mails were sent to a designated mailing list, one 
that I am not subscribed to.

Jacob

On 10/16/22 00:03, Auto Upgrade Helper wrote:
> Hello,
> 
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *acpid* to *2.0.34* has Succeeded.
> 
> Next steps:
>      - apply the patch: git am 0001-acpid-upgrade-2.0.33-2.0.34.patch
>      - check the changes to upstream patches and summarize them in the commit message,
>      - compile an image that contains the package
>      - perform some basic sanity tests
>      - amend the patch and sign it off: git commit -s --reset-author --amend
>      - send it to the appropriate mailing list
> 
> Alternatively, if you believe the recipe should not be upgraded at this time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
> 
> Please review the attached files for further information and build/update failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
> 
> Regards,
> The Upgrade Helper
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171742): https://lists.openembedded.org/g/openembedded-core/message/171742
> Mute This Topic: https://lists.openembedded.org/mt/94354924/4454410
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jacob.kroon@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

