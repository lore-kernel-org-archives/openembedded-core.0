Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4258C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 14:57:52 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.7308.1659452268751912462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 07:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=paiQE5XF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id w10so13717636plq.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 07:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mdnbb53OPfsjgTbQrgZG2eRlN5jkozLqg5qtv5w1GAs=;
        b=paiQE5XFgqS1zuDrH1PWEc2Af6VdFon01KGf314b+riGVJo0THZ1qf8xUkm30IIde5
         oOP9wIthriozoAdOX85pGs+JvLiSeb34QZTkKsWBqq7Ew3qVWM8gxabL+MXFpa0Iw6Q4
         buovCkjR+iJ7w4f5308momguJAvla1jqoEpl5CTrcoSZMrlLsv59Deqked2X/xRln5cH
         zgwaGZkRSpR3ePPaEC3mHqbjtsrwT04rwBgsV+dklhemsV9pBgUnrF91/SP4nlujeUJo
         K69GM7LusELu9BibDuGjdGIBcU7CihQ1T1VGm5Y3Ugo900spf9mtushxUbMh7S7+56i+
         Wr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mdnbb53OPfsjgTbQrgZG2eRlN5jkozLqg5qtv5w1GAs=;
        b=Boik+8+8eEzo3uo5R/WDFGrv1UUdarasJznA1Y31i90oN1DTXZPQ1Hv5ppxM/keulz
         tiVKj4oHJ1Nu2SlIDAxvVyXzg2uU/GT9fxK7Wr8cZzkOzKKaldviwl3eiUk2gHJk2eFh
         /ONWve1ZKsZubGjb0AEJdgiSPCEBuyXCy8dKz8woCQCpAb+hRWdMRjceW5GxgeaLUZlg
         og0p6j3poiXjAN3A1FveugEHtTBAI2OkUkMiwIKvgnVlbVlfh9UgplDV8/WwyO1DC7kP
         n2UUKJgsoQ0upagclze2//FUlUME9fc20JdHgmdRu9+Iezmr+mc1iac8PgK1hAndwML7
         4zEg==
X-Gm-Message-State: ACgBeo1OLkSj8/suly17+eiBhsE1HjHtNM2oW+nim5FvZUmjVZFzU8IV
	cAAzhWebFiPGfnOpVwJvuxtQyWkPGkI+TKDkU7u3EQ==
X-Google-Smtp-Source: 
 AA6agR4a7LAPPlsYr7EJVzfcStjeEgAcCvoHhlYD2JSj2EsBooL3zbfr9UyM0MfGmPh6Vz7Gmyvx2Yyxd9oMrqp1cNU=
X-Received: by 2002:a17:90b:390:b0:1f3:ee2:62a8 with SMTP id
 ga16-20020a17090b039000b001f30ee262a8mr24990104pjb.148.1659452268156; Tue, 02
 Aug 2022 07:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1659105705.git.steve@sakoman.com>
 <75503a13cb2a2266f311477a605389bbac7676e2.1659105705.git.steve@sakoman.com>
 <CAApg2=Ssr1jO61mMOg4_QnT=4EFeu21N9sASB1esde0yYwUiJA@mail.gmail.com>
 <17078DEC65A79A88.27835@lists.openembedded.org>
In-Reply-To: <17078DEC65A79A88.27835@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 2 Aug 2022 04:57:36 -1000
Message-ID: 
 <CAOSpxdaFAu2WTKZA7pKxtFAsjNoG4+A56U7qqtfGt+Fku=VxHQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 11/29] xserver-xorg: update 21.1.3 -> 21.1.4
To: steve@sakoman.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
 openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 14:57:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168792

On Tue, Aug 2, 2022 at 4:37 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> On Mon, Aug 1, 2022 at 7:56 PM Marta Rybczynska <rybczynska@gmail.com> wrote:
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
>
> Is there a bbappend to xserver-xorg somewhere in your layers?
>
> The recipe in core is building from a tarball fetched from
> https://www.x.org/releases/
>
> It appears that a bbappend is changing this to look in
> github.com/JeffyCN/xorg-xserver, which doesn't have 21.1.4
>
> So my best guess is that the issue is with a bbappend in some other
> layer, not with this patch in oe-core.

I'm going to guess you've included meta-rockchip in your build which
does include this bbappend:

https://github.com/JeffyCN/meta-rockchip/blob/master/recipes-graphics/xorg-xserver/xserver-xorg_%25.bbappend

That's where github.com/JeffyCN/xorg-xserver and the AUTOREV are coming from.

Steve

