Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEA3C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 14:09:32 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.6602.1659449371254114935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 07:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=fLjruHOd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id m2so6786515pls.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 07:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rk7JXe9d9ttAZ0g+tWow3YRwFhIL3Mq63ylsFP/a+YE=;
        b=fLjruHOdEHmINSj6EY45yVFEthuU0wwgEGafqsHmXjTCgQry8pn85K+QCKfRYDeOYi
         xQMU2hgN0qblW8PVUuTRe6fmMTMMrQsDmt/nbAzeLRv0VQGA5b9eWqDQNukDyAJpagp7
         ytxJ37EMoLyYdTznC4Nhp3tHdvyYfOcIuXXqVSnSrQwDY7Z9m6yMdnbPJM8wIxPyHsb9
         0SgOCI+xVee+CICrViT46Zs/eeTPIKX1Vrlfq85OiSI69zZE4PrLyjPD5wsyEgO8CAN5
         /aatdh/uLWh1N3g23+33t//u4NBemsociJIdEtama+XZ91U+D5OduvBNjB3ql1TKnh/G
         LmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rk7JXe9d9ttAZ0g+tWow3YRwFhIL3Mq63ylsFP/a+YE=;
        b=TOyjONGBXL+4U6wYc4M4YvTYzSSvvu/dLh9bUg6+2YTtYvUC5aJjNzlypp7aGtRKPR
         VjIRxnzsVU+L/T38fHU/BNqYq6KjGjr3n7ztIMmx8TR9vpZCspI8ZSOqoBiVvSXSq+vN
         vWwoaCf2VQdwSjqNpj+dYjhNVSbLLQfW8TpmTmWAMko81Xz+NSmrgEZ+EyMlSJWiJubR
         chHFI6NGlzUuY0ad0HJh0MgMb8GDP+jlqM3ooqjjx9BIBQSqyqQbITAOvztCipMriqhT
         yCNL5eR07YqBvtGysYRHyFZy26EUY2pS3+zumK6vsRYYFAZPBSN0vzyhCi3QZGZqSbhO
         DdNA==
X-Gm-Message-State: ACgBeo24CIHoVqCf+xdmXLQTzqfSHagzZ8knV14ZvNBFLPNsgfMD12HD
	GUHyV6qUb1KHj85HBHQd0uL5pBGoRLkoWEhQY/0dcw==
X-Google-Smtp-Source: 
 AA6agR6M2B6JffgXZOOmcxG65uaMKEFCH2sjQx3DA/RYYDPcNfgMi72oIhMMOeGopFR5e84Jhf1MIxq/ahfR5jh1JY0=
X-Received: by 2002:a17:903:2685:b0:16e:da0a:9d8 with SMTP id
 jf5-20020a170903268500b0016eda0a09d8mr13380178plb.42.1659449370564; Tue, 02
 Aug 2022 07:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1659105705.git.steve@sakoman.com>
 <75503a13cb2a2266f311477a605389bbac7676e2.1659105705.git.steve@sakoman.com>
 <CAApg2=Ssr1jO61mMOg4_QnT=4EFeu21N9sASB1esde0yYwUiJA@mail.gmail.com>
 <CAApg2=S2rNKCKv0gAvVwwraO9-1jL_cAmJ2uf87V8hpYkn8jxQ@mail.gmail.com>
In-Reply-To: 
 <CAApg2=S2rNKCKv0gAvVwwraO9-1jL_cAmJ2uf87V8hpYkn8jxQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 2 Aug 2022 04:09:15 -1000
Message-ID: 
 <CAOSpxdaSPBZqgRVqMUoY9ZxCcoshSTPyhTuo_Vox3UedG1K5sA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 11/29] xserver-xorg: update 21.1.3 -> 21.1.4
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 14:09:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168787

On Mon, Aug 1, 2022 at 7:57 PM Marta Rybczynska <rybczynska@gmail.com> wrote:
>
> On Tue, Aug 2, 2022 at 7:56 AM Marta Rybczynska <rybczynska@gmail.com> wrote:
> >
> > On Fri, Jul 29, 2022 at 4:47 PM Steve Sakoman <steve@sakoman.com> wrote:
> > >
> > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > >
> > > Security update
> > >
> >
> > With this update we're getting:
> >
> > Parsing recipes...WARNING:
> > /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb:
> > Exception during build_dependencies for AUTOREV
> > WARNING: /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb:
> > Error during finalise of
> > /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
> > ERROR: ExpansionError during parsing
> > /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
> > Traceback (most recent call last):
> > File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/git.py", line
> > 249, in Git.urldata_init(ud=<bb.fetch2.FetchData object at
> > 0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at
> > 0x7fc0cafbd0d0>):
> > > ud.setup_revisions(d)
> > File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/__init__.py",
> > line 1347, in FetchData.setup_revisions(d=<bb.data_smart.DataSmart
> > object at 0x7fc0cafbd0d0>):
> > for name in self.names:
> > > self.revisions[name] = srcrev_internal_helper(self, d, name)
> > File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/__init__.py",
> > line 1212, in srcrev_internal_helper(ud=<bb.fetch2.FetchData object at
> > 0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at 0x7fc0cafbd0d0>,
> > name='default'):
> > if srcrev == "AUTOINC":
> > > srcrev = ud.method.latest_revision(ud, d, name)
> > File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/__init__.py",
> > line 1624, in Git.latest_revision(ud=<bb.fetch2.FetchData object at
> > 0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at 0x7fc0cafbd0d0>,
> > name='default'):
> > except KeyError:
> > > revs[key] = rev = self._latest_revision(ud, d, name)
> > return rev
> > File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/git.py", line
> > 752, in Git._latest_revision(ud=<bb.fetch2.FetchData object at
> > 0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at 0x7fc0cafbd0d0>,
> > name='default'):
> > return sha1
> > > raise bb.fetch2.FetchError("Unable to resolve '%s' in upstream git repository in git ls-remote output for %s" % \
> > (ud.unresolvedrev[name], ud.host+ud.path))
> > bb.data_smart.ExpansionError: Failure expanding variable SRCPV,
> > expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception
> > FetchError: Fetcher failure: Unable to resolve '21.1.4_2022_05_23' in
> > upstream git repository in git ls-remote output for
> > github.com/JeffyCN/xorg-xserver
> > The variable dependency chain for the failure is: SRCPV -> AUTOREV[vardepvalue]
> >
> Additional information: it happens on zephyr and freertos builds.

Do you see this on master too?  Since this is a backport it would be
interesting to see if it fails there too.

Steve

