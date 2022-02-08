Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48057C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 12:10:33 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.10282.1644322230585383233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 04:10:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=tgK2racN;
 spf=pass (domain: burtonini.com, ip: 209.85.221.47,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f47.google.com with SMTP id w11so30363284wra.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 04:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jzgZw9Dkf2UPvtx0T2S3iKCDkG2d/VpwPaOHZCQ4FKA=;
        b=tgK2racNqTyiyQ3DiXC2OPjrSWDA4QVKQL01jpPr4FK5hlzzXTQq77Z6v8DYLTMqS6
         qUE6Z7ooDFYc6014k+QWFI5/YJMR1MpoFStQspKY+7z0znHSHTDJZlq3y5Ibp6GpgM89
         y29wRnLfT1dPlCdNol5jZxxHsCmBV89e2whS7FdMYBMyb+z1zOWT2vWl+3+Bc6qjAVnY
         B6JsUFQTT+Mu+tMGVa3IMWkRPtUWdHJ/39Vf4jzIobuieXaJmWDO0NoGTT1kf/TkayCk
         HsYkeIAl4VzHdLqT6wXwOANEtqNAzFCbveuMntPj23n62G/1jJ2BMhAaXBweQ5d59/Pm
         s/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jzgZw9Dkf2UPvtx0T2S3iKCDkG2d/VpwPaOHZCQ4FKA=;
        b=6VCDWHkK4B06q17WllM/pnbL2VuOBe5ehxsGO5e0YIdLU7UDOQxOt9NLgKcpHDLVSS
         BDCtYggO2FlMHR3qeVDti5kDADjq0eFS3ml9IhrgWgf0eV0WXML5HewuHNYM6Bx3DhGd
         1Pczj812NyyI9j/5C7yOF5ZR3g/GQ+7GAHCWWmn06BLZiCXbofdhfRFmdVSp2c1Mk56k
         fZkSGWQKIPyYf3r2XHrSHcnrWcwRNf3heeBv0brOYR1XR7iqi4Ud4jaunSZ8lCr+HS0R
         ZoTEL9sgYZ6Ie6/b1WbWg9rvzmzOONAjpZr3aEaiqZNZarUW+Ee5TmnuHweGQgk/fNuN
         zhsg==
X-Gm-Message-State: AOAM530YxmvWikod4STxBc8HnULD3MgpbG22UAm57hE8txLGkN7D8v3s
	TZFajlUc8N86DrHOyyI1Y0UNJL4N6sIDDaSBmC0WBQ==
X-Google-Smtp-Source: 
 ABdhPJzBtkDcX1eBxWm9c2fXP1KbQMvvdr3AykEipNViCz6ay69NfMhjeTu8aTMQ/Ee18/QfABTHceO6XD9FPsseaOI=
X-Received: by 2002:a05:6000:1d96:: with SMTP id
 bk22mr3247620wrb.231.1644322228776;
 Tue, 08 Feb 2022 04:10:28 -0800 (PST)
MIME-Version: 1.0
References: <20220128014022.3144694-1-alejandro@enedino.org>
 <CAAnfSTseymNVH6KbfuL02kXSAcm_qPviimu8oW-2Sz36_DrijA@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTseymNVH6KbfuL02kXSAcm_qPviimu8oW-2Sz36_DrijA@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 8 Feb 2022 12:10:17 +0000
Message-ID: 
 <CAAnfSTsws2ffmt99X9NNWDW6oX4X3wjg90_4CnN=X+AGNTT0Wg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] newlib: Upgrade 4.1.0 -> 4.2.0
To: alejandro@enedino.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 12:10:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161499

Patch on the list.

It would be good to get newlib exercised in the AB somewhere...

Ross

On Tue, 8 Feb 2022 at 11:32, Ross Burton <ross@burtonini.com> wrote:
>
> This is causing license errors for me:
>
> ERROR: newlib-4.2.0-r0 do_populate_lic: QA Issue: newlib: The
> LIC_FILES_CHKSUM does not match for
> file://COPYING.NEWLIB;md5=b8dda70da54e0efb49b1074f349d7749
> newlib: The new md5 checksum is 8bb75595dbcc7d45e5c0d116d7bdf6ce
> newlib: Here is the selected license text:
> vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
> The newlib subdirectory is a collection of software from several sources.
> Each file may have its own copyright/license that is embedded in the source
> file.  Unless otherwise noted in the body of the source file(s), the
> following copyright
> notices will apply to the contents of the newlib subdirectory:
> (1) Red Hat Incorporated
> Copyright (c) 1994-2009  Red Hat, Inc. All rights reserved.
> ...
> ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
> FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
> LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
> OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> SUCH DAMAGE.
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> newlib: Check if the license information has changed in
> /builds/engineering/yocto/meta-arm/work/build/tmp/work/cortexm33e-fpv5-spd16-poky-eabi/newlib/4.2.0-r0/newlib-4.2.0.20211231/COPYING.NEWLIB
> to verify that the LICENSE value "GPLv2 & LGPLv3 & GPLv3 & LGPLv2 &
> BSD-2-Clause & tcl" remains valid [license-checksum]
>
> Ross
>
> On Fri, 28 Jan 2022 at 01:40, Alejandro Hernandez Samaniego
> <alejandro@enedino.org> wrote:
> >
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> > ---
> >  .../newlib/{libgloss_4.1.0.bb => libgloss_4.2.0.bb}  |  0
> >  meta/recipes-core/newlib/newlib.inc                  | 12 +++++++++---
> >  .../newlib/{newlib_4.1.0.bb => newlib_4.2.0.bb}      |  0
> >  3 files changed, 9 insertions(+), 3 deletions(-)
> >  rename meta/recipes-core/newlib/{libgloss_4.1.0.bb => libgloss_4.2.0.bb} (100%)
> >  rename meta/recipes-core/newlib/{newlib_4.1.0.bb => newlib_4.2.0.bb} (100%)
> >
> > diff --git a/meta/recipes-core/newlib/libgloss_4.1.0.bb b/meta/recipes-core/newlib/libgloss_4.2.0.bb
> > similarity index 100%
> > rename from meta/recipes-core/newlib/libgloss_4.1.0.bb
> > rename to meta/recipes-core/newlib/libgloss_4.2.0.bb
> > diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
> > index 23cd172008..5e488d0848 100644
> > --- a/meta/recipes-core/newlib/newlib.inc
> > +++ b/meta/recipes-core/newlib/newlib.inc
> > @@ -15,13 +15,19 @@ LIC_FILES_CHKSUM = " \
> >                 file://newlib/libc/sys/linux/linuxthreads/LICENSE;md5=73640207fbc79b198c7ffd4ad4d97aa0 \
> >                 "
> >
> > -SRC_URI = "https://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
> > -SRC_URI[sha256sum] = "f296e372f51324224d387cc116dc37a6bd397198756746f93a2b02e9a5d40154"
> > +# Newlib maintainers sometimes publish the source
> > +# from a specific snapshot, after an upgrade we can
> > +# delete the following line and keep the empty default
> > +NEWLIB_SNAPSHOT = ".20211231"
> > +NEWLIB_SNAPSHOT ?= ""
> > +SRC_URI = "https://sourceware.org/pub/newlib/newlib-${PV}${NEWLIB_SNAPSHOT}.tar.gz"
> > +SRC_URI[sha256sum] = "c3a0e8b63bc3bef1aeee4ca3906b53b3b86c8d139867607369cb2915ffc54435"
> > +
> >
> >  INHIBIT_DEFAULT_DEPS = "1"
> >  DEPENDS = "virtual/${TARGET_PREFIX}gcc"
> >
> > -S = "${WORKDIR}/newlib-${PV}"
> > +S = "${WORKDIR}/newlib-${PV}${NEWLIB_SNAPSHOT}"
> >  B = "${WORKDIR}/build"
> >
> >  ## disable stdlib
> > diff --git a/meta/recipes-core/newlib/newlib_4.1.0.bb b/meta/recipes-core/newlib/newlib_4.2.0.bb
> > similarity index 100%
> > rename from meta/recipes-core/newlib/newlib_4.1.0.bb
> > rename to meta/recipes-core/newlib/newlib_4.2.0.bb
> > --
> > 2.25.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#161064): https://lists.openembedded.org/g/openembedded-core/message/161064
> > Mute This Topic: https://lists.openembedded.org/mt/88736577/1676615
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

