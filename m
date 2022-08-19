Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D66C25B0E
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 08:16:29 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web08.780.1660896973056535488
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 01:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OthPf9Yg;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id e15so5235955lfs.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 01:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=XF6jWaWH/l2NdT/3ZhljGwS5UyclBtQcG1PEjCOmWnQ=;
        b=OthPf9YgJ6iH6wKQ3Tb6zu1lOk+L6XztPOZlQFJ1L0ij/S8NxnDeIaJ6jCHOrFOjNd
         pGUnKow5JnuzitcQnfiWWuVgl7At3VsXZPHoZXa2RKfMy+ECgNKwdRlbUoyA9mBgOlk6
         +kdKuqb4waSeEPq4z4kiEoR5XLctxbd9WpVVvpqiRm83c6cV2uARBzIpeCHrj90hqPp5
         65ABiu0ibxBIPcCqT9tMMrX/PH7asF9DDNeYRp63weTDlR/OPAy3vu5PBi4Gxlg1u1MO
         bwuEGZCwoIDBl/s3guCpm+D4LWqEWiwolMSGcexMC3hRMAcjEfyZR8yQHeEvfhMZYfqH
         BXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=XF6jWaWH/l2NdT/3ZhljGwS5UyclBtQcG1PEjCOmWnQ=;
        b=u0Fb0u05EjW2dQn42m5LaMX1aK6V8eaqXxG1QPbfFWD+qU1QPYKmVO5r/WW0ly5rH+
         ybwsG7gTcTzGZBg3zaaY/GFGQyjxRYUzbugqCdnH1iXaBhHJnTbfQ0Uu+UCKb3kEVFBn
         3kMPGO5uDjygvDZ7yKPrZQXZmpebxTpepws0u/NuClhwOT+8CS0h6f/+VuApW5TXoGWS
         e8NnDxCGDpM+1kn6p7fkCDtA+VMVyyUtPRp2OtbU/CSQ3reRueh0xZD588IQCQSos0QG
         F1r5zt1L9RZ0ugV0NebBxYk1sT+hPeKXPrUL3Gd9C18FTxbZA6i24fqus4Rb1DWr8vT/
         xp7g==
X-Gm-Message-State: ACgBeo0bDOYMcArUIa7TbIsG8J+KzF0Hq/Tnq99qX4K036+i1rzL4Txn
	3oCwM0ZGX9LDk9alCU0uX64zdt2PsWuWl65j1oo=
X-Google-Smtp-Source: 
 AA6agR7J199jhKWMvmGnjhDOPaWceOxMNUes0STYCgbYL+pXzQxzRYEuexl888e1eH/j4lBRdk8J6/PsdvlDpB/6cY8=
X-Received: by 2002:a05:6512:b98:b0:492:beef:a6a5 with SMTP id
 b24-20020a0565120b9800b00492beefa6a5mr1924786lfv.358.1660896971175; Fri, 19
 Aug 2022 01:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220819072727.2236928-1-alex@linutronix.de>
 <20220819072727.2236928-28-alex@linutronix.de>
 <ab7d4e38-db17-edd6-3914-7a53f313d691@windriver.com>
In-Reply-To: <ab7d4e38-db17-edd6-3914-7a53f313d691@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Aug 2022 10:15:59 +0200
Message-ID: 
 <CANNYZj9P7GYxY0LJkqmvEwjt5_0YJRiE7dguFg0zBcLEyDm0fg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 28/42] python3-hypothesis: upgrade 6.54.1 ->
 6.54.3
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 08:16:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169615

Hello Qi,

no problem, this can be dropped. I'm working on a python 3.11 upgrade now:
https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/python-3.11

The only issue found by AB is a couple failing tests:
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3909/steps/12/logs/stdio

Alex

On Fri, 19 Aug 2022 at 10:09, ChenQi <Qi.Chen@windriver.com> wrote:
>
> Hi Alex,
>
> I sent a patch to revert this recipe's version to 6.46, because it was broken since it was upgraded to 6.48.
> In short, it's trying to use some python3.11 feature and falls back to a module which itself is a backport from python3.11.
> More details are in the commit message: [OE-core][PATCH] python3-hypothesis: revert back to 6.46.11
>
> Regards,
> Qi
>
> On 8/19/22 15:27, Alexander Kanavin wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...ython3-hypothesis_6.54.1.bb => python3-hypothesis_6.54.3.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-hypothesis_6.54.1.bb => python3-hypothesis_6.54.3.bb} (91%)
>
> diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.54.3.bb
> similarity index 91%
> rename from meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb
> rename to meta/recipes-devtools/python/python3-hypothesis_6.54.3.bb
> index afcd5e64ef..7874fed296 100644
> --- a/meta/recipes-devtools/python/python3-hypothesis_6.54.1.bb
> +++ b/meta/recipes-devtools/python/python3-hypothesis_6.54.3.bb
> @@ -13,7 +13,7 @@ SRC_URI += " \
>      file://test_rle.py \
>      "
>
> -SRC_URI[sha256sum] = "de63c34309181875e71d0f5d1c1051c9320a1fe0517ea6733af8cedf818191f4"
> +SRC_URI[sha256sum] = "03749f5e2cb982e54e2a11abcb367b9a260ef8e279387d437145354c080a6bdc"
>
>  RDEPENDS:${PN} += " \
>      python3-attrs \
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169598): https://lists.openembedded.org/g/openembedded-core/message/169598
> Mute This Topic: https://lists.openembedded.org/mt/93120253/3618072
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

