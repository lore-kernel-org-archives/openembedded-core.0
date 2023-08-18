Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF22C73C66
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 15:35:18 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.10.1692372909859687673
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 08:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CITewfFt;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4ff09632194so1397804e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 08:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692372908; x=1692977708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=npozec/qQJo2Ktr5GfIrgyV/9MAoNuNaVldpnw5Ufd8=;
        b=CITewfFtuqdAWFk/8KUSyghgVfL457YvednOk9bcsdiXoWYSz9UyaxetL7dORvnnwt
         mNOWWUxkNoylcj6I0zE7v6Ev8LS46ipZZl3uDiFxHZCWfmbCjbOK5ShUQIeC9xw6rJy+
         UlszeXvnenUezXyYBh5XVV18z/Q12y98AyRj5TS0B+J2s6Kdie/a0s0oMeoscKGY2Da6
         vkAreEddQ/KwBBoIqb9zovsWjJ3sExahxPnK9cE1jEbK8ovRIIdrfBgXO9B/Q5l9Pl6Y
         r/GoDWJGchjtgdOYxZUKIPQqmNIlY/9NwFa+m4TAg9j6aF7MP2RboNlR1us92tmdzGOb
         Vggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692372908; x=1692977708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npozec/qQJo2Ktr5GfIrgyV/9MAoNuNaVldpnw5Ufd8=;
        b=axX+RlushyB+h8K9C33Lg250/3av6jCX3ppLAgHS1Eq8AYZX6NCUyfmN5+ZWuvW3o2
         Qb+YL4J0yE/zfJ4SukrGbGY6/g5ZHTbaWGK/d1P8ZvoCFz7t7rVLayR/XazaNQiaGqz+
         YCKHpn0OtZv3z+RNmhC9c4Q8evxuuBI1TqDctlrYU0T2msYYQeSyxWe7f2Un2WLRtVqP
         WOiDHabZ9ZCHCnyN17xYxGbYf65Xb7Gnv/suMg6zvfACPIWxoNS6orbuDBlbnGjjdhKO
         xcIMQlqNijdTjFuGm+/NPaRFBsYTed90qFqCU+KVoZpZsNq2zWmgsnb44TdZ2Trp2iNz
         0j1Q==
X-Gm-Message-State: AOJu0Yxfv/WP9YFH2KHcHEUjaCfU/hAq21TdLdQv/Nc776kyVQ/iueaX
	vB2aQlUs7iQ3PqHjFMJL+VUPx1J67BXCuUcyvmY=
X-Google-Smtp-Source: AGHT+IHu//q8DQlbDTtuDSREB7dtWirK8T317Laf0zHIZZxlWlbiHd08fHq9qWdCzaKdicRpkXgA43+QheH+c19tjPs=
X-Received: by 2002:a05:6512:3604:b0:4fc:265d:fc62 with SMTP id
 f4-20020a056512360400b004fc265dfc62mr1840842lfs.18.1692372907797; Fri, 18 Aug
 2023 08:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230818134719.3004991-1-ecordonnier@snap.com>
In-Reply-To: <20230818134719.3004991-1-ecordonnier@snap.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Aug 2023 17:34:56 +0200
Message-ID: <CANNYZj_GmjD9XtRJje_OpwA3pSwQKEbdMm+fFvxJTGU5NfW+XA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "vim: do not report upstream version
 check as broken"
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 15:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186377

The comment is indeed obsolete, so the comment can be removed. But not
the actual line, because 9.0 is less than 9.0.1527.

"Upstream version unknown" also means that we for whatever reason set
PV to something later than latest upstream.
The reason in this case being vim's never ending stream of CVE fixes,
and tagging each commit in git.

Please check your changes with 'devtool check-upgrade-status vim' as well.

Alex

On Fri, 18 Aug 2023 at 15:47, Etienne Cordonnier via
lists.openembedded.org <ecordonnier=snap.com@lists.openembedded.org>
wrote:
>
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> vim 8.3 has been out for a long time, so this can be reverted.
>
> Test results:
> $ devtool latest-version vim
> ...
> ...
> INFO: Current version: 9.0.1527
> INFO: Latest version: 9.0
>
> This reverts commit 11d8ee09b1bdec4824203dc0169093b2ae9d101a.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/recipes-support/vim/vim.inc | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
> index 33ae0d8079..e8c5074361 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -22,9 +22,6 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
>  PV .= ".1592"
>  SRCREV = "29b4c513b11deb37f0e0538df53d195f602fa42c"
>
> -# Remove when 8.3 is out
> -UPSTREAM_VERSION_UNKNOWN = "1"
> -
>  # Do not consider .z in x.y.z, as that is updated with every commit
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
>
> --
> 2.36.1.vfs.0.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186368): https://lists.openembedded.org/g/openembedded-core/message/186368
> Mute This Topic: https://lists.openembedded.org/mt/100820547/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

