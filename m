Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B15DC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 13:13:53 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.588.1670591631255550715
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 05:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SNgITdI5;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 1so6962526lfz.4
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 05:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WT3yQM31hJGmHYng9OL4bper84ZN/HLVTvkz6In2hew=;
        b=SNgITdI5bNRIQFUM/iJwd2eKpjPhX5GknLoYTcfdQqg0hhIvKhSt5WPKrgqO+suNZ9
         10o3K9RMyHZRj+dUfDFKQWrxfbswnSRMwM1y9pIkNI362CiJ4J6uP58nFyfZYsOnFzK7
         N7nQw51gS+SGIn2OjYEWSdEhjSRwxoYLAmcNNJfH/Q1dDE+n0ilL9YlZ3+2TpMelknE5
         PUdFCfuNhWX6Ac8I+gXkvs6uXzFKpCmC128Or9jhqtp1PINnZAQw/wanJpzgYY2Msqgs
         16lpSHZUfMQIx/GbYwbxkCLcgm7gshengEGFWOclClAmBoagVFWD1F67qXkJ9v5MOAIa
         rfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WT3yQM31hJGmHYng9OL4bper84ZN/HLVTvkz6In2hew=;
        b=BoU+YnwtxKf8ciL8kH0iFOACG4fj5iWh374bcl01LumHL0GQa/9SOCsINVPL91e9aT
         8RHc+Ggu+pSO332JeXSrfJzABfobZ09aNRL3f5iuyoqiQuJHWhh5JgU08xe2ZvHQISCK
         OimZ72f2rvKLubX7ZPE8Ifj9Puoub5KPsDcH3F8imgdegF4HPiaLfSqFCzv9WaVRDgEF
         e7nqi97hLhRUDe9e3PiynQ9fDb63p73Gb8PaXrlLBSgvot9QxO2iv3bp7isD0/V+34Sr
         8SixriQdmS3jO+uI8VzhhRj1H0C3E60BzSm3frtNCJDQohlV4JYX7hAlqIEzMGaqXDvm
         mzgw==
X-Gm-Message-State: ANoB5pkTwX/ybcUS4dLligOO3ZpiWDGgaftUlo6V/un+Etcc0EPK5JB+
	aOIY3Gu/OJIvCygufcvgu7++sYkaci1WTUg4F8o=
X-Google-Smtp-Source: AA0mqf7Culg+P6S5eSHoacY/xwywtqtC4MeKBIynsbFY84PbHKDAJRWT6giAaMv+OYefNB6mzphSiPJbkVvICvg4UXo=
X-Received: by 2002:ac2:5391:0:b0:4b5:4502:1323 with SMTP id
 g17-20020ac25391000000b004b545021323mr9987899lfh.345.1670591629452; Fri, 09
 Dec 2022 05:13:49 -0800 (PST)
MIME-Version: 1.0
References: <20221208071136.1967696-1-olani@axis.com> <20221208071136.1967696-4-olani@axis.com>
 <08c1f279-d446-bc7c-f01d-4ebfb1da51d8@gmail.com> <jwq5yekdg24.fsf@axis.com> <Y5Mzg1VAbMREQ55k@mail.local>
In-Reply-To: <Y5Mzg1VAbMREQ55k@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 Dec 2022 14:13:38 +0100
Message-ID: <CANNYZj8ND2kNUriNf7UrkJ38N5iGGLE2Nv9zOWszYoD-3wxk-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RFC 3/3] time64.conf: Include to enable 64 bit
 time flags
To: alexandre.belloni@bootlin.com
Cc: Ola x Nilsson <ola.x.nilsson@axis.com>, Khem Raj <raj.khem@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 13:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174451

I'd rather not maintain a list of those that *are* affected, even if
we then include those that aren't. It's only build flags, and they
should be ignored when the platform has already done the right things
from the start.

Alex

On Fri, 9 Dec 2022 at 14:09, Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
>
> On 09/12/2022 10:55:16+0100, Ola x Nilsson wrote:
> >
> > On Fri, Dec 09 2022, Khem Raj wrote:
> >
> > > Thanks for the patches
> > >
> > > On 12/7/22 23:11, Ola x Nilsson wrote:
> > >> Signed-off-by: Ola x Nilsson <olani@axis.com>
> > >> ---
> > >>   meta/conf/distro/time64.conf | 23 +++++++++++++++++++++++
> > >>   1 file changed, 23 insertions(+)
> > >>   create mode 100644 meta/conf/distro/time64.conf
> > >>
> > >> diff --git a/meta/conf/distro/time64.conf b/meta/conf/distro/time64.conf
> > >> new file mode 100644
> > >> index 0000000000..99eb06dc0f
> > >> --- /dev/null
> > >> +++ b/meta/conf/distro/time64.conf
> > >> @@ -0,0 +1,23 @@
> > >> +GLIBC_64BIT_TIME_FLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
> > >> +
> > >> +# TODO: Only for 32-bit architectures?
> > >> +TARGET_CC_ARCH:append:arm = " ${GLIBC_64BIT_TIME_FLAGS}"
> > >> +TARGET_CC_ARCH:append:armeb = " ${GLIBC_64BIT_TIME_FLAGS}"
> > >> +TARGET_CC_ARCH:append:mips32el = " ${GLIBC_64BIT_TIME_FLAGS}"
> > >
> > > We should enable it across all 32bit systems
> > > something like
> > >
> > > TARGET_CC_ARCH += "${@'-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64' if
> > > d.getVar('SITEINFO_BITS') == '32' else ''}"
> > >
> > > would do it.
> >
> > I was looking for a way to identify 32-bit platforms but did not find
> > SITEINFO_BITS.  I'll look into using that instead.
> >
>
> I don't think it is correct to assume all the 32bit platforms are
> affected. riscv32 is not affected for example nor would be any newer
> 32bit architecture.
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174450): https://lists.openembedded.org/g/openembedded-core/message/174450
> Mute This Topic: https://lists.openembedded.org/mt/95533494/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

