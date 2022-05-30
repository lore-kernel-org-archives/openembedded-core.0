Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0D5C433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 10:31:09 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web09.35332.1653906660335295946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 03:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oCyH3KwG;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id k20so2554264ljc.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 03:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=po9GIc//4BXNUkVxk1xNmQmL0pTjTQsP8JnhwDOlPKU=;
        b=oCyH3KwGXmqyebPJLcxkqTnjtdmrqBa6uKD1HTfDdmQ84X7VndK3d+M0ool+b5BMKn
         RfwsAxsKzZqsr5TVlZL2RbgZp7FPL9hI3B8RaFSXDKX5nGnOABj52wCDcLiTOanA6b/v
         LZFkQ2cVPEZpDMrPo+goIPGMZgTVgh2YDgRA8ZMNCr/acLsP+vicNw+YUp3vTBIcfxnM
         psOSW8sdA4GVrr8gFvOUHgPq/MslDrEafiT9koO/tB2QFMe3xorzmXdogMBgSsejiKrs
         t+lfhgRYSD5SuCOSzQtrAs2hd45WVkcMS7zzCYTg2rJtdldNAfc9bjoqqJGCWKxE/TFo
         0pPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=po9GIc//4BXNUkVxk1xNmQmL0pTjTQsP8JnhwDOlPKU=;
        b=Cj3vGhp4g1UIjkHJyYzizDZO0NOI3oX+eHG1/JvJmdZ4IGD3I2+05z4Qa8lZDLIpbx
         FlmYOxEuy6p2js7fCdCJCdTAuhP+wH05ffVcKYHcfOoNEmvskQTgVFjljqIvMqLOa+wu
         pu4aS5iHGREHu436SRicj2SpI0keaCiJdy6TB+4e52fdBm1Ef3Hh62DUsOiBoKc1iYK4
         5pty8gly5E2EKPqZNATIjo9K0YGleik8d+3yYfX490oM/MG7h4LfMYnrK4pBchJPmMqK
         MoJ2Dob+EwNtNriENQWHEnNQrcBz84e5rOqXrVtL29gzrG0w+Whtc4RgEpSc4IMY/CtA
         LT4g==
X-Gm-Message-State: AOAM5309IWr1wrdEhcB396fX+Y/9QLdNyaJhur+pRBYLuPAZi58fSzBG
	aUggv/Pb0a3WTCyq4tZWnqaYip7tdDSrf11ZB0Q=
X-Google-Smtp-Source: 
 ABdhPJx8aOfIFCarDGqKSbvb3BIp6G4MfmGxl0PR/6hL+5csvneCai2aa0jElRp2BjRw7kU5EAIYUm8wCPMgKPgDW9s=
X-Received: by 2002:a2e:7a05:0:b0:253:cdc8:d9b7 with SMTP id
 v5-20020a2e7a05000000b00253cdc8d9b7mr32927012ljc.56.1653906658490; Mon, 30
 May 2022 03:30:58 -0700 (PDT)
MIME-Version: 1.0
References: 
 <5e05e3aa-6b3f-44b1-85d1-8cd220310306@denue6es010.ebgroup.elektrobit.com>
In-Reply-To: 
 <5e05e3aa-6b3f-44b1-85d1-8cd220310306@denue6es010.ebgroup.elektrobit.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 May 2022 12:30:47 +0200
Message-ID: 
 <CANNYZj-=CA2yBc1s-6epKaG-s_DNhAkfTqhKYVdhPqqsD4S8qQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] json-c: Add ptest for json-c
To: Simone Weiss <simone.weiss@elektrobit.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Kai Tomerius <kai.tomerius@elektrobit.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 10:31:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166279

On Mon, 30 May 2022 at 11:48, Simone Weiss <simone.weiss@elektrobit.com> wrote:
> +               if ./$i > /dev/null 2>&1 ; then

Should the output be completely discarded like this? Maybe it's better
to have it printed, especially if something fails?

Alex

