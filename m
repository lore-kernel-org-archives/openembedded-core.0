Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4EAC433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 07:32:25 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web08.8075.1651735927629767743
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 00:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RkfX1Ujk;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id v4so4483728ljd.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 00:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fqVraJTGK9o9Tpx02Lhi53t59wNCYBUNcM3lBYeRWgw=;
        b=RkfX1UjkzYccQ/OCtQQBD1hexoTwS31KwoyTV0dcYgpnp7BEa7fospffhFra8av/6q
         nsLMLPVl4YBrQ7PXX0llYUjunEAx2dBaq0fsqimUsMuh3SMKbFQ29eWPQe0dmrRqC3gr
         GvL73lL6/yzVlvuQ3PLFKPrCoGecfoWb2xs0pciU4lupbvROoC9UW6War7txU0r5Q1RL
         uMRaQwB5H19U1JvtqYQXJRbuMAX+8JQX4+cNlOn2Ms6PzDBI9Zxh7iD3QNoqI/2nr2vE
         4ofsdAmOv59Fuk5Vfh0XxVZh+ccqZoYA0p3KgRg6AkLNlnAi5lmiR18eBfndaj+wcfRZ
         +Uxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fqVraJTGK9o9Tpx02Lhi53t59wNCYBUNcM3lBYeRWgw=;
        b=ddVmrfxKhYj1ifjFmlFuNfEuAxebu6EHeeymndn4zrbM7nI5eaa9pauj0HNGPnfKmG
         EPpCr39cb/jOcVADOCRahCQN8JUJN5FCWr5udTdcxX9NAPgkMfF62gZfXAs/wQhb0oqL
         2l9QQ4F40UFwGPlFQzIJ8fSjbhyNNXDkH3S336FzLgaqQiwKu7zFTNQfVoaNLIEhJTMQ
         WgJE41ZDNwRbkgeU6TEuxHB691WuyOrV3khLYWYKsq2NOqsiO8c2jQGzUvbED+APyMRu
         ARUecWOIPKt4RLJjRYY+nhClPw9vO+6XTErhmrGPovLfYNGzHtMbUZgCGsu6Zd57xZbJ
         WYHQ==
X-Gm-Message-State: AOAM5315pAycOlMJBoVdc6Y4adCeSpcikw7D8OrSWnQCpAoJI1fdWDBw
	ItNSFFZ2ZBmbO83YVznGlVDCYv1ug+SEZGZxXxk=
X-Google-Smtp-Source: 
 ABdhPJxqUfJ+GD14d819Hz4175LzqypFo/57GMasd2jeOg0TND2Z5s+lxYnB3irz5ddwgDQJq8TlCNbEar8aAdh6zZw=
X-Received: by 2002:a2e:9e8d:0:b0:24b:5af4:3feb with SMTP id
 f13-20020a2e9e8d000000b0024b5af43febmr15289028ljk.257.1651735925600; Thu, 05
 May 2022 00:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220505072720.410277-1-jiaqing.zhao@linux.intel.com>
In-Reply-To: <20220505072720.410277-1-jiaqing.zhao@linux.intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 May 2022 09:31:53 +0200
Message-ID: 
 <CANNYZj8xM8py+zr-8VgFr4dRK7xYPiOdqwTB8TCrgPj21Hxuug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxml2: Upgrade 2.9.13 -> 2.9.14
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 07:32:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165292

On Thu, 5 May 2022 at 09:27, Jiaqing Zhao <jiaqing.zhao@linux.intel.com> wrote:
>             "
> -# will be in v2.9.14
> -#
> -SRC_URI += "file://CVE-2022-23308-fix-regression.patch"

The patch file should be removed as well.

Alex

