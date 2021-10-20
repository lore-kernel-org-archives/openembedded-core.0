Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A432C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 07:09:11 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web12.4703.1634713744451155865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 00:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MkuYaZAX;
 spf=pass (domain: gmail.com, ip: 209.85.222.49,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id q13so4820754uaq.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 00:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N+MdpHsWWO0QCyITxlBHA9gQ95NXxcMTMals7q9uMsE=;
        b=MkuYaZAXiyBg/qC0LQRT0vmuD4Lrk48vJMbUi9NV9QRfWJWoYJDYzYbicYoLKMYlw2
         vqKzEsEj+f1F76CmZt++sqPsdaxW+gNdEV+vtaFHAZ8JQ1NGG0DhqxtKSTgu0cJsUtW0
         6mat7qFM22aBPePzknRSJPMwGaiv7PRhaIilrB51qtQgTYTQTkOSvXsLa2oIRhp0hqFn
         FfmUlA+wKIWB7229yaq7RtXpwHc5QVpknSXIgfLbccBsDP9WVCKynDstRuRsz3V9xmIs
         4l9C6O3UqjotSUU9QQOJXzs+8V6Pzm3c249MVfbHgYOeKgEi/9H7ID8x/AuZ57hUiYip
         rhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N+MdpHsWWO0QCyITxlBHA9gQ95NXxcMTMals7q9uMsE=;
        b=3yIhS0YwC/8mL69gEyCmra1m2V2/I15ZzCGoRlI4fekK+5JqLWGctptObeN26tKlL6
         m+us/swTOjBldsjPm43aJbrFX22XSbElMgHXVsmTzJ+4ucnwBZy1tUyJX2+5EE4hmHiz
         DsnfCFHyL9eoKffvwKxGfD2n4PPWD5ljcUUNRUDrO2VxeuxsT1ic03vvprX+vE5v+Zyj
         MUFjsX7jMTKvZkgY5d6kGdEEwVClyUKcjOnbVYkjmMoRMrwLXRhq1pEPN3gd5Cef5JJK
         nnWq5/Ms1BwZk3L5GL0SegsE/q9M/UkDgL5DOaU9uhBF/+Fq3Kz/Ak0pCgf1lShrAF8B
         Cfuw==
X-Gm-Message-State: AOAM533z+XcT9VawjsMnu9mAjzTm5307Matui7sYFnktfHAFRuRoo3tF
	rWIsx7q06bLqyO9mqVCgclFkCqeo2MwbOg1YkaQ=
X-Google-Smtp-Source: 
 ABdhPJxgjnShQe7o6o+jCHLca6M1GkOLPT+5IobyMk+8mgGBHPgdbyfTasQ7Iwc7P6sf1xAfTaNzgFPpxob175okcfQ=
X-Received: by 2002:a67:b10d:: with SMTP id w13mr40490327vsl.31.1634713743511;
 Wed, 20 Oct 2021 00:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <YVTwuSLx+HyyIDkV@piout.net>
 <16A988E1BC842A91.3292@lists.openembedded.org>
In-Reply-To: <16A988E1BC842A91.3292@lists.openembedded.org>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Wed, 20 Oct 2021 12:38:54 +0530
Message-ID: 
 <CALY49845oK2-9FQz0Qo5GM0eZ35FePWhuB_Baa=_tK8TC99a=A@mail.gmail.com>
Subject: Re: [PATCH v3] Re: [OE-core] [PATCH v2 2/3] Rust cross testing file
To: PGowda <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <rwmacleod@gmail.com>,
	alex.kanavin@gmail.com, umesh.kalappa0@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 07:09:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157249

Hi,

Gentle ping on this patch set.

Thanks,
pgowda

