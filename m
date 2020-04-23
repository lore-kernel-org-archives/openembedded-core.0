Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.2534.1587630613954848557
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 01:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oijuWxUF;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id f19so5527951iog.5
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 01:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pgBC4AOwGIvfKe6LoAVrHZhEfk7tS7bdCHSD8Hx0/eA=;
        b=oijuWxUFuIq+y2epJ9nlEehQL9IqF0Vm1mndWVwItF+YEeelPTYw2jy0C+Y4HdxwR2
         xafB0NJpAUhiYBDZmrSPpmBudYSISURSKyL80aCg7CLPelod2Zog7lVmnVrt831p7idj
         H7cL+EqtWGxomHtQ3Xzo3IRTfRNQlsQnPrRN7Yf6zQbXPYuPYl5hCpjxPueBoOXk7aQf
         ukDAfKl+n/BDAgt5BaczK33/c60MMr6z8klMzRHEfmFa+qJ0q7Z+ZaWvUj/vm7PRXn5i
         v5nShAxiPQf1Dc/BNvyhcQdhcUFQwKXw3MJaVces8wV+w7D9autLLcdyH4M7AGVZuwuD
         PnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pgBC4AOwGIvfKe6LoAVrHZhEfk7tS7bdCHSD8Hx0/eA=;
        b=Oc0OScRd3R4AvZCBzs3fDT4EWjlcrWA7qBEAEzu0pPrUYQ32NsAiqQV9Vtcsdabk0M
         6FljLEdNbNFYAZreG4y4+YLqswJPnVcOwqHPUY64OqpxOo3ZGD1/k/iInhRMXjWNAqXy
         7cdL15InRcjQSCmWF//48r/yMd1CA+BZHIMusfA6Xd3TQ3AvSor+21TMZ2v603M8MqSY
         Le/lFsIvcAayhakov7bjouC58XFAKyBrNZy+JzIWWFBW8CW63XqmVDgTLwmOqPEKXZPU
         /zPqRf9vjr6rod25bMNnWPwcZWbmPxmQu882PNE/dhRcWHS9RDYFinPSSLBxKmHeT6z6
         D7Gg==
X-Gm-Message-State: AGi0PuYpIhHhgwlUPn+y/CLIHMH49qDp8JCb3btm6Vh9waPWIknCAnHw
	59Ep2wI0LahZEvTF6FGvdRm593x57NbdC8MtSuw=
X-Google-Smtp-Source: APiQypLG5gGAKJUi0n3XLUFHeIynNQF5V+Pf+FP9Cpcjf5YRAMBtPotjOtu3rm7om6R7BAD3wTRnLDLgRVVFUhIrVQI=
X-Received: by 2002:a02:7611:: with SMTP id z17mr2231607jab.42.1587630613148;
 Thu, 23 Apr 2020 01:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200422135211.121292-1-alex.kiernan@gmail.com> <CAJ86T=W+CmGCZF_ej+na_tzAddNP69XJPE5MZTGFF2HjRqfGtQ@mail.gmail.com>
In-Reply-To: <CAJ86T=W+CmGCZF_ej+na_tzAddNP69XJPE5MZTGFF2HjRqfGtQ@mail.gmail.com>
From: "Alex Kiernan" <alex.kiernan@gmail.com>
Date: Thu, 23 Apr 2020 09:30:02 +0100
Message-ID: <CAO5Uq5RXQn+Q0NmVD0nWAYxp3YMs8TFKiDLudCHzUFD6LHcc5Q@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/6] openssh: Move sshdgenkeys.service to sshd.socket
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 22, 2020 at 7:48 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Wed, Apr 22, 2020 at 6:52 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > sshd.socket launches the templated sshd@.service, so by moving the
> > sshdgenkeys.service to sshd.socket, key generation can start in advance
> > of a connection.
>
> Is deferring key generation until the first connection a bug or by design?
>

If you've installed it, presumably you're expecting connections. But I
agree you could argue it either way.

-- 
Alex Kiernan
