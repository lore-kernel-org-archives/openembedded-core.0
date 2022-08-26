Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12317ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 09:08:35 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web09.35021.1661504909182394493
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 02:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j1rAApDd;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id x24so972919lji.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 02:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=kGEsJCT2jiI7VU8yH4S+YIm1wzJE+NL1P1h8L8pzZbU=;
        b=j1rAApDdBMTruwNtRwEIOOPBJ5ryGs/RrPe9/PcpOt19SdS5TJ476EzZbO7i3Ut8Z+
         mYXXZp0rcc8xJivlzs+Y2mpyKwo6cMvxdH0GLxkdoW8L5qk31f3U2Q3ibwyPlSDsvhBk
         Fkzv0BI/iMOAuZjf4xwVrWwl7JS7esTENwKQB/Zk4WLZyLOuy/qfjp7uHq7sa4XaDKeb
         SZhUT2voyY6bUpaGJz8z1HuRYpwMsz440OjjTFaWtAqPMdejgPc401IqRANGZUDxt/ZB
         N9ADbJdoMFwg/0mw2mC/zDOT4pZn7RO5uUzCYcCNHqLwEIEIVWSc7RyEwNI2DjMV4XTS
         IUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=kGEsJCT2jiI7VU8yH4S+YIm1wzJE+NL1P1h8L8pzZbU=;
        b=n9/g0Rqw72ucrjYuuczZ9vc5HRCc77j9cHj+v8TPD+65qtzFTV7+mefvHasejtefTw
         3DuTtBaqxp4LWTTYO1wLqZpmw7N3M4guKqw3Dmf+pSkoZZU1nB8BhW8UBnCwtg0uEulM
         SAa7qvH704TgGb8bprbqil7dKbTX4bbT193+bBnSLQ6oXWx87m4DduE3LzrhNbOQL47n
         JfVNiWe/k8CGWvwLndnMrHkam0Nca9P6rlp7f+MO0/p1qIRiGrHtb/qb6nHhe02m9wYO
         5i6fXg2ZYg9I0bwkePMNV7eRHMgcnUSouxGud2SDR9nOwjIMWQeFtBvgUqsG+H1QElEd
         Ku+Q==
X-Gm-Message-State: ACgBeo2BV2X0EAcOpF3mQ1LblOJz9dJpE3jqomE98Ro0TAbLUB0SYSnN
	6Ksk2aHM6nENAjZqHVDESucsiUO0bSZqSjKW7P0=
X-Google-Smtp-Source: 
 AA6agR615kng/Vr18s9QxRnnnqvQVrNU303RF/xmfL4FS71rbOvZJzRLPxqs50Z0JEpFEc7s4b8IxQnokE4T+xyahAI=
X-Received: by 2002:a2e:7e0b:0:b0:261:bef1:a32e with SMTP id
 z11-20020a2e7e0b000000b00261bef1a32emr2130970ljc.41.1661504906923; Fri, 26
 Aug 2022 02:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220824124234.3549247-1-alex@linutronix.de>
 <20220825153712.55f446b1@booty>
 <CANNYZj_HRzuszmzkT0vU8rQ7sxvp8m_kLQUfQqPbCMWT_tdFxA@mail.gmail.com>
 <20220826110419.6039ccd4@booty>
In-Reply-To: <20220826110419.6039ccd4@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Aug 2022 11:08:15 +0200
Message-ID: 
 <CANNYZj8yH_ZOVoH7=HRzzdnmcOfcA_RjwhYNSsMbH-+h6COihQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] meta/conf: move default configuration
 templates into meta/conf/templates/default
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 09:08:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169905

On Fri, 26 Aug 2022 at 11:04, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> > I've sent a separate patch for meta-yocto to poky@ list, does that help?
>
> Oops, I can't find any such patch in the poky@ list.

This:
https://lists.yoctoproject.org/g/poky/message/12870

Alex

