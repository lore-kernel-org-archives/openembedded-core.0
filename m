Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF768C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 13:53:41 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.64021.1672754015766051724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 05:53:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=at+wXZl/;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id bt23so29082213lfb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 05:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AKhTAD6ooZ1sBAAoxO7fVFMsDaBe2Xeu6jos4Ec3jjI=;
        b=at+wXZl/UcOlZ7eaTDn6eLr1PI2o5jWE+SgQlOJuTGor1oXtBaEm4hXRJQJ5qBpwJ0
         g2E9f+fhI4gdeI8QLiwFcNFBrDGkHTFXWRftiKFg4p1LPDwP6GZAbIe1bfg3+rSm3xHf
         nwbMh9iwP3ble4smw98JEHRcbQBxYzKBLGeXgIHfA9M9NL3YoLtLWEhEgowVm1oZp2Ex
         xGtwjk3XyAyky+hCcbBbPsRWX2du37svuqyFqaZojegyFK/tIeXXiyAkup8bDoLV5JU1
         41LGWQ17k+/M37AyHJPEFCDf4cz/lMczbhipC5MiZwDpVPI63v8gFmfz1lUqncBlHY/b
         LrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKhTAD6ooZ1sBAAoxO7fVFMsDaBe2Xeu6jos4Ec3jjI=;
        b=YSEd/z3CjcLQWu7A4CAv9Ds+CTj6oCivfh0aPDv6vKuZZcy76Xv0sSBj0hhPencpDB
         n8HDnZvJt2vsO0jaGLBRFRejdkfCMuBYGsOGTx3YpcIVlcJwWL2JMM9qDI7GpNws2dTd
         cmx6HNi4Fnunw4u6AAKFq2zwY1hxoOzO1fJU0eREqY/thpe/V2Vzi58Vs1yy5fVHs7as
         pS4zOpuGU0/vET336pWyL5RM5sSFIcOYEWtVN+MwJytCTkzRPHox241FV0bHceZo0h8o
         be0mgIi7kakzQFLG97iMKrhUyIVD6zpl8mmEitl2RQzuFkCIIV2SqcYaiwZZwOnys5FL
         sE9A==
X-Gm-Message-State: AFqh2krFkoCM1LyFo7lgC3Tm+MFRSZ6pPSHXo8aU8vF0th970Q6W2npo
	vV2/L2C3SDsReMVual0ktoMa7iLqQmjK5yMe0qU=
X-Google-Smtp-Source: AMrXdXt1ykOknhBY99tvACKdUaiI7B23tIzEYrsFpLXx6eWHmDfRAMqUpsb9GlYcXQ2klYpYQBmH+zGL6tB8346dj70=
X-Received: by 2002:a05:6512:1107:b0:4cb:2508:f535 with SMTP id
 l7-20020a056512110700b004cb2508f535mr1052876lfg.131.1672754013952; Tue, 03
 Jan 2023 05:53:33 -0800 (PST)
MIME-Version: 1.0
References: <52dceb5d7867a60a1da6c6f5879f4d949c9be483.camel@linuxfoundation.org>
 <29497.1672753788020339166@lists.openembedded.org>
In-Reply-To: <29497.1672753788020339166@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 3 Jan 2023 14:53:22 +0100
Message-ID: <CANNYZj-qiwTg+=QouWQ1KfH7jgZxaekfrECkHox-7yZKpgCsjQ@mail.gmail.com>
Subject: Re: [OE-core] [master][langdale][kirkstone][dunfell][PATCH]
 glibc-version.inc: Use https protocol for fetch task
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 13:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175352

On Tue, 3 Jan 2023 at 14:49, Ranjitsinh Rathod
<ranjitsinhrathod1991@gmail.com> wrote:
> Thanks for the input.
> But is it okay to change protocol from git to https. I can change the commit message if it is possible
>
> I hope it will not harm anything if we change the protocol, right?

There needs to be a reason for the change that is applicable outside
of your organization's network. "Our IT department isn't able to fix
the network" is not a reason.

Alex

