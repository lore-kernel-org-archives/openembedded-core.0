Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web08.9990.1611764347015547741
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 08:19:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sidebranch-com.20150623.gappssmtp.com header.s=20150623 header.b=Mr0ze5KH;
 spf=softfail (domain: sidebranch.com, ip: 209.85.219.51, mailfrom: leon@sidebranch.com)
Received: by mail-qv1-f51.google.com with SMTP id 2so1324603qvd.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 08:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RJhcWb0V/RgmcXuzTT1G8EKm0edig4olk7NEv8NW0Dc=;
        b=Mr0ze5KHR0QVwpyeEP2vUZyvNKni4DWQIeO0yPRmODXIptcTUj1BXJKFSEsoSWAP/x
         11sIm1QX5Flbi0Yn8Vl6FaHzwqH7/iZRkt9akN3JYTr3pZueKr4E5CgyMOnReZzJS/A+
         Cdhsel4Y2ULzsgkKMEbHD1lJzWzpyGFlvJroae2HFy8jUeheoIk/OmNTFFoytFP5P/NP
         LRzrEgLxojJ/BGf/yphcoKjHVCu+gU6C81hkQGjyTuOYy8cfLl62aZLS+B8YeDNm8mId
         afb8Sogis2Xwo1kyAv9epzVpMSWVYLzvXacSfPO9gnwFo56u6jnXFM0Ip6No/mgTlnRr
         cOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RJhcWb0V/RgmcXuzTT1G8EKm0edig4olk7NEv8NW0Dc=;
        b=jTB/bl8EGmYpPtnhWT0H0CEJGQxABxebN7hT0fRrQxIQ6Izw6i84jg64694OL92FFg
         5ASycfRc+7+I8EP/uM3GiSNQgFVgiGvYKGMwJ0ZfK+Vn8Dl+7rWkXp9nc4vwkshAtVI5
         1mIXUs/Lj3YfRiLfs3Txa0yoMdjqEqMNI1AyJXBL7+qoIvTJNEavxPC3NqGR8NHKR4ee
         pgAJhB78eyJ/SEm2vecyvQAL+oL4Ve6dtX0GpSzgJi76XnAqdnSmCsTsOIZfldkJEW83
         JXFxJmvtMhOz8V7ZqUvnQULpdUObaweEjDkj/9STdkeW8YTKLZkmWfdLgdGn+TfSrleF
         h7Sw==
X-Gm-Message-State: AOAM533jKq4ziFD97FHkZW3e0gU/xze5qDnbL8gZfIgORDmv/Dv27Jhh
	83l/5RiKn/Ma0skUx2vqDicMwl4k2gXo4ACYoJZKmxP+vmxyow==
X-Google-Smtp-Source: ABdhPJwMtGbUlXw8D+CXvpQX0hVwghDSqwP98LjXLWKyxSP2VMLKBFfapbqEzfjxFxtbax4y/TK1NObKkdisQ28glDQ=
X-Received: by 2002:a0c:a789:: with SMTP id v9mr10989245qva.41.1611764346002;
 Wed, 27 Jan 2021 08:19:06 -0800 (PST)
MIME-Version: 1.0
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.443c6779-935d-4b0c-bd2a-e7ccda1d0c4a@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1d651819-d3eb-4e73-bb7d-d97ad0bed5fe@emailsignatures365.codetwo.com>
 <9fa11fda-4154-f371-2b13-06dc33e9ce97@topic.nl> <CAMjhiJhR=i2ap+wMmLoqiYGNZSE7+VFLnFc1_oH-7p=yuRFtxQ@mail.gmail.com>
 <76948e1a-7a88-a5ea-fce9-87b0fa9ebfc8@topic.nl>
In-Reply-To: <76948e1a-7a88-a5ea-fce9-87b0fa9ebfc8@topic.nl>
From: "Leon Woestenberg" <leon@sidebranch.com>
Date: Wed, 27 Jan 2021 17:18:55 +0100
Message-ID: <CAMjhiJgH8FJ8pJMgq+JZ9hrHz3SeT10fSvEMnTt6LPjwc7hUrA@mail.gmail.com>
Subject: Re: [OE-core] GCC crashes on aarch64 since gatesgarth
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

>
> > Let me know if I must replicate a specific set of commits.
>
> Don't know what you mean by that, can you explain?
>
I mean I could try to reproduce your build locally, but I would want
the specific commits of the layers you are testing against, and the
local.conf settings that trigger your faults.
(I.e. be as close to the failing setup as possible).

Leon.
