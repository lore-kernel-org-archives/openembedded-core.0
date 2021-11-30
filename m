Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D21DC433FE
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 14:55:15 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web09.77681.1638284114306602014
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 06:55:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kB7CBpA+;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id f9so53440460ybq.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 06:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gLcvDRb+k8Vcq626Ms43PkhjfS9CzBYv8pg/a5OS+mU=;
        b=kB7CBpA+ABByOq8wTERea8nyv+qQ2YuPnTjlUksIBDzQQTE82uhflITjXF/F+whvhb
         kvpfMdIgaOz2oLdx1xdvuOHuvakeiqOklZMGtPDvSi4LmgJIFj7MoyYSQxXgBZDuXf8n
         sB7YtqrKy6B3R2ksDpA8hsY+zEzb7edjSSrGofbfUIG0CKJgSSR+5H4CpQVIedqhJgLK
         TEO59pM4b25V+cEsXr8I3UGTb9R3cPgt6r2SRme537RMtRKfqbRM71Ij+4IhEyUjLf4k
         j+bQwvdgNx1rNCGl7cD37Ezpc+dmrc1UOzFg7Y4iTmEUpMpnpxqZX/SZDdEaO6yJYEzG
         eyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gLcvDRb+k8Vcq626Ms43PkhjfS9CzBYv8pg/a5OS+mU=;
        b=Wqp0OufMNG7Mx1wvIvgHsfcVGVzVn2UXa9Rl6/27pt5i+f1Zh6zvUz8uNDhoHYBY56
         naOQ0mXCsqzx4gLmFQiwaHBf5mpyBbv8v71mn4+ImzXIj7FQXtgljaBoH4JVIkI+2mMQ
         meWhBQ1DO88QLP3O/YTwR5/keYF2KxOv0w92Hg18rD4h4RjafLjQ+uarTgEG4lxjJK9T
         ZHI+SKQ+DQ2LzsrsXgH/1POw3VFJ7Q7uzbNhrErxdE/qwqGjxFlKR+s4xDGvWg3igrT2
         AKlNwxOaGagmaNDw7Tb4+U1A0eubpD5ZWzr4mRhcc1HaJrwSSUW0CCrdJnH8s7TBsZRZ
         0qAA==
X-Gm-Message-State: AOAM531awDBtqz5SYkRt3v2yAnX4J1R7mrwD55i2swd3WPFicXDqxywH
	wbxDxiVpgQZLSCq5/Z3laHs8qdR5ZQyuwxN2EzE=
X-Google-Smtp-Source: 
 ABdhPJxgjEKz6tllT2NNffhUxlwr34lvnuN6zuPZhvb+IYuSNUZMCteiiEtvoIQ4guwcBdMg4vKdz50MkeP57veaZ0w=
X-Received: by 2002:a25:3b4f:: with SMTP id
 i76mr42216907yba.217.1638284111725;
 Tue, 30 Nov 2021 06:55:11 -0800 (PST)
MIME-Version: 1.0
References: <9613eb4f99803547c682e63e0e4673cbde7f826e.camel@intel.com>
 <32437.1638256346527650757@lists.openembedded.org>
In-Reply-To: <32437.1638256346527650757@lists.openembedded.org>
From: Steve Sakoman <sakoman@gmail.com>
Date: Tue, 30 Nov 2021 04:55:00 -1000
Message-ID: 
 <CAGDS+nnS5kxs+y+wHqJ9KA08pC0q8bvdgW47xQv0kau94=5m+w@mail.gmail.com>
Subject: Re: [OE-core] [meta][dunfell][PATCH] glib-2.0: Add security fixes
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 14:55:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158976

On Mon, Nov 29, 2021 at 9:12 PM Ranjitsinh Rathod
<ranjitsinhrathod1991@gmail.com> wrote:
>
> Adding missing patches and will resent it.

While you are at it you might also want to check
CVE-2021-28153-4.patch, I had to tweak it slightly to get it to apply
cleanly (i.e. without a fuzz warning).

Steve

>
> Thanks,
> Ranjitsinh Rathod
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158971): https://lists.openembedded.org/g/openembedded-core/message/158971
> Mute This Topic: https://lists.openembedded.org/mt/87373335/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

