Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB2AC61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 13:28:19 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.39870.1700573298666847978
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 05:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D1QdaDI5;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-548f35e6a4bso1454213a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 05:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700573297; x=1701178097; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5C3WOy5ecOlvJA/LZ0Jz6qhgTQaOxFHUoCOj3ZpViHc=;
        b=D1QdaDI5UD+HJdTswd15gPtWwojJD+94amMm/cgoB61CtjfoKppZj4vn4Cx3kUJfqe
         HGjkXe0uMGABOhjmzWDLKEcGHGeh7FZt7J5NtLA3HiZqP/1TABaL7lfg5VyOm3nEQMr9
         scnw0fmV/2+i5KyWVdULOiO0w1e6MVfaau7H0rDbq56+SoAVKLtGexgMoy6yQuMU7zd7
         vDnWCxiJIkfcIqdPY1rbJfCJkY+4hqr1PfZK1OuqAoPOAkCC0OBI11YuNeyEavgx+3ew
         OLkC3NwBxHU19/ysVlCOHAROBYY1cneb3HUYNx7qYR2T67krhU4kspJ4+m55XtOUOx/e
         UOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700573297; x=1701178097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5C3WOy5ecOlvJA/LZ0Jz6qhgTQaOxFHUoCOj3ZpViHc=;
        b=aEVxlzy6tMMHH/+tWFSQCb6bvArZUMmdxUXBs3RPi7ktwkp68xDr8zY1j4L31DkDef
         umEH1nTF/7Gb8eiedwsnjhl76KTJg38r0d4jI+GfWmH4d31p3lyFGBanJi1rrPWyY2xT
         bEvjpD2j0QN73JN4L/96XJ+zXDdqzmcgsCEVdjRmcXPJT2h3JuEKf6VV7n/NcZoOsLsD
         97wgR5bOx9/3fuepHC6mWmUd8xDVw+OVPkClGdOeGkRjZZaB3HHPJw5dMAS0mLyKjxUk
         PEoo/aCwpzG8RJuBwRTSWWw+JW6tNHiclYsPNW/G1QSqR2NZgB0Fx1sSFvqoI9BKaEaR
         R2Pg==
X-Gm-Message-State: AOJu0YzGJNhhOCGpT6vg3WHXPqSKXhvRRJSET6kNfsQ1rQX7eF5Oz4i8
	fMJCna4y2lK64FGJqiKiAm8=
X-Google-Smtp-Source: AGHT+IF91EK+aLDDvEegzArj9VUZk29xe+d6MKhGeoSogI7CnALcC9J+gUVaePCDGnAn6Y0H3fFXjQ==
X-Received: by 2002:a17:906:1001:b0:a01:9aa8:9fa8 with SMTP id 1-20020a170906100100b00a019aa89fa8mr1354418ejm.0.1700573296587;
        Tue, 21 Nov 2023 05:28:16 -0800 (PST)
Received: from [10.134.50.69] ([89.249.73.142])
        by smtp.gmail.com with ESMTPSA id mr39-20020a17090782a700b00a01946a962csm1043413ejc.206.2023.11.21.05.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 05:28:16 -0800 (PST)
Message-ID: <43135cba-e82f-4426-b049-7f926830817b@gmail.com>
Date: Tue, 21 Nov 2023 14:28:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][master][PATCH] ptest-packagelists: Add sdbus-c++
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Poonam Jadhav <ppjadhav456@gmail.com>
Cc: openembedded-core@lists.openembedded.org, poonam.jadhav@kpit.com,
 ranjitsinh.rathod@kpit.com
References: <20231121132203.932559-1-ppjadhav456@gmail.com>
 <CANNYZj9SpzPK_vAw56KSckFTd4Cfisuffb_N9mpw3oD0Nj=khQ@mail.gmail.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <CANNYZj9SpzPK_vAw56KSckFTd4Cfisuffb_N9mpw3oD0Nj=khQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 13:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190979

On 21.11.2023 14:24, Alexander Kanavin wrote:
> On Tue, 21 Nov 2023 at 14:22, Poonam Jadhav <ppjadhav456@gmail.com> wrote:
>
>
>> Add sdbus-c++ in ptest-packagelists to run ptest
> sdbus-c++ is not in oe-core, and so cannot be added. You need to add
> it to the list via .bbappend or a custom image recipe.
>
> Alex

It's in meta-oe. Please resend it to 
openembedded-devel@lists.openembedded.org

Slava

