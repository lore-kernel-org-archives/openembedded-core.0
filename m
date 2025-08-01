Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2669C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 16:25:16 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.92130.1754065515964891051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 09:25:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WFJZhlU+;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e8dfa190de4so1661178276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754065515; x=1754670315; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUEETfVUEDEuP5OVGiiV5Mxu5LXwu9Hn8CKBvjJvFPA=;
        b=WFJZhlU+Ja7Gnz791kzRNYPzx6A05LJ2JCMKoRitkZep2BHwB8L5hhfQwIdeG7hkla
         yAxD+ByEnARysLGDuBZg5Qj4BP7fGZ+i0PAjrUWxu9IBJQRKkNZOpojM/pA0TJKAZest
         QDBORYCkS8B5JIc0EGA4hyoSxLWUcjtCG2gWXteRn/tiaCbOxC0U98eh4Vb7/tk5z+pj
         jss74G98OOGAlleHwb8YZUop6pNSBhru//tHSsQzcgSXMln5jJfDIQAJRU944LRr5/V+
         i8+dY+6+HxpvBNuD54M4B6iWizrJSLHWhxA+w2Lql9oh5YtKLQ7sQcf48L4eSm4cLtlG
         GeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754065515; x=1754670315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUEETfVUEDEuP5OVGiiV5Mxu5LXwu9Hn8CKBvjJvFPA=;
        b=g57VHqBdS1aymyuOg6SwybyWTpplaTs9yk8UMI/QTxfUlI7ven9u2dIp1jkI3xE75e
         PxklKTs/QbZwVBWHb5t7O7oW3d1qBGDRmLUpL/HqERtyHxXcWMQ9rZSeVzbvU7XmPa25
         X3b6kG3utTekWvLvqoGsv58ypF1NsGw1Ye8nIkTmrQEAZUBU85ePEcdoRIxFJRH5taWS
         5CGfq6AqFQgCiUohEEbKyi3zc7BldqOzxkVcEcanFzZ4qVTPLubMNmJDLigwHs6f+Fxi
         iJOVPNiDusvcL5iBniBd3FGLNTEYtuFab7jzMbKfeYUFazrzgOxBf7Df8e0Jopzvi/Qg
         D4vQ==
X-Gm-Message-State: AOJu0YxKEgjC6fRFtslIlLRmv9Nodteo+zV4lNqMvUkbrVzmD4HS+Fuu
	ZTL3fK/U0MetaEmMat0ICzjR4vw4+vkrH7pn83NjB3B2g6GklsPBqX876edanbUjTEwSi/tELlL
	shZP49lXzMNzvstRuhpKO+VtWGkg+Xw4=
X-Gm-Gg: ASbGncvkgfiwcvzkQYd81azJHFdf+5zDcgjRnSHQ06Pw6pxhqoUKzRcvQmIFAHjbwD3
	Gtwax5t4VSmTRaVJAfnl0STJ5dB6l4LU2lI+ngZ8hJvUuflwNu5u8YRVYnRN+vd6ws/Jb3zSnNs
	rchDIDGpy6aUpKgT6ZU17FnTfn9P1aqKDd3MkKGZblSjqCNsnMiIqtZEk7rfCExYUEKV7jZT378
	TSJhIIWKEbT+f4VuTASjD2tkhfFT9zdDayTrsPK
X-Google-Smtp-Source: AGHT+IF++zFWJsQe1GH8IIdV7ffx2o3Hhtp/N6646gD2D17vC2F8ORmUL9uX1Su+R/T8TS3C8AJS4swp5AsjvMHRqrw=
X-Received: by 2002:a05:690c:2501:b0:719:f37e:e69c with SMTP id
 00721157ae682-71b7f08edccmr3727857b3.36.1754065514836; Fri, 01 Aug 2025
 09:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250801042242.3076232-1-raj.khem@gmail.com> <DBR3USPY34UA.F664WZTD1W0R@bootlin.com>
 <DBR837TZX59J.9N2ST9LM6WP2@bootlin.com>
In-Reply-To: <DBR837TZX59J.9N2ST9LM6WP2@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Aug 2025 09:24:48 -0700
X-Gm-Features: Ac12FXw92y8WSMsie2s0aiN7ZGEBBQE-rqpOY8BenvrjbqaVqCMH_kAPepE7DBc
Message-ID: <CAMKF1spNqOFBTCvO__S8KBtnu7pPd+c0t3GVip2eQm=Ugd8GoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] toolchain/clang-native: Set BUILD_LDFLAGS
 instead of LDFLAGS
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 16:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221369

On Fri, Aug 1, 2025 at 9:13=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Fri Aug 1, 2025 at 2:54 PM CEST, Mathieu Dubois-Briand wrote:
> > On Fri Aug 1, 2025 at 6:22 AM CEST, Khem Raj via lists.openembedded.org=
 wrote:
> >> BUILD_LDFLAGS is used by other recipes to emit native LDFLAGS
> >> into their cmake toolchain files especially in QT layers. it
> >> will usually be inherited by recipes wanting clang provide
> >> BUILD_* variables so this is more appropriate than LDFLAGS to
> >> pass these options.
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >
> > Hi Khem,
> >
> > It looks like something in there is breaking the reproducibility:
> >
> > AssertionError: The following deb packages are different and not in exc=
lusion list:
> > /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-e=
xtended/tmp/deploy/deb/./core2-64/clang-dev_20.1.8-r0_amd64.deb
> > The following ipk packages are different and not in exclusion list:
> > /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-e=
xtended/tmp/deploy/ipk/./core2-64/clang-dev_20.1.8-r0_core2-64.ipk
> > The following rpm packages are different and not in exclusion list:
> > /srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-e=
xtended/tmp/deploy/rpm/./core2_64/clang-dev-20.1.8-r0.core2_64.rpm
> >
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2205
> > https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250801-t697t=
4fj/packages/diff-html/
> >
> > Can you have a look at this?
>
> I did a rebuild of this one and is succeed. So either we have an
> intermittent fail or some cache issue, not really sure...
>

Possible, I was wondering how build linker flags would insert into
target builds, it's quite unlikely
but still a case. I have dumped the binaries ( strings ) and tried to
catch absolute build path and
did not catch it so far.

> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2210
>
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

