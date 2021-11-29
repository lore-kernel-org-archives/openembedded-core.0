Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FB5C433F5
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 16:42:39 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.63687.1638204158631689647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 08:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CPqRsnve;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id l22so46246941lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 08:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dzGh+XnIjFJEtdFU6tURaonmJBSXi3kavJ0wLtpQODo=;
        b=CPqRsnve8DecP313CfJHGthw1a+PZRGB2w9aJB7gOlX/OYZtmMhtcuxJYoP91fmumP
         fSRVR370jillKa5jTKCL5tNREFOcSGBjYtq21EoNQOgyoIe0V/0ycimtGJ98S1A8vspo
         yjw3K0EF9uBEBwOk1uvu67kokc6DVxcmwpwqdJHhEwraHiXDRNSBnsmyJYPQhDBvX2GB
         EiW4ilHWuOuy87UexdN5x9+aY8jJ/3lX0ddO7POJv2iT9VXsdfebnH53U/536H0mhQRr
         dNZpv0PUPV5BeeKz7Z+Jjrz4TtdLjg0RX6ShPaEihHyIEXDWYu34dyeW2G+Y2QJ6gQJM
         oO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dzGh+XnIjFJEtdFU6tURaonmJBSXi3kavJ0wLtpQODo=;
        b=TQVMDZaAPn4kxosmXreXgHeS5B+MF/rgg0o/2Z/WgpeSmPolWW6pWL2teJKNuDlh/d
         0tmxkCdF/8Jo5mIO51kHSBX1JkudXRy0xVTOFLc6dvJoIG5SxEMRnBlmnXtXfYxCJ7KD
         +IsTKBvIBVeISlPYGJV+vyoojUhlActzGs8rdJbD9SwNSUALJ/6xkkoIk7XXtWQMKEFx
         yGXy9edVR4lpV0RaeacsdESzyIRXNRQ937OB3fpsKHu1cCVeZd1ldmIRw/tFILwWYibN
         2aFt21sZjcKa9rwjmGhIa3kPnw/kaZQfzdf66gXi1F64OEobtC8D6GNYU9oHEEOkbWqt
         SQGA==
X-Gm-Message-State: AOAM532VlCc9H4Vamx4RYrLYl9zIBt22OfBJVzGb0KOiqez/aseZK8FM
	GCwlyWpSGuee5tqnqmvNj94=
X-Google-Smtp-Source: 
 ABdhPJxoJNwz+F/MtkPY/Nkgr7xc+xTTVBmIkCZUlypLlCXR4Bt3gL4jlpBHzYpB55N/5TL9Q6klqQ==
X-Received: by 2002:a05:6512:33d6:: with SMTP id
 d22mr50564927lfg.564.1638204156578;
        Mon, 29 Nov 2021 08:42:36 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 b10sm1584854lfj.230.2021.11.29.08.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 08:42:36 -0800 (PST)
Message-ID: <2c2e6ad1-526d-06a4-d248-914cc1b64f11@gmail.com>
Date: Mon, 29 Nov 2021 17:42:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [OE-core] [RFC PATCH 0/9] Improve native/cross reproducibility
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20211128094532.1145820-1-jacob.kroon@gmail.com>
 <CANNYZj-nqD8u3b8_jpE9FhvGvzcpc2aJQqbo2WAhM4XejgXRGw@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <CANNYZj-nqD8u3b8_jpE9FhvGvzcpc2aJQqbo2WAhM4XejgXRGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 16:42:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158954

On 11/29/21 10:16, Alexander Kanavin wrote:
> Thanks Jacob. When looking at this patchset I kept asking myself, why is
> this or that change necessary for -native but not for -target. I think
> it would help if you include that information in the commits,
> particularly, in 1/9 as it is the most invasive change of all. Maybe we
> can then figure out a better way.
> 
> Alex
> 

Yeah, I think its because there is no extra manipulation of rpath done
for the target binaries at all, since they wont be running in a location
other than what they were configured for. RP, Khem, please correct me if
I'm wrong. The native binaries on the other hand will need to run from
each recipe specific sysroot.

I can update the commit message in patch 1 if that makes sense.

Jacob

