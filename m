Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F97C6FD1F
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 10:09:33 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.29904.1678097368986209729
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 02:09:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nRDEic6U;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id x6so9044629ljq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 02:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678097367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asTUh76waeNCrsF0cPLRmpCMa+dlmOvTgHtE8VhLrfo=;
        b=nRDEic6UrJty2KOHumEjp9YUt3FKSU+TZo7sbL6TRlpZP96x5Mx2T7rVefBcBr5iAO
         3z2+FE5kkoWkhqE8MSObAPP+U+nQhaQJrK6cbdqqvDT4MWw/pRdE4/Xscm28pJC3eYKy
         izWraqyxVIo/JaapHRciWKCUqqkAgfdHGC+jvV4Tu2+kMsVM12BYEav9w6Ni533f/kIc
         l7PeZ6TdpVKqsBp53k1MuIlKLiumgl5vKjmdnDpKQBwjDKfyzWEUg1g/XnkCIDQ9qmdw
         Aznb5x6Z5Lyur5HgKkVN20/Jb4JZgq5cpVT0QIL6VuKlkjx9rY7ItD5ICA8gnZ5VnSpk
         5xQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asTUh76waeNCrsF0cPLRmpCMa+dlmOvTgHtE8VhLrfo=;
        b=bvZBi1JGb638eUwf3BF0XpTpPNMCFLQ/bPGYfVdgxZUVKE5pYBib1TZshislQQ69t1
         2XfPfvDtstBJaLQq9PesqgMen/2bqJcW85kkZSzSl0MhaCr6Yb1+lHsyl1q69kuynecR
         jQvtKa/RHV2lphktuqVklLXgKVbPi3Arf7HX7gZpCSFS1AV1DZq9P1I9EmPZH283kk1J
         Nql/NRUad1hOiK/ihN7aaXDnR7pK891SMyUoOFtBXq2oRjY8+Nh6VM8kZsq4a3cxIjfH
         jwLDZi9uq/osKV61eU1eMtHOevG0scuhsbaaE/wklSLnYnWQo279NVxMljlgcbSSljDD
         y8rg==
X-Gm-Message-State: AO0yUKW/RdIdfg61jPYtCEYkUMWoHHWBBX7mee/YltZgkJV/fB8N9Z95
	pK/fEFHQh26xKqFzg73UuOYqOcqg9P0+pPlK0sE=
X-Google-Smtp-Source: AK7set8/pk8ZJrTFQdOs81hutpUfu+EEuUpkqjVyhXL2AeNExCB2CxLdxO+afej42XF5Kpf3N+X9WAsN+66//EEIKdY=
X-Received: by 2002:a2e:850a:0:b0:295:ba28:a43 with SMTP id
 j10-20020a2e850a000000b00295ba280a43mr5464343lji.4.1678097367131; Mon, 06 Mar
 2023 02:09:27 -0800 (PST)
MIME-Version: 1.0
References: <17474798FA156F5A.18951@lists.openembedded.org> <20230306091108.3347363-1-zboszor@gmail.com>
In-Reply-To: <20230306091108.3347363-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Mar 2023 11:09:15 +0100
Message-ID: <CANNYZj-r0Wo4bUk1E7N2wSWYTWjpWa3FeOqYxWFSL=eVHjmmOg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Mesa 23.0.0
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 10:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178065

On Mon, 6 Mar 2023 at 10:11, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszo=
r@gmail.com> wrote:
> * bindgen-cli MR has the suggested changes
>   See https://github.com/kraj/meta-clang/pull/748

I would prefer that this PR is accepted and merged first before a
change that relies on that recipe to exist is submitted here.

Alex

