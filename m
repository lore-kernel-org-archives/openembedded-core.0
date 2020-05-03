Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.18571.1588482270805524188
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 22:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vPwqEGxw;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id a21so6352513ljj.11
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2020 22:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=6UAkR3GA8kKHzhO1z/feN9FlTVdR30IEMDm/hJfyo84=;
        b=vPwqEGxwnGMJlVCHx0EHjbjD5ndOOW6FUNEQ1nhms1yJXExKkZ6r/4gEPn6gqPG40o
         imKu8ohOgR4x1lwaY98UTPaFGiJ3fv1id60dC/epTcN4RrUlsbsS5CIPPQwl+P41LFbG
         fp4KJ3ye0tWkcGOoLKi4r857D+/go9vC7LL1IaPuJKOcY2lUP3/n7Ggymxazrr1XDloP
         vBAHoNneSpAOZ0iIny2RXFwNbHKc8dxUVeBp+MlUttyqVIl3Cwd9xXYpd2IORrayNZC2
         y8QH6sDbeit1z4lw6uN00/xllNkn1GtkMaqFDSRJQnoyrgMqAHZvoslq3Ww2uOOxVxKx
         EaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6UAkR3GA8kKHzhO1z/feN9FlTVdR30IEMDm/hJfyo84=;
        b=IbFrvk/YcauTArwpz6Be4NNyfCOcOGbXjIOhKmumIkOI1syp+tFhXHu4Z3Mo5zzQ75
         lwGeLmAHRBZRcBoidhOMsvJDhYb5L0t169SSfJj3hqG1JlWa+T15wOEc86FKyc9et13E
         JUp9Z13sRVdEKo5NjO0uxvK3OIuEcJzHzQe1QVKJweMM13oXHsWVu8sWpionFqR5zO0g
         rmsuj6iqgVGCSFUwmjcAMUC1dU+iJVp12eLVJ5DJzBeuqUHg2lY+SJO8DPQqRtfOHtpc
         1dJvWg0QYQoRtmfnBwpCJQgzkBe0KEcfwN4QgXa5A85aTMbEytn1qDZ00op0oSwNJjEb
         w+bw==
X-Gm-Message-State: AGi0PuYLh6U1LYa6etp1W/6fYntBimZAYlcIyjuQN1ILNiDpDhdR0Db8
	WZ0QYjyCIQ8507AGSz54aIaAg9PU
X-Google-Smtp-Source: APiQypL6KrvsRsPO04uSLuiAP23cqmXKth4mfeu1zj8Q/3tNXF9bq3+Etc4a81oIHo3yr16OWv9RtQ==
X-Received: by 2002:a2e:8ed0:: with SMTP id e16mr6819351ljl.96.1588482268495;
        Sat, 02 May 2020 22:04:28 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id d28sm254254lfe.76.2020.05.02.22.04.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2020 22:04:27 -0700 (PDT)
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHBzZXVkb19pcGMuaDogRml4IGVudW0gdHlwZWRlZg==?=
To: openembedded-core@lists.openembedded.org
References: <20200503042712.1878496-1-jacob.kroon@gmail.com>
 <20200503043253.2277.4916@do>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <fdff28e2-0ef2-ea63-8c0f-7f01dbc06178@gmail.com>
Date: Sun, 3 May 2020 07:04:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200503043253.2277.4916@do>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Pseudo README states that patches should be directed to 
openembedded-core ml.

Is there some special magic that needs to go in the message header ?

/Jacob

On 5/3/20 6:32 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: pseudo_ipc.h: Fix enum typedef
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/23915/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
>    Suggested fix    Rebase your series on top of targeted branch
>    Targeted branch  master (currently at e44ca998c2)
> 
> 
> 
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 
