Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74327C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 16:19:43 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.8339.1659457181014520316
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 09:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OsgEVuSN;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id t22so22704036lfg.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 09:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=04W+KlC8nm551h3QHX/nzSBAHEuZpZVaK7qGdxOtEpI=;
        b=OsgEVuSNpl1ksFmZ8CFKqaI+PVI3oVcADoskC4WRHO8fhSogoL+VGwnXJq5vT7gWkg
         CNKNZbrJ4HJ5aflezhKAgBaCVm4m2La1Y0ZSAoxlpnWkgG48AIPp7FuZfX+SPTeopxRP
         jC1lyPIVGiReuQvT7wfuNQg2IIxKphu035LE9adAOceaf89yglk/Ht9/3uj4KdNWgUYX
         38fiXP9uFyXc5uYkrqJM951/hFqXdf1KBMJsRobVGdeiqWRkYIcoFkV9wgdLUd65Q5aj
         +fAJubNQvglgF+EqRtjMMW73t+wIwL7SseJM4KTc9P9GIJGokHpQtyedvYEH/uzrNbrR
         oTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=04W+KlC8nm551h3QHX/nzSBAHEuZpZVaK7qGdxOtEpI=;
        b=6bTPSx/bAw6Yz8jhPrL31mcbOpbpEzi98+NtpGriI7H1JSZqBEQuWV9JWwJ5KuZdjD
         S7Rd3YrEPILR1DR7OwCbsNEFfDz5b043LKYkhKHP+KGRV59uKU1cnd7+SGrxdpq1UlTq
         qwRDmfcx3Ol8pqFzbTmFPGkVffXaS1KQ+Gbp+mFrcVDueYxsSpOvdRsvG9Lrk5F3JM0E
         uwOzwGzjih9MFdgaYHXJXqitn+g/QD6lcBbpk0A/SKUfFHHukY/8EH0Zc1egfai7RiJ/
         An/MdlfcE54fZIbdGQUNEED2W/E3LsfyE0bOnzPtvbxFLCb+pVqC7zVpK3TVLLdlK3/e
         IRdQ==
X-Gm-Message-State: AJIora/jwZJsQ6CmWqfbMG3J9ucessqKaNCwWFV2sAZN7jdNy8e0WdD6
	zM95VTOcgSgYr1cE6jgisiDaFd5gVPUJpIUZxrU=
X-Google-Smtp-Source: 
 AA6agR7l7xnx4AdykH1yEeQcMCbx8V661J+bv8N5bXnJiV9s82gejEwuwMj19L3zh7OA+EIR37kJmJK56VJ/P6EVwZo=
X-Received: by 2002:a05:6512:b21:b0:47f:752a:c140 with SMTP id
 w33-20020a0565120b2100b0047f752ac140mr7511344lfu.349.1659457178987; Tue, 02
 Aug 2022 09:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1659105705.git.steve@sakoman.com>
 <75503a13cb2a2266f311477a605389bbac7676e2.1659105705.git.steve@sakoman.com>
 <CAApg2=Ssr1jO61mMOg4_QnT=4EFeu21N9sASB1esde0yYwUiJA@mail.gmail.com>
 <17078DEC65A79A88.27835@lists.openembedded.org>
 <CAOSpxdaFAu2WTKZA7pKxtFAsjNoG4+A56U7qqtfGt+Fku=VxHQ@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdaFAu2WTKZA7pKxtFAsjNoG4+A56U7qqtfGt+Fku=VxHQ@mail.gmail.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 2 Aug 2022 18:19:27 +0200
Message-ID: 
 <CAApg2=SuG1Q-RTD2YyCZpP5+PkCzhSeNevs3Ci3SYQ6UpSHyVQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 11/29] xserver-xorg: update 21.1.3 -> 21.1.4
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 16:19:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168793

On Tue, Aug 2, 2022 at 4:57 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Tue, Aug 2, 2022 at 4:37 AM Steve Sakoman via
> lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
> wrote:
> >
> > On Mon, Aug 1, 2022 at 7:56 PM Marta Rybczynska <rybczynska@gmail.com> wrote:
> > >
> > > On Fri, Jul 29, 2022 at 4:47 PM Steve Sakoman <steve@sakoman.com> wrote:
> > > >
> > > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > >
> > > > Security update
> > > >
> > >
> > > With this update we're getting:
> > >
> > > Parsing recipes...WARNING:
> > > /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb:
> > > Exception during build_dependencies for AUTOREV
> > > WARNING: /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb:
> > > Error during finalise of
> > > /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
> > > ERROR: ExpansionError during parsing
> > > /tmp/workspace.Pvlp4fXTtK/oe-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
> > > Traceback (most recent call last):
> > > File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/git.py", line
> > > 249, in Git.urldata_init(ud=<bb.fetch2.FetchData object at
> > > 0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at
> > > 0x7fc0cafbd0d0>):
> > > > ud.setup_revisions(d)
> > > File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/__init__.py",
> > > line 1347, in FetchData.setup_revisions(d=<bb.data_smart.DataSmart
> > > object at 0x7fc0cafbd0d0>):
> > > for name in self.names:
> > > > self.revisions[name] = srcrev_internal_helper(self, d, name)
> > > File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/__init__.py",
> > > line 1212, in srcrev_internal_helper(ud=<bb.fetch2.FetchData object at
> > > 0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at 0x7fc0cafbd0d0>,
> > > name='default'):
> > > if srcrev == "AUTOINC":
> > > > srcrev = ud.method.latest_revision(ud, d, name)
> > > File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/__init__.py",
> > > line 1624, in Git.latest_revision(ud=<bb.fetch2.FetchData object at
> > > 0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at 0x7fc0cafbd0d0>,
> > > name='default'):
> > > except KeyError:
> > > > revs[key] = rev = self._latest_revision(ud, d, name)
> > > return rev
> > > File "/tmp/workspace.Pvlp4fXTtK/bitbake/lib/bb/fetch2/git.py", line
> > > 752, in Git._latest_revision(ud=<bb.fetch2.FetchData object at
> > > 0x7fc0cb054970>, d=<bb.data_smart.DataSmart object at 0x7fc0cafbd0d0>,
> > > name='default'):
> > > return sha1
> > > > raise bb.fetch2.FetchError("Unable to resolve '%s' in upstream git repository in git ls-remote output for %s" % \
> > > (ud.unresolvedrev[name], ud.host+ud.path))
> > > bb.data_smart.ExpansionError: Failure expanding variable SRCPV,
> > > expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception
> > > FetchError: Fetcher failure: Unable to resolve '21.1.4_2022_05_23' in
> > > upstream git repository in git ls-remote output for
> > > github.com/JeffyCN/xorg-xserver
> >
> > Is there a bbappend to xserver-xorg somewhere in your layers?
> >
> > The recipe in core is building from a tarball fetched from
> > https://www.x.org/releases/
> >
> > It appears that a bbappend is changing this to look in
> > github.com/JeffyCN/xorg-xserver, which doesn't have 21.1.4
> >
> > So my best guess is that the issue is with a bbappend in some other
> > layer, not with this patch in oe-core.
>
> I'm going to guess you've included meta-rockchip in your build which
> does include this bbappend:
>
> https://github.com/JeffyCN/meta-rockchip/blob/master/recipes-graphics/xorg-xserver/xserver-xorg_%25.bbappend
>
> That's where github.com/JeffyCN/xorg-xserver and the AUTOREV are coming from.
>

Oh my yes. I was grepping around in meta-zephyr as it fails only there.

Marta

