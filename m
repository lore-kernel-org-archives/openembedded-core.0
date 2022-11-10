Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D1DC433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 16:06:32 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.9368.1668096382182809430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 08:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=EqqDZ9Cz;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.49, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f49.google.com with SMTP id a13so3850833edj.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 08:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qhlzAVah6/Qe3r9rOnJh/YSER6PYy6yFfZkF/tPfSLg=;
        b=EqqDZ9Cz+xmrF6TKDEuFaXiVslmjCh6Jx9iLh2bjGes7eLkDcY9UJhe+ie6dq4ZMH0
         chuBgVCG0psOsdoV3HahN1EuRWVM+Kd9MvSSpZxOexykzFhJrhxhCQX0rQTk+8bU4G8z
         +YZ9b2XAfS1PlC+yPKBPkWNujXfe+pvNyW6Cr/yKAh0dRa9AJIooIgwfFhGyD6cmsLWX
         KcXphx44LMqGWN23c7sZLmWCmSmLUb0uUO2tVpboWupvinzBx/Pm1h2fQGto/B8gOj/p
         2UnuOsnKRITIzD86YDGvyf9M8IgW+xd82BuckL5aRpzA8KkiTymXHH0cIVc6pfWvPQSd
         r1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhlzAVah6/Qe3r9rOnJh/YSER6PYy6yFfZkF/tPfSLg=;
        b=x4XKiQ+SX1+1gvTLeR66xQZV1M2G3mIy8ljqQNFgf7fk3Iq1+89zMW85p6ZonLnotU
         8yasG1+rBl16zvrReG3xgIfZ2wYKldcHs6+sxFWOxV2D/em9fQabBUWNKczqRPVp2jie
         jQBkjoEWRQEsiMbnUlAfNVFBr+tadTmzGkrNvzZc0d4Qd3gHN/uTwQNK3Z1yUy6KPK9w
         f4E9o8VY3UIxmfx8Vi9Rq5eWGjwUJov/6892dm9ubXKxfNAaw1dca7WOtGQQkk37hh7S
         EI4liZ+obPvhLKCNGru8Knde/MOnQpGcc/UG081jEEgFf9n7jj0j6wEb5cnZwObmvl9j
         U2bQ==
X-Gm-Message-State: ACrzQf1eTiAJdJiuvh4Omk78otj9umgy4Ppkr6ijuu1ccm1GexlE03Wi
	F2dDZshQ439mnRqsfJWDNmNEq6bLpzBrgoZTejMYUw==
X-Google-Smtp-Source: AMsMyM4DSZkN06zPeW9kENzZ3zLG4VwXyhMyR5kVTZPeH+f8VmMomEIxE2Zzb2q41HtzUSqucxYJyP5i8F9pyvaD26w=
X-Received: by 2002:aa7:c441:0:b0:457:1323:1b7e with SMTP id
 n1-20020aa7c441000000b0045713231b7emr2512253edr.311.1668096380467; Thu, 10
 Nov 2022 08:06:20 -0800 (PST)
MIME-Version: 1.0
References: <1668000283-8148-1-git-send-email-pdoshi@mvista.com>
In-Reply-To: <1668000283-8148-1-git-send-email-pdoshi@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 10 Nov 2022 06:06:09 -1000
Message-ID: <CAOSpxdYDj=ovL81kOaMNrtNO9fXEx3bjzKFK2=g+4783SCzMsw@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] tzdata: update to 2022f
To: pdoshi@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 16:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173080

This patch will need to be submitted for master branch first, and I
will then cherry-pick it to the other branches.

Steve

On Wed, Nov 9, 2022 at 3:25 AM <pdoshi@mvista.com> wrote:
>
> From: Priyal Doshi <pdoshi@mvista.com>
>
> Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
> ---
>  meta/recipes-extended/timezone/timezone.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
> index d3c78e9..c4cdb77 100644
> --- a/meta/recipes-extended/timezone/timezone.inc
> +++ b/meta/recipes-extended/timezone/timezone.inc
> @@ -6,7 +6,7 @@ SECTION = "base"
>  LICENSE = "PD & BSD-3-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
>
> -PV = "2022d"
> +PV = "2022f"
>
>  SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
>             http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
> @@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
>
>  UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
>
> -SRC_URI[tzcode.sha256sum] = "d644ba0f938899374ea8cb554e35fb4afa0f7bd7b716c61777cd00500b8759e0"
> -SRC_URI[tzdata.sha256sum] = "6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90da1abcd82c9abcf2dc4f321de0"
> +SRC_URI[tzcode.sha256sum] = "e4543e90f84f91fa82809ea98930052fdbc13880c8a623ee3a4eaa42f8a64c15"
> +SRC_URI[tzdata.sha256sum] = "9990d71f675d212567b931fe8aae1cab7027f89fefb8a79d808a6933a67af000"
>
> --
> 2.7.4
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173018): https://lists.openembedded.org/g/openembedded-core/message/173018
> Mute This Topic: https://lists.openembedded.org/mt/94912286/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

