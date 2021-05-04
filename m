Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.8810.1620147116997000443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 09:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=f51JimIh;
 spf=pass (domain: burtonini.com, ip: 209.85.221.53, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f53.google.com with SMTP id v12so10181118wrq.6
        for <openembedded-core@lists.openembedded.org>; Tue, 04 May 2021 09:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kdAioCRkupxezbEVDahnGlETyfLAjRBy0OeREJu/8Ds=;
        b=f51JimIhM+JIajjjjn8GoPR6licNBKYVYhHwQ3Ef5bw4JMo1JvdSvuj4iDBrRCwBtW
         kw9t+ZImJE1fZ+KM/lvjqKJ2LKb6dpTR1/AEF4Bwl0acikuEq8A008up7mm9B5nyp5pS
         H+EGTb1WZV5w6nHi96peiBlucS0V2bcw0QhQHkXn0p8/Y6eu5n1IFIZnOK8+2XMIXz0t
         AOgPEeQiofCnB8SZ7gsiVxHIyyg9KWm84X9tx3drD62oa4pQFjineMHpDI90dtmQ8ukl
         CQAUOiHgNvjoHodA5uGI+ZU7OLmlMZoE4tpmCktkAJLCAHn3XBH/ExwntC90EVqawm8n
         NgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kdAioCRkupxezbEVDahnGlETyfLAjRBy0OeREJu/8Ds=;
        b=DotgsA2Xh30zJtIdoa2jvnuH298TdQBCu84uUiPnZbfaaSSS8Z8MjOzEQDNwG3VNjx
         00yG+lcuo8qgIMprXhB6T+T/7D4LWNsnaopXmb8zFSt5sQJWHEFbGwqtgPdQoBO4WHpZ
         5DmvpRSLWbXWK7LQry+F7w8Cd8nznLhcvQZqcC7GkN2edhAEdoNq6TnPxVeLHdeEOXBp
         dBcjF2LsU0wWJDl8Vv3e8hQSfGA4YE1C5hIs92DGd/H4eHXibvaJKJCl667vFMtbYadb
         /DDZJVfMlMDDXJVcVGL4cLKt8MUDqePzmNvMBbhAyNkNfxlqAT+Hjc8izg2gfHIf4BV+
         yJHg==
X-Gm-Message-State: AOAM532URqTDiHm6rlE+9QPQoNyL/pdBdS042CDgXKCR2TDxl2A+mLkp
	nssuevFBBnQ2uie62Jd80loBBd3P49KGQdn6ijMI6Q==
X-Google-Smtp-Source: ABdhPJys57XJbxo3e5isLtkWf2DqtusAVD1O8alk+i6KDqtntd5ZQ1501nU/CLTpSeWO0OoaTZ8EzPkAEMVOgcJL8Kw=
X-Received: by 2002:a5d:64eb:: with SMTP id g11mr33434106wri.260.1620147115541;
 Tue, 04 May 2021 09:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <1696db50-c2d4-1ef5-50ad-0afbe12f6a0a@3mdeb.com>
In-Reply-To: <1696db50-c2d4-1ef5-50ad-0afbe12f6a0a@3mdeb.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 4 May 2021 17:51:44 +0100
Message-ID: <CAAnfSTtgai9XY1FFDPa1edKvonC-+JNog8jDbjMmbfjycnp-gA@mail.gmail.com>
Subject: Re: Development of fwupd recipe
To: =?UTF-8?Q?Norbert_Kami=C5=84ski?= <norbert.kaminski@3mdeb.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, =?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>, 
	Richard Hughes <hughsient@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've prototype recipes for meta-oe but haven't yet sent them out.  I
should be doing this shortly though.

Ross

On Fri, 23 Apr 2021 at 09:52, Norbert Kami=C5=84ski
<norbert.kaminski@3mdeb.com> wrote:
>
> Hi all,
>
> We (3mdeb Team) are interested in fwupd recipe development. We saw that
> Ross Burton did some great work on this topic (fixing fwupd
> dependencies), and we would like to know if there is any work in
> progress that we could help with. Currently, we are porting fwupd
> to *BSDs, so if you have any questions or troubles with the fwupd recipe,
> feel free to ask.
>
> Best regards,
>
> Norbert Kami=C5=84ski
> Embedded Systems Engineer
> http://3mdeb.com | @3mdeb_com
>
