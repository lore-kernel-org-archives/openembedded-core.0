Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A684C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 12:09:30 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.8356.1634818169208282492
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 05:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=dwPQ3QKb;
 spf=pass (domain: foundries.io, ip: 209.85.128.50,
 mailfrom: daiane.angolini@foundries.io)
Received: by mail-wm1-f50.google.com with SMTP id
 l38-20020a05600c1d2600b0030d80c3667aso525230wms.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 05:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wiWPHf9lgCQgeV5/qTBeLGOHaDDpA1W4WGsFINa35vY=;
        b=dwPQ3QKbyMvpQy2YsxgotxsYF6hXT/yZpI7arUqMBdt8rU9EQSK05dEyqVSw3M94Q0
         MZfy+VIoJrmg08dmCEqauHjjSALwEb0C6sXC6s+A4AvCVy6AI8J+UINRUwT6v8tBdETi
         ri4JWOM51cu0ObBtYGxid5i4P6T6hJKZhrN4vQs9yCbJMg8r4mcsjEmPmL0CUc+2xtOR
         QQpiIcV++ivcl5W9PndQ+5s7sB7L8QPRFFOtxStRxo2zre0acqHIm9n5iMJud50NYqnV
         f/Ml3UN4Dja7ipDy8QFK2HsM1Z9OfT+Rejg1nfCQXCn0ecclq95r7tay4YM2YyXzhSzc
         i6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wiWPHf9lgCQgeV5/qTBeLGOHaDDpA1W4WGsFINa35vY=;
        b=HyDub5wWKuLQmZOKq/CmRTZDFHlvDksuD35b8qW/92Rj+reEwEF2fT4/7BrfC6S7Pf
         LFoIEutEfdRJ6+LXw0vSIqlf+zwnqo1j10mDyt3ua/YjVe9uejgrD5MEgw7mUNKTsWAb
         KRImfcAL8jdJhEv9dz+ABySdoTo90fW6RTMkCKx7c9VeRE58bzD3BJTT5bjdEkbRkRpq
         KjAkl7so0aBHDoWuaMet6nHSriZSB5VsBs4Bvk7pAyblAKs4rguniU9XSExTG4axD1gl
         n6cPpmYna9oWOPqCpI+BE6TpEmOw0VuYUFrHe5/JxLOBUP6o76TAvoqh72kueWiNMVaU
         SBQA==
X-Gm-Message-State: AOAM533lLdRAurlCM6IXNIrqAS5HB/941DR/BsDTSQy+V+AxTgJEefk8
	bIxd+ylf3BEO0ObzmK+HuU1Xm+uIkVS1xDaZ6xzq7g==
X-Google-Smtp-Source: 
 ABdhPJxz75EUB97aXIgWVQyQ6qVo4tQFH+fG1Sq2AlUR7++SC3L3EEcHtKMND3s2riVTrhn4KKe4MuoZARD5WzgM6bU=
X-Received: by 2002:a1c:7f56:: with SMTP id a83mr6492704wmd.20.1634818167421;
 Thu, 21 Oct 2021 05:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211018184455.437741-1-daiane.angolini@foundries.io>
 <YW8ZazwTRTxNVdiO@piout.net>
In-Reply-To: <YW8ZazwTRTxNVdiO@piout.net>
From: Daiane Angolini <daiane.angolini@foundries.io>
Date: Thu, 21 Oct 2021 09:09:16 -0300
Message-ID: 
 <CA+HEL784CxicYGZGt3v+04me7qr3u_V-nGDF-tuQLmjaqFd=rg@mail.gmail.com>
Subject: Re: [OE-core] classes/lib/useradd: The option -P is deprecated
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 12:09:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157280

On Tue, Oct 19, 2021 at 4:15 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Daiane,
>
> On 18/10/2021 15:44:55-0300, Daiane Angolini wrote:
> > Since [1] the option -P is not available, so remove it from parsing lib.
> >
> > This is a partial fix for [YOCTO #14605].
> >
> > During the do_rootfs, the error message when using -P is:
> >
> >   useradd: unrecognized option '--clear-password'
> >
> > Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
> > ---
> >  meta/lib/oe/useradd.py | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/meta/lib/oe/useradd.py b/meta/lib/oe/useradd.py
> > index 8fc77568ff..63768311ee 100644
> > --- a/meta/lib/oe/useradd.py
> > +++ b/meta/lib/oe/useradd.py
> > @@ -45,7 +45,6 @@ def build_useradd_parser():
> >      parser.add_argument("-N", "--no-user-group", dest="user_group", help="do not create a group with the same name as the user", action="store_const", const=False)
> >      parser.add_argument("-o", "--non-unique", help="allow to create users with duplicate (non-unique UID)", action="store_true")
> >      parser.add_argument("-p", "--password", metavar="PASSWORD", help="encrypted password of the new account")
> > -    parser.add_argument("-P", "--clear-password", metavar="CLEAR_PASSWORD", help="use this clear password for the new account")
>
> This causes an issue in useradd-staticids.bbclass

I had imagined this would cause problems in other places, some of them
I would not be aware of.
I will take a look again on this issue, and I have already sent an
adjustment to the documentation to also cover the bug #14605

But I don't hope to be able to do so in the next 2 days.

Thanks,
Daiane
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/847/steps/12/logs/stdio
>
> File: '<code>', lineno: 20, function: <module>
>      0016:__anon_177__home_pokybuild_yocto_worker_reproducible_centos_build_meta_classes_siteinfo_bbclass(d)
>      0017:__anon_63__home_pokybuild_yocto_worker_reproducible_centos_build_meta_classes_update_rc_d_bbclass(d)
>      0018:__anon_23__home_pokybuild_yocto_worker_reproducible_centos_build_meta_classes_systemd_bbclass(d)
>      0019:__anon_195__home_pokybuild_yocto_worker_reproducible_centos_build_meta_classes_useradd_bbclass(d)
>  *** 0020:__anon_311__home_pokybuild_yocto_worker_reproducible_centos_build_meta_classes_useradd_staticids_bbclass(d)
>      0021:__anon_114__home_pokybuild_yocto_worker_reproducible_centos_build_meta_classes_update_alternatives_bbclass(d)
> File: '/home/pokybuild/yocto-worker/reproducible-centos/build/meta/classes/useradd-staticids.bbclass', lineno: 307, function: __anon_311__home_pokybuild_yocto_worker_reproducible_centos_build_meta_classes_useradd_staticids_bbclass
>      0303:python __anonymous() {
>      0304:    if not bb.data.inherits_class('nativesdk', d) \
>      0305:        and not bb.data.inherits_class('native', d):
>      0306:        try:
>  *** 0307:            update_useradd_static_config(d)
>      0308:        except NotImplementedError as f:
>      0309:            bb.debug(1, "Skipping recipe %s: %s" % (d.getVar('PN'), f))
>      0310:            raise bb.parse.SkipRecipe(f)
>      0311:}
> File: '/home/pokybuild/yocto-worker/reproducible-centos/build/meta/classes/useradd-staticids.bbclass', lineno: 271, function: update_useradd_static_config
>      0267:        # is a bit of a waste -- only process useradd/groupadd
>      0268:        useradd_param = d.getVar('USERADD_PARAM:%s' % pkg)
>      0269:        if useradd_param:
>      0270:            #bb.warn("Before: 'USERADD_PARAM:%s' - '%s'" % (pkg, useradd_param))
>  *** 0271:            d.setVar('USERADD_PARAM:%s' % pkg, rewrite_useradd(useradd_param, True))
>      0272:            #bb.warn("After:  'USERADD_PARAM:%s' - '%s'" % (pkg, d.getVar('USERADD_PARAM:%s' % pkg)))
>      0273:
>      0274:        groupadd_param = d.getVar('GROUPADD_PARAM:%s' % pkg)
>      0275:        if groupadd_param:
> File: '/home/pokybuild/yocto-worker/reproducible-centos/build/meta/classes/useradd-staticids.bbclass', lineno: 177, function: rewrite_useradd
>      0173:            newparam += ['', ' --no-user-group'][uaargs.user_group is False]
>      0174:            newparam += ['', ' --non-unique'][uaargs.non_unique]
>      0175:            if uaargs.password != None:
>      0176:                newparam += ['', ' --password %s' % uaargs.password][uaargs.password != None]
>  *** 0177:            elif uaargs.clear_password:
>      0178:                newparam += ['', ' --clear-password %s' % uaargs.clear_password][uaargs.clear_password != None]
>      0179:            newparam += ['', ' --root %s' % uaargs.root][uaargs.root != None]
>      0180:            newparam += ['', ' --system'][uaargs.system]
>      0181:            newparam += ['', ' --shell %s' % uaargs.shell][uaargs.shell != None]
> Exception: AttributeError: 'Namespace' object has no attribute 'clear_password'
>
> >      parser.add_argument("-R", "--root", metavar="CHROOT_DIR", help="directory to chroot into")
> >      parser.add_argument("-r", "--system", help="create a system account", action="store_true")
> >      parser.add_argument("-s", "--shell", metavar="SHELL", help="login shell of the new account")
> > --
> > 2.30.2
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#157090): https://lists.openembedded.org/g/openembedded-core/message/157090
> > Mute This Topic: https://lists.openembedded.org/mt/86422106/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

