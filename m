Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.9712.1600324810463720745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 23:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aqBiJEi+;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: grembeter@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id d20so1201744qka.5
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 23:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vbmQTkyAiem3cJUmpJKxUueQ9kCoXgWfERZq3omPs/E=;
        b=aqBiJEi+5hfwTMSqgkfrKHwqjrCS3quchyx7ax828eqtNOtP7FhqYzQ+Rs9RGCBcFg
         PKGfyZOiZIY0058ZoO3TF/d/yLl7GbsABABnhWVbl+e24DnuN5uDAoh4PFBxQgMXx95J
         P/6WSmAVMEfCwAey4Rvinz5oSkV0w+Xc5klLhxiHc62nebuXJIZicS9F41tXB3QPkWCN
         msccc2wwCBqzSvCGsQDNymGtwI1neLNDxMnLH6VkTBGelSlt1q4nQ1MzYWoDUD3mBMVi
         qb9D5aLzRVNLnG7mYycJtWN6SnhFQPmR+IIdANM+oWmwT7+6FtJS3pCjjYF+kseF/VwL
         xPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vbmQTkyAiem3cJUmpJKxUueQ9kCoXgWfERZq3omPs/E=;
        b=jKUglnWNBvN76Hq6Dut8yFJkpBb6PI6pdVxgjTOZTeZELbJB0fEG2Dmbu/AE4INelV
         gALCDydJuhpNvFoE5Arh/rzTgWPvwn+/77wnhB3QMVlHvkdFiMOJ0d4t0EZ/vrWWO0yL
         JXdqHxS7cycHlmc6ytk1PXzBoWfxj4jko9eUvNBUnuwqgUNokDlUR6jUtc0c5SL9Jfzs
         GDsWO/V98aIxT4tqwClf7XU5Ey4arDBMXVnihX2agjzKYgh1KDqSRXe2ZHgkZFipFjZ3
         xdtaC0Y86HFLoikW6NgnS350wEJwFm8aIV5Pc9YHa8+WpXisP17cJKV4TVIAdLLOO/cF
         GHKA==
X-Gm-Message-State: AOAM532177ACcFm/NAfzI09ns8QSNk/fhI5BPhMYW1/hxSqMG6OT3dtY
	+w+Gj25CU4lnQDCjXAXgxTyE2S0sgj6v5nqbBZo=
X-Google-Smtp-Source: ABdhPJzIKfykZ4b+7uTqibZD4jTGUc78WeysyJfazvFoWqDwWNui+39zVqevFRjNaOyHQ9ziSeLCoJvjj70Yxu0c1ws=
X-Received: by 2002:a05:620a:a09:: with SMTP id i9mr24269564qka.201.1600324809625;
 Wed, 16 Sep 2020 23:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAGFuAuz+8M62V2qkc5HutJZDDLXxacF2ajr-4wuZaOKqZ1i-nw@mail.gmail.com>
 <CABcZAN=LCFfzCi=RVqggOno1sxcsC=F9SEj2hDL7MQHu=SM=yQ@mail.gmail.com>
 <CAGFuAuyc3TdWx_a1EwgnvMxjXh7+Nj4w+bTrZ_yJa+KBxbEgCw@mail.gmail.com> <661f48ab-da7a-cefd-a409-25631e7330c2@kernel.crashing.org>
In-Reply-To: <661f48ab-da7a-cefd-a409-25631e7330c2@kernel.crashing.org>
From: "gr embeter" <grembeter@gmail.com>
Date: Thu, 17 Sep 2020 08:39:58 +0200
Message-ID: <CAGFuAuxrqyqCYF81RCKdPM7P36AVoqWJxb+uBD3DDBsgAUcgQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oe-setup-builddir: create conf/multiconfig/ from TEMPLATECONF
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Christopher Larson <kergoth@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Just for the sake of knowing, how do you reference multiconfig directories?
Do you copy them manually to $BUILDDIR/conf after setup-env is done?
I mean when I run `bitbake multiconfig:configA:core-image-minimal'
there should be "$BUILDDIR/conf/multiconfig/configA.conf" file, right?

On Thu, Sep 17, 2020 at 12:42 AM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> In my configurations, we refernce the multiconfig directories inside of our many
> layers.  I definitely don't want the copied into the conf/* directory structure,
> since I don't want users modifying the prebuilt ones.
>
> --Mark
>
> On 9/16/20 12:08 PM, gr embeter wrote:
> >> Why copy this from TEMPLATECONF when they can be supplied by any layer in your BBLAYERS?
> >
> > At the stage of creating build directory I think it is logically to
> > use TEMPLATECONF both for "local.conf" and "multiconfig"
> >
> >
> >
> > 
> >
