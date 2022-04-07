Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FE2C41535
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web08.926.1649350374762580209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 09:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IgiYzyLU;
 spf=pass (domain: linaro.org, ip: 209.85.217.44,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f44.google.com with SMTP id z134so4221610vsz.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 09:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sich+Q1bv2S6NTCMNFsEWZ0W/f3raNFUCdN7aSmky38=;
        b=IgiYzyLUNT7r0axw8yjC8ilMmdP/2PSpK8W46d9uhGSjGPYFS2j94nlnoZHby4O+iX
         U5j/hxL4Z4uXUqklvSLuW8G9mzbDSEZrxnDHuIEhk8kV0wru6fFDj5NL11b5Z3/to7aT
         CooihzrS8FER0cOsjcsKIY081L9PoFUL32uAhqTC0gujCOzfl9zITLTdvD9ZRIrNUBj2
         ra3+tLpppY/qroYRFXSMmqzEZ09sLUy1xrb/SNrdmfpVZx19WiVXwd0bv2x7Q1wEfRmE
         mhV019uZ4JV6Y0HogdUbxHYg8S3MtVeakzI/edf1LkHh6cYdR5lOvP/XV+9kFbkr2k2m
         sx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sich+Q1bv2S6NTCMNFsEWZ0W/f3raNFUCdN7aSmky38=;
        b=N5SMHexaXMoGpXabtscqfV0POWN9/mLFXHDkeO9U3cBB+YhZ+oW/OrKbY5FyWKanxX
         2HBfTzqFFGAU7GJ1VPrSs+NYuq/qrv69tnW1FgTBQVrNgge2OW4VssuybU7Jn6scbZl6
         fMoVpCxetSdZhhtz0QMzGDYoRUKuXqoFpMBAQBrkRnbTQYQEoikR5E1Y5A+/Y/U9a6sv
         3LkUozMqZPVSqzv0KYsMIM8U3MwC4CGye9OSAJ/HHP1iKW+ORoPXQ4WZcNyfj2VuhU1A
         3KJ0hrghLnzh0RV241HUGEclvO0+NY+FABfHGWtMv5t4ni1m8X5MCycNhaUI97YVELIH
         DBxg==
X-Gm-Message-State: AOAM532Y6YvKFdhPEnUGlzjKqY10fkSr7laVm9wxqRr2leSObss1Vu1o
	TYRc4SthT6sDOvUUkcxUyTc4bC0svdmnL6CBkU5eFQ==
X-Google-Smtp-Source: 
 ABdhPJwayGpez6PUZjARYNsvq1feNJgCfUAsyNvIhWE3IsqDpfsjJqqh63MjwYe7PVpa2zWdeya+5LQQM6dhQGgGW94=
X-Received: by 2002:a05:6102:6d3:b0:325:cfa3:44b with SMTP id
 m19-20020a05610206d300b00325cfa3044bmr4939537vsg.23.1649350373900; Thu, 07
 Apr 2022 09:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <16E3A40F5847C949.23740@lists.openembedded.org>
In-Reply-To: <16E3A40F5847C949.23740@lists.openembedded.org>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Thu, 7 Apr 2022 12:52:43 -0400
Message-ID: 
 <CANp-EDaZHkXKg8WiOT+Jq+tR4WzQ0DDyeDPHrG2xRnUMy85r_g@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] vim: Upgrade 8.2.4524 -> 8.2.4681
To: ralph.siemsen@linaro.org
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164115

Sorry, please ignore this patch... it is already queued in
stable/dunfell-nut branch.

Regards,
Ralph

