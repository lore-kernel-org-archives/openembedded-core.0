Return-Path: <oecore.mailinglist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CE3C433F5
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 17:40:35 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.9201.1635010833938119039
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 10:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V5sYk1f5;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 b133-20020a1c808b000000b0032ca4d18aebso3933770wmd.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 10:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iH7jxiTBuLkc8qf16TyrCJHlWPm3l8fQJcUB9BGGmv4=;
        b=V5sYk1f5Eo/PhuDxUlwitO4crSmM5ZNtJhyFMo3eV5hnEEuhBD+53qp66pAWVbUi+3
         SFkET2wgdicURFN30qnwvN+uIR8/dAl4YcAanFLu4NsYT8nLy30pEmg8wTVwqjTNZkfe
         XCUFEKXh7gxtlGA09/rb+DO2P0CGCX/5GLWWJ3CzO7QO9LZQrA5je1uLfHt4/9Sf0Ly0
         Zna8f7MITfgt7883052qADYPneQmKdu/Yml2MNXxn92sP/k3SlNRmi/uaJechmVzhj6y
         5IC6ULTGYTu47Z3PBr3RdBMbpzdbWxroQMgfvGcawg5/XYpWnQoyIC0jfdC633R53FV6
         Qpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iH7jxiTBuLkc8qf16TyrCJHlWPm3l8fQJcUB9BGGmv4=;
        b=Y0Y0a9ALvmuZaen5E+yZ+dIafcwQRqEGY4MS0XW/fR9k4en5PxiRVpEwhI5Th8fRZi
         dh29lzbqn58a97NZumolZGhz90fJX1/XHqYylblGZ/qoT/Fx2smkmplQNt3dQCWhGieb
         YQeuds9gV3xytvqc53izSmL2kYF4216HxVIlWd7/Xk2lzbrQOiPmlqKNyA57TWY6hb/M
         L3PQBd48AJZ2TkBe330MatxyMgnLVbqEm+0ZR/HOK4etiGTVToEOlLD6St8O4V3DThxp
         JMQBRtnKKDuL4CL4rKouIsQqodM6iblO2lSOogGDk/BvD/pjSDPQW9qEByK6EF4U33Xo
         PSEA==
X-Gm-Message-State: AOAM5313tUFf0x4WbgccV5FXVeONXL1myoXaNdhNhY7Yb2vNZqdd4vPi
	g6mVQVzamyqZCXN3N8n1Qn6TUA4TGII=
X-Google-Smtp-Source: 
 ABdhPJwXqJExWqfL3tDSEMeIm5pLMYafXOCnzf0aSx9+JGdyszDOT+cMQFdUF/JD6Op0zhDNvnicUA==
X-Received: by 2002:a1c:20c8:: with SMTP id
 g191mr14167314wmg.100.1635010832380;
        Sat, 23 Oct 2021 10:40:32 -0700 (PDT)
Received: from [192.168.42.52] (ppp-2-84-88-128.home.otenet.gr. [2.84.88.128])
        by smtp.gmail.com with ESMTPSA id
 d16sm3601473wrq.66.2021.10.23.10.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Oct 2021 10:40:32 -0700 (PDT)
Subject: Re: [OE-core] [PATCH 18/65] u-boot: upgrade 2021.07 -> 2021.10
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Paul Eggleton <bluelightning@bluelightning.org>
Cc: Jon Mason <jon.mason@arm.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <20211019153419.3319802-1-alex@linutronix.de>
 <20211019153419.3319802-18-alex@linutronix.de> <4686739.31r3eYUQgx@linc>
 <CANNYZj_LwDStdwbCP0NrrgbUQXumck1AqdZA35iAu+OvsRJsaw@mail.gmail.com>
From: Robert Berger <oecore.mailinglist@gmail.com>
Message-ID: <ef1c3387-fbaa-d255-5352-1284a2bab8a1@gmail.com>
Date: Sat, 23 Oct 2021 20:40:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: 
 <CANNYZj_LwDStdwbCP0NrrgbUQXumck1AqdZA35iAu+OvsRJsaw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 17:40:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157305

Hi,

Take care with this update, since it might break some builds due to 
something like this[1]

[1] https://lore.kernel.org/all/18564205.Z0HQFNUZ9R@kista/

I observe issues e.g. with Ubuntu 16, imx6 and u-boot 2021.10.

Regards,

Robert

-- 
Robert Berger
Embedded Software Evangelist

Reliable Embedded Systems
Consulting Training Engineering
URL: https://www.reliableembeddedsystems.com

Schedule a web meeting:
https://calendly.com/reliableembeddedsystems/
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--

