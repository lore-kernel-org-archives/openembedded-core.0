Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D17EC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 10:24:05 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.17832.1671445444705859338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 02:24:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pX8z6hJz;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id kw15so20260564ejc.10
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 02:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BI8FprtHmKl69A25YhaR10NlCil6y5FGUBWup4uJsEQ=;
        b=pX8z6hJz141lW/fRhM0VsnJY3Hw1JzlqQr2kmHqYmeLbXoYQqaIuuwQ3LJ+CLaoY9p
         xL27cO0khMw67/naV8HPXN2colhugTR+7wztfCw/EQYFnST5CgVZBIYIw1x51w+1HYFu
         v5pi1WewHFnh6c8CYK8/KPicJ6/43OvfY+fLte43EenvloDSazAXKgpqvmGgqgD96fWL
         V67oOQ0rC+Th9LZC5DUYqif2l+yLTgweaKUBwnHTVkDsERcYIcBe8AE/4VuyzSEbDy0r
         4kElYGMY8llBfMavJ8zK/llNIe7Q5ksHttNBzrdShFqZP1orrd3aO0jIIO0YQXCNNlZa
         yQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BI8FprtHmKl69A25YhaR10NlCil6y5FGUBWup4uJsEQ=;
        b=AEOJ2oB90b6ccOze7eBjzNAZrENcaUtykn6sVNdNAfo87wzHFr/rH0S38zuEsJhELK
         2V7eA5RyDL8EJyQ4Mgm7JzS1gLGbgmD030Vs/UvevKvBlBnGC4bxszqy2j1CFlzHEoNF
         ci0EOoQriVaBS42qIbkuHTfF37lSQO2dU813hz3NnLmmjjrTVkFPHZGTqFeNg7xeuz4+
         C5DxjxutnI83hAUbOR3SQe0vCyParLmQxHzArawrsWNPlooQQyCyEoeeoErOoDwqGCPf
         2kgdfCEbqfV0F1+V+O8XWluJa7zDKxHE66WItwzPIamVtbuZ57LIEo+DUqp4RO9/+POf
         u5uw==
X-Gm-Message-State: ANoB5pmHKP90vqS0IknOmCpfcoKRMuZsknnh87Wl3TWZSVlPz9xoucCv
	bRCU+NmqhVaslj/bsfPnY4Hz9raLfi8j81wIhIE=
X-Google-Smtp-Source: AA0mqf63O0a/N8qVElsFdsTyPvdVlm05qtJ+O00ScqgAWOdPkj3jx+bG+f2KDMweiyhpOv4QWSLfrorCfZBI28E35Pk=
X-Received: by 2002:a17:906:35d1:b0:7c0:aa96:e934 with SMTP id
 p17-20020a17090635d100b007c0aa96e934mr32404045ejb.309.1671445443056; Mon, 19
 Dec 2022 02:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20221217162057.1377465-1-alejandro@enedino.org>
In-Reply-To: <20221217162057.1377465-1-alejandro@enedino.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 19 Dec 2022 10:23:50 +0000
Message-ID: <CAO5Uq5SZNeJWMDBBiT5qV9UF79nO9Garoq+O+NCdza8AnaLiPA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] rust: Enable building rust from stable, beta
 and nightly channels
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 10:24:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174812

On Sat, Dec 17, 2022 at 4:21 PM Alejandro Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
> From: Alejandro Hernandez Samaniego <alejandro@enedino.org>
>
> Rust follows the train release model via the stable, beta and nightly channels,
> by default we build rust from the stable channel, however there are certain
> features which are only available in the beta or nightly channels.
>
> Make these channels available by setting a RUST_CHANNEL variable which defaults
> to stable making this change transparent to the user.
>
> The snapshot version used by rust during its compilation wont necessarily match
> the version being built, specially if were building from an unstable channel,
> to avoid confusion rename this to SNAPSHOT_VERSION and use RUST_VERSION for the
> version to be built, which is automatically defined to PV.
>
> Append -beta or -nightly to rusts PV for signature awareness.
>
> It is important to note that this does not build rust from the beta/nightly
> published tarball (which today build rust v1.67.0 and v1.68.0 respectively),
> instead this builds rust from the current selected version (1.66.0) and enables
> the beta/nightly features for that version.
>
> Setting the variable RUST_CHANNEL=nightly results in the following:
>
> $ rustc -Vv
> rustc 1.66.0-nightly
>

I think there's an existing problem which means you're probably still
not getting quite what you wanted here... I think libstd-rs build
ought to be affected by this, but as far as I can tell won't be,
because we're building it with cargo, not as part of the bootstrap
process (and I've failed to find any documentation which suggests
building with cargo is "supported"). I've no idea if that means you
could end up with something which is subtly broken.

That said, my attempts to switch the way the standard library gets
built over the weekend failed miserably.

--
Alex Kiernan

