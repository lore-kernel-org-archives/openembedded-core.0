Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B11C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 14:37:22 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web08.6927.1659451033476369735
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 07:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=sZIf4hHT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id z19so13645416plb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 07:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m35cwxaeEAoE5uCXl5PnSiLw4j1dGMcl8t+6ML7mXxE=;
        b=sZIf4hHTBiGajHY/8jtjQ9NVCjxTKKEaGo3cucp5PDwjK3o2+SVaHra4dSea1IlQpI
         GsWXyV+wf3Q1n/V6pJD89bEFt67iOJG9FQYBeXKF651NKDwWRl7F0fvFoF9Zpx1/6mda
         Pe0Qzm18TN7CsQZvyLiyWYfrBt2rk1Zm9quFOHX/ZJDA5O1F4Rvid5vmtk7+nSQeJK9w
         Z4auVkzz4ptDP5AQkFBSAns+8Tkl5Q5YRzNDjAstS064zgOllcr3Kfw26HadqRguUUxy
         p4huNVfyJlQmVvNNqt8YLjr3ftPuxra09JkceetXLzmsGftP1P5zOyTi/AOHY6gplSSQ
         AU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m35cwxaeEAoE5uCXl5PnSiLw4j1dGMcl8t+6ML7mXxE=;
        b=hyNSaEPAjaFuLf72wjkMGYc4FtOtwX67FHT3CAGZn5zeF1o+3hsiDsmUJjzxoo+Ntn
         nO3Yp4HGSl09GZu1QL/Wbv0HKw52EDYPO85PIkz40uu5zYkEbBpt/DG8PFp0KX7Kr8iL
         5+tFyhVZmAh8+rrvVtqeTDHwlECAQJ3t5YiTs22y1q0xpRlk38n6qCQNzfDoXniqAiGk
         4IaPQrjSKpjoHmE9qPwWGJEwmcLZGxWmMLWr24ESJR29gV84U2t5nwave+UX9nZJd+iC
         gI0uZqIis1Ymy/V8Yxq13epX07lENvoEpbkI1UfXtAvIzNKrOLgGSRh7AIKsr9Fg1RmW
         nfaw==
X-Gm-Message-State: ACgBeo1S5zUaoLHZfEqbGhuMM0bY7MG7c2MxCX+Mp/fWsiBtSYxukTeC
	K/FiK805ccB/9PNTEKXmuOQ3eCBKJZLFXSYW98CMUg==
X-Google-Smtp-Source: 
 AA6agR6tj8wHCLEPgYuPd+DxfVgJfgl5xearMHEP7lddne6hsvqp4oRGIl+eFE4uh1KS5ft/QiH7mX85Oe6v3tp09uk=
X-Received: by 2002:a17:902:ce04:b0:16c:e142:5dd7 with SMTP id
 k4-20020a170902ce0400b0016ce1425dd7mr21831075plg.173.1659451032847; Tue, 02
 Aug 2022 07:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1659105705.git.steve@sakoman.com>
 <75503a13cb2a2266f311477a605389bbac7676e2.1659105705.git.steve@sakoman.com>
 <CAApg2=Ssr1jO61mMOg4_QnT=4EFeu21N9sASB1esde0yYwUiJA@mail.gmail.com>
In-Reply-To: 
 <CAApg2=Ssr1jO61mMOg4_QnT=4EFeu21N9sASB1esde0yYwUiJA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 2 Aug 2022 04:37:00 -1000
Message-ID: 
 <CAOSpxdb2MgN5DJhp-aqF9P1vFv_5WLhiFe+idrJ7-VfiDgDXQg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 11/29] xserver-xorg: update 21.1.3 -> 21.1.4
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 14:37:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168789

On Mon, Aug 1, 2022 at 7:56 PM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
> On Fri, Jul 29, 2022 at 4:47 PM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> >
> > Security update
> >
>
> With this update we're getting:
>
> Parsing recipes...WARNING:
> /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb:
> Exception during build_dependencies for AUTOREV
> WARNING: /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb:
> Error during finalise of
> /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
> ERROR: ExpansionError during parsing
> /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
> Traceback (most recent call last):
> File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/git.py", line
> 249, in Git.urldata_init(ud=<bb.fetch2.FetchData object at
> 0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at
> 0x7fc0cafbd0d0>):
> > ud.setup_revisions(d)
> File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/__init__.py",
> line 1347, in FetchData.setup_revisions(d=<bb.data_smart.DataSmart
> object at 0x7fc0cafbd0d0>):
> for name in self.names:
> > self.revisions[name] = srcrev_internal_helper(self, d, name)
> File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/__init__.py",
> line 1212, in srcrev_internal_helper(ud=<bb.fetch2.FetchData object at
> 0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at 0x7fc0cafbd0d0>,
> name='default'):
> if srcrev == "AUTOINC":
> > srcrev = ud.method.latest_revision(ud, d, name)
> File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/__init__.py",
> line 1624, in Git.latest_revision(ud=<bb.fetch2.FetchData object at
> 0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at 0x7fc0cafbd0d0>,
> name='default'):
> except KeyError:
> > revs[key] = rev = self._latest_revision(ud, d, name)
> return rev
> File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/git.py", line
> 752, in Git._latest_revision(ud=<bb.fetch2.FetchData object at
> 0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at 0x7fc0cafbd0d0>,
> name='default'):
> return sha1
> > raise bb.fetch2.FetchError("Unable to resolve '%s' in upstream git repository in git ls-remote output for %s" % \
> (ud.unresolvedrev[name], ud.host+ud.path))
> bb.data_smart.ExpansionError: Failure expanding variable SRCPV,
> expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception
> FetchError: Fetcher failure: Unable to resolve '21.1.4_2022_05_23' in
> upstream git repository in git ls-remote output for
> github.com/JeffyCN/xorg-xserver

Is there a bbappend to xserver-xorg somewhere in your layers?

The recipe in core is building from a tarball fetched from
https://www.x.org/releases/

It appears that a bbappend is changing this to look in
github.com/JeffyCN/xorg-xserver, which doesn't have 21.1.4

So my best guess is that the issue is with a bbappend in some other
layer, not with this patch in oe-core.

Steve

> The variable dependency chain for the failure is: SRCPV -> AUTOREV[vardepvalue]

