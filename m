Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B3AC433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 04:27:40 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.5684.1637036858812071501
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 20:27:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PMFB+LPE;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id n6so23078999uak.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 20:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MhLaRKjM0bvoe8ZrCseHfFa+e3IkD9n6EjDLgVU29Dg=;
        b=PMFB+LPEO+aL0/IQgxhocz8Ruyr4Ue0PtLWmVyST55xgZDKkacfJHMj+cftbomO/mX
         Jt4DbWTBvOdNIO/K3Pl/Rx2X58wvLmatqz96FbJ44AJVrXH6VUp6Z9VJQ8zrB2lCmibM
         nDm+LeeSGOacuiMyckceLt0Hm8b5uEWs+SLZ2vlOFOuTdwmzJcZOF8UT2tC7zJ4uMz05
         G76impA/88K0MytlF5JiAKn3R4AczOHFsaqeaC/5UiT2I3FzAsk/wPmEHkQJdeP0gUNi
         cIV9uorcneQz39Ovk88Jvil2L6IoWmSmZzwYT4pnHSW/hJBmlxRtZ5ygkEe+DnERbLdT
         R9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MhLaRKjM0bvoe8ZrCseHfFa+e3IkD9n6EjDLgVU29Dg=;
        b=DYks2jHd/9BpYzRU/NTcv4IySGz+0/Q4JHhgD+OptallQRF9zsKxd+1F1ovJGz5gIF
         7UpVXtonxGsCGcuojzqg58NrnGYgx8+yv2XNCszE5617QumhCBZyfwnQn9tUeOsN7oQX
         ma8abGY0KwfVqBX61iXj1mxPxwGcit8a5FlDRGkRkKg5ipzDX0KN3FNw7xL2vdVBcUxs
         AsJr+niB+wLPL5OAAvxY0KTyJoK3vF4Ws6mucPJDD1iQSqocEnCQcKYj+vZ9XAgR9MeF
         aa/pFP2k/qH0z++CmB9nNDqhMcIaAl4nZ4BEWH8nwGaPBHzhuur7Typs77SudgcBlE/C
         J1tw==
X-Gm-Message-State: AOAM531q5KK87MjYF52Z9PhqeTy77/fE/38JdRMo7xk7R8CFVG1hu3aZ
	0T7/4rDBXA23oE2JCy82PbW1aX4tYe9r+lZycSQ=
X-Google-Smtp-Source: 
 ABdhPJzPIpHeQznCaJFdLa4d5LkKwAEnmZAvoIn/07WJTUBBDNYNbNi+wk7TJjD5slYgQWWElOw+gfuh7mJHPJqBWqs=
X-Received: by 2002:a67:e18e:: with SMTP id e14mr50536506vsl.49.1637036858016;
 Mon, 15 Nov 2021 20:27:38 -0800 (PST)
MIME-Version: 1.0
References: <20211115140340.8047-1-pgowda.cve@gmail.com>
 <fb89e2f93d5bd83bfb745664c83959450721f799.camel@intel.com>
In-Reply-To: <fb89e2f93d5bd83bfb745664c83959450721f799.camel@intel.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Tue, 16 Nov 2021 09:57:27 +0530
Message-ID: 
 <CALY4985BecSdQFemocJXY15E8cqQsQcMm1N0wnP4oyUZPBrAhw@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH v2] rust-cross: Replace TARGET_ARCH
 with TUNE_PKGARCH
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"rwmacleod@gmail.com" <rwmacleod@gmail.com>,
 "umesh.kalappa0@gmail.com" <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 04:27:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158338

Hi Anuj,

I'm sorry regarding the patch subject.
The patch is for the master branch. However, the same issue exists for
other branches as well.
I will check the comments from others and will post the patch to the
Hardknott branch once it's approved in the master branch.

Thanks,
Pgowda

On Tue, Nov 16, 2021 at 8:01 AM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> This doesn't look hardknott related. Is this for master?
>
> Thanks,
>
> Anuj
>
> On Mon, 2021-11-15 at 06:03 -0800, Pgowda wrote:
> > rust-cross-* imported from meta-rust has incorrect signatures,
> > depending on MACHINEOVERRIDES making it effectively MACHINE_ARCH
> > as shown by sstate-diff-machines.sh:
> >
> > openembedded-core/scripts/sstate-diff-machines.sh --tmpdir=tmp-glibc
> > \
> > --machines="qemuarm64 qemuarm64copy" --targets=rust-cross-aarch64-
> > glibc \
> > --analyze
> >
> >  === Comparing signatures for task do_configure.sigdata between
> >  qemuarm64 and qemuarm64copy ===
> > ERROR: gcc-runtime different signature for task do_configure.sigdata
> > between qemuarm64 and qemuarm64copy
> > NOTE: Starting bitbake server...
> > Hash for dependent task gcc/gcc-
> > runtime_11.2.bb:do_prepare_recipe_sysroot
> > changed from
> > da4ebf1b272cb73153145a0a95e6438d2955ae2d36f84db10f6880b2781ec331 to
> > 47a0ebb7a88c9f896fb9dbce269f575ab8a6faabb2b9e62d164be6e71c5e4e40
> > Unable to find matching sigdata for
> > openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:
> > do_prepare_recipe_sysroot with hashes
> > da4ebf1b272cb73153145a0a95e6438d2955ae2d36f84db10f6880b2781ec331 or
> > 47a0ebb7a88c9f896fb9dbce269f575ab8a6faabb2b9e62d164be6e71c5e4e40
> >
> > The following patch takes TUNE_PKGARCH into consideration instead
> > of TARGET_ARCH and results in signatures as expected.
> >
> > [YOCTO #14613]
> >
> > Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> > ---
> >  meta/recipes-devtools/rust/rust-cross.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/rust/rust-cross.inc
> > b/meta/recipes-devtools/rust/rust-cross.inc
> > index bb625f4240..a77f7d5122 100644
> > --- a/meta/recipes-devtools/rust/rust-cross.inc
> > +++ b/meta/recipes-devtools/rust/rust-cross.inc
> > @@ -34,7 +34,7 @@ DEPENDS += "virtual/${TARGET_PREFIX}gcc
> > virtual/${TARGET_PREFIX}compilerlibs vir
> >  DEPENDS += "rust-native"
> >
> >  PROVIDES = "virtual/${TARGET_PREFIX}rust"
> > -PN = "rust-cross-${TARGET_ARCH}-${TCLIBC}"
> > +PN = "rust-cross-${TUNE_PKGARCH}-${TCLIBC}"
> >
> >  # In the cross compilation case, rustc doesn't seem to get the rpath
> > quite
> >  # right. It manages to include '../../lib/${TARGET_PREFIX}', but
> > doesn't
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#158292):
> > https://lists.openembedded.org/g/openembedded-core/message/158292
> > Mute This Topic: https://lists.openembedded.org/mt/87069441/3616702
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub [
> > anuj.mittal@intel.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

