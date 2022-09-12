Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D51C6FA82
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 19:23:28 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web09.212.1663010604596369981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 12:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gCsorTON;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-1225219ee46so26091745fac.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 12:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jdxn36B5lGFeSB44IwEpQKZfK3v6SKRflhQ+keAnoz0=;
        b=gCsorTONfy8ttGzssVTapmgW184IHC9opTwPCtX0IoyFTe0XmjQwWnItkXOWLiq66R
         3CQAsuaJiTZh0N+C1gvKmApaIW6mlav9scp48fOfrSB0c3l7KsjY79budCXFp0mYP21i
         D5ffcxUKbceGRfZcdh6qlkXa6NciZnG4MZuZ5wjFYUI+hXA/iUIOoYbxiAMKPk6v5be1
         8NGb9PEPXk9C28Fwq5Q+yfllI5FqsHi6lxruWNIFKexuQFbTJ9btvp4ROJ6qJhLvtzqd
         IwVTZWtdmrxuBPygz0a2PTePHPjyw/RGtYYXX5SmV8flQvIpoZ9YjQRwYXNLu2rEkbFa
         4umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jdxn36B5lGFeSB44IwEpQKZfK3v6SKRflhQ+keAnoz0=;
        b=Jwk+oD/Hgy89SiO+9Pp2UNjuCVFE+L5IRXg9yUQFUYjgxLckQayxdc1cukT7PkBltJ
         DCJTTN49vUa4Yhq1pAyK3/gwwe6zRnSdLXe7InQ5hRjgD7e+mfTWg/WWGhv8zM8zEE8R
         13LdXCvRG/qMU/sPFb09/ZYVCkGixcVBSZ/9p4uYQmBPaeYVqXZi6sWysYqNt3MM1B99
         S7a5EniDEg9qP0ia7zDR3/euNLVrvdkdIwJiwPgaBbAiguCJoxuJ0Zt/MNcWO4tUF7kE
         prOV0B1RF1ZX3tIf2PHrJMTcxkBSM3+OIVxKnmypPCTXBHG0HeBw88I7+DTWisZQWfO2
         AyrA==
X-Gm-Message-State: ACgBeo2khEmw9QFvTb6k/entrIA3TzsgjyBpQe9EIu8MYaMe01D1CW53
	QPjUB14jkgZYTMAkB0uUSSGYr5dSdql900FaqSk=
X-Google-Smtp-Source: 
 AA6agR5xUgcmmG5GSM7bU252hdlqkVpR8pnu+GfcL0eUhtR0dYO14gaJ5U3eFfm/USRnNLnV4/w2TedXfV4tpBJGkAI=
X-Received: by 2002:a05:6808:17a6:b0:344:eaa9:24e8 with SMTP id
 bg38-20020a05680817a600b00344eaa924e8mr9455406oib.55.1663010603791; Mon, 12
 Sep 2022 12:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220912092122.2020942-1-ptsneves@gmail.com>
 <CAMKF1srjyVGO1fcUkxzO0qM8zotmqOp_FRYMpD2U14JkmPdvvQ@mail.gmail.com>
 <36784d61-0e16-32b8-9e44-99833170e595@gmail.com>
In-Reply-To: <36784d61-0e16-32b8-9e44-99833170e595@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Sep 2022 12:22:57 -0700
Message-ID: 
 <CAMKF1spu4U3jFukipQkc3GvYpq9pTsnTHZwK2rXKYc1CoHz+Gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] watchdog: Remove unneeded tirpc dependency
To: Paulo Neves <ptsneves@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 19:23:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170544

On Mon, Sep 12, 2022 at 12:08 PM Paulo Neves <ptsneves@gmail.com> wrote:
>
> it should as there is no rpc code in the project as far as i scanned. I
> built it with musl successfully.

OK thanks for confirming.

>
> Paulo Neves
>
> On 9/12/22 17:06, Khem Raj wrote:
> > On Mon, Sep 12, 2022 at 2:21 AM Paulo Neves <ptsneves@gmail.com> wrote:
> >> watchdog code does not have any dependency on rpc code,
> >> therefore the dependency and flags to try to use it are
> >> removed.
> >>
> >> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> >> ---
> >>   meta/recipes-extended/watchdog/watchdog_5.16.bb | 4 ----
> >>   1 file changed, 4 deletions(-)
> >>
> >> diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
> >> index 26fcc10487..6031dcaa16 100644
> >> --- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
> >> +++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
> >> @@ -28,10 +28,6 @@ UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
> >>
> >>   inherit autotools update-rc.d systemd pkgconfig
> >>
> >> -DEPENDS += "libtirpc"
> >> -CFLAGS += "-I${STAGING_INCDIR}/tirpc"
> >> -LDFLAGS += "-ltirpc"
> >> -
> > does musl build works too ?
> >
> >>   EXTRA_OECONF += " --disable-nfs "
> >>   CACHED_CONFIGUREVARS += "ac_cv_path_PATH_SENDMAIL=${sbindir}/sendmail"
> >>
> >> --
> >> 2.25.1
> >>
> >>
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#170533): https://lists.openembedded.org/g/openembedded-core/message/170533
> >> Mute This Topic: https://lists.openembedded.org/mt/93628579/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> >> -=-=-=-=-=-=-=-=-=-=-=-
> >>
>

