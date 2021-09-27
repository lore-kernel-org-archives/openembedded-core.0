Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53556C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 07:42:29 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web08.28287.1632728548234819251
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 00:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a8ZlSWaG;
 spf=pass (domain: gmail.com, ip: 209.85.166.180,
 mailfrom: twoerner@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id a11so6876445ilk.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 00:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x1d53L8A3lBC3NyuQHMHcpeS4t9q7Lxsfe/gDJQVTKc=;
        b=a8ZlSWaG/cn6iGf+IMntPImV4/qBTVauSXKwqBi+NGZg6VaMhcr0hMhBCy9Kdy3SW7
         JIW4sVegK2p5O8CqIgCvZtgXdzaVw84GWtNB4ObC3R6rD4koNnsNrrhLcFUPySkA7SBP
         +OvHOLJLEpJ0pZdRfdWhwyFgIo/RhfIucL162NMyzjqLXNAvEZGuQsnW9la5mOWRSUr3
         pYSZLRcSjX5wqAdPQGSme85PsIK8n47J1V8sA8yZfg/PI1a5Z/FlIYa2/R7jiQokCv5K
         sRLrIj7qso12PBL0uow1VOnj6JK0O9USJ+3aHuhMHqj+BUKIvoU0fTCZCk/0N4zeysEp
         NFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x1d53L8A3lBC3NyuQHMHcpeS4t9q7Lxsfe/gDJQVTKc=;
        b=aN/PQnx/BFadgcotH0yAuOsgxeqMpllvdxcrYh3jHJwn3I5KQV3zN2J8PaYYoEX+kM
         xAiwdeDtg6BL6ChITyZaaaVfPScvSTiVU4v7w3CmWGbOAd/xJoxcrZej9HKukzLfW1+Q
         sahZNva/M780AgJA1g1RByyi995vNJeb1c9hUVdp6vY1+xG6VDlLW3tQD7DRsLxeAAZa
         pW99KTqGTg3yAf2wAJ8Ewy/UZn1/6qrkP8EEW5dtnBaDPMY38qjD6q2cqFGZrFJ+30Zs
         o9SRA4whfUK6Mvz/bLTPDCFzdQKQoJvQALpOHAmKYSkivTnBkcGP+6wy3NKAUzpAhvFH
         lt3Q==
X-Gm-Message-State: AOAM531c9aKv0+vU5uB303wG6obHWweJSJ6ekTcrravGrkgYwA0BjuFU
	Z3uPRGOUvlKd0M/n4QhCUVu/AoDEATaRu8caBKa5HcQL
X-Google-Smtp-Source: 
 ABdhPJz1TKOWWzYz1Y0Sc7Zgzv3+QR0/GlgAZCKcjdWR8C0FoYdBp1Wgd0PvKYH3O9rDWVmzHb2wBfvK4QC7A7rgYbc=
X-Received: by 2002:a05:6e02:1ba4:: with SMTP id
 n4mr17909030ili.225.1632728546645;
 Mon, 27 Sep 2021 00:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210915003804.34746-1-twoerner@gmail.com>
 <20210915003804.34746-2-twoerner@gmail.com>
 <20210915105303.3x6gmiuaisqkxlvm@fedora>
In-Reply-To: <20210915105303.3x6gmiuaisqkxlvm@fedora>
From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 27 Sep 2021 03:42:15 -0400
Message-ID: 
 <CAHUNapRcmujnMuAKfX+PzGQ3ryLpKYTwre6xLBhUP-Pcx=u4Jg@mail.gmail.com>
Subject: Re: [OE-core] [meta-skeleton][PATCH 2/2] hello-mod/hello.c: convert
 printk to pr_xxx
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000a644505ccf53dbe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 07:42:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156373

--0000000000000a644505ccf53dbe
Content-Type: text/plain; charset="UTF-8"

ping?

It seems 1/2 got applied, but I didn't see an NAKs for 2/2?

On Wed, Sep 15, 2021 at 6:53 AM Quentin Schulz <
quentin.schulz@theobroma-systems.com> wrote:

> Hi Trevor,
>
> On Tue, Sep 14, 2021 at 08:38:04PM -0400, Trevor Woerner wrote:
> > Convert to the newer pr_xxx aliases for logging, which embed the log
> level in
> > the macro names.
> >
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
>
> Reviewed-by: Quentin Schulz <foss@0leil.net>
>
> Thanks!
> Quentin
>

--0000000000000a644505ccf53dbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping?<div><br></div><div>It seems 1/2 got applied, but I d=
idn&#39;t see an NAKs for 2/2?</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 15, 2021 at 6:53 AM Quentin=
 Schulz &lt;<a href=3D"mailto:quentin.schulz@theobroma-systems.com">quentin=
.schulz@theobroma-systems.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hi Trevor,<br>
<br>
On Tue, Sep 14, 2021 at 08:38:04PM -0400, Trevor Woerner wrote:<br>
&gt; Convert to the newer pr_xxx aliases for logging, which embed the log l=
evel in<br>
&gt; the macro names.<br>
&gt; <br>
&gt; Signed-off-by: Trevor Woerner &lt;<a href=3D"mailto:twoerner@gmail.com=
" target=3D"_blank">twoerner@gmail.com</a>&gt;<br>
<br>
Reviewed-by: Quentin Schulz &lt;<a href=3D"mailto:foss@0leil.net" target=3D=
"_blank">foss@0leil.net</a>&gt;<br>
<br>
Thanks!<br>
Quentin<br>
</blockquote></div>

--0000000000000a644505ccf53dbe--

