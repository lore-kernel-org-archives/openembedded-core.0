Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900CDC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 11:07:30 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.12224.1741864041082406025
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 04:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hrbeDhDM;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e90b8d4686so6885426d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 04:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741864040; x=1742468840; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x1SQo41RofBpQYwDdozLRYciVS78cgYTNe1si5+If5Q=;
        b=hrbeDhDMUzfpMm3Y+XGOUtsX3GFO3FvOs9nx8Jwv2DkZRQ6lKHbb4i7I2oUTFsnZr0
         jqGNXssSjeub6MyNDMKFXa6nrOgu4+cY58AdXimCRb2NrLfjKLq6zWQeLVtUrStHeNhS
         oZuc3ljzP8l0WO4XyfeRJPdDXxCTxW93fZnJWmWlYtKexzJ26ykPQilRq48cXr9+MCY6
         tl+ZE0UfqeHJHn4FcUeTT/2JO+hcGgpGiDOijEB1AZB681ArhCJbZBBkWAuX7LFFzgrP
         iZcYkpoh3iFOTOUnWrQE/LeZvRY44/0nMNx7yNNlGReKg48efGemaYbU/gVlO+qt3s+k
         V0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741864040; x=1742468840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1SQo41RofBpQYwDdozLRYciVS78cgYTNe1si5+If5Q=;
        b=ohKCCajF5RgHs5TbbgpL/w+hFtNgArTit3W5WaCyP8/gwxobQIoQow7P2uWwsHzZms
         PpZbPFEkGtMFQIPx1EpU8d3jpDRsjRN99ESvSLhSkJUB4iO6KpVkdjqo/OrunUHH27DY
         l/KZmgHf/MCZW5CtfmRSPom74RSU0Aa689yrZCFiGxHsa85iQv2QDjVXiqmL+X2fVqtF
         YN1WcjL8VOrlS/hxACMu06VcOsiS9t+rDHmWew3XeTdjvT7Xx0Zwao1q7pYaDbvuHEv9
         xfah/fUE+X+qDQsQYLJEDthxiVFeR1luK9I7cYbA6LJ9TCBc6LD5ZAKxRX3HHoUaWMbl
         YiPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwQlUOxurXPZnj7DsMAU8oKSOgxPwdwyu1A3up/DZUh++XKV19NLzxIVRyevP+GELX0bYvkIEXtCpQOYnSt/rI/A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyVVkcqvjYF5VcERn09KGLIZvhc+udtV80ysCKGjQ92ThnxWqU8
	29CI+N96F4+5Y6mgNnARR/AHRifa8KZPHbIAJKxIW4wbXN8pVK6WAtpZQ4KGe/VTUxXXou+aZct
	Vb2UZApFg+q40/kgy/NulOxqbXUqI+w==
X-Gm-Gg: ASbGnctOV3K2m5itNneSgNzF/RyubknEQXgSD4l7PoVVFLTxIasQmcY57UfxoT78VIb
	kF7Nbzm6zXkcxgo1kJvTdM8WrTRYrNgzC3MxIeR6rETxEHAZFGU3w9oczVBjXsWLaGvddSkD/Vz
	MKotETs0q+MS6CqQldxMM9eLcJ
X-Google-Smtp-Source: AGHT+IHhPAwHxq+kZaRWs8+nDDykzB+YscNA6BbPn+KDxN2QY1XzAOiYjkLbypwH9Fg1gk4oaTx3EY3kPZTX9+BH0UI=
X-Received: by 2002:a05:6214:f61:b0:6e8:8d15:2d3d with SMTP id
 6a1803df08f44-6ea3a6a63demr134633626d6.40.1741864040187; Thu, 13 Mar 2025
 04:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250312123610.4018764-1-alex.kanavin@gmail.com>
 <20250312123610.4018764-2-alex.kanavin@gmail.com> <ad57ccc7a58787ef153e08802fbcaacc1119b0f8.camel@linuxfoundation.org>
 <CAMKF1spKOca7kCEGZiSRXmWOdGVk7Lz79RDo43t7e_tQVLK2Fg@mail.gmail.com>
In-Reply-To: <CAMKF1spKOca7kCEGZiSRXmWOdGVk7Lz79RDo43t7e_tQVLK2Fg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Mar 2025 12:07:09 +0100
X-Gm-Features: AQ5f1Jr1BUKTB9XLliTkcb4Xrv_C9hgPSUmkyfD7AEHtQRsPuIz50Q7MnjfqFNQ
Message-ID: <CANNYZj9x30rSHegdqNbd3KT1DCuiKaWUt+HtpCoccY2grhMDQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glib-2.0: address ptest failures
To: Khem Raj <raj.khem@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 11:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212762

On Wed, 12 Mar 2025 at 21:20, Khem Raj <raj.khem@gmail.com> wrote:

> > Probably needs a libc override as it breaks musl:
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/1183
>
> Does it work with locale-base-en-us ? if so then we can use that
> across both libcs

It doesn't unfortunately. The tests explicitly set LC_ALL=C.UTF-8,
which comes from locale-base-c in glibc.

Alex

