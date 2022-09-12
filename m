Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76105ECAAD5
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 15:06:40 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web08.8817.1662995199150049778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 08:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=baOFwPg4;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id
 l7-20020a056830154700b0065563d564dfso6021916otp.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 08:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=YuimLD1F6M8On9yoJkvxFly7gt3Ea2xynbutqY7kCXM=;
        b=baOFwPg422J2Zmn3XNoXpA3E1Uksz9D11Xh3mFt9HqiHn71Om8G7Z2kLvxvFUCOPUa
         omWBNYWjZBzHYvVbWPvcQo1Ux0qIOR0/YNJ6Xvch2Y3y4wvaAB+Y/K9iCMWCtxgc/MKY
         GuoymUA+NQAK9O0sTSSwQloYspdgIhiAVAGPJDblppDjjSEev3wOhQPfLldiIsoU1OFJ
         PKNpGe1SDFR8ScddRDHpF6Z0juLEd7AozRhSR+5uqqXZT9Ko1zsw1FXwMrNm+XS6LcwV
         IqPqYTU35YdfDdpX8a8ubODmCmlgknaPRNBcKmvpC74jaQ6H7EdALNsNamFva3COCM9G
         vQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YuimLD1F6M8On9yoJkvxFly7gt3Ea2xynbutqY7kCXM=;
        b=rT8TNFUCFRnzQRjfEAypT7EA6iFTve2dn2gzCkDYRNwtVNvNlwYSpJY3W/8Ov0hrwJ
         qaDl/FfFr8gIZf5GjbbdWJoo2CUqpAO0c35xgBbDoDWUjEgIS53nXqOw3cn62UDFolDz
         7QY8cA72fBdJzwD00Fag2XXYK4HMeBIbBcArB4YG5RWfqfXjVes+CA0OJhcZEWg/mcdB
         LVaYuKehtZmLZPK8b4fIpH/UWjmyu7aO1zSa6wsym2hlBAx/nZk9Dq1Dfpf7QFw01BgN
         rjWPfyW3jNZfGACjs1InlISjJU7U4Zun8wDbhenwYwLPNfuvXgWTQbtI2fPgajy1+QU9
         QXPg==
X-Gm-Message-State: ACgBeo2WtNdUwLGk9iIHubA3bfJ7dQ9WHEWf6JnXv64vOsqSzGwPlIOB
	VCYw0TsefUHq+lIo6/5HPZRtj5/HJNCVzJk4bog=
X-Google-Smtp-Source: 
 AA6agR5YO5C6noNW997eBIW2mFQZJ3KN2n4f0QyJqZkC045ijiktXL9Gt+6AXZbrJZY/kA5bnNyK0ruPfR2XcPNlaS4=
X-Received: by 2002:a9d:5781:0:b0:655:f401:5a18 with SMTP id
 q1-20020a9d5781000000b00655f4015a18mr1507443oth.111.1662995198172; Mon, 12
 Sep 2022 08:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220912092122.2020942-1-ptsneves@gmail.com>
In-Reply-To: <20220912092122.2020942-1-ptsneves@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Sep 2022 08:06:12 -0700
Message-ID: 
 <CAMKF1srjyVGO1fcUkxzO0qM8zotmqOp_FRYMpD2U14JkmPdvvQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] watchdog: Remove unneeded tirpc dependency
To: Paulo Neves <ptsneves@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 15:06:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170537

On Mon, Sep 12, 2022 at 2:21 AM Paulo Neves <ptsneves@gmail.com> wrote:
>
> watchdog code does not have any dependency on rpc code,
> therefore the dependency and flags to try to use it are
> removed.
>
> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> ---
>  meta/recipes-extended/watchdog/watchdog_5.16.bb | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
> index 26fcc10487..6031dcaa16 100644
> --- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
> +++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
> @@ -28,10 +28,6 @@ UPSTREAM_CHECK_REGEX = "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
>
>  inherit autotools update-rc.d systemd pkgconfig
>
> -DEPENDS += "libtirpc"
> -CFLAGS += "-I${STAGING_INCDIR}/tirpc"
> -LDFLAGS += "-ltirpc"
> -

does musl build works too ?

>  EXTRA_OECONF += " --disable-nfs "
>  CACHED_CONFIGUREVARS += "ac_cv_path_PATH_SENDMAIL=${sbindir}/sendmail"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170533): https://lists.openembedded.org/g/openembedded-core/message/170533
> Mute This Topic: https://lists.openembedded.org/mt/93628579/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

