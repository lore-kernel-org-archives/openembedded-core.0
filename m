Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F8CC25B07
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 20:03:06 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.3070.1660161779855271445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 13:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ChxVQ4hD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 186-20020a1c02c3000000b003a34ac64bdfso1567534wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 13:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=IQ9JD+eBAEx65jkHmN53qnQngbMaP9wGMBRcxSrHTDQ=;
        b=ChxVQ4hDKM9HL+Syj5tWVXgGfX6//c2VMGUtRLqBjYW+TffqVnVfzTnTJxjWLRjzO0
         admDPFMNgogNew/88fnFvWwNsetBnptUqvfh7NQFvaKQZzJtESo9i40mc1BG7XNNQ+6X
         +2OF5ZL/PfkYYTgijhnFn3WppS1iyvv5UVwoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=IQ9JD+eBAEx65jkHmN53qnQngbMaP9wGMBRcxSrHTDQ=;
        b=ZfQohFEwn4iXPWhoO1D7e/1QV8SHP8/xvzEUUS0rJLnHrB30vEVlqL22kHYIPk+4zZ
         XBSnMdXgM4XPBYGxt36o8o7u5HK8nW8wAxdb3FzXZsQUv0eTJpLAC+1RUmDBlKeW1stt
         ABu2C+FhV51kMyU4uodm7z1e+WkEIQIWmGP4SbVnhFRvRXnYJxTt80bps9FJSXas5QFr
         cJN56oJZ0t7fQyK8/iOhs20EdqFSQOSVKW8vbK/MTGMmB1xgpM97MbkZVc2w/xodzKbr
         bmI9sIDo7XbBDJuuP8InwFqZVSKHf+TPXqhIAXOmJh++ke0bbLHa8mWdUhAAuQJba9rX
         wRYw==
X-Gm-Message-State: ACgBeo3NuqPnnLb/OWQDqkY3CSEfxHrNt9liIOm8g/MVRm465YTx/uB0
	v5t2y7mWdI0Q9Iwz4HJl9NQ91NLzUQX4pQ==
X-Google-Smtp-Source: 
 AA6agR7nvKzGm+PrZXaPrQBbM1R2ARFjBPOoW2Q/P+iKrlUv/spyhOWIJ8jzVOVLlMzFqU4elJDUXA==
X-Received: by 2002:a1c:2701:0:b0:3a4:f86b:9d28 with SMTP id
 n1-20020a1c2701000000b003a4f86b9d28mr3453504wmn.168.1660161777886;
        Wed, 10 Aug 2022 13:02:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bdb5:cbd6:cc51:991?
 ([2001:8b0:aba:5f3c:bdb5:cbd6:cc51:991])
        by smtp.gmail.com with ESMTPSA id
 t5-20020adff605000000b0021e5f32ade7sm16876545wrp.68.2022.08.10.13.02.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 13:02:57 -0700 (PDT)
Message-ID: 
 <87ce9ec2232a1c51ccad74ffcccfcf4927fc4efa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib: Add copyright statements to files
 without one
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2022 21:02:56 +0100
In-Reply-To: <170A142F264F545B.30714@lists.openembedded.org>
References: <170A142F264F545B.30714@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 20:03:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169211

On Wed, 2022-08-10 at 21:00 +0100, Richard Purdie via
lists.openembedded.org wrote:
> Where there isn't a copyright statement, add one to make it explicit.
> Also add license identifiers as MIT if there isn't one.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Sorry about the duplicate patches, I ran a command on the wrong
terminal. The original series of 5 patches was correct.

Cheers,

Richard

