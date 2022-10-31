Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EDEFA3740
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 09:55:50 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.7469.1667210141570844048
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 02:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BCvawNUk;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id s24so16040149ljs.11
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 02:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q5XlJ5c+OjcU7YGoEqR9ZoAF6vQ9nBSbM0d0hdD8hVw=;
        b=BCvawNUkRFTYMAt7EgBxQQl3LSSpWr8CI0S1/FFNo+Ph+38hIqcn1drNk8Vu6s//q6
         BStLVdyujGsZpmwI1JHoqGdDK8wff9wb8T39e/Z8bt49H4uTjjnN1cLykBegffcMfKIh
         AQfvpw2cSGbZPz7QwLI85vmgCRxVk6P8zvLnGd6a3PfmnHRjIXXST2Wa32eGeHLNG0+c
         bY2qKUIdp4hoeHZCpYRe1KvvHHJ7NgiE5/MdD63/chcYhz7/VBqriNpiIU89/Y7c0Ydq
         zEj18P6MlHpDc4FZ2SmsMBUok7ZoJTfeeGClOS1WNyothGutQvBHNC2bhyBNhuwvLAjM
         tG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5XlJ5c+OjcU7YGoEqR9ZoAF6vQ9nBSbM0d0hdD8hVw=;
        b=QkrREpXnB6JfJ6TdB7Q8qxGp7pHAme4vxqObxoRmlb3k/p/P/qBFqVjsGf8BEUv3Ko
         5toEy4im1Pa5bqPJFNoekQMkofU1oGAXBmMIPDyXHq5LVqV+72AYq8uDHtpO0Dnn1Ybn
         i4cTToer2vJC26yFVQ/LoMRXKolqKL6ezspZ8mObeZ04EIqgCWmI/JbfC7QQ3oeNJ1M7
         TFvxdc/2AsAtSqgk5OrJpQETLO9aox/0yZ0eh7pcxcxDCx6m2aGySBsXFk9CntYAySEk
         yYLbaZ3lAXcn4Lz+u8qErT+Iugf/4TQBWPA8eKGTAZmP6SPQtOZGd8XNumdT6Otw8PAU
         ly3A==
X-Gm-Message-State: ACrzQf1xWejWJNwsDFL+eLJrlAPU/YPbpMhWXu6/Tsd7AgmnWZM9ScXP
	hGVbklPlejMqtjkLvCzXDVjDUevymopi1+DIUuw=
X-Google-Smtp-Source: AMsMyM5uMcciAwxqjjOLSJ9oDRT4tNfOI/9C8zj8otBaymCqj942VwkSlhkhIaAGtBfbN7OnvTyc6ihxnmaLQTufj5g=
X-Received: by 2002:a2e:3202:0:b0:277:351f:714c with SMTP id
 y2-20020a2e3202000000b00277351f714cmr5251643ljy.33.1667210139331; Mon, 31 Oct
 2022 02:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_SNB98B4WgHjY8nGP-N1LCHg10c+SJZGY-1w+AXMa3Yw@mail.gmail.com>
 <32700.1667209194304360334@lists.openembedded.org>
In-Reply-To: <32700.1667209194304360334@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Oct 2022 10:55:28 +0100
Message-ID: <CANNYZj9Pbuzu9D9RodJN2HCo_+csc___EORNQzh89=mNNhb-ZA@mail.gmail.com>
Subject: Re: Public: Re: [meta-oe][oe-core][PATCH V3] bc: Add ptest.
To: Yan Xin Kuan <yanxk.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 09:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172299

This conversation is on the mailing list now.

When writing a response, you need to check the list of recipients in
your message (typically in the 'To:' field), which should include
openembedded-core@lists.openembedded.org and then it will go to the
list.

Alex

On Mon, 31 Oct 2022 at 10:40, Yan Xin Kuan <yanxk.fnst@fujitsu.com> wrote:
>
> Sure.
>
> I did not intend to make it private.
>
> I just do not know how, it takes time for new commers to get used to this mailling list kind of management.
>
> I will find myself some docs to look into.
>
> Maybe this is not working, for I can not see our conversation on the website:
> "Public: Re: [meta-oe][PATCH V3] bc: Add ptest."
>
> I switched it to this:
> Public: Re: [meta-oe][oe-core][PATCH V3] bc: Add ptest.
>
> Not pretty sure weather it works or not.
>
> Nevermind, I would find some guidence in oe docs.
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172298): https://lists.openembedded.org/g/openembedded-core/message/172298
> Mute This Topic: https://lists.openembedded.org/mt/94681666/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

