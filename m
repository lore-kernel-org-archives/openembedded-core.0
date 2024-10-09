Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1DDCF0449
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 09:53:29 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.12533.1728467602111405909
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 02:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GNmfQOv9;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fad100dd9eso65840681fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 02:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728467600; x=1729072400; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XhOGMCFs8bWlSfOyM/7KAmGH1HViFMNQ3LwCTDdI10g=;
        b=GNmfQOv9E9asx93ekjYn2zrNexwm0I0Ld2SqxRxr4tHPjBautbIh0nR6efu7l+AKxo
         +2PeWv4zNM+oo7t6I7DAgTQ1UrXeQdwXIb5LHLjn/K7K8b7h+MsuxRkz3sO7sDU8l7mu
         sa8rqub7GuqLlUDxefGI5WzBLw/S4zZMUeHthle0PUwUf6ZxjGxTPyNNcv3Jwe5nLSnI
         Vuxe2UCXoMj/4kc0MaYaPSwM6ZMcno7YY2yf83rfguveX/5fzwrYxPcBfiAYqh2MCcXI
         45CFUXhTpMnbODzQGHWJ6Gg5AmbrzmNYljF20E7R+yBknzE3f5RGg94wofpJrhyX/7fd
         XAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728467600; x=1729072400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XhOGMCFs8bWlSfOyM/7KAmGH1HViFMNQ3LwCTDdI10g=;
        b=rQR8LrSzT65JjiJPc161BlypjAE6oxVQXgomIU/FNDZL17J36HngjS1WKkD19AvhTK
         qjcGlDjn1ExjKFEgZCGdnr1JEpyTc527QRDBy5cFnGbMa0aezHYZ5HakS5K7Cs7/ymn0
         boFgNHXn5Pm7mHKJ9KupWlGovB/jHCGS7myqCiRfyIs+IJVp/sAAf+2Rr63PPtNTmZ9b
         wKXivDsJTZYU17L2OKFUCRHl8+M3iOB+IWfei5tx+3oVgY86GeS/YB6qyU+xcxS3NKhe
         fhlo7ZnVEJFjKFHOHXDs0pNc+FxA+jQfO0gv5ygaMN40nzP6F0kGQ/+R9vxEB5m0gGga
         x2Hw==
X-Gm-Message-State: AOJu0YwUhcaTLgxQsU26QfgdPghPzzEukXGiPEspfwSmQxqgf7d1nte3
	9rdeunhsat9uZrfbKYTJV8F7SB2x2wq9iyUuJKY6/I9YEqpgaXNEzSlYjrFqY87bZP4ZHGKcr5E
	rLdHejQDqXbJOTZRaJBlVnQ2DvpM=
X-Google-Smtp-Source: AGHT+IGa5s8F8L+d/0GUNSWr4tNZH/1jU0vdYaLznhFu5KysvqkeFrAGYJSFN26Hz7VWdDxO6J14GCZKwGhnQ09GeWQ=
X-Received: by 2002:a05:651c:1502:b0:2fa:c18c:faba with SMTP id
 38308e7fff4ca-2fb187ce392mr9925691fa.30.1728467599856; Wed, 09 Oct 2024
 02:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb_-W3CLfx1TCD-705gR05t4kVGXUtQeLc-z9=g+wFj=mg@mail.gmail.com>
In-Reply-To: <CAK5yBb_-W3CLfx1TCD-705gR05t4kVGXUtQeLc-z9=g+wFj=mg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Oct 2024 11:53:08 +0200
Message-ID: <CANNYZj-XyKAupgQ8973-ssh_3U+Zg4rScVYYgL-7dR87yN+qWQ@mail.gmail.com>
Subject: Re: [yocto] Yocto Project Status 8 Oct. 2024 (WW41)
To: yocto@lists.yoctoproject.org, sjolley.yp.pm@gmail.com
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	yocto-status@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 09:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205344

On Tue, 8 Oct 2024 at 16:49, Stephen Jolley via lists.yoctoproject.org
<sjolley.yp.pm=gmail.com@lists.yoctoproject.org> wrote:
> For 5.2 it would be helpful to have rough development plans for areas of the project if anyone is able to help document a rough roadmap/plan for them. The following areas are known to be being or need working on:
...
> If there are other areas we should have plans for, please let us know.

I guess adding clang or parts of it to oe-core should be in the list too?

Alex

