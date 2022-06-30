Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185DAC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 22:19:04 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.31299.1656627538190036363
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 15:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NSIn8a1a;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: sakoman@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id y18so579998iof.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 15:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MS/xCOmOiSeNZBoeugYgpHgBYr0nG/sZQhDt+Oi//BY=;
        b=NSIn8a1a5HL1EegRUwtf6hsgIbwR12J+bYW787PV70phvfD35qh6hkkkzE780GSs4f
         yQnFPWR7OkfQjkaeFrsqZkFfjLxBlqttMpLgN8o1LaCBracpvDuo+byHM0XFR4BDcbY2
         J/RMryB31nufUS1cmU2yf5joCoYHz0BWnrs7ncaCcF4LgQZbsIQ4GFee5rbiQcZ5LbJB
         2H4uiWMzBrVnhjiwKjSDuD8TtEvvIl3LzyOHe14R0YIZS8tqqjry8DJx0uL0GOeChXVb
         biJH+UNiF7K63LrAmobKyqFi4gIFvg4f1oPcjg3fOE80h8ISU6SfSpgm1kXwzlrjRgUv
         tc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MS/xCOmOiSeNZBoeugYgpHgBYr0nG/sZQhDt+Oi//BY=;
        b=bGJionnF65GJM6w8wwDIR50R1f/oi4SJ3wPDx86r5suzOEIDTSKlSYYz1S9lTQ441B
         Ng4K3GidcFaqml2ZeP2TI6z04atXHyirjGzY57UDgb73IjJSJTELYSLCOMqy8k5OnE/0
         qbJyp1XU6CM1B9X/0x217UvPgzEGgpjRkxoog24LIidSiuwWfZcvk+FIypxVfmpnVoC+
         jKBX4rhK9kdjJTY4N5TUHOhEcudzgSyaOBzXKt1pXR6z+Lxoij1yhACTbL3dMbJZA96S
         +p9qGEQr+q9rpsP6CPK8CiOvKIb1tBZxwdV9O9RQazDfLodwjo4bB/1gcR0FOrKzxsFV
         rssw==
X-Gm-Message-State: AJIora/BxVxf7c8EiIrMMDr2jUR4BxkudiFOfWn4ffEF0lH/BBQkyMju
	rF9cf2UO62e1GX7FLVYmZ+UfEQjvNd6ZG6OoWSg=
X-Google-Smtp-Source: 
 AGRyM1uFrrNPz88Nf7o8ci7KmqG/uPJQndRh5/oAFTSCPqUhCfSiOIBh48AraH59u7d1Mgwnry22efOB5KNKjz0Op9k=
X-Received: by 2002:a02:c88e:0:b0:33b:daad:a6b4 with SMTP id
 m14-20020a02c88e000000b0033bdaada6b4mr6192185jao.58.1656627537348; Thu, 30
 Jun 2022 15:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <16FB9273F36F7F78.24408@lists.openembedded.org>
 <7bdfec55599094a196f35ce4e84e651b8179d120.camel@linuxfoundation.org>
 <CAOSpxdbBwbBCHFxvFCvww=+J+v7PB0T7ENBHAGy4iZt3Jcm3Fg@mail.gmail.com>
 <93a6ffcf36c1293f57c77d027a7112bccbd9cd91.camel@linuxfoundation.org>
In-Reply-To: 
 <93a6ffcf36c1293f57c77d027a7112bccbd9cd91.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 30 Jun 2022 12:18:46 -1000
Message-ID: 
 <CAGDS+nk1YtN0n2TGX9suY424Fb235FyaU2q-NjXX381a8VU3Xw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] packagegroup-core-ssh-dropbear: Add
 openssh-sftp-server
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 22:19:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167445

On Thu, Jun 30, 2022 at 9:36 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2022-06-30 at 07:13 -1000, Steve Sakoman wrote:
> > On Mon, Jun 27, 2022 at 9:14 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Fri, 2022-06-24 at 14:45 +0100, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > Seems sad to have to do this but openssh is moving to use sftp instead
> > > > of scp to move files. This means scp from Fedora 36 will no longer be
> > > > able to move files to/from a dropbear based image. This breaks a number
> > > > of our key QA tests and I suspect will cause users pain too.
> > > >
> > > > The sftp server from openssh is small and standalone so adding it to
> > > > the packagegroup seems to be the best way to preserve user sanity. If
> > > > people really don't want it, they can just use dropbear instead of the
> > > > packageground.
> > > >
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > ---
> > > >  .../packagegroups/packagegroup-core-ssh-dropbear.bb             | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
> > > > index 4f844ad9255..b969ab7ca01 100644
> > > > --- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
> > > > +++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
> > > > @@ -3,4 +3,4 @@ PR = "r1"
> > > >
> > > >  inherit packagegroup
> > > >
> > > > -RDEPENDS:${PN} = "dropbear"
> > > > +RDEPENDS:${PN} = "dropbear openssh-sftp-server"
> > >
> > >
> > > If we want kirkstone or dunfell to work on Fedora 36 we're going to
> > > need this. Unfortunately it will break images with -dev packages in
> > > them.
> > >
> > > The fixes for master for that are not appropriate for
> > > kirkstone/dunfell, they're quite invasive for master.
> > >
> > > As such you may need to disable the -dev package dependencies for
> > > dropbear/openssh, something like:
> > >
> > > RDEPENDS:openssh-dev[nodeprrecs] = "1"
> > > RDEPENDS:dropbear-dev[nodeprrecs] = "1"
> > >
> > > in the appropriate places. I mention this now whilst I remember the
> > > context!
> >
> > Any hints as to the "appropriate places"? ;-)
> >
> > I assumed you meant the openssh and dropbear recipes:
> >
> > diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> > b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> > index f306b1245a..2178c4868f 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> > @@ -162,6 +162,8 @@ FILES:${PN}-keygen = "${bindir}/ssh-keygen"
> >
> >  RDEPENDS:${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
> >  RDEPENDS:${PN}-sshd += "${PN}-keygen
> > ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit
> > pam-plugin-loginuid', '', d)}"
> > +RDEPENDS:openssh-dev[nodeprrecs] = "1"
> > +
> >  RRECOMMENDS:${PN}-sshd:append:class-target = "\
> >      ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
> >  "
> > diff --git a/meta/recipes-core/dropbear/dropbear.inc
> > b/meta/recipes-core/dropbear/dropbear.inc
> > index 78f9f9adbd..a93d247caa 100644
> > --- a/meta/recipes-core/dropbear/dropbear.inc
> > +++ b/meta/recipes-core/dropbear/dropbear.inc
> > @@ -9,6 +9,7 @@ LICENSE = "MIT & BSD-3-Clause & BSD-2-Clause & PD"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=25cf44512b7bc8966a48b6b1a9b7605f"
> >
> >  DEPENDS = "zlib virtual/crypt"
> > +RDEPENDS:dropbear-dev[nodeprrecs] = "1"
> >  RPROVIDES:${PN} = "ssh sshd"
> >  RCONFLICTS:${PN} = "openssh-sshd openssh"
> >
> >
> > but I still get failures on do_populate_sdk:
> >
> > Error:
> >  Problem: package dropbear-dev-2020.81-r0.core2_64 requires dropbear =
> > 2020.81-r0, but none of the providers can be installed
> >   - package dropbear-2020.81-r0.core2_64 conflicts with openssh
> > provided by openssh-8.9p1-r0.core2_64
> >   - package openssh-8.9p1-r0.core2_64 conflicts with dropbear provided
> > by dropbear-2020.81-r0.core2_64
> >   - package openssh-dev-8.9p1-r0.core2_64 requires openssh = 8.9p1-r0,
> > but none of the providers can be installed
> >   - conflicting requests
>
> I'm confused between the different branches. I think you'll need:
>
> RDEPENDS_${PN}-dev = ""
>
> in both those recipes to break the main dependency. Whether you nee the
> RRECOMMENDS chain breaking I'm less sure but for dunfell it would be:
>
> RRECOMMENDS_dropbear-dev[nodeprrecs] = "1"

I'm working on kirkstone first.  Thanks for the advice!

Steve

