Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966BEC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 08:04:06 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web10.8320.1645171445381083575
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Feb 2022 00:04:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JiTWwWBG;
 spf=pass (domain: gmail.com, ip: 209.85.217.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id y4so9030567vsd.11;
        Fri, 18 Feb 2022 00:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P5FD5y5VoHeJd0Zvmcpinp6gnD1if20PtXFaLz4NMbE=;
        b=JiTWwWBGgWGoWLd4cCcKNA3u3iMABExbRHH2xdUeOajw0ujrpU8qYQimHkwMWN2Xwn
         nc+tiSTooJYA93mBANGODrMJ/TM+RPLm0BAGFxe/W/hG1wYkYMIlQsHTCUDf/c38P/iV
         jaNfo24JquPoJ/xSf2bWzMMBBVZv/SvGS4f5PShCU75itlLfCBphDCfL2XQ3Jp981N42
         3fbVg08P5H5zKFHn+0TE/zzOomyrip4HvaRD5vq1vQUGamOS0+fF7XlzpaTig4p76y3Z
         g29mJgPK7SKNphGtbLze97ZTLjjGVIGgWYB5+42K2w8gb62+Wc7HPlrwx9+9JXem9TCn
         uaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P5FD5y5VoHeJd0Zvmcpinp6gnD1if20PtXFaLz4NMbE=;
        b=sSyWG5xYj/7zv3Mg4/rj65QNy9LXUXjumZ4BLeAifRVBUz0tkBEKahixnnvSVvhgZ3
         12zzPLvsMtgCKfGbKZag4KDTorBoyD7Er1+g6FYfKPeCbWU7tWy6D1m+O7HW7JFmkVRb
         8yXeUbbP4peii73RiRD3ARBdI6slwtVAeItP9uOMNHo803Kk4mMP0LMgPjmGmug9bW3k
         7lb0wW7Fz238EJiWPrXJ3KvdFooWgi/X4Gjg+YZQ4F6aPc0mrM+urJZiAMo7s+FN40U0
         coWpv3qeMCy9sRnOfGCq2Ag9cA1v56peXDe+2m7WZbQZnBwDv3xwAJi7ZkELZFaTnA28
         jQ/w==
X-Gm-Message-State: AOAM530uITAI2o+WdL9fxbdXLOfTeRj+UorqIUCsZawS87mpbdLzIkIs
	28UTD6/MwvV/BIxB/dMrqXNHuHWqAQk/fOsQcjQ=
X-Google-Smtp-Source: 
 ABdhPJxDcB9k1x89pR9Tco35JZS0Xu1Ug6q7Tg1VTcYZEqIQoTHkCKIHpyW17AbZibuTBAmd96LL+ch2GovVcMCvu1c=
X-Received: by 2002:a05:6102:20d1:b0:30e:dfe6:de1a with SMTP id
 i17-20020a05610220d100b0030edfe6de1amr3012773vsr.73.1645171444515; Fri, 18
 Feb 2022 00:04:04 -0800 (PST)
MIME-Version: 1.0
References: <7d187920-92f0-a0fe-22b9-a77a1c98fd7d@windriver.com>
 <CAJ86T=VF+6J3UBJ-=rYt=rODkdP=H73cWFXyE0YfJCaYJfb1oQ@mail.gmail.com>
 <Yg9SGkkOMwoPVcP1@korppu>
In-Reply-To: <Yg9SGkkOMwoPVcP1@korppu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Feb 2022 09:03:53 +0100
Message-ID: 
 <CANNYZj9SjKwzhBrpphqLkNCLOieZUs_Z+r-80yriWJV3xAzErQ@mail.gmail.com>
Subject: Re: [Openembedded-architecture] [oe] INCOMPATIBLE_LICENSES and
 WHITELIST_<license> usage
To: Mikko Rapeli <mikko.rapeli@bmw.de>
Cc: Andre McCurdy <armccurdy@gmail.com>, Saul.Wold@windriver.com,
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 08:04:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161885

You should really try per-image INCOMPATIBLE_LICENSE :) Maintaining
those whitelists/excludes is awkward, as developers constantly want
more of them.

Alex

On Fri, 18 Feb 2022 at 09:00, Mikko Rapeli <mikko.rapeli@bmw.de> wrote:
>
> Hi,
>
> On Thu, Feb 17, 2022 at 04:20:01PM -0800, Andre McCurdy wrote:
> > On Thu, Feb 17, 2022 at 3:01 PM Saul Wold <Saul.Wold@windriver.com> wrote:
> > >
> > > Folks,
> > >
> > > I am working on a proposal to re-write how INCOMPATIBLE_LICENSES is used
> > > and processed to possibly include a COMPATIBLE_LICENSES variable as
> > > well, see PeterK's email [0]
> > >
> > > I am trying to determine the usage of WHITELIST_<license> which would be
> > > used to override a license that might be listed in INCOMPATIBLE_LICENSES
> > > variable.
> > >
> > > Randy and I have done a quick and dirty survey of a 100 or so layers
> > > (thanks Randy) and could not find any real usage other than what's
> > > currently in OE-Core for WHITELIST_GPL-3.0.
> > >
> > > If you are using WHITELIST_<license>, please let me reply with your usage.
> >
> > Common case seems to be allowing gdb in debug builds of distros which
> > are otherwise free of GPLv3 etc, e.g.
> >
> >   https://github.com/MentorEmbedded/meta-mentor/blob/master/meta-mel/conf/distro/include/gdbserver-gplv3.inc
> >   https://github.com/lgirdk/meta-mng/blob/ofw-2112.6/conf/distro/mng.conf
>
> Exactly, I'm using this in a lot of projects.
>
> Basically distro config has:
>
> INCOMPATIBLE_LICENSE_append += " GPLv3 GPLv3+ LGPLv3 LGPLv3+"
>
> and then various GPLv3 tools are allowed in build but not allowed to be
> part of images:
>
> WHITELIST_GPL-3.0 += "binutils"
> PACKAGE_EXCLUDE += "binutils-dbg binutils-staticdev binutils-dev binutils-doc binutils-locale libbfd binutils"
>
> WHITELIST_GPL-3.0 += "gdb"
> PACKAGE_EXCLUDE += "gdb-sdktests-dbg gdb-sdktests gdbserver gdb-dbg gdb-staticdev gdb-dev gdb-doc gdb-locale gdb"
>
> WHITELIST_GPL-3.0 += "rsync"
> PACKAGE_EXCLUDE += "rsync-dbg rsync-staticdev rsync-dev rsync-doc rsync-locale rsync"
>
> etc etc.
>
> Use case is that developers can install additional GPLv3 licensed tooling if they
> need to debug something, but product images don't include them by default.
>
> Cheers,
>
> -Mikko
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#1460): https://lists.openembedded.org/g/openembedded-architecture/message/1460
> Mute This Topic: https://lists.openembedded.org/mt/89223137/1686489
> Group Owner: openembedded-architecture+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-architecture/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

