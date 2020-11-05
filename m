Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.4466.1604619050355053034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 15:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=glCDKOLk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id c18so3203961wme.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 15:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=cwFKwPcKAxeG+Cm1MmGQnRj6JTfaevucXyWmw8ZJqG4=;
        b=glCDKOLkX/MZsHVDOA3HPiwnaHZL+DDsZjPViIBZiweF93eMw58FmXwQKmI3y6XDin
         oErskcAwcg0nfHpKf0TGExw1OwJ0j/Xxj20h6DWov30G3+8GXpYMccx2KsJeLXThQVsY
         tbk15FzP2RaU9uP8NTQTYNWAOWUGSOw6kvqWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cwFKwPcKAxeG+Cm1MmGQnRj6JTfaevucXyWmw8ZJqG4=;
        b=awav+U53NGR/WT60kHiguTkSw9oP1IwEZdAgibrwaOAwZE8WdNGrFVUT3DgZBAbYp0
         9N7GIoJd/ZkqNpN3uua7LjIN5x9Zuef3MQCUupEYj8oXgYovnt0VV95+FuBT79DPMpeg
         e0QZ718a9nBS69FrrArjyDzYoalUJF/r0HRK4G5YtliynxpNiJ8qpfJEnCuSNiXj9u83
         uFwVqsnKMcGxZABlrMQnz+JKZmW6dYVAYa2VC6T1zvXMeI7t8gUkpJ1NU1mcvIeeYIFi
         S09giQ2Xy2pppr8v6zZqkh4lGUwBZiKmj9sLLvXs8r0cNRUqRq/Hg3vSkZ2bIX3jxd26
         ZzBw==
X-Gm-Message-State: AOAM531EFEkpev8/Trehblqb6pFKahj/bOAZVl1iEVrMmF1Rnp8/dZVN
	jLGSUu4Nl9YoLcsdi+qHfeJmDg==
X-Google-Smtp-Source: ABdhPJxi4R1jiw6bu2UwKJzktjrnDqpw5mXMCjySECTPoLVmuXCX6QMAKDQDL/DH8VN4W4IC9u4JPQ==
X-Received: by 2002:a7b:cbd7:: with SMTP id n23mr5253174wmi.142.1604619048807;
        Thu, 05 Nov 2020 15:30:48 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 8.b.5.4.f.1.8.b.1.d.2.1.c.c.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (8.b.5.4.f.1.8.b.1.d.2.1.c.c.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:90cc:12d1:b81f:45b8])
        by smtp.gmail.com with ESMTPSA id a185sm4437867wmf.24.2020.11.05.15.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 15:30:48 -0800 (PST)
Message-ID: <71c52cf8f79485db66584f8ce85abee7ba3e5c54.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] setuptools3: use DEPENDS_append instead of +=
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Ross Burton <ross@burtonini.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Thu, 05 Nov 2020 23:30:47 +0000
In-Reply-To: <CAJ86T=VuUjZzWwetPZsQYmFMDDJ9VtDqfqP9mbGGx024ktfzoQ@mail.gmail.com>
References: <20201104121217.4013924-1-ross.burton@arm.com>
	 <20201104121217.4013924-3-ross.burton@arm.com>
	 <CAJ86T=VuUjZzWwetPZsQYmFMDDJ9VtDqfqP9mbGGx024ktfzoQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-11-04 at 11:48 -0800, Andre McCurdy wrote:
> On Wed, Nov 4, 2020 at 4:12 AM Ross Burton <ross@burtonini.com>
> wrote:
> > To help people who inherit setuptools3 and then assign DEPENDS with
> > =.
> 
> It looks like there are other classes which could benefit from a
> similar fix. Maybe it's good to try to standardise and update all of
> them?

This is kind of like a virus which spreads through the system. If you
set DEPENDS after an inherit in a recipe it should be "+=". I'd much
rather classes just did += too and we save appends and so on for where
they're really needed as they're hard to override.

The alternative is to iterate over the system changing more and more +=
-> append and end up making += pointless :/.

Cheers,

Richard



