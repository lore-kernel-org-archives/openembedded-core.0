Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C02CC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 16:59:18 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.95036.1638377940697780325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 08:59:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mRsbkGnb;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id z5so39464869edd.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 08:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OrHno/77/gJEMoalfl+Zg+KT49vprKQYLbyNpmPIRYc=;
        b=mRsbkGnbuFKL9Fl1DsavbYMErLG2qkYyORyRpFdgDk3SzFWCogJgqCQAEw4RsOQiAI
         7Lia3vWL6bOzw1f0/jWYcLsu5rhqF9RvlEWyI/pYoTXq4jvOSWePVs5MuIcTytVaee6c
         eRx6xfsRVhvlb//ggDTSAk4VyhmSBKEUrzjAC1m5D3u46aRd0/63xkU3NG/7IttPKtmR
         IMWg6zeQfvzygV5uC8Kqxhc6wChJzqL6kA1trQ8mALm3qh2sH7MYEiK/zAm18B7MIHVJ
         RNGQsP8Uj7sdtFGKiAx4uA7LCZ0x8NH2i61S9KgJEG/XwcE+bKQySSuyDO3pr56Tr6/0
         TN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OrHno/77/gJEMoalfl+Zg+KT49vprKQYLbyNpmPIRYc=;
        b=lA388Vv2g3g5eD5Mu58a7excb+7L23ahYYm/Wj/yNHjYVsonY9gtWLBJeNXvqFa0Nz
         24Vt/B53J+axTPGkjpxqJ8kr37fAGrJLQVmIkPEZFfIuAvwLIikHHL1Nda5maqN8/BYi
         XPSzIuTa+vDLFT+80zbFjcQAJL5cy/kf5u6EoV/rE3yxnX6bkGd/JYN5lPPVDpX2m+NN
         Ijcv9O8+PBTh1aHyaYhANrKUSAfcKVWH67Ve52yjymHjiGKs0mkzRnJi0EW2QPT6o4L6
         Hg3NugUF3RTeBQ0xPHjhrrSmdYGA+ayUalrBPtZpcURQZ2sipGn9xOwxJkdtX/Bw9Tp6
         OE8A==
X-Gm-Message-State: AOAM5327T3LJAQvNgFXU9+1GC50TEZfFgFjHtydE5zrxSKUpSC2o8EGC
	kDlPtJ3J63he+E64To76XwIeSgCTCjReH3lhZno=
X-Google-Smtp-Source: 
 ABdhPJx0nagp/Met3mBRD4g7BHJCx5rZTgoDmwJo1uymdnGVNK1mBm8yUDy2+9rLyhessIgxaxQXbIGRSwqsGWApo/s=
X-Received: by 2002:a05:6402:1914:: with SMTP id
 e20mr10293653edz.96.1638377939077;
 Wed, 01 Dec 2021 08:58:59 -0800 (PST)
MIME-Version: 1.0
References: <20211201162800.3128628-1-quentin.schulz@theobroma-systems.com>
In-Reply-To: <20211201162800.3128628-1-quentin.schulz@theobroma-systems.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 1 Dec 2021 11:58:48 -0500
Message-ID: 
 <CADkTA4MDSHzEyTWeVksHGqSnwPPyOqTfX=nd7YEq3_iqefVVoA@mail.gmail.com>
Subject: Re: [PATCH] ptest-packagelists: Add missing python3-webcolors entry
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Quentin Schulz <foss+yocto@0leil.net>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 16:59:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159050

On Wed, Dec 1, 2021 at 11:28 AM Quentin Schulz
<quentin.schulz@theobroma-systems.com> wrote:
>
> Resolves:
>
> WARNING: python3-webcolors-1.11.1-r0 do_package_qa: QA Issue: supports ptests but is not included in oe-core's ptest-packagelists.inc [missing-ptest]
>

I haven't seen the warning for this either, and I didn't even know
this packgelist existed :)

So thanks for the fix, looks good to me.

Bruce

> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>
> Note: Not tested
>
>  meta/conf/distro/include/ptest-packagelists.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index bf9d158a0a..c503a6a594 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -56,6 +56,7 @@ PTESTS_FAST = "\
>      python3-more-itertools-ptest \
>      python3-pluggy-ptest \
>      python3-wcwidth-ptest \
> +    python3-webcolors-ptest \
>      qemu-ptest \
>      quilt-ptest \
>      sed-ptest \
> --
> 2.33.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

