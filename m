Return-Path: <vvavrychuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E90BC433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 20:21:31 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web08.23659.1635625290823234380
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 13:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NAjTWcLR;
 spf=pass (domain: gmail.com, ip: 209.85.219.182,
 mailfrom: vvavrychuk@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id s3so282904ybs.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 13:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KbAj8pBB5ScXvB3+EEoy1kQnCveMU6f9Vr67syFlrHo=;
        b=NAjTWcLRh95cwXcUSOxpwqiu/xKmKFBOITcuFqNy31A6DTfydCUfCa2gkjBJEgi6LO
         3B1OaaHYT6SlfV4lfL3O5KJYmEf712s6Qwist3sScb0cfy82TEEzcxdgTNkQjmaZaKEw
         dI9xrXozUk0ingkzcLMGXPwV/OZy1MITROjIRlftpYOILnKRcOZJHhdpRBeMR8LrVpsK
         UQCKMMgj+VZgzNGGIsuGU1G9YKwqsia85D+K6SGvx+23jaarKWp6YCdOh6i6EfhkecS/
         /0/nDuS88ygb7iVIwPSoKRmHMI+fhssLukBPWEY9SZAR203ckBHlxJPMQhG/ymg+lhTU
         sHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KbAj8pBB5ScXvB3+EEoy1kQnCveMU6f9Vr67syFlrHo=;
        b=z9IqzmlAvNEPpLc3JH19XqH48s5ytJNMUwKZAGGTFflAOiYDDBp657mvAhkU/kH1Me
         IJQRG/zrjGY36YGrOTUQdOBArt1TlZ6jcxzyp7nXhLPFKGxE1FMvti4nJKd10bpWW6ie
         q2SP4G0bWLPRGxXASdueBepWl4O+uJfv0szUPAYwSeeldQEn2qhES8yU5L6lUcXcyNot
         9y2UifJ3QyWw0TQLllcAutGWrJGmttOIURXRocpcxiQv7SSfLCeHO7s92a79rr7Fp+LP
         4nuXZPFEdc+uuOYY0WjhroZprK/UIoLe8YQUDl25qz8wux9o4vtjaN7BCigEk91+bMNc
         1wdg==
X-Gm-Message-State: AOAM532NRZDtPtTaCbVpoY+pUxyTjQf4Maq53NjRWjIqA8df+Lw44IBe
	YqgzRQYaFhT1dQ/GjW51KeoEnbk59vLD4Rb+LFQ=
X-Google-Smtp-Source: 
 ABdhPJxmvTZJZAOTS8VN/5fngOceBbPLxtojSTsUM0cWbi9UnQZkBXRR3miLpki2DAA2TNMNaCSb+hX86/vpT4f/zys=
X-Received: by 2002:a25:9d83:: with SMTP id v3mr20219214ybp.97.1635625289983;
 Sat, 30 Oct 2021 13:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <W5wi.1632764687377274770.mOgu@lists.openembedded.org>
 <e47d11b76cd90e456330dd111f9ca37fbd39bb4e.camel@linuxfoundation.org>
In-Reply-To: 
 <e47d11b76cd90e456330dd111f9ca37fbd39bb4e.camel@linuxfoundation.org>
From: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Date: Sat, 30 Oct 2021 23:21:17 +0300
Message-ID: 
 <CAGj4m+7jjDzf6ZXWDsEUhkzD5X1MoSWP7HWCknL_fKQ==x=dOA@mail.gmail.com>
Subject: Re: [OE-core] ERROR: Task (.../kernel-module-something.bb:do_package)
 failed with exit code '134'
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Oct 2021 20:21:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157649

Hi, Richard,

> Even if you can't reproduce the error, you can likely look at the pseudo
> database (in WORKDIR/pseudo/) as it is a relatively simple sqlite3 database. You
> can check the inode numbers in the database compared to the files on disk and
> the issue is fixed when the numbers match up.

I have checked files.db but it did not help. I have found that ino in
sqllite db is what is printed in pseudo.log, and, it does not match
actual ino on the file system, as it is printed in pseudo.log too:

  inode mismatch:
'../kernel-module-smth/1.0-r0/image/lib/modules/5.10.25-yocto-standard/extra/smth.ko'
ino 701049753 in db, 639582649 in request.

The question is what has led to this mismatch. How can I debug it when
I get this situation randomly (or not randomly, but pattern is not
clear for me at the moment)?

Kind regards,
Vasyl

