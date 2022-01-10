Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0900C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 15:34:02 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.32949.1641828841878845480
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 07:34:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=DdVszUcO;
 spf=pass (domain: burtonini.com, ip: 209.85.221.54,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f54.google.com with SMTP id k18so27444775wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 07:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9nCibfjkzJ3NIDxJLugVk1PQplGFfCC+T8a2wIl0YxE=;
        b=DdVszUcO169N/kqGl4VDTWzNVL7lLdXuPR5jQaID6NDKC6amgEka6YA3X9MwyW/j7L
         9YxO5Dc1+ZX83k3SmPdK7GbXjMpTnFlhqcIBqXFRDLUTk3nUMVcNv/E9idlXZfo+oTM9
         5K5Icb3pi1iN/dKKqYzRYjX4XNppPmYkPUjQ4+WQf2g4nRzoVUi6mlV2GzxV0z9YfFvY
         24zlwzSsA5Y67xuNDVm8XuRAoHVk5/BosBxjp9Nc7nWyjw9+k9sIeNj/dNU1ffBSaMSa
         iFgeitD4OjwxKB3c8kd3qV1ey/9dAzn8yn687G8BXDdnQaE/0PSDKwqkQ+a/xalVfw8H
         ltIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9nCibfjkzJ3NIDxJLugVk1PQplGFfCC+T8a2wIl0YxE=;
        b=v+T7QssLTzwJVMNY3lXdKQxcR7yWs0rLDqb7dDml51fyAvOelCXVn5L5qMOpYCNoJF
         RfalSCUBIxhZOX0HiS29zrGo6WIgN/BZ5mbeTznaxndLuh2gq80C5Rm6XPmQM/tqDw3y
         6Rv9N23z/EMNCVak4/EalDn0HxGAbNKH0F3qYQ9UkYOec6Y++1PoSS+lajJGnz60IysZ
         ZVPXYZ+jWaIMQZ7a4mhwudLwaxwL85zjxVDH170dI7GtPtnH+dz8bUf8IhLAlbDdl6Fw
         F7GPkwJ4WVD283uvgANDgiYrOyvJv9RpK5Hss7GGUFpNZXxu4r/EEM78ku4vmvUO6HnF
         r0FA==
X-Gm-Message-State: AOAM531XbQVHmhx7ogc5boU/Bkyt4cRGFg5aChov8a6TjtU44GebC7+e
	zOqbNIrtNx7I11dg3zJ9pFhDeXIdkFatKIvXvDcsIw==
X-Google-Smtp-Source: 
 ABdhPJyCu58+GNe2GdkfCjxNLVTUN0+kbvFT8Da9vEandJFC4nGQMP5mjsX7Eomzqpv/3PrjKrmZmNWyIAHInpbExWc=
X-Received: by 2002:adf:e186:: with SMTP id az6mr136612wrb.405.1641828840304;
 Mon, 10 Jan 2022 07:34:00 -0800 (PST)
MIME-Version: 1.0
References: <20211229013456.474188-1-anuj.mittal@intel.com>
 <31e42a0753fbb1355ddad0f87fef1effff493de2.camel@linuxfoundation.org>
In-Reply-To: 
 <31e42a0753fbb1355ddad0f87fef1effff493de2.camel@linuxfoundation.org>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 10 Jan 2022 15:33:49 +0000
Message-ID: 
 <CAAnfSTvFh7aWSfVu8dE5EC8sHApDGkjstXi_dFthjeBU27AVgA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] xserver-xorg: update CVE_PRODUCT
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
 openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 15:34:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160369

I sent a patch to whitelist two, and the other will be dealt with via
a CPE update.

Ross

On Mon, 10 Jan 2022 at 11:59, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-12-29 at 09:34 +0800, Anuj Mittal wrote:
> > Some of the CVEs have x_server as the product name.
> >
> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > ---
> >  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > index 7d1f17e7777..4e88cf26f72 100644
> > --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> > @@ -19,7 +19,7 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.xz"
> >
> >  UPSTREAM_CHECK_REGEX = "xorg-server-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
> >
> > -CVE_PRODUCT = "xorg-server"
> > +CVE_PRODUCT = "xorg-server x_server"
> >
> >  S = "${WORKDIR}/${XORG_PN}-${PV}"
> >
>
> This does add a number of CVEs for master. Do you have updates for those? They
> mostly look like things we probably would add to the ignore list at a quick
> glance?
>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160344): https://lists.openembedded.org/g/openembedded-core/message/160344
> Mute This Topic: https://lists.openembedded.org/mt/88007560/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

