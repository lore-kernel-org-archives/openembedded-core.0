Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0850C38159
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 12:01:13 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.13418.1674043273033879905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 04:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e2wJxD+A;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id j1so8045353iob.6
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 04:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+bGMezNLftV7wohRXpnyb177mbOgxGlhkHhRHVXsYjI=;
        b=e2wJxD+AeD6nV9uokzAVcBbTtwMI3CnmkW5LitfXig0os3hr5t1n1ywUVkmlxT9SlK
         yaA1VKztvjnh9nOcSfrZCeUitbCKln6iX/MI4Atjhq7ZqwT89AJ2br6KPsfvH5rPLsT2
         d91foU8ulchlR5VvWWyM03obt1DJgzqxQQBMP+8i260B2GFTnWZnwCNwrGUPRxtMFsAq
         8g3v6a/Vxd+JHAgC+1VE6PkVoqgIT19iyWaZ8wm+AkCZtmgCivmWo6Ou+K/fq8wpz9P4
         GWDCL4JUTEHPTk0a67FHjen2yO2hPHWcvZMWVJGV+RKmuh1OjMt+Le7KpcSI2alTBaeX
         GHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bGMezNLftV7wohRXpnyb177mbOgxGlhkHhRHVXsYjI=;
        b=zutro7KWCUtHCxN4r7ZE80E7K6A3NaO7fjw3aW77vu/3DgM8YhzGtvcbnTc1dvyzOv
         90alKWpTBIEcFP5aNh68Cjls6RQ22m9EcRpq+k/djwks4zAZrABPGzhq/QfWNzBrPihp
         3CshKgkK4HHcUVqJUNGizz3hgBHvWxj64XgJfaLdbVprdwcAgkQP2R3wDm7LIHzzKkMt
         hqnBMA6SUKGzYEnCvrIwxvLysYbZBCp+Ow67UV6VGTKyQIGwPGhNOF8r10YfZ4Z/tcnA
         rRTasPWzFsUGac2PfC1L4jv6QtiB3PJj6pF3UJYji7hYA53miZw0JwCuLRL2GM7K9jE2
         QaDA==
X-Gm-Message-State: AFqh2krkyR7cWU8nWex50DPvWgnHYsACBhYT69uCVt0V5FfDd+t9b5/k
	EtUEMKLN00BLjSCMGrLiW/mrBXvyd/42m9TCMbo=
X-Google-Smtp-Source: AMrXdXuWpKKWnwZ+BclYvh9Ufqz0h74jNdjRMlmZutqIWg1WQvdqhIW3j06BW7JymkysIylOcYg/rFHAbBCwijBOFao=
X-Received: by 2002:a05:6602:1782:b0:6e3:134:3a97 with SMTP id
 y2-20020a056602178200b006e301343a97mr548376iox.64.1674043272377; Wed, 18 Jan
 2023 04:01:12 -0800 (PST)
MIME-Version: 1.0
References: <9ff8d23a-d44b-2480-ca3d-dfd5d057436d@windriver.com> <17348.1674042183734415898@lists.openembedded.org>
In-Reply-To: <17348.1674042183734415898@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 18 Jan 2023 12:01:01 +0000
Message-ID: <CAO5Uq5R9udswL4RzNhtsWNYzN1U+sDNrrxvFX7FBvLyOsn=e6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust: Merge all rustc-source patches into rust-source.inc
To: "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 12:01:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176088

On Wed, Jan 18, 2023 at 11:43 AM Kokkonda, Sundeep
<sundeep.kokkonda@windriver.com> wrote:
>
> Yes, linker is needed by 'rust' and we checked that linker issue is solved by adding minimal required pkgs 'gcc g++ & binutils' instead of complete pkgs provided by 'packagegroup-core-buildessential'.

Does it really need g++? If it does, it does, it just seems surprising to me.

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176087): https://lists.openembedded.org/g/openembedded-core/message/176087
> Mute This Topic: https://lists.openembedded.org/mt/96110740/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kiernan@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
Alex Kiernan

