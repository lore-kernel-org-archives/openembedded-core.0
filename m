Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C61CC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 17:23:42 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.1324.1659979418555176357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yj2SNmuY;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id j3so3359787ljo.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XQULgx/aSvtXJq+wmtLcOIegkA6liAHwroeGnPBhTFo=;
        b=Yj2SNmuYyFUOupxBKFkTrIUix1oetUnxofZC7Ed2+nJHj3xt/9X6lUDiGpv+hlZQZ7
         VcStuc29mKL57/mCzErQkv8v7+u4z41T0peHb+saIRAZuG52Kjlp+FdjrNlKH3muD4Au
         agO6hVg+agQZTIjfDRrj279TLvXlQtOqacmRswS9lAmWhfShmDGsrysnsYqWyEFqzsi9
         sbu7blFfzQA6I7Jvj3/l8WIQotuFjGYQygOSoTIVLcBo7kv3Qod3njOi8URZsuSYoZsB
         XcMsYHbHjwOCKVJQl2iJMN2hHLrB6H0IJFiPc6hm7Px0R3q4m9y/txA7tuiscUd6Vz2x
         QDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XQULgx/aSvtXJq+wmtLcOIegkA6liAHwroeGnPBhTFo=;
        b=6x1QlJqO1BehWF64uNibsCPLRW4ybcnvzRVWX6o6nXnUgxWDQ4qtm43GvMFAN+Zy5b
         11Mg+2JJ8okBTWOZwd90GnsJ8+w8aKhtAZbYiuXtkZ6Y5xrejpBxAOEyuNr2+el1e27l
         LxFdoXYptSBTca61dvD3puWODDBLIrvoSeRA4A9DUj/uSpI/itFXsgOfR5SGq3CKnIC2
         7lt5CvAjKwZIzAUWlGPq89SHhXXVsNuoBPfqpFCwUyCI7ZnaAW7niG9sHABLTlbDCUlW
         FAiWb5AtBtEB0dFagfvz2plxgauv9oPWfgu8mMvHISMLvruLHItNff9EwPWGDGT5O2jL
         kpcA==
X-Gm-Message-State: ACgBeo2keg477G5cOJd5e9uqzz9VxWQvwEMjh43s4IjVDsRSS+FokOIb
	7rwADqBmajd4QwACGFFoafFK+4/GEtWD6zna/I0=
X-Google-Smtp-Source: 
 AA6agR5IPY+hSD1mgGhNJJJJTRkKlo0a6Eqo1huo4SaeorI6qKZX2qkjePv1zreF6XsgXDJwjkXk5kC9CHSF6KmqU60=
X-Received: by 2002:a2e:804e:0:b0:25e:7231:c304 with SMTP id
 p14-20020a2e804e000000b0025e7231c304mr6058518ljg.257.1659979416678; Mon, 08
 Aug 2022 10:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220808064237.3975347-1-alex@linutronix.de>
 <20220808064237.3975347-3-alex@linutronix.de>
 <19f519e2-c632-da23-6132-664f2c53d311@gmail.com>
In-Reply-To: <19f519e2-c632-da23-6132-664f2c53d311@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 8 Aug 2022 19:23:25 +0200
Message-ID: 
 <CANNYZj8ZPzmykravZiDVap-PswhkNS_w8gO8pfc3TbjpJspnsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 03/44] dropbear: use git to get sources as
 the website is down
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 17:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169106

This is the upstream issue. This patch can be dropped I guess.

https://github.com/mkj/dropbear/issues/186

Alex

On Mon, 8 Aug 2022 at 18:54, Khem Raj <raj.khem@gmail.com> wrote:
>
> it seems to back up again. However, if its a site flakiness issue
> perhaps finding a good mirror might be nice.
>
> On 8/7/22 11:41 PM, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >   meta/recipes-core/dropbear/dropbear_2022.82.bb | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/dropbear/dropbear_2022.82.bb b/meta/recipes-core/dropbear/dropbear_2022.82.bb
> > index e170587d08..cff2e6c024 100644
> > --- a/meta/recipes-core/dropbear/dropbear_2022.82.bb
> > +++ b/meta/recipes-core/dropbear/dropbear_2022.82.bb
> > @@ -14,7 +14,7 @@ RCONFLICTS:${PN} = "openssh-sshd openssh"
> >
> >   DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> >
> > -SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
> > +SRC_URI = "git://github.com/mkj/dropbear.git;branch=master;protocol=https \
> >              file://0001-urandom-xauth-changes-to-options.h.patch \
> >              file://init \
> >              file://dropbearkey.service \
> > @@ -23,6 +23,8 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
> >              file://dropbear.default \
> >              ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
> >              ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers', 'file://dropbear-disable-weak-ciphers.patch', '', d)} "
> > +SRCREV = "b8669b063bd2fc1906a13fb4b50c8b4697bf49ce"
> > +S = "${WORKDIR}/git"
> >
> >   PAM_SRC_URI = "file://0005-dropbear-enable-pam.patch \
> >                  file://0006-dropbear-configuration-file.patch \
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169027): https://lists.openembedded.org/g/openembedded-core/message/169027
> > Mute This Topic: https://lists.openembedded.org/mt/92886998/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

