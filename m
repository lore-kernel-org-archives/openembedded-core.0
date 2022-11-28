Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9391C43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 15:21:50 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.120708.1669648909911734945
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 07:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k7lc3z//;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id p8so17873375lfu.11
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 07:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=48+7O5MZ/h4LRLUENHO/xYpxbZZmWM3DGXR+zbbNZcQ=;
        b=k7lc3z//roEqHK8k7xpakZ4l3CbKba5DUtjideEwgq3GaBRWXcBE/Sizy3WQSl+qtt
         pOzAaXex7yzBAOl9m6/EsK8M2FIqAm1A/9dJ9Y7S9uObia39xnxNhQpRdnxClgTw9Cnc
         JjS1CUmLa8FLRWcWBCok6d2Ck2JZE04OsO6f+9DXlc+kf5MbUwWz+99FNHLmCmAh/pbh
         09SUJLvvocxAq72pRimAsLqZ/0DcRhrkGTYuvFXCsaxwKVjX2pd3DZRvtgVnrS0tsbTh
         UZrEmSy2rcvZCFDfp14a4eauPnBBKu/B29/nmNgQPQUkDvKJZQutw0PuLOkZc9zsxX83
         75gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48+7O5MZ/h4LRLUENHO/xYpxbZZmWM3DGXR+zbbNZcQ=;
        b=fMnGT31HLUQwfg2zMmwVgNxLXgqtjImVEVo2zccdy/bLp/0iOacz8xUlW7lbRF6yqE
         FkzvoSpo9v/LGFfX6Dqx4PKLEcwmSyYjkXr9FB7w0SykpYYBmBoqwplnuVxdPP+QwgbX
         CXo8tboG5Bdqkj13GrgvccT6HB8QB9H8tlUsWp8hJZmouTQ+Ng23cfcotSrRsvaaTQub
         0HpiRsb3eNb4PvAwbZLjef376ZwHLcg+0/WR7RLtUclUxrNlFDGppskNrfKglzKiyY+g
         uZq7kCF1/YMucGj2LHQbZak8fz3GEu3NY8osWpIoaHMQVmvLEyWk4EZ7c7Ubkbge7//L
         Y4Lw==
X-Gm-Message-State: ANoB5pl0uhu+vPBUtv7Silxi7QKkSQYFAF+JQxoEzQYirwQPknoL4skb
	ELp+Enp3wVAFxs1A7JLNTttArAJx6L7CunOHRfY=
X-Google-Smtp-Source: AA0mqf5ngkTBAm+YJZiq5dbqUM3RQoV2zbzS5IQuuu8wZfYeAGzCwUg+km4oE9C1rR5wsJXlVa1UW6RA2pGNgKvXxnk=
X-Received: by 2002:a05:6512:25ab:b0:4b4:d443:6550 with SMTP id
 bf43-20020a05651225ab00b004b4d4436550mr13252458lfb.393.1669648907713; Mon, 28
 Nov 2022 07:21:47 -0800 (PST)
MIME-Version: 1.0
References: <20221128151122.317262-1-f_l_k@t-online.de>
In-Reply-To: <20221128151122.317262-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Nov 2022 16:21:35 +0100
Message-ID: <CANNYZj-u-9qbexJvrhnjA=tnd08vnathK8zJdSwUcpykys9XvQ@mail.gmail.com>
Subject: Re: [oe-core][PATCHv3] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 15:21:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173923

On Mon, 28 Nov 2022 at 16:11, Markus Volk <f_l_k@t-online.de> wrote:
> +Upstream-Status: Pending

Please submit upstream first and include the link to the submission.
I'm highly allergic to 'Pending' without a reason.

Alex

