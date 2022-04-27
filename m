Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38738C4332F
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 14:35:01 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.9088.1651070094105993359
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 07:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W9yqznWM;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id w1so3498834lfa.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 07:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ivq74QNxS0lIbrcOMyjMzzsjl5eVKqZM13zKT5vSKOs=;
        b=W9yqznWM0eN+U6DMKueBcb2Vayoc1mWDgkmhnseFY7FV5YrlDhM9XjronRI/QVtiJg
         sAhwr790VTx4OR7E62rcjRxvMSvhr9N4vrs9cMPPNbdZ73QAB/8T6Ed76VTP35iBxG0l
         FIN7cX1is695M3+r9vn9N071LY493qFa1uJUkY9veCC2c1j9ZvcNFLH97qj7VB1uQamn
         h/uwYnZkmZrX2RarXU1axyh6VWnM4jqE9w05arQYgb2oWc9mwHN2/ub9RzAAx6DAInSY
         8lB87q1/o7xzTNFLMciD+dfxiMTdwn3+MTqVFripJh3L6++pz9Ch6WYJD4KCBYYe6TYz
         /X/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ivq74QNxS0lIbrcOMyjMzzsjl5eVKqZM13zKT5vSKOs=;
        b=bGTz/wqrXaafysgkgynENX5ITfLQUnNBOuZg/WCyNUJ4y/LGP8MxKJdzFZiPfL26qw
         vbWMUihYJeTsJe/udPN3hCkpJtDvhUJI4+xFMhxVLJzK2WWc1pBvnLbOfcCw765SyXuK
         Wdxp/6hMqR5zjYe/1GUpiyUKBk3h741lckJ7mk1WM8GI1934tyW9ejZxjK56O8xJq6af
         c5mkSa1zYGrDcgrF1M8ZRNHQfYZxK1WDbPNffMEar7GuaHJBeG8BWe1t67bEotEJjMe2
         9d+JEnDiiO1KRzpiuUV4YhFMbk9llxwXLDwZBNTSOmLcVkixcg+yot1zBa8OaSG+SfNV
         wd6Q==
X-Gm-Message-State: AOAM531nyMmkdPh+1Bs9z2nKBrY7OLifgAj1F+marMGtn1LB+hnDdA0z
	ZVuYJWWa5h585hp3AHdwTGm6Uw18yXhQFwBMayg=
X-Google-Smtp-Source: 
 ABdhPJzovO3Zs3xnyilSvVLGBwHWg10q0NU7JkdSufSG9uZik4qWNFtJGjCxNpP6Nk4LxrkTd88yo/ZJhqTyzD9Uu4w=
X-Received: by 2002:a05:6512:5cb:b0:472:f7e:a5f5 with SMTP id
 o11-20020a05651205cb00b004720f7ea5f5mr8457966lfo.358.1651070092074; Wed, 27
 Apr 2022 07:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220427084009.3406717-1-alex@linutronix.de>
 <20220427084009.3406717-13-alex@linutronix.de>
 <bf10143cf121d1a2a8e88080107b482938657078.camel@linuxfoundation.org>
In-Reply-To: 
 <bf10143cf121d1a2a8e88080107b482938657078.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Apr 2022 16:34:40 +0200
Message-ID: 
 <CANNYZj9eUzy9-6wLZ3rLpr+cAno33VosPr6qVEBWHt9D8GGbcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 13/18] valgrind: update 3.18.1 -> 3.19.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 14:35:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164924

On Wed, 27 Apr 2022 at 15:08, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Did that patch result in:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3176
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3176

A previous version of it, yes. I addressed the issues:

+           file://0001-Fix-drd-tests-shared_timed_mutex.cpp.patch \

+    # https://bugs.kde.org/show_bug.cgi?id=445743
+    rm ${D}${PTEST_PATH}/drd/tests/pth_mutex_signal

Alex

