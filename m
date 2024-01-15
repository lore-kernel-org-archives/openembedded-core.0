Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78A7C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 06:26:13 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.70865.1705299969707921078
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 22:26:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T8Iow2LR;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50ea9daac4cso8354352e87.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 22:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705299968; x=1705904768; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhdUsuLQYv9L9rwGxAOwkXRd/JPt2rR+ulv+oTWs+TE=;
        b=T8Iow2LRyU429+jS8mC4PHDnYwwJZpi3iCjQro0OoVuZ2zfgLzT02/1uokBVnhmjnb
         DWHbSgTDgfNsPWO0r5uGnvuAn71CGKcEuv86u5/3AaS2zV/xoV4DwadukAWVlj+3CCo6
         6p1Uzhitf/cfq52yppys6lDDd0ujIzDLhaolqMwO94JWikDkvGBfGhhWvtg7ShOnp+Kh
         M2CGLaB2rJvl7V0WXfXqyTOqR+KXEI/8sQWtehVDNLKRfgtoL+mpAKM/qTIsHRYH1kJR
         1x/YTV8h38b9dtU7LpwkcZ443ETc6vsnKC4kXW4U1rNz2X58H/tQAGnjm/D2DScr2QrB
         gmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705299968; x=1705904768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RhdUsuLQYv9L9rwGxAOwkXRd/JPt2rR+ulv+oTWs+TE=;
        b=c+YPMrVY4M0LbCHaEO2wcFglk2RDwQpnZBF2NcsMuU4GlbekXSgCQFTxg7vX2KJfxn
         ksgA15tJx3U/IDxbw0+ib2g6Frau6o8I2tPOGY16Poa9Co51anGNbED2AnMhdL8EoK37
         w9CEMh/YToL4e3F8fMnogF+d1YKIEVgxDsOsgKnvsCkZsFtz4ZroQknZZoRtO5qpQTAH
         oDKyjA7gifM4FqIV9F3FjbjjxlsoGZzFE7zTkS9CidzKgRB3XnSb2dTNwn4cjnE3M0C4
         SwS8lQ/MNb1NWpB5XYg47euKuptxf3mL4FGWcvLEbhm/4aFYlhYazBLSFzTDQBm7zpiY
         4HEw==
X-Gm-Message-State: AOJu0YyND6JxqQQAblYB3HrbVzEyQX4fQjJd159KcqMXmr6393Xyt+cX
	wNNHLvhxsCOwA+Kd4LtHEcUWXt+b/DZmnwJoLA0=
X-Google-Smtp-Source: AGHT+IEGK9nxp9Dzyv4bGX2z7P8B+2pm+QcumRSTXMv5mwH3EepCVzK6sNbkiUS9KWlabbxa4tjA7MMN4bA+ZB38CPg=
X-Received: by 2002:a05:6512:114f:b0:50e:757c:9627 with SMTP id
 m15-20020a056512114f00b0050e757c9627mr2568421lfg.81.1705299967393; Sun, 14
 Jan 2024 22:26:07 -0800 (PST)
MIME-Version: 1.0
References: <2ef89f525fd5ceaec574d025c515033c06fcaf6c.camel@iris-sensing.com>
In-Reply-To: <2ef89f525fd5ceaec574d025c515033c06fcaf6c.camel@iris-sensing.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Jan 2024 07:25:56 +0100
Message-ID: <CANNYZj8MzVgqKNvMWHhT39FABEv6igsB7p0O1xow9i_hPQiW_w@mail.gmail.com>
Subject: Re: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
To: Jasper.Orschulko@iris-sensing.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 06:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193631

On Mon, 15 Jan 2024 at 01:54, Jasper Orschulko via
lists.openembedded.org
<Jasper.Orschulko=3Diris-sensing.com@lists.openembedded.org> wrote:
> If no one objects, I would like to put into motion that we gradually
> move all oe-core recipes SRC_URIs from Github releases to git source
> code (archives) for better source code traceability.
>
>
> Reasoning follows:
>
> ---
>
> Currently, there are (at least=C2=B9) 35 recipes in poky that use Github
> release packages, rather than using the unmodified git source code
> (archives).
>
> In my humble opinion, this is not a good idea, as the GitHub releases
> do not necessarily align with the content of the accompanying git
> repository, obscurifying the actual source code that goes into a yocto
> package.

I don't understand this argument. It's an either-or situation: either
the recipe takes the source code from release tarballs and never
touches the git repository or vice versa. The two are never mixed. So
if you need to trace the source code from the tarball, you trace it
back to what is in the tarball, and stop there. That this source code
also happens to be developed in git somewhere isn't relevant.

> I believe that with the amount of work oe has already put into
> reproducible builds from scratch, it would be a shame if we wouldn't
> expand this effort make (at least) oe-core recipes build reproducible
> from git source.
>
> What are your thoughts on this?

Firmly negative, I'm afraid. Release tarballs are not a github
invention, for example pretty much all of GNU and GNOME software is
released that way, it's just that those projects obscure their
respective git repositories better (on savannah and gitlab
respectively).

As 'old school' as they are, release tarballs are still an entirely
valid way to consume source code from upstream, and in some cases
upstreams prefer their users doing it that way. You need to fix the
osselot tool to respect and support that.

I'm also curious about what osselot outputs that can't be done with a
oe-core class directly? Is something missing in existing create-spdx
classes? Here's for example what osselot provides for busybox, but I
can't really make sense of it:

https://github.com/Open-Source-Compliance/package-analysis/tree/main/analys=
ed-packages/busybox/version-1.36.1

Alex

