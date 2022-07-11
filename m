Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621DBC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 15:46:31 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web08.30574.1657554385904220031
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 08:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KT3toU8b;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id a9so9361298lfk.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 08:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lKEu5E3cNx2f9P7yMCmugGiIJc7JhiUErv+zmWr0gj0=;
        b=KT3toU8btXUD6o1xuT7z569STJ1R+aK1G+1Ofx1uq1IewQE3gwDVvI6V6ew6MhZFdg
         DefBHdAQoao/mfp99KC5wYKV52OqmIvsKKRLu4nKuKZMHuNPirOuH4GbGLsIw7S6P3mO
         r8S22C2WtScPawyQo4xt3KHiE2/Qu+x/t8tbHQoZZbuFpUGC2wilZbNYVR+sFJ8bY6Hu
         iSRHaGzl2+7k9njuQxME5Japjss5DoQosv5XpCZdcujF1RDLatpUT10A20/B98jAKH+h
         EwCgbM3wgziuPvPvbIFDT0+AIDTndMXNY6CdvDKQ6vH158lcWPecgU2g9WNzToXmeJXg
         TH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lKEu5E3cNx2f9P7yMCmugGiIJc7JhiUErv+zmWr0gj0=;
        b=gNeG0brtwORxddH0tJK1QXQ+tY3Q9rjlrcZ3wyaeawPVJXeA504APct4RWMBV6wLSa
         KLQzeMC1lm5y2H5w+71ABvjxHUKAKim9/Ft99hANYbuhhKHly1BFAvrg8pHitKXBCs+d
         FLzvUP9TK3CmvMYR8E/NPMIqu5lZoidPH2HwS8P9H9MrLDVXeAr0Vb4w2aB0g4j+P3HJ
         GnDrjO9WBOaXHnqujbl4uB7XK2dsDEZAP5bglTXegahr3AXrgLOAva0BWYTedLpOv8p5
         /+jUIimtyWV6GHiNovKbhJ3+C2c+O6Szao5cvXpFSawojkvsintcgq+sY/SoKBMmTB3B
         /trg==
X-Gm-Message-State: AJIora+8I8YGlpYUC+lrHeZ47B/1luICaFhPup1UFMKRp9Sizuq794wp
	g/cLVmdkfLjwhg8EZlkeGd8+qUYXS3M5Qn8EPbE=
X-Google-Smtp-Source: 
 AGRyM1s7r7dUifgihjqjUr/wHT9CfNUR+iWHXRpR/RpOVadb64q7Pp6IpS8HDf4eiy59ctwysfrY1QIF+YgH4ocdYsE=
X-Received: by 2002:a05:6512:3b26:b0:47f:9895:703c with SMTP id
 f38-20020a0565123b2600b0047f9895703cmr12530501lfv.395.1657554383899; Mon, 11
 Jul 2022 08:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220708191730.3413011-1-alex@linutronix.de>
 <CAJdd5Gbs6YKYs3qNgt_jQriiR7ix8XtPubMAmc2ftK5CMuNNfQ@mail.gmail.com>
 <CANNYZj95c=syJT9-sW20UC79bf3qRjZDDJNaOmDUvq_jJPiYLQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj95c=syJT9-sW20UC79bf3qRjZDDJNaOmDUvq_jJPiYLQ@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 11 Jul 2022 10:46:12 -0500
Message-ID: 
 <CAJdd5GYdxO_Th9_BV+7sWMsj9CDtdu+_nFpnr=eCGFWYXRM=Aw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] meta/files: add layer setup JSON schema and
 example
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 15:46:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167875

On Fri, Jul 8, 2022 at 3:03 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Fri, 8 Jul 2022 at 21:33, Joshua Watt <jpewhacker@gmail.com> wrote:
> > > -- all lists (sources, layers, remotes) are replaced by objects keyed by 'name' properties of the list items.
> > > This allows using them as dicts inside Python, and makes the json more compact and readable.
> >
> > As long as the order is truly irrelevant because different
> > implementations (and even different versions of Python!) will result
> > in a different processing order.
>
> Yes, for all of those things it's irrelevant.

I did think of one way in which the order matters: If you are planning
on populating BBLAYERS from this list, the order would matter. If you
are doing that (or we want to allow it at all) it would need to be a
list instead of a dictionary.

>
> > > +++ b/meta/files/layers.example.json
> > > @@ -0,0 +1,115 @@
> > > +{
> >
> > Missing the version? Although I see it's in the schema.
>
> It's at the end of the file. File is written via python's json module
> which decides where it goes.

Yep sorry.

>
> > > +    "sources": {
> > > +        "meta-alex": {
> > > +            "contains_this_file": true,
> > > +            "git-remote": {
> >
> > The problem with this is that there has been some desire for other
> > fetching mechanisms; Perhaps we can say git is only supported, but
> > that was the reason I used `oneOf`: it allows for other fetching types
> > in the future.
>
> 'git-remote' is not a mandatory property in the json, it can be
> absent, and instead there can be 'svn-remote', 'tarball' or
> 'delivered-by-doves'. Anything you want. Just propose an object
> definition into the schema.
>
> >
> > > +                "branch": "master",
> > > +                "describe": "",
> > > +                "remotes": {
> > > +                    "remote-alex": {
> > > +                        "uri": "https://github.com/kanavin/meta-alex"
> > > +                    }
> >
> > Multiple remotes are nice.... but not strictly necessary, since you
> > can only have one rev checked out. I don't care too much one way or
> > another but it's something to think about since it makes the fetching
> > more complicated.
>
> It isn't at all more complicated to handle multiple remotes in the
> fetch script which I suggest you look at and try out. I don't want to
> have to guess which of the remotes is the right one either when
> writing the json, or when using it: I'm writing them all, and fetching
> from all as well, ignoring the failures (the failure only happens if
> needed revision is absent and can't be checked out). You can write and
> check out single remotes if you so wish, but then you have to decide
> how to choose out of several.
>
> >
> > > +                },
> > > +                "rev": "05b25605fb8b2399e4706d7323828676bf0da0b5"
> > > +            },
> > > +            "layers": {
> > > +                "meta-alex": {
> > > +                    "buildconfigs": {
> > > +                        "conf/templates/configuration-gadget": {},
> > > +                        "conf/templates/configuration-gizmo": {}
> >
> > I think these fall under the same category as the machines below, but
> > I don't use  TEMPLATECONF so I'm not sure.
>
> They're not quite same as machines or distros, as they can be anywhere
> in the layer. This saves you the trouble of walking over the layer
> tree, especially when look at the layer repo through the browser.

Configuring _what_ you want to build is probably even more contentious
that describing how to fetch your layers, so for starters I'd really
like to just focus on the layer fetching; TEMPLATECONF is far from the
only method for doing build configuration and I don't think we should
bake it into the "layer setup" piece at this point (same for machine &
distro, although they aren't generally contentious, see below).

>
> > > +                "meta-intel": {
> > > +                    "machines": {
> > > +                        "intel-core2-32": {},
> > > +                        "intel-corei7-64": {},
> > > +                        "intel-skylake-64": {}
> >
> > Why does this need to be listed here? Isn't this just the contents of
> > the conf/machine directory in the layer? I really don't want to be
> > duplicating information; IHMO it's better to let the layer itself be
> > canonical about what machines/distros/etc. it supports
>
> Then you would have to check out all the layers first and look at them
> one by one. The idea is that this information is available upfront,
> and for all of the layers in a build. It can be used, for example to
> be used by Richard's proposed oe-setup tool, and as the json is never
> written or edited manually, it won't get out of sync wrt git revision
> it lists for the layer.
>
> The plain list of machines isn't that interesting, but if it comes
> with additional information such as descriptions, architectures or
> kernel versions etc., then it's quite useful to capture this in a
> standard format. We could maybe look at how buildroot handles this.

I suspect that not including the machine/distro/template stuff for now
might give us better adoption as standard way to describe layers,
which is another reason I'm a little hesitant to include them (in
addition to duplicating information available in the layer itself)

>
> Alex

