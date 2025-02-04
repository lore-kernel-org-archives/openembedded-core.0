Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75618C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 11:37:37 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.114512.1738669048961952210
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 03:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ArZ/5Mg6;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6dfbc45355bso58206806d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 03:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738669048; x=1739273848; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mdPSBHd58azDcXtZ9vvuIvhw4anN6/nOyzpzxdpG1fk=;
        b=ArZ/5Mg6HnOmAvxo0Z+N4/DtUCNhD4d/ix0tmd9Tyi29K+Akgk2813HowwlsbQ+MHI
         j/9oWLvvH8OEoWgwTNKKUjZI59ghL++gxd8RDfVd6rTUjyox1nTPXOLBHcHRw4BChwWl
         1j0zQaHLayttrQ55cCzxduQKPTWmw4SW7Il8XKqziavpv+bhhr1etTygMJ+lh+3LBEaP
         Gx4IiNjkgzqj5IT22MZpQkyR1vBK+/aY8Do1z41pMcAaDpZJ6jeo0qeqyIpSoVA2lna+
         nG1zakuMvWpPN5ngoFvln2UgDOXGwF73U8N1sVMp0n3hMzB+UM+ELe5SKN/S7U0NTJyj
         NXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738669048; x=1739273848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdPSBHd58azDcXtZ9vvuIvhw4anN6/nOyzpzxdpG1fk=;
        b=EuzdkcGgFLTWUZIy+ef4AKLXlqEbcs1ODkQ4q7aShm8IRKw8iJqhoxDXp4+J0gMtkS
         XrbMMgpzIr+jIGJLTBFOJ/6lP5sIKksamGfy5fMoq8kgtpzijOIOGyHpoGEAm9s+oIgq
         Xsv76zGF+NvM+h8fwhwjDcTBQH2nYYIDoWkuPyabbnl63mHzGTkXxHgSmij23lVRB4gE
         GX14abNQ+s497esrz/nfMVrBdyb69GVSzNvAOmtFz8U1O9/86PO8TrTIXqLCze7JSVS8
         yfKU9QJQVg8hsMVW3Y+vyv4L439vKR+sRSGzIhya7SnH0b/Ps4XfKXNwON3ptvrAakFR
         hhxg==
X-Gm-Message-State: AOJu0Yxc2QVmHxTAa5GOuRjzl1itPOcLVBq7DZORUeE9nKTEOsXP0oM8
	GBp6i7l3ewRYu2eDiYQqU6pvwk2MN/pBDNAj0/Wl1OndWrq4dIDZFRZRVksYAnqTpgwRP/KDwvM
	HqbrmDzhbXaKclJFWg0gRT3ANJYU=
X-Gm-Gg: ASbGncsnTbZc8ATWxcO27n/1z2v6eT//u0AYX5pyvywoXJuFcf9FV0vvc9q1w4d8wEy
	bTJ54k8S8JAPrL2aFXSw8KF0kK3W0cdD3ucmRI+KWbaMvlfQR6xThmTuEvfZpLrGMoZ4OJ+aaYD
	vZJS5nJXntssv+syj6eT4rlFS8wQQjKvQ=
X-Google-Smtp-Source: AGHT+IFRbkFenu8vkvw4TpoCHgDcfLhPSvs83jklwq+V1/R+++v6xg7gZVqAzKzFhRdkmxoKYCVMYLxRArqIiEash4o=
X-Received: by 2002:a05:6214:da4:b0:6cb:99db:bdd5 with SMTP id
 6a1803df08f44-6e243c793e5mr398301596d6.39.1738669047935; Tue, 04 Feb 2025
 03:37:27 -0800 (PST)
MIME-Version: 1.0
References: <20250204103744.27883-1-othacehe@gnu.org>
In-Reply-To: <20250204103744.27883-1-othacehe@gnu.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Feb 2025 12:37:15 +0100
X-Gm-Features: AWEUYZlnODcqnRHviJ3IXj6wdHBcgzwuR3cNGYLkUx2C3wtbBzUj9YM_GPlKHtI
Message-ID: <CANNYZj-O24h9m9gG-yHpDX4s9OxrJrfkfKDuETcXFq8X_r99ow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] lib/oe/package: Add strip keep-section support
To: othacehe@gnu.org
Cc: openembedded-core@lists.openembedded.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 11:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210775

On Tue, 4 Feb 2025 at 11:37, Mathieu Othacehe via
lists.openembedded.org <othacehe=gnu.org@lists.openembedded.org>
wrote:
> Add a 'PACKAGE_KEEP_SECTIONS' variable to keep some specific ELF sections
> while stripping binaries and libraries.
>
> That one can then be used to keep the .debug_frame section around for
> example, this way:
>
> PACKAGE_KEEP_SECTIONS = ".debug_frame"
>
> By using libunwind + minidebuginfo, that provides a way for users to get
> debug_frame based backtraces on target.

I don't understand. We already have support and tests for
minidebuginfo, so what additional functionality would the above
setting enable? Can you adjust the existing tests to showcase that?

Adding new variables has a high bar for acceptance, because the need
for them must be clearly shown, and they need to be tested and
documented too.

Also the patch is changing things all over the place, and so is
difficult to review. Can you split it up? E.g. first add some new
thing, then adjust code elsewhere to take it into use.

Alex

