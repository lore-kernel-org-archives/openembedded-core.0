Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADADC433FE
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 09:37:32 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web08.4471.1667641043907249557
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 02:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IkEQH4xd;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id b3so10461633lfv.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 02:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W0o7ECtFEsOTiTykifeRkWM6tapDpHhFVDZ9+R1mVbQ=;
        b=IkEQH4xdaLsH17yuhm8khVD/VX9E/FGzJd90Y8MoK0S5oAO4kLeTjXToS24Ykx3Ejo
         aljhfy5abvGSLy122Y6GqoMUTS8t/nHumt0o6N5V6rIpk3xHSj5CehZ8epLipZCTPmZA
         nwzTUDr/krvWyHOcT3TLV+WCAPECC4fDuNdK2Sg/fgnWc5B31qrIwjg5+KuqmeL6nGFi
         OYss0664k1W5DLmcds9p8WKA5oTEzP49HID04og0/Xf1sRqntp6NT3HYyVB3TbNrlRSL
         QRCFqayGrIxxM+mDRfbacrsNMe626KCKqRirGc5cl+dCxMt2x3WyqKVeMTqbGCEXM+gp
         NqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0o7ECtFEsOTiTykifeRkWM6tapDpHhFVDZ9+R1mVbQ=;
        b=E5/AAOwYnqlaKZGLPWcWfZ4AjrnMn32fSqI/IThYJw1ELFqRpXACK4lsXfZGLn3I2h
         YhDkopJkCtP2aCgGX4AZbvyPeqD1TryXm0Ic2VHqo09kBBWIEkXVO1cMEKRmoKH8MWnu
         fS3jLQ2Q6blA7s3s4oj5bZNS/JFeypMt5kbCLEULX26Yc3Dnktecs/qYuLfM7ZJsTExU
         URzcAW+7Dc3dd5Em2aovBM4ubSn4vEQoCQ/qNJWq3ikN5MVP5Xttobi7NTc+lbvdiL5p
         JqSKaPToaf568obuVSnrXm7WLHYg94Dpl22jlOBlJHD3LRr+KDIQNnw4t8SUrcqk7viT
         aqhg==
X-Gm-Message-State: ACrzQf0dcDqCA7UKL/8y5fU8rxcIQ+CXpY4U5Xiy2nkUejILX5/5xyox
	XuVQsdRqilv8VPo3nDtR51lb3pldjfK77cuvJ+E=
X-Google-Smtp-Source: AMsMyM7w7MyH3cHMQDjjyBX2eboRo3OS/Rdnpx5033Q6ZrKj/yDVjhNo3gxQ6ZfthLnNBjgtTf98pgjtgjcWEQybuYc=
X-Received: by 2002:a05:6512:4016:b0:4a4:6edb:8d6e with SMTP id
 br22-20020a056512401600b004a46edb8d6emr15987202lfb.393.1667641041731; Sat, 05
 Nov 2022 02:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <18559.1667640210159651223@lists.openembedded.org> <Groupsio.1.18559.1667640210159651223@lists.openembedded.org>
In-Reply-To: <Groupsio.1.18559.1667640210159651223@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 5 Nov 2022 10:37:10 +0100
Message-ID: <CANNYZj8fstPWL5GafQpG9np-yDJECsYhGx8Y8tTevo4uQtiehA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] add python3-brotli_1.0.9 in meta/recipes-devtools/python
To: cp0613 <cp0613@linux.alibaba.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 09:37:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172742

Then you need to adjust the recipe to build both. Or place a second
recipe next to the current one.

Alex

On Sat, 5 Nov 2022 at 10:30, cp0613 <cp0613@linux.alibaba.com> wrote:
>
> [Edited Message Follows]
>
> Yes. But I need to build a python version for python development. This is C/C++.
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172741): https://lists.openembedded.org/g/openembedded-core/message/172741
> Mute This Topic: https://lists.openembedded.org/mt/94823104/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

