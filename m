Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F56C433EF
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 15:14:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.10884.1651850053897569264
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 08:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eXRTFZs2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso6998985wme.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 08:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:content-transfer-encoding
         :user-agent:mime-version;
        bh=5+x8dvOh4pfHf2VroEuiv1gMnn0ubBzKrGRcF0hOeeo=;
        b=eXRTFZs2FGdbaOz89sqh/EKKPICoiKoHrz+ejvcR9+26x+ld8wgbgD2TuHMGMLcbnu
         G9FNGAnwbRtt2HUTmj3fMGHbpBXmeNP458IVB9ToVqVaPKM7YkciP5qkpQnftzm/vX1w
         ElSVrMwbEdl5SlyQsbEdFJ/QV4Zp1+dkl1fw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date
         :content-transfer-encoding:user-agent:mime-version;
        bh=5+x8dvOh4pfHf2VroEuiv1gMnn0ubBzKrGRcF0hOeeo=;
        b=nwC5d//BDY5tIZUWPvfuYGiroZELPxMnc7xXo61IRZjk/QBTfgqu5tBByd4RhPq+AT
         JV8ldV5s6A3pBD9adSr+8ehC56QSmrj6cZQaWbDy+84TwEwqt5Vh93XltKyQBSUmBgWs
         0khV1WS4cvBzcK9xUivgt0wB7cgyDWcjb0WYNe0md3L76xf1ZhoLBgoHwweVF0UQKOyr
         FkdtShYXt6gNZBRTTV1SCu5FFJWfpef5ncFR8Gw/bujy8ZWW8171E2ISv+85itCfEwNo
         aatzbFOlFj7eQwfUz9HjLILxBPN8caJDFNICuQ75y+3UPeE5uI/dox2RvKqgBBRo3qvV
         WG0Q==
X-Gm-Message-State: AOAM532pR18ecVN4aftmpYDhJahyIpTpKy8juFISEbIEJd3vvPPh3Fbv
	sdE+kjj4+iFejnUORsH3ldW1UM1GKf/aXhI9
X-Google-Smtp-Source: 
 ABdhPJz59Bp2+iFSWya4Yb3wTEGAygu3aa+9vgb57ycQ2tL5xJpVTM08rH/oDPpmJOHIdla90ChnXQ==
X-Received: by 2002:a7b:cc0d:0:b0:381:220e:a3a0 with SMTP id
 f13-20020a7bcc0d000000b00381220ea3a0mr3787085wmh.59.1651850051747;
        Fri, 06 May 2022 08:14:11 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fb8f:f559:b469:21cd?
 ([2001:8b0:aba:5f3c:fb8f:f559:b469:21cd])
        by smtp.gmail.com with ESMTPSA id
 o9-20020a5d4089000000b0020c5253d8d2sm3894004wrp.30.2022.05.06.08.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 08:14:11 -0700 (PDT)
Message-ID: 
 <0f338ca1e26012b86f183975252e670f11776e99.camel@linuxfoundation.org>
Subject: gcc12 testing results
From: richard.purdie@linuxfoundation.org
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
Date: Fri, 06 May 2022 16:14:10 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 15:14:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165340

I reran the gcc 12 testing. We still have an issue with linux-yocto
5.10 and edgerouter:

https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/3046

and meta-virtualization has a couple of issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/46

Build is still going.

Cheers,

Richard

