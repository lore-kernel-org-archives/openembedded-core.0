Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D377C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 11:39:57 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.114544.1738669192006483751
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 03:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UQqNvIqY;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b6fc3e9e4aso495602185a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 03:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738669191; x=1739273991; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GARsnRO/gfpGvGc/Bo4MRan5v+dt2H40Iv5eqy4CZSU=;
        b=UQqNvIqYIFquUZX3vHQ0juYe1NLhf5rsI4OLBdOLmJGGZyeltDUJo3xVQnWr/ySkKR
         4yzsuoANOI4JzhH1tcQGQdelSSstD2BqthlnPiS5SZGPKGiMwCH/XYmEX+ZLKtGPcVNz
         bzobee+oNOIJLmsvKIZhr9pWL4ZVHIio3x7FKeRLn59Pu76QvLkbjDYf22pEBIZQehMp
         Hx8nCFZfNFn96ZVI8DU9KEbhdrUijjYn2wpPr1BE3sWlNE7ryCvIXabwlGR/459RwgeG
         GGPRpsi4DuMPHxJB9AiDisQDM/DfBR1O5WqAlExJOGdMafQUmYqVrDVHYAoKgg1LCqd5
         Wj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738669191; x=1739273991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GARsnRO/gfpGvGc/Bo4MRan5v+dt2H40Iv5eqy4CZSU=;
        b=fVQyM0WtPJN+Rhkb2A+ZXmdpFEyOJr0bLva3uv9aJw0IYYrsND6X7/y+CG/bNb9tW0
         BnbXqhnPPR3CMgLY1Pb3e0JpwpkBPuOC+99PDC4dBWN46LRxeBS/Q1g8I2CwFHqBwyTa
         1NuQ4NOtDbg6GQptFl8jboIVZ+iLz7KN1C6RQ7BfaKWsx4GDMjSQOc1lV5MoJwoE6Y8L
         SFINa/po7U2Pc0WB4LBcdPMvAk+N+qrY1th1JvhZOOuBugIAlj2VJkeIEWcvIubYIXf9
         vbQ/g93spBnTOhkRkra1Cs+EIEmnMFRrikUy6KZdHK9bvqI/K1y0INPKS2rN1r3F4dE+
         ZUtg==
X-Gm-Message-State: AOJu0Yz0ULKKuUbtCauQhJhQJQjRdykd0DC3Kdvwu50bCvVtABnMy+uM
	8QjJ5+3sGX6/elKrYZGIhpXYNyFcphqlg9HgBGQZoLIhYO2osDPwiTuLBX2+nM5o4xVSxUFGhFM
	1ptHEAGD9duDppHMT9/EkIp/6OG8=
X-Gm-Gg: ASbGnctjjZTX1PSkBnWdQFXdN13L7FxFDajQ9A9B0LZBNMk2Lgkj4AgOPN3NRN8V3Ri
	tUL0Z8hB3fswKHkQPazvMPslhpllGbFWFatnkZLQJ5u1alRIwsUim/7Co7zpft76wqVgRFi67EH
	O4n3uWr0HlnayahDRkknuKSIo7PNDCUMA=
X-Google-Smtp-Source: AGHT+IGjA4nNuTGMYc0oFeUOMhuoNgr31/Ki5vKcdezuYnQ8gA6dI2og6SdgetFjnXEQXQiGWpaAaiFEuhS67cWQtYk=
X-Received: by 2002:a05:6214:d8d:b0:6d8:7a7d:1e6b with SMTP id
 6a1803df08f44-6e243bb5e06mr393752366d6.10.1738669190983; Tue, 04 Feb 2025
 03:39:50 -0800 (PST)
MIME-Version: 1.0
References: <20250204103744.27883-1-othacehe@gnu.org> <CANNYZj-O24h9m9gG-yHpDX4s9OxrJrfkfKDuETcXFq8X_r99ow@mail.gmail.com>
In-Reply-To: <CANNYZj-O24h9m9gG-yHpDX4s9OxrJrfkfKDuETcXFq8X_r99ow@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Feb 2025 12:39:39 +0100
X-Gm-Features: AWEUYZksGiEX0fpUo1n9Wj2KsCWPCW-nqyMi614z_O9cpP4tJjEWo-1V5yES1uk
Message-ID: <CANNYZj8Henj1KLH-T7PCBuOJ4S0-XjNE2Rk7NYrwahWRakmO2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] lib/oe/package: Add strip keep-section support
To: othacehe@gnu.org
Cc: openembedded-core@lists.openembedded.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 11:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210776

On Tue, 4 Feb 2025 at 12:37, Alexander Kanavin <alex.kanavin@gmail.com> wrote:

> I don't understand. We already have support and tests for
> minidebuginfo, so what additional functionality would the above
> setting enable? Can you adjust the existing tests to showcase that?

Specifically, this:

https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selftest/cases/minidebuginfo.py

Alex

