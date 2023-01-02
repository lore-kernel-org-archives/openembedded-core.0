Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8C2C3DA7A
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 16:40:35 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.40251.1672677633910924572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jan 2023 08:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kr0oT0vg;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id bt23so25585281lfb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 08:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cNWPDr+sMCwcSXEuV1wxfcmeq1rOzMb5sEnAyCc3bEQ=;
        b=kr0oT0vgdldy/wF1GPTSqRlihdLvRupcC1or765my4qHbJAJ3/qFiLDVSFVCSbn2VB
         B9bYQmSziM3QC2ORfXtOU4HIqPNs5ZV5cbxdHg3WBDxB6Bt2lBYx3MMx1JmyreOZjDfe
         vO6jzv5EaxaHvoKfKdzN+BSp0JqXgQC3ieNwY0DZBV9tlB6Roi120Zgb45u+04zoOS0C
         yYobnOxNJK5lusloBPRQ6VP6nzEIlP6Hrak26pwKKoIsjGrXjv6C24EwytQ1qECXGZm7
         yIthFkzWQdY297rbO3ioHQa5Tdu39EmW6MbOI0ny61nwdXU4qahLSuIKIgHF5cTqBL5h
         lrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNWPDr+sMCwcSXEuV1wxfcmeq1rOzMb5sEnAyCc3bEQ=;
        b=nYPO1qTrrXkH3cGCA3/0HQS3WYp2SViAYWAdicf22XT6s7lgklBVFJKALXh4AZAHfR
         Mnk6tdAwoVknPdUWHgAxfYUcOjpfdwneS3Xy8lkDcRkNTQxz+vWiV7Xk/sM/hfJgeZez
         JVmd5ojw2Hui08mgzl594r3LbQWCAavUXTRzWCHaETEWIhq1akiooLP9P0CdAjoUDfqE
         NZ0qLmrKyuP24EqnBPysJ5v6/f1L/WcuVHTn31+n/ZE3la0lLVhnzYEVSzexD0Zse3x1
         Dm11cDQ2QDQaE1gzg0jqpH5+3RNnnTD+Q+8z7fumZg8fQM1FbgzgHGkdnYIUlm0zWkOC
         1HPQ==
X-Gm-Message-State: AFqh2kr7QjNisfAj0Z8W3kPLJAHfbscV5+Xz0AaShymzRoSO9DxudVe5
	dt9YHsxL3+Fp8JzLv8Y1vI9QP5DE12ojLrW88fM=
X-Google-Smtp-Source: AMrXdXtHXRL1IUm+eoPru6yXaSlym6tYbVlWZkUOOHokg7vBG/bBZXT8X31l5oOMq7qsv04O7nGYiM8+iP7Yqtdp3x8=
X-Received: by 2002:a05:6512:b1f:b0:4cb:26a:32ab with SMTP id
 w31-20020a0565120b1f00b004cb026a32abmr1215568lfu.569.1672677632150; Mon, 02
 Jan 2023 08:40:32 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5Toa3pa5Tnb1fuxLNe_PDYSAJUM4eJ5JObdeBOCQWzHVg@mail.gmail.com>
 <528a76b9a3cfebab7d1fc3edc88db756197faa22.camel@linuxfoundation.org>
In-Reply-To: <528a76b9a3cfebab7d1fc3edc88db756197faa22.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 2 Jan 2023 16:40:20 +0000
Message-ID: <CAO5Uq5QMOz7eAuju_z4iCLK+9uQzNmiGh3u9dtdKaxfEr_A2iQ@mail.gmail.com>
Subject: Re: [OE-core] C.UTF-8 in glibc
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 16:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175323

On Mon, Jan 2, 2023 at 4:28 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2023-01-01 at 18:32 +0000, Alex Kiernan wrote:
> > glibc got an official C.UTF-8 in 2.35, but we don't appear to install
> > it by default... if I add "c" to IMAGE_LINGUAS then it gets installed,
> > but it feels like this ought to be default? Or even stronger and have
> > it separate from IMAGE_LINGUAS so even if that's set to "" you still
> > get it?
> >
> > I tripped over it because I was trying to get the ostree ptest suite
> > to pass and it ended up with a time formatting failing a test because
> > it wasn't running in C.UTF-8.
>
> Making it even stronger might be tricky given how our variables work
> but we definitely should have that in the default locales list.
>

My original thinking on trying to make it stronger was I expect you
really want this, but given everyone's managed so far without, I guess
if they need it now they can add it back in if they're overriding
IMAGE_LINGUAS.

Just thinking about this more, we can't specify it for musl, the
obvious way would be a glibc specific append, which would then mean
that setting IMAGE_LINGUAS = "" you still get it, which doesn't
immediately feel right (plus the general wish to avoid append in
core), which I guess means it needs something with more trickery...
I'll go play.

-- 
Alex Kiernan

