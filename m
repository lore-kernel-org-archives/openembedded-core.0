Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D54C43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 20:03:11 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web09.3693.1657310583068337756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 13:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=djxzwDtX;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id w2so10769749ljj.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 13:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EzuK16RsI4UBlq70FTTIeU4bajrCkmFo1E2p5DeMbsg=;
        b=djxzwDtXiAKfC8/TroQG7o0/Fe4vAFfMHvvDRISfqEURGQX8HdtvwUvFCZHeqGbJHm
         nNECjOnou2nRD1sWldQ/vCmLdNJtbs/OyoPPkg/KlJDXIryDq4knS7VD0+7jJHNQK9U9
         8aMBUR1NTl07ah1A8Iq6BoTJl4HH6MT0+0Zd26MCHxbH1i8hUqEsOc0gZy+b59DzqSg0
         uqcK9XmvS7vvLsLkicI18/7/qviWUcyOD6mFlus60KWv3e5erwurwjDWChMIjVCmXO7T
         z1zZE/DZKM9t6j/XLA4QdT1/Cixn9/f8WUV+3yjZrgnIUhxFNpPv1x/oQJjX0AYk7OYi
         tgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EzuK16RsI4UBlq70FTTIeU4bajrCkmFo1E2p5DeMbsg=;
        b=rT26ZOPpSrY+pdZBvXimZivjX8ISXZRshsQ6ArjYQCU3Vsvar+/0Hg59DuEitjEY4D
         T6RZ/B41jfIsFMnK+tkZU6e5vJmeAc+jS2qfB4KsPqdDvMbCvgZJd/n+uKyk4u+yUy4E
         C07C0WjdLGja5U8N6wALrEThR33ssTvotGMDZef71nllqX1DKQyagyYIhi2zMYIsw1/E
         r5V7UfwywbngUOarLcD5ad5CJbGyUGe3Dap/4pMZq53YqQ1dqGthRtwA8P9O6dPDO191
         aLcZzEpYZLMvvbND1Wts9f+r0JKlQb5+UsweSGTb6IrLJMePBIfRBPjyMX10DjMgkC2y
         MLVA==
X-Gm-Message-State: AJIora/kEUCEthLqkG4tMP1JeBz8RgldGEqnyVC6s5UAwFf8fpqXIcSO
	BPLzNa7JtlXO1DnunNALEclWLbTSzRFT8PoBWY8=
X-Google-Smtp-Source: 
 AGRyM1sfXBQ4YGfVEHgjNW/w6iCmhE3Pb3CkAMHzoZ1hIZnCDxNZK94Po9ecaESB2vroDy4lSbBTfvWpPcnsutAhE/s=
X-Received: by 2002:a2e:9e41:0:b0:25d:4100:b8eb with SMTP id
 g1-20020a2e9e41000000b0025d4100b8ebmr2918574ljk.257.1657310581010; Fri, 08
 Jul 2022 13:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220708191730.3413011-1-alex@linutronix.de>
 <CAJdd5Gbs6YKYs3qNgt_jQriiR7ix8XtPubMAmc2ftK5CMuNNfQ@mail.gmail.com>
In-Reply-To: 
 <CAJdd5Gbs6YKYs3qNgt_jQriiR7ix8XtPubMAmc2ftK5CMuNNfQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Jul 2022 22:02:49 +0200
Message-ID: 
 <CANNYZj95c=syJT9-sW20UC79bf3qRjZDDJNaOmDUvq_jJPiYLQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] meta/files: add layer setup JSON schema and
 example
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 20:03:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167833

On Fri, 8 Jul 2022 at 21:33, Joshua Watt <jpewhacker@gmail.com> wrote:
> > -- all lists (sources, layers, remotes) are replaced by objects keyed by 'name' properties of the list items.
> > This allows using them as dicts inside Python, and makes the json more compact and readable.
>
> As long as the order is truly irrelevant because different
> implementations (and even different versions of Python!) will result
> in a different processing order.

Yes, for all of those things it's irrelevant.

> > +++ b/meta/files/layers.example.json
> > @@ -0,0 +1,115 @@
> > +{
>
> Missing the version? Although I see it's in the schema.

It's at the end of the file. File is written via python's json module
which decides where it goes.

> > +    "sources": {
> > +        "meta-alex": {
> > +            "contains_this_file": true,
> > +            "git-remote": {
>
> The problem with this is that there has been some desire for other
> fetching mechanisms; Perhaps we can say git is only supported, but
> that was the reason I used `oneOf`: it allows for other fetching types
> in the future.

'git-remote' is not a mandatory property in the json, it can be
absent, and instead there can be 'svn-remote', 'tarball' or
'delivered-by-doves'. Anything you want. Just propose an object
definition into the schema.

>
> > +                "branch": "master",
> > +                "describe": "",
> > +                "remotes": {
> > +                    "remote-alex": {
> > +                        "uri": "https://github.com/kanavin/meta-alex"
> > +                    }
>
> Multiple remotes are nice.... but not strictly necessary, since you
> can only have one rev checked out. I don't care too much one way or
> another but it's something to think about since it makes the fetching
> more complicated.

It isn't at all more complicated to handle multiple remotes in the
fetch script which I suggest you look at and try out. I don't want to
have to guess which of the remotes is the right one either when
writing the json, or when using it: I'm writing them all, and fetching
from all as well, ignoring the failures (the failure only happens if
needed revision is absent and can't be checked out). You can write and
check out single remotes if you so wish, but then you have to decide
how to choose out of several.

>
> > +                },
> > +                "rev": "05b25605fb8b2399e4706d7323828676bf0da0b5"
> > +            },
> > +            "layers": {
> > +                "meta-alex": {
> > +                    "buildconfigs": {
> > +                        "conf/templates/configuration-gadget": {},
> > +                        "conf/templates/configuration-gizmo": {}
>
> I think these fall under the same category as the machines below, but
> I don't use  TEMPLATECONF so I'm not sure.

They're not quite same as machines or distros, as they can be anywhere
in the layer. This saves you the trouble of walking over the layer
tree, especially when look at the layer repo through the browser.

> > +                "meta-intel": {
> > +                    "machines": {
> > +                        "intel-core2-32": {},
> > +                        "intel-corei7-64": {},
> > +                        "intel-skylake-64": {}
>
> Why does this need to be listed here? Isn't this just the contents of
> the conf/machine directory in the layer? I really don't want to be
> duplicating information; IHMO it's better to let the layer itself be
> canonical about what machines/distros/etc. it supports

Then you would have to check out all the layers first and look at them
one by one. The idea is that this information is available upfront,
and for all of the layers in a build. It can be used, for example to
be used by Richard's proposed oe-setup tool, and as the json is never
written or edited manually, it won't get out of sync wrt git revision
it lists for the layer.

The plain list of machines isn't that interesting, but if it comes
with additional information such as descriptions, architectures or
kernel versions etc., then it's quite useful to capture this in a
standard format. We could maybe look at how buildroot handles this.

Alex

